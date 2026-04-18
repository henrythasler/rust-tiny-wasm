use wasmparser::BlockType;

use super::*;

pub fn compile_return(
    control_stack: &mut [ControlFrame],
    value_stack: &[StackElement],
    machinecode: &mut Vec<u32>,
) {
    let frame = control_stack
        .get_mut(0)
        .expect("control stack should contain at least one element on 'return' opcode");

    assert_eq!(
        frame.end_types.len(),
        value_stack.len(),
        "insufficient operands on stack for 'return'"
    );

    frame.patches.push(Patch {
        location: machinecode.len(),
        instruction: Instruction::Br,
    });
    machinecode.push(branch::branch(0));
}

pub fn compile_loop(
    blockty: BlockType,
    control_stack: &mut Vec<ControlFrame>,
    value_stack: &mut [StackElement],
    register_pool: &mut RegisterPool,
    machinecode: &mut [u32],
) {
    assert_eq!(blockty, BlockType::Empty);

    control_stack.push(ControlFrame {
        opcode: Opcode::Loop,
        start_types: vec![],
        end_types: vec![],
        stack_height: value_stack.len(),
        value_stack: Some(value_stack.to_vec()),
        register_pool_index: Some(register_pool.index),
        machinecode_offset: machinecode.len(),
        patches: vec![],
    });
}

// pub fn compile_br(
//     relative_depth: u32,
//     control_stack: &mut Vec<ControlFrame>,
//     value_stack: &mut Vec<StackElement>,
//     register_pool: &mut RegisterPool,
//     machinecode: &mut Vec<u32>,
// ) {
// }

pub fn compile_brif(
    _relative_depth: u32,
    control_stack: &mut [ControlFrame],
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        !value_stack.is_empty(),
        "insufficient operands on stack for 'if'"
    );

    let cond = value_stack.pop().unwrap();
    assert_eq!(
        cond.valtype,
        ValType::I32,
        "Operand type mismatch in 'brif'"
    );
    let frame = control_stack
        .last()
        .expect("control stack should contain at least one element on 'end' opcode");

    register_pool.free();

    match frame.opcode {
        Opcode::Loop => {
            let offset = (frame.machinecode_offset as i32 - machinecode.len() as i32) * 4;
            machinecode.push(branch::cbnz(cond.reg, offset, RegSize::Reg32bit));
        }
        _ => panic!("unexpected Instruction"),
    }
}

pub fn compile_if(
    blockty: BlockType,
    control_stack: &mut Vec<ControlFrame>,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        !value_stack.is_empty(),
        "insufficient operands on stack for 'if'"
    );

    let cond = value_stack.pop().unwrap();
    assert_eq!(cond.valtype, ValType::I32, "Operand type mismatch in 'if'");

    let end_types = match blockty {
        BlockType::Type(ty) => vec![ty],
        BlockType::Empty => vec![],
        _ => panic!("Unexpected blocktype in 'if'"),
    };

    register_pool.free();

    control_stack.push(ControlFrame {
        opcode: Opcode::If,
        start_types: vec![],
        end_types,
        stack_height: value_stack.len(),
        value_stack: Some(value_stack.to_vec()),
        register_pool_index: Some(register_pool.index),
        machinecode_offset: machinecode.len(),
        patches: vec![Patch {
            location: machinecode.len(),
            instruction: Instruction::Cbz,
        }],
    });
    machinecode.push(branch::cbz(cond.reg, 0, RegSize::Reg32bit));
}

pub fn compile_else(
    control_stack: &mut Vec<ControlFrame>,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let frame = control_stack
        .pop()
        .expect("control stack should contain at least one element on 'end' opcode");

    match frame.opcode {
        Opcode::If => {
            for patch in frame.patches {
                match patch.instruction {
                    Instruction::Cbz => {
                        // +1 because we want to jump *after* the last then-instruction
                        let offset = (machinecode.len() - patch.location + 1) as i32 * 4;
                        let location = machinecode
                            .get_mut(patch.location)
                            .expect("patch location should point to valid location");
                        branch::patch_cbz(offset, location);
                    }
                    _ => panic!("unexpected Instruction"),
                }
            }

            // Restore value stack and register pool to state at the beginning of the 'if' block
            *value_stack = frame.value_stack.unwrap();
            register_pool.index = frame.register_pool_index.unwrap();

            control_stack.push(ControlFrame {
                opcode: Opcode::Else,
                start_types: vec![],
                end_types: frame.end_types,
                stack_height: value_stack.len(),
                value_stack: None,
                register_pool_index: None,
                machinecode_offset: machinecode.len(),
                patches: vec![Patch {
                    location: machinecode.len(),
                    instruction: Instruction::Br,
                }],
            });
            machinecode.push(branch::branch(0));
        }
        _ => panic!("Unexpected Opcode in Else"),
    }
}

/// Compiles the opcode `end`
///
/// Handles control- and value-stack operations depending on the current block type
///
/// # Arguments
///
/// * `machinecode` - mutable reference to the current JIT-code vector
/// * `control_stack` - mutable reference to the control stack
/// * `value_stack` - mutable reference to the value stack
///
/// # Returns
///
/// `true` if the function should return; otherwise `false`
pub fn compile_end(
    control_stack: &mut Vec<ControlFrame>,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut [u32],
) -> bool {
    let frame = control_stack
        .pop()
        .expect("control stack should contain at least one element on 'end' opcode");

    let mut results = value_stack
        .split_off(i32::max(0, value_stack.len() as i32 - frame.end_types.len() as i32) as usize);
    value_stack.truncate(frame.stack_height);
    value_stack.append(&mut results);

    assert_eq!(
        value_stack.len(),
        frame.stack_height + frame.end_types.len(),
        "Length of value stack ({}) should match block result ({})",
        value_stack.len(),
        frame.stack_height + frame.end_types.len()
    );

    match frame.opcode {
        Opcode::Func => {
            for patch in frame.patches {
                match patch.instruction {
                    Instruction::Br => {
                        let offset = (machinecode.len() - patch.location) as i32 * 4;
                        let location = machinecode
                            .get_mut(patch.location)
                            .expect("patch location should point to valid location");
                        branch::patch_branch(offset, location);
                    }
                    _ => panic!("unexpected Instruction"),
                }
            }
            return true; // break 'expression;
        }
        Opcode::If => {
            // Restore value stack and register pool to state at the beginning of the 'if' block
            *value_stack = frame.value_stack.unwrap();
            register_pool.index = frame.register_pool_index.unwrap();

            for patch in frame.patches {
                match patch.instruction {
                    Instruction::Cbz => {
                        let offset = (machinecode.len() - patch.location) as i32 * 4;
                        let location = machinecode
                            .get_mut(patch.location)
                            .expect("patch location should point to valid location");
                        branch::patch_cbz(offset, location);
                    }
                    _ => panic!("unexpected Instruction"),
                }
            }
        }
        Opcode::Else => {
            for patch in frame.patches {
                match patch.instruction {
                    Instruction::Br => {
                        let offset = (machinecode.len() - patch.location) as i32 * 4;
                        let location = machinecode
                            .get_mut(patch.location)
                            .expect("patch location should point to valid location");
                        branch::patch_branch(offset, location);
                    }
                    _ => panic!("unexpected Instruction"),
                }
            }
        }
        Opcode::Loop => {}
        _ => panic!("unsupported constrol-frame type"),
    }

    false
}
