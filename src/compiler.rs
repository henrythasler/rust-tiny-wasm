#![allow(dead_code)]
//! Processes a Webassembly module and returns a LinkedModule for subsequent execution
use std::mem;

use wasmparser::{Operator, Parser, Payload::*, ValType};

use super::*;
use crate::assembler::aarch64::*;
use crate::assembler::{emit_epilogue, emit_prologue};

use control_instructions::*;
use procedure_call::*;

mod control_instructions;
mod numeric_instructions;
mod procedure_call;

#[derive(Clone)]
pub struct WasmFunction {
    pub name: String,
    /// offset in INSTRUCTION_SIZE units
    pub offset: usize,
    /// length in INSTRUCTION_SIZE units
    pub length: usize,
}

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
            TypeSection(reader) => {
                for ty in reader.into_iter() {
                    for (_, item) in ty?.into_types_and_offsets() {
                        if let wasmparser::CompositeInnerType::Func(func) =
                            item.composite_type.inner
                        {
                            println!("{}", func);
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
            TagSection(_) => { /* ... */ }
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
                // here we can iterate over `body` to parse the function
                // and its locals
                let offset = machinecode.len();
                let mut reader = body.get_operators_reader()?;
                let fn_idx = *functions.get(function_index).unwrap() as usize;
                compile_function(&mut reader, types.get(fn_idx).unwrap(), &mut machinecode)?;

                wasm_functions.push(WasmFunction {
                    name: exports.get(function_index).unwrap().name.clone(),
                    offset,
                    length: machinecode.len() - offset,
                });
                function_index += 1;
            }

            // Sections for WebAssembly components
            ModuleSection { .. } => { /* ... */ }
            InstanceSection(_) => { /* ... */ }
            CoreTypeSection(_) => { /* ... */ }
            ComponentSection { .. } => { /* ... */ }
            ComponentInstanceSection(_) => { /* ... */ }
            ComponentAliasSection(_) => { /* ... */ }
            ComponentTypeSection(_) => { /* ... */ }
            ComponentCanonicalSection(_) => { /* ... */ }
            ComponentStartSection { .. } => { /* ... */ }
            ComponentImportSection(_) => { /* ... */ }
            ComponentExportSection(_) => { /* ... */ }

            CustomSection(_) => { /* ... */ }

            // Once we've reached the end of a parser we either resume
            // at the parent parser or the payload iterator is at its
            // end and we're done.
            End(_) => {}

            // most likely you'd return an error here, but if you want
            // you can also inspect the raw contents of unknown sections
            _ => {}
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

    let register_pool = RegisterPool::new();

    // every functions starts with an epilogue to save the initial state and create a new stack frame
    emit_prologue(machinecode);

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
            _ => {
                return Err(TinyWasmError::Compiler(format!(
                    "unsupported instruction: {:?} at position {}",
                    op, index
                )));
            }
        }
    }

    // move result values to result registers according to Aarch64 Procedure Call Standard (X0..X7)
    if !func_type.results().is_empty() {
        load_results(&mut value_stack, func_type.results().len(), machinecode)?;
    }

    // restore initial state before returning to the caller
    emit_epilogue(machinecode);

    // add padding to INSTRUCTION_SIZE to align subsequent functions to the correct size
    let padding_instructions =
        ((machinecode.len() * INSTRUCTION_SIZE) % mem::align_of::<fn()>()) / INSTRUCTION_SIZE;
    for _ in 0..padding_instructions {
        machinecode.push(hint::nop());
    }

    Ok(machinecode.len() - initial_size)
}
