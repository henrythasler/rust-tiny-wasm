use wasmparser::BlockType;

use super::*;

pub fn compile_return(control_stack: &mut [ControlFrame], machinecode: &mut Vec<u32>) {
    let frame = control_stack
        .get_mut(0)
        .expect("control stack should contain at least one element on 'return' opcode");
    frame.patches.push(Patch {
        location: machinecode.len(),
        instruction: Instruction::Br,
    });
    machinecode.push(branch::branch(0));
}

pub fn compile_if(
    blockty: BlockType,
    control_stack: &mut Vec<ControlFrame>,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        value_stack.len() >= 1,
        "insufficient operands on stack for 'if'"
    );

    let cond = value_stack.pop().unwrap();
    assert_eq!(cond.valtype, ValType::I32, "Operand type mismatch in 'if'");

    let end_types = match blockty {
        BlockType::Type(ty) => vec![ty],
        BlockType::Empty => vec![],
        _ => panic!("Unexpected blocktype in 'if'"),
    };

    control_stack.push(ControlFrame {
        opcode: Opcode::If,
        start_types: vec![],
        end_types,
        stack_height: value_stack.len(),
        patches: vec![Patch {
            location: machinecode.len(),
            instruction: Instruction::Cbz,
        }],
    });
    println!("{:?}", control_stack);
    machinecode.push(branch::cbz(cond.reg, 0, RegSize::Reg32bit));
    register_pool.free_register(&cond.reg);
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
    machinecode: &mut [u32],
) -> bool {
    let frame = control_stack
        .pop()
        .expect("control stack should contain at least one element on 'end' opcode");

    assert_eq!(
        value_stack.len(),
        frame.stack_height + frame.end_types.len(),
        "Length of value stack ({}) should match block result ({})",
        value_stack.len(),
        frame.stack_height + frame.end_types.len()
    );

    let mut results = value_stack.split_off(value_stack.len() - frame.end_types.len());
    value_stack.truncate(frame.stack_height);
    value_stack.append(&mut results);

    match frame.opcode {
        Opcode::Func => {
            for patch in frame.patches {
                match patch.instruction {
                    Instruction::Br => {
                        let offset = machinecode.len() as i32 - patch.location as i32;
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
            for patch in frame.patches {
                match patch.instruction {
                    Instruction::Cbz => {
                        let offset = machinecode.len() as i32 - patch.location as i32;
                        let location = machinecode
                            .get_mut(patch.location)
                            .expect("patch location should point to valid location");
                        branch::patch_cbz(offset, location);
                    }
                    _ => panic!("unexpected Instruction"),
                }
            }
        }
        _ => panic!("unsupported constrol-frame type"),
    }

    false
}
