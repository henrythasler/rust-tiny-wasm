use std::io::Cursor;

use crate::assembler::aarch64::*;
use crate::assembler::{emit_epilogue, emit_prologue};
use crate::loader::Code;
use crate::loader::webassembly::Webassembly_ValTypes;

use super::control_instructions::*;
use super::numeric_instructions::*;

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
    location: Reg,
    val_type: Webassembly_ValTypes,
}

pub fn compile_function(entry: &Code, machinecode: &mut Vec<u32>) -> Result<(), String> {
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
            iter.nth(compile_const(
                &opcode,
                &mut Cursor::new(&bytecode[index..]),
                &mut value_stack,
                machinecode,
            ));
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
