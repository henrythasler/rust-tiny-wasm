//! Processes a Webassembly module and returns a LinkedModule for subsequent execution

use super::loader::*;
use crate::loader::webassembly::Webassembly_ValTypes;
use owo_colors::OwoColorize;

use crate::assembler::aarch64::*;
use crate::assembler::{emit_epilogue, emit_prologue};

use control_instructions::*;
use numeric_instructions::*;

mod control_instructions;
mod numeric_instructions;

pub struct LinkedModule {
    machinecode: Vec<u32>,
}

impl LinkedModule {
    pub fn get_machinecode(&self) -> &[u32] {
        &self.machinecode
    }
}

#[derive(Debug)]
enum Opcode {
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
    location: Reg,
    val_type: Webassembly_ValTypes,
}

fn compile_function(entry: &Code, index: usize, module: &WasmModule, machinecode: &mut Vec<u32>) -> Result<(), String> {
    let func_type = module.type_section().expect("Type Section should not be empty").func_types.get(index).expect("Should be able to read the func_type at index");
    let parameters = &func_type.parameters;
    let results = &func_type.results;

    // every functions starts with an epilogue to save the initial state and create a new stack frame
    emit_prologue(machinecode);

    // Control stack is initialized with the (implicit) outer func-block
    let mut control_stack: Vec<ControlFrame> = vec![ControlFrame {
        opcode: Opcode::Func,
        start_types: vec![], // FIXME: insert function parameters
        end_types: vec![],   // FIXME: insert result types
        stack_height: 0,
        patches: vec![],
    }];

    // Value stack starts empty
    let mut value_stack: Vec<StackElement> = vec![];

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
            // iter.nth(compile_const(
            //     &opcode,
            //     &mut Cursor::new(&bytecode[index..]),
            //     &mut value_stack,
            //     machinecode,
            // ));
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
    Ok(())
}

pub fn compile(module: &WasmModule) -> LinkedModule {
    let code_section = module.code_section();
    let export_section = module.export_section();

    let mut machinecode: Vec<u32> = Vec::new();

    if let Some(c) = code_section {
        let mut iter = c.entries.iter().enumerate();
        while let Some((index, entry)) = iter.next() {
            match compile_function(entry, index, module, &mut machinecode) {
                Ok(()) => (),
                Err(error) => {
                    let function_id = match export_section {
                        Some(val) => &val.exports.get(index).unwrap().name,
                        None => &index.to_string(),
                    };
                    let error_msg = format!("Error in function '{function_id}()': {error}");
                    panic!("{}", error_msg.red());
                }
            }
        }
    }

    LinkedModule { machinecode }
}
