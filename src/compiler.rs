#![allow(dead_code)]
//! Processes a Webassembly module and returns a LinkedModule for subsequent execution
use std::mem;

use wasmparser::{Operator, Parser, Payload::*, ValType};

use super::*;
use crate::assembler::aarch64::*;
use crate::assembler::{emit_epilogue, emit_prologue};

use control_instructions::*;
use procedure_call::*;
use stack::*;

mod control_instructions;
mod numeric_instructions;
mod procedure_call;
mod stack;

#[derive(Debug, Clone)]
pub struct WasmFunction {
    pub name: String,
    /// offset in INSTRUCTION_SIZE units
    pub offset: usize,
    /// length in INSTRUCTION_SIZE units
    pub length: usize,
}

#[derive(Debug)]
pub struct LinkedModule {
    pub machinecode: Vec<u32>,
    pub functions: Vec<WasmFunction>,
}

impl LinkedModule {
    pub fn new(machinecode: Vec<u32>, functions: Vec<WasmFunction>) -> Self {
        Self {
            machinecode,
            functions,
        }
    }
}

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
}

#[derive(Debug)]
pub struct Patch {
    pub location: usize,
    pub instruction: Instruction,
}

#[derive(Debug)]
pub struct ControlFrame {
    pub opcode: Opcode,
    pub start_types: Vec<ValType>,
    pub end_types: Vec<ValType>,
    pub stack_height: usize,
    pub patches: Vec<Patch>,
}

#[derive(Debug)]
pub struct StackElement {
    reg: Reg,
    valtype: wasmparser::ValType,
}

#[derive(Debug)]
pub struct Export {
    pub name: String,
    pub r#type: wasmparser::ExternalKind,
    pub index: u32,
}

pub fn compile(module: &[u8]) -> Result<LinkedModule> {
    let mut machinecode: Vec<u32> = Vec::new();
    let mut wasm_functions: Vec<WasmFunction> = Vec::new();

    let parser = Parser::new(0);

    // temporary module sections for lookup
    let mut types: Vec<wasmparser::FuncType> = Vec::new();
    let mut exports: Vec<Export> = Vec::new();
    let mut functions: Vec<u32> = Vec::new();

    let mut function_index = 0;

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
                            types.push(func);
                        }
                    }
                }
            }
            ImportSection(_) => { /* ... */ }
            FunctionSection(reader) => {
                for func in reader {
                    functions.push(func?);
                }
            }
            TableSection(_) => { /* ... */ }
            MemorySection(_) => { /* ... */ }
            GlobalSection(_) => { /* ... */ }
            ExportSection(reader) => {
                for export in reader {
                    let export = export?;
                    exports.push(Export {
                        name: export.name.to_string(),
                        r#type: export.kind,
                        index: export.index,
                    });
                }
            }
            StartSection { .. } => { /* ... */ }
            ElementSection(_) => { /* ... */ }
            DataCountSection { .. } => { /* ... */ }
            DataSection(_) => { /* ... */ }

            // Here we know how many functions we'll be receiving as
            // `CodeSectionEntry`, so we can prepare for that, and
            // afterwards we can parse and handle each function
            // individually.
            CodeSectionStart { .. } => {}
            CodeSectionEntry(body) => {
                // here we can iterate over `body` to parse the function and its locals

                let mut locals: Vec<(u32, ValType)> = Vec::new();
                let locals_reader = body.get_locals_reader()?;
                for local in locals_reader {
                    locals.push(local.unwrap());
                }

                let offset = machinecode.len();
                let mut reader = body.get_operators_reader()?;
                let fn_idx = *functions.get(function_index).unwrap() as usize;
                compile_function(&mut reader, types.get(fn_idx).unwrap(), &locals, &mut machinecode)?;

                let function_id = exports
                    .get(function_index)
                    .map_or(format!("$func{function_index}"), |v| v.name.clone());

                wasm_functions.push(WasmFunction {
                    name: function_id,
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
            _ => {
                return Err(TinyWasmError::Parser(String::from(
                    "Found unknown section identifier",
                )));
            }
        }
    }

    Ok(LinkedModule {
        machinecode,
        functions: wasm_functions,
    })
}

fn compile_function(
    reader: &mut wasmparser::OperatorsReader<'_>,
    func_type: &wasmparser::FuncType,
    locals: &[(u32, ValType)],
    machinecode: &mut Vec<u32>,
) -> Result<usize> {
    // Value stack starts empty
    let mut value_stack: Vec<StackElement> = vec![];

    // Control stack is initialized with the (implicit) outer func-block
    let mut control_stack: Vec<ControlFrame> = vec![ControlFrame {
        opcode: Opcode::Func,
        start_types: func_type.params().to_vec(),
        end_types: func_type.results().to_vec(),
        stack_height: value_stack.len(),
        patches: vec![],
    }];

    let initial_size = machinecode.len();
    let register_pool = RegisterPool::default();

    // calculate initial stack size from all parameters and locals
    let mut stack_size = func_type.params().iter().fold(0, |acc, x| acc + valtype_to_usize(*x));
    stack_size += locals.iter().fold(0, |acc, x| acc + x.0 as usize * valtype_to_usize(x.1));
    println!("{}", stack_size);

    // every functions starts with an epilogue to save the initial state and create a new stack frame
    emit_prologue(stack_size, machinecode);

    'expression: while !reader.eof() {
        let index = reader.original_position();
        let op = reader.read().unwrap();
        match op {
            Operator::End => {
                if compile_end(&mut control_stack, &mut value_stack, machinecode) {
                    break 'expression;
                }
            }
            Operator::Return => {
                compile_return(&mut control_stack, machinecode);
            }
            Operator::I32Const { value } => {
                let reg = register_pool.allocate_register();
                value_stack.push(StackElement {
                    reg,
                    valtype: ValType::I32,
                });
                compound::mov_large_immediate(reg, value as i64, RegSize::Reg32bit, machinecode);
            }
            Operator::I64Const { value } => {
                let reg = register_pool.allocate_register();
                value_stack.push(StackElement {
                    reg,
                    valtype: ValType::I64,
                });
                compound::mov_large_immediate(reg, value, RegSize::Reg64bit, machinecode);
            }
            Operator::LocalGet { local_index } => {

            }
            Operator::LocalSet { local_index } => {

            }
            _ => {
                return Err(TinyWasmError::Compiler(format!(
                    "unsupported instruction: {:?} at position {}",
                    op, index
                )));
            }
        }
    }

    // move result values to result registers according to Aarch64 Procedure Call Standard (X0..X7)
    // X0: Result, X1: Tag (0=Ok, 1=Trap)
    if !func_type.results().is_empty() {
        load_results(&mut value_stack, func_type.results().len(), machinecode)?;
    } else {
        // Result=0
        machinecode.push(processing::mov_reg(Reg::X0, Reg::XZR, RegSize::Reg64bit));
        // Tag=Ok (0)
        machinecode.push(processing::mov_reg(Reg::X1, Reg::XZR, RegSize::Reg64bit));
    }

    // restore initial state before returning to the caller
    emit_epilogue(stack_size, machinecode);

    // add padding to INSTRUCTION_SIZE to align subsequent functions to the correct size
    let padding_instructions =
        ((machinecode.len() * INSTRUCTION_SIZE) % mem::align_of::<fn()>()) / INSTRUCTION_SIZE;
    for _ in 0..padding_instructions {
        machinecode.push(hint::nop());
    }

    Ok(machinecode.len() - initial_size)
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
        // contains unreachable
        let module = vec![
            0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x01, 0x04, 0x01, 0x60, 0x00, 0x00,
            0x03, 0x02, 0x01, 0x00, 0x07, 0x07, 0x01, 0x03, 0x66, 0x6f, 0x6f, 0x00, 0x00, 0x0a,
            0x05, 0x01, 0x03, 0x00, 0x00, 0x0b,
        ];
        let res = compile(&module).unwrap_err();
        assert!(
            matches!(res, TinyWasmError::Compiler(msg) if msg.contains("unsupported instruction"))
        );
        Ok(())
    }
}
