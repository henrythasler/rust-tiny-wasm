#![allow(dead_code)]
//! Processes a Webassembly module and returns a LinkedModule for subsequent execution
use std::io::Cursor;
use std::mem;

use wasmparser::types::TypeData;
use wasmparser::{BinaryReaderError, Chunk, Parser, Payload::*, SubType};

use crate::assembler::aarch64::*;
use crate::assembler::{emit_epilogue, emit_prologue};

use control_instructions::*;
use numeric_instructions::*;
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
    pub start_types: Vec<wasmparser::ValType>,
    pub end_types: Vec<wasmparser::ValType>,
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

pub fn compile(module: &[u8]) -> LinkedModule {
    let mut machinecode: Vec<u32> = Vec::new();
    let mut wasm_functions: Vec<WasmFunction> = Vec::new();

    let parser = Parser::new(0);

    // temporary module sections for lookup
    let mut types: Vec<wasmparser::FuncType> = Vec::new();
    let mut exports: Vec<Export> = Vec::new();
    let mut functions: Vec<u32> = Vec::new();

    let mut function_index = 0;

    for payload in parser.parse_all(&module) {
        match payload.unwrap() {
            // Sections for WebAssembly modules
            Version { .. } => { /* ... */ }
            TypeSection(reader) => {
                for (_, ty) in reader.into_iter().enumerate() {
                    for (_, item) in ty.unwrap().into_types_and_offsets() {
                        match item.composite_type.inner {
                            wasmparser::CompositeInnerType::Func(func) => {
                                println!("{}", func);
                                types.push(func);
                            }
                            _ => {}
                        }
                    }
                }
            }
            ImportSection(_) => { /* ... */ }
            FunctionSection(reader) => {
                for func in reader {
                    functions.push(func.unwrap());
                }
            }
            TableSection(_) => { /* ... */ }
            MemorySection(_) => { /* ... */ }
            TagSection(_) => { /* ... */ }
            GlobalSection(_) => { /* ... */ }
            ExportSection(reader) => {
                for export in reader {
                    let export = export.unwrap();
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
                let mut reader = body.get_operators_reader().unwrap();
                let fn_idx = *functions.get(function_index).unwrap() as usize;
                let _ = compile_function(&mut reader, types.get(fn_idx).unwrap(), &mut machinecode);
                function_index += 1;
                // here we can iterate over `body` to parse the function
                // and its locals
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

    // if let Some(c) = code_section {
    //     let iter = c.entries.iter().enumerate();
    //     for (index, entry) in iter {
    //         let typeidx = function_section.unwrap().type_indices.get(index).unwrap();

    //         let function_id = match export_section {
    //             Some(val) => val.exports.get(index).unwrap().name.clone(),
    //             None => format!("func{index}"),
    //         };

    //         let mut wasm_function = WasmFunction {
    //             name: function_id.clone(),
    //             offset: machinecode.len(),
    //             length: 0,
    //         };

    //         match compile_function(entry, *typeidx, module, &mut machinecode) {
    //             Ok(length) => {
    //                 wasm_function.length = length;
    //                 functions.push(wasm_function);
    //             }
    //             Err(error) => {
    //                 let error_msg = format!("Error in function '{function_id}()': {error}");
    //                 panic!("{}", error_msg.red());
    //             }
    //         }
    //     }
    // }

    LinkedModule {
        machinecode,
        functions: wasm_functions,
    }
}

fn compile_function(
    reader: &mut wasmparser::OperatorsReader<'_>,
    func_type: &wasmparser::FuncType,
    machinecode: &mut Vec<u32>,
) -> Result<usize, String> {
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
            wasmparser::Operator::End => {
                if compile_end(&mut control_stack, &mut value_stack, machinecode) {
                    break 'expression;
                }
            }
            wasmparser::Operator::Return => {
                compile_return(&mut control_stack, machinecode);
            }
            wasmparser::Operator::LocalGet { local_index } => {
                println!("Opcode Local get: {:?} ({:?})", local_index, op);
            }
            _ => {
                return Err(format!(
                    "unsupported instruction: {:?} at position {}",
                    op, index
                ));
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

    // // iterate over WebAssembly opcodes and emit machinecode instructions
    // let bytecode = &entry.code;
    // let mut iter = bytecode.iter().enumerate();
    // 'expression: while let Some((index, &opcode)) = iter.next() {
    //     println!("Opcode: 0x{:02X}", opcode);
    //     // Control Instructions
    //     if opcode == 0x0b {
    //         if compile_end(&mut control_stack, &mut value_stack, machinecode) {
    //             break 'expression;
    //         }
    //     } else if opcode == 0x0f {
    //         compile_return(&mut control_stack, machinecode);
    //     }
    //     // Numeric Instructions
    //     else if opcode == 0x41 || opcode == 0x42 {
    //         iter.nth(
    //             compile_const(
    //                 &opcode,
    //                 &mut Cursor::new(&bytecode[index + 1..]),
    //                 &mut value_stack,
    //                 &register_pool,
    //                 machinecode,
    //             ) - 1,
    //         );
    //     }
    //     // Unsupported
    //     else {
    //         return Err(format!(
    //             "unsupported instruction 0x{opcode:02X} at position {index}"
    //         ));
    //     }
    // }

    Ok(machinecode.len() - initial_size)
}
