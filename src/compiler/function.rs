use crate::assembler::aarch64::*;
use crate::assembler::{emit_epilogue, emit_prologue};
use crate::compiler::control_instructions::{compile_end, compile_return};
use crate::loader::Code;
use crate::loader::webassembly::Webassembly_ValTypes;

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

pub fn compile_function(entry: &Code, machinecode: &mut Vec<u32>) {
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
    let mut iter = entry.code.iter();
    'expression: while let Some(&opcode) = iter.next() {
        if opcode == 0x0f {
            compile_return(machinecode, &mut control_stack);
        } else if opcode == 0x0b && compile_end(machinecode, &mut control_stack, &mut value_stack) {
            break 'expression;
        }
    }
    println!();

    // FIXME: move result to r0

    // restore initial state before returning to the caller
    emit_epilogue(machinecode);
}
