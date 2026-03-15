#![allow(dead_code)]
//! Processes a Webassembly module and returns a LinkedModule for subsequent execution

use std::io::Cursor;

use super::loader::*;
use crate::loader::webassembly::Webassembly_ValTypes;
use owo_colors::OwoColorize;

use crate::assembler::aarch64::*;
use crate::assembler::{emit_epilogue, emit_prologue};

use control_instructions::*;
use numeric_instructions::*;

mod control_instructions;
mod numeric_instructions;

#[derive(Clone)]
pub struct WasmFunction {
    pub name: String,
    /// offset in instructions (u32)
    pub offset: usize,
    /// length in instructions (u32)
    pub length: usize,
}

pub struct LinkedModule {
    machinecode: Vec<u32>,
    functions: Vec<WasmFunction>,
}

impl LinkedModule {
    pub fn new(machinecode: Vec<u32>, functions: Vec<WasmFunction>) -> Self {
        Self {
            machinecode,
            functions,
        }
    }
}

impl LinkedModule {
    pub fn get_machinecode(&self) -> &[u32] {
        &self.machinecode
    }

    pub fn get_functions(&self) -> &[WasmFunction] {
        &self.functions
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
    start_types: Vec<Webassembly_ValTypes>,
    pub end_types: Vec<Webassembly_ValTypes>,
    pub stack_height: usize,
    pub patches: Vec<Patch>,
}

pub struct StackElement {
    reg: Reg,
    val_type: Webassembly_ValTypes,
}

pub fn compile(module: &WasmModule) -> LinkedModule {
    let code_section = module.code_section();
    let export_section = module.export_section();

    let function_section = module.function_section();

    let mut machinecode: Vec<u32> = Vec::new();
    let mut functions: Vec<WasmFunction> = Vec::new();

    if let Some(c) = code_section {
        let iter = c.entries.iter().enumerate();
        for (index, entry) in iter {
            let typeidx = function_section.unwrap().type_indices.get(index).unwrap();

            let function_id = match export_section {
                Some(val) => val.exports.get(index).unwrap().name.clone(),
                None => format!("func{index}"),
            };

            let mut wasm_function = WasmFunction {
                name: function_id.clone(),
                offset: machinecode.len(),
                length: 0,
            };

            match compile_function(entry, *typeidx, module, &mut machinecode) {
                Ok(length) => {
                    wasm_function.length = length;
                    functions.push(wasm_function);
                }
                Err(error) => {
                    let error_msg = format!("Error in function '{function_id}()': {error}");
                    panic!("{}", error_msg.red());
                }
            }
        }
    }

    LinkedModule {
        machinecode,
        functions,
    }
}

fn compile_function(
    entry: &Code,
    typeidx: usize,
    module: &WasmModule,
    machinecode: &mut Vec<u32>,
) -> Result<usize, String> {
    let type_section = module.type_section().unwrap();
    let func_type = type_section.func_types.get(typeidx).unwrap();

    let initial_size = machinecode.len();

    let register_pool = RegisterPool::new();

    // Value stack starts empty
    let mut value_stack: Vec<StackElement> = vec![];

    // Control stack is initialized with the (implicit) outer func-block
    let mut control_stack: Vec<ControlFrame> = vec![ControlFrame {
        opcode: Opcode::Func,
        start_types: func_type.parameters.clone(),
        end_types: func_type.results.clone(),
        stack_height: value_stack.len(),
        patches: vec![],
    }];

    // every functions starts with an epilogue to save the initial state and create a new stack frame
    emit_prologue(machinecode);

    // iterate over WebAssembly opcodes and emit machinecode instructions
    let bytecode = &entry.code;
    let mut iter = bytecode.iter().enumerate();
    'expression: while let Some((index, &opcode)) = iter.next() {
        println!("Opcode: 0x{:02X}", opcode);
        // Control Instructions
        if opcode == 0x0b {
            if compile_end(&mut control_stack, &mut value_stack, machinecode) {
                break 'expression;
            }
        } else if opcode == 0x0f {
            compile_return(&mut control_stack, machinecode);
        }
        // Numeric Instructions
        else if opcode == 0x41 || opcode == 0x42 {
            iter.nth(
                compile_const(
                    &opcode,
                    &mut Cursor::new(&bytecode[index + 1..]),
                    &mut value_stack,
                    &register_pool,
                    machinecode,
                ) - 1,
            );
        }
        // Unsupported
        else {
            return Err(format!(
                "unsupported instruction 0x{opcode:02X} at position {index}"
            ));
        }
    }
    // FIXME: move result to r0

    // restore initial state before returning to the caller
    emit_epilogue(machinecode);
    Ok(machinecode.len() - initial_size)
}
