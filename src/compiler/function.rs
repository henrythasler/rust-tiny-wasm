use super::*;
use crate::assembler::aarch64::*;
use crate::assembler::{emit_epilogue, emit_prologue};
use crate::loader::Code;
use crate::loader::webassembly::Webassembly_ValTypes;

enum Opcode {
    Func,
    Block,
    Loop,
    If,
    Else,
}

struct ControlFrame {
    opcode: Opcode,
    start_types: Vec<Webassembly_ValTypes>,
    end_types: Vec<Webassembly_ValTypes>,
    stack_height: usize,
}

struct StackElement {
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
    }];

    // Value stack starts empty
    let mut value_stack: Vec<StackElement> = vec![];

    // iterate over WebAssembly opcodes and emit machinecode instructions
    let mut iter = entry.code.iter();
    'expression: while let Some(&opcode) = iter.next() {
        print!("{:02X?} ", opcode);

        // ret
        if opcode == 0x0f {
            // FIXME: Manage Control Stack and add jump entry to backpatch list
        }
        // end
        else if opcode == 0x0b {
            let frame = control_stack
                .pop()
                .expect("control stack should contain at least one element on 'end' opcode");

            assert_eq!(
                value_stack.len(),
                frame.stack_height + frame.end_types.len()
            );
            let mut results = value_stack.split_off(frame.end_types.len());
            value_stack.truncate(frame.stack_height);
            value_stack.append(&mut results);

            match frame.opcode {
                Opcode::Func => {
                    // FIXME: validate control frame vs. stack
                    // FIXME: backpatch ret instructions here
                    // FIXME: if FrameOpcode::Func, exit while-loop and end function
                    break 'expression;
                }
                _ => {}
            }
            /*
               // Validate return values match expected types
               assert value_stack.height == frame.height + frame.end_types.length
               assert value_stack.top(frame.end_types.length) == frame.end_types

               // Clean up value stack
               results = value_stack.pop(frame.end_types.length)
               value_stack.truncate(frame.height)
               value_stack.push(results)

               if frame.opcode == func:
                   // Function exit: results stay on stack for caller
                   return results
            */
        }
    }
    println!();

    // FIXME: move result to r0

    // restore initial state before returning to the caller
    emit_epilogue(machinecode);
}
