#![allow(dead_code)]
//! Processes a Webassembly module and returns a LinkedModule for subsequent execution
use std::mem;

use wasmparser::{Operator, Parser, Payload::*, ValType};

use super::*;
use crate::assembler::aarch64::{self, *};
use crate::assembler::{emit_epilogue, emit_prologue};
use crate::runtime::TrapCode;

mod control_instr;
mod function;
mod numeric_instr;
mod parametric_instr;
mod parser;
mod procedure_call;
mod stack;
mod traphandler;
mod variable_instr;

use control_instr::*;
use function::*;
use numeric_instr::*;
use parametric_instr::*;
use parser::*;
use procedure_call::*;
use stack::*;
use traphandler::*;
use variable_instr::*;

#[derive(Debug)]
pub enum Opcode {
    Func,
    Block,
    Loop,
    If,
    Else,
}

#[derive(Debug)]
pub enum Instruction {
    Br,
    Cbz,
    Cbnz,
    Call,
}

#[derive(Debug)]
pub struct Patch {
    pub location: usize,
    pub instruction: Instruction,
}

#[derive(Debug)]
pub struct FunctionPatch {
    pub location: usize,
    pub instruction: Instruction,
    pub function_index: u32,
}

#[derive(Debug)]
pub struct ControlFrame {
    pub opcode: Opcode,
    pub start_types: Vec<ValType>,
    pub end_types: Vec<ValType>,
    pub stack_height: usize,
    pub value_stack: Option<Vec<StackElement>>,
    pub register_index: Option<i32>,
    pub result_register: Option<Reg>,
    pub machinecode_offset: usize,
    pub patches: Vec<Patch>,
}

#[derive(Debug, Clone)]
pub struct StackElement {
    reg: Reg,
    valtype: wasmparser::ValType,
}

#[derive(Debug, Default)]
pub struct FunctionTable {
    pub offset: usize,
    pub length: usize,
    pub func_indices: Vec<u32>,
    pub type_indices: Vec<u32>,
}

#[derive(Debug, Default)]
pub struct ModuleContext {
    types: Vec<wasmparser::FuncType>,
    exports: Vec<Export>,
    functions: Vec<ModuleFunction>,
    func_table: Option<FunctionTable>,
}

#[derive(Debug)]
pub struct Export {
    pub name: String,
    pub r#type: wasmparser::ExternalKind,
    pub index: u32,
}

#[derive(Debug)]
pub struct ModuleFunction {
    pub type_index: usize,
    pub imported: bool,
}

pub fn compile(module: &[u8]) -> Result<LinkedModule> {
    let mut machinecode: Vec<u32> = Vec::new();
    let mut jit_functions: Vec<JitObject> = Vec::new();
    let mut tables: Vec<JitObject> = Vec::new();

    let parser = Parser::new(0);

    let mut module_ctx = ModuleContext::default();
    let mut function_index: u32 = 0;
    let mut call_patches: Vec<compiler::FunctionPatch> = Vec::new();

    for payload in parser.parse_all(module) {
        match payload? {
            // Sections for WebAssembly modules
            Version { .. } => { /* ... */ }
            CustomSection(_) => { /* ... */ }
            TypeSection(reader) => {
                for ty in reader.into_iter() {
                    for (_, item) in ty?.into_types_and_offsets() {
                        if let wasmparser::CompositeInnerType::Func(func) =
                            item.composite_type.inner
                        {
                            module_ctx.types.push(func);
                        }
                    }
                }
            }
            ImportSection(_) => { /* ... */ }
            FunctionSection(reader) => {
                for type_index in reader {
                    module_ctx.functions.push(ModuleFunction {
                        type_index: type_index? as usize,
                        imported: false,
                    });
                }
            }
            TableSection(reader) => {
                for table in reader {
                    let table = table?;
                    match table.ty.element_type {
                        wasmparser::RefType::FUNCREF => {
                            // function table will be initialized with u32::MAX to distinguish from valid function references
                            module_ctx.func_table = Some(FunctionTable {
                                offset: 0,
                                length: table.ty.initial as usize,
                                func_indices: vec![u32::MAX; table.ty.initial as usize],
                                type_indices: vec![u32::MAX; table.ty.initial as usize],
                            });
                        }
                        _ => {
                            return Err(TinyWasmError::Parser(String::from(
                                "Only funcref tables are supported",
                            )));
                        }
                    }
                }
            }
            MemorySection(_) => { /* ... */ }
            GlobalSection(_) => { /* ... */ }
            ExportSection(reader) => {
                for export in reader {
                    let export = export?;
                    module_ctx.exports.push(Export {
                        name: export.name.to_string(),
                        r#type: export.kind,
                        index: export.index,
                    });
                }
            }
            StartSection { .. } => { /* ... */ }
            ElementSection(reader) => {
                if let Some(func_table) = module_ctx.func_table.as_mut() {
                    for element in reader {
                        let element = element?;
                        let (table_index, offset) = match element.kind {
                            wasmparser::ElementKind::Active {
                                table_index,
                                offset_expr,
                            } => (table_index.unwrap_or(0), parse_const_expr(offset_expr)?),
                            _ => panic!("Only active elements are supported"),
                        };

                        assert_eq!(table_index, 0, "Only table index 0 is supported");

                        // println!("table_index: {:?}, offset: {:?}", &table_index, &offset);

                        match element.items {
                            wasmparser::ElementItems::Functions(section) => {
                                for (i, func_idx) in section.into_iter().enumerate() {
                                    func_table.func_indices[(offset as usize) + i] = func_idx?;
                                }
                            }
                            _ => {
                                return Err(TinyWasmError::Parser(String::from(
                                    "Only function elements are supported",
                                )));
                            }
                        }
                        // println!("func_table: {:?}", &module_ctx.func_table);
                        // panic!()
                    }
                    // adding the function table placeholder to the the machinecode;
                    // content will be replaced by the actual function offset later;
                    // items that are not replaced remain 0 for easy runtime checks
                    func_table.offset = machinecode.len();
                    let padded_length = (func_table.length * TABLE_ENTRY_SIZE * INT32_SIZE)
                        .div_ceil(CODE_ALIGNMENT)
                        * CODE_ALIGNMENT;
                    machinecode.extend(vec![u32::MAX; padded_length / INT32_SIZE]); // each function table entry is a tuple of (offset, type_index)
                    tables.push(JitObject {
                        name: String::from("function_table"),
                        offset: func_table.offset,
                        length: padded_length, // need to store a tuple of (offset, type_index) for each function in the table
                    });
                } else {
                    return Err(TinyWasmError::Parser(String::from(
                        "Element section found but no function table defined",
                    )));
                }
            }
            DataCountSection { .. } => { /* ... */ }
            DataSection(_) => { /* ... */ }

            // Here we know how many functions we'll be receiving as
            // `CodeSectionEntry`, so we can prepare for that, and
            // afterwards we can parse and handle each function
            // individually.
            CodeSectionStart { count, .. } => {
                if count as usize != module_ctx.functions.len() {
                    return Err(TinyWasmError::Parser(format!(
                        "Code section count ({}) does not match function section count ({})",
                        count,
                        module_ctx.functions.len()
                    )));
                }
            }
            CodeSectionEntry(body) => {
                // here we can iterate over `body` to parse the function and its locals

                let mut locals: Vec<(u32, ValType)> = Vec::new();
                let locals_reader = body.get_locals_reader()?;
                for local in locals_reader {
                    locals.push(local.unwrap());
                }

                let offset = machinecode.len();
                let mut reader = body.get_operators_reader()?;
                let function = module_ctx.functions.get(function_index as usize).unwrap();

                compile_function(
                    &mut reader,
                    &module_ctx,
                    function,
                    &locals,
                    &mut call_patches,
                    &mut machinecode,
                )?;

                let function_name = module_ctx
                    .exports
                    .iter()
                    .find(|&idx| idx.index == function_index)
                    .map_or(format!("$func{function_index}"), |v| v.name.clone());

                jit_functions.push(JitObject {
                    name: function_name,
                    offset,
                    length: machinecode.len() - offset,
                });
                function_index += 1;
            }

            // Once we've reached the end of a parser we either resume
            // at the parent parser or the payload iterator is at its
            // end and we're done.
            End(_) => {}

            // most likely you'd return an error here, but if you want
            // you can also inspect the raw contents of unknown sections
            other => match other.as_section() {
                Some((id, _range)) => {
                    return Err(TinyWasmError::Parser(format!(
                        "Found unknown section identifier: {}",
                        id
                    )));
                }
                None => {
                    return Err(TinyWasmError::Parser(String::from("Found invalid section")));
                }
            },
        }
    }

    // patch all the function calls with the correct offsets
    for patch in call_patches {
        let target_function = jit_functions.get(patch.function_index as usize).unwrap();
        let offset = (target_function.offset as isize - patch.location as isize)
            * aarch64::INSTRUCTION_SIZE as isize; // convert to bytes
        // println!(
        //     "Patching call to '{}()' (index {}, offset {}) at location {} with offset {}",
        //     target_function.name,
        //     patch.function_index,
        //     target_function.offset,
        //     patch.location,
        //     offset
        // );
        branch::patch_branch_link(offset as i32, &mut machinecode[patch.location]);
    }

    // patching the function table with the actual start offsets for each function
    if let Some(func_table) = module_ctx.func_table.as_mut() {
        for (i, &func_idx) in func_table.func_indices.iter().enumerate() {
            if func_idx < u32::MAX {
                let jit_function = jit_functions.get(func_idx as usize).unwrap();
                let func = module_ctx.functions.get(func_idx as usize).unwrap();
                machinecode[func_table.offset + i * TABLE_ENTRY_SIZE] =
                    (jit_function.offset * INSTRUCTION_SIZE) as u32;
                machinecode[func_table.offset + i * TABLE_ENTRY_SIZE + 1] = func.type_index as u32;
            }
        }
    }

    Ok(LinkedModule {
        machinecode,
        functions: jit_functions,
        tables, // trap_handler: Some(trap_handler),
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty_module() -> Result<()> {
        let module = vec![0x00, 0x61, 0x73, 0x6D, 0x01, 0x00, 0x00, 0x00];
        compile(&module)?;
        Ok(())
    }

    #[test]
    fn invalid_module() -> Result<()> {
        let module = vec![0x00, 0x61, 0x73, 0xFF, 0x01, 0x00, 0x00, 0x00];
        let res = compile(&module).unwrap_err();
        assert!(matches!(res, TinyWasmError::Parser(msg) if msg.contains("bad magic number")));
        Ok(())
    }

    #[test]
    fn invalid_section() -> Result<()> {
        let module = vec![
            0x00, 0x61, 0x73, 0x6D, 0x01, 0x00, 0x00, 0x00, 0x10, 0x01, 0x00,
        ];
        let res = compile(&module).unwrap_err();
        assert!(matches!(res, TinyWasmError::Parser(msg) if msg.contains("unknown section")));
        Ok(())
    }

    #[test]
    fn unsupported_instruction() -> Result<()> {
        // hexdump -v -e '1/1 "%02x "' tests/assets/dummy-empty.wasm
        // contains 0x0A (reserved instruction) which is not supported by the compiler
        let module = vec![
            0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x01, 0x04, 0x01, 0x60, 0x00, 0x00,
            0x03, 0x02, 0x01, 0x00, 0x07, 0x07, 0x01, 0x03, 0x66, 0x6f, 0x6f, 0x00, 0x00, 0x0a,
            0x05, 0x01, 0x03, 0x00, 0x0A, 0x0b,
        ];
        let res = compile(&module).unwrap_err();
        assert!(
            matches!(res, TinyWasmError::Compiler(msg) if msg.contains("unsupported instruction"))
        );
        Ok(())
    }
}
