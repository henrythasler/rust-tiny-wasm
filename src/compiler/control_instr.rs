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

pub fn compile_block(
    blockty: BlockType,
    control_stack: &mut Vec<ControlFrame>,
    value_stack: &mut [StackElement],
    register_pool: &mut RegisterPool,
    machinecode: &mut [u32],
) {
    let end_types = match blockty {
        BlockType::Type(ty) => vec![ty],
        BlockType::Empty => vec![],
        _ => panic!("Unexpected result type for block"),
    };

    control_stack.push(ControlFrame {
        opcode: Opcode::Block,
        start_types: vec![],
        end_types,
        stack_height: value_stack.len(),
        value_stack: Some(value_stack.to_vec()),
        register_index: Some(register_pool.index),
        result_register: None,
        machinecode_offset: machinecode.len(),
        patches: vec![],
    });
}

pub fn compile_loop(
    blockty: BlockType,
    control_stack: &mut Vec<ControlFrame>,
    value_stack: &mut [StackElement],
    register_pool: &mut RegisterPool,
    machinecode: &mut [u32],
) {
    assert_eq!(
        blockty,
        BlockType::Empty,
        "result type of loop block must be 'Empty'"
    );

    control_stack.push(ControlFrame {
        opcode: Opcode::Loop,
        start_types: vec![],
        end_types: vec![],
        stack_height: value_stack.len(),
        value_stack: Some(value_stack.to_vec()),
        register_index: Some(register_pool.index),
        result_register: None,
        machinecode_offset: machinecode.len(),
        patches: vec![],
    });
}

pub fn compile_br(
    relative_depth: u32,
    control_stack: &mut [ControlFrame],
    value_stack: &[StackElement],
    machinecode: &mut Vec<u32>,
) {
    let idx = control_stack.len() - 1 - relative_depth as usize;
    let frame = control_stack
        .get_mut(idx)
        .expect("control stack inconsistent");

    if !frame.end_types.is_empty() && frame.result_register.is_none() {
        frame.result_register = Some(value_stack.last().unwrap().reg);
    }

    match frame.opcode {
        Opcode::Block => {
            frame.patches.push(Patch {
                location: machinecode.len(),
                instruction: Instruction::Br,
            });
            machinecode.push(branch::branch(0));
        }
        _ => panic!(
            "unexpected instruction for control stack item {:?}:",
            frame.opcode
        ),
    }
}

pub fn compile_brif(
    relative_depth: u32,
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
    let idx = control_stack.len() - 1 - relative_depth as usize;
    let frame = control_stack
        .get_mut(idx)
        .expect("control stack inconsistent");

    match cond.reg {
        Reg::IReg(reg) => {
            register_pool.free();

            if !frame.end_types.is_empty() && frame.result_register.is_none() {
                frame.result_register = Some(value_stack.last().unwrap().reg);
            }

            match frame.opcode {
                Opcode::Loop => {
                    let offset = (frame.machinecode_offset as i32 - machinecode.len() as i32) * 4;
                    machinecode.push(branch::cbnz(reg, offset, RegSize::Int32bit));
                }
                Opcode::Block => {
                    frame.patches.push(Patch {
                        location: machinecode.len(),
                        instruction: Instruction::Cbz,
                    });
                    machinecode.push(branch::cbnz(reg, 0, RegSize::Int32bit));
                }
                _ => panic!(
                    "unexpected instruction for control stack item {:?}:",
                    frame.opcode
                ),
            }
        }
        _ => panic!("Unsupported register type for 'brif' condition"),
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

    match cond.reg {
        Reg::IReg(reg) => {
            register_pool.free();
            control_stack.push(ControlFrame {
                opcode: Opcode::If,
                start_types: vec![],
                end_types,
                stack_height: value_stack.len(),
                value_stack: Some(value_stack.to_vec()),
                register_index: Some(register_pool.index),
                result_register: None,
                machinecode_offset: machinecode.len(),
                patches: vec![Patch {
                    location: machinecode.len(),
                    instruction: Instruction::Cbz,
                }],
            });
            machinecode.push(branch::cbz(reg, 0, RegSize::Int32bit));
        }
        _ => panic!("Unsupported register type for 'if' condition"),
    }
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
            register_pool.index = frame.register_index.unwrap();

            control_stack.push(ControlFrame {
                opcode: Opcode::Else,
                start_types: vec![],
                end_types: frame.end_types,
                stack_height: value_stack.len(),
                value_stack: None,
                register_index: None,
                result_register: None,
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
    machinecode: &mut Vec<u32>,
) -> bool {
    let frame = control_stack
        .pop()
        .expect("control stack should contain at least one element on 'end' opcode");

    let mut results = value_stack
        .split_off(i32::max(0, value_stack.len() as i32 - frame.end_types.len() as i32) as usize);
    value_stack.truncate(frame.stack_height);
    value_stack.append(&mut results);

    // restore register pool to state at the beginning of the block, so registers used in this block are available again
    register_pool.index = frame.register_index.unwrap_or(0) + frame.end_types.len() as i32;

    // stack unwinding register alignment
    if !frame.end_types.is_empty()
        && let Some(expected_reg) = frame.result_register
    {
        let stack_element = value_stack.last().unwrap();
        let result_type = frame.end_types.last().unwrap();

        if stack_element.reg != expected_reg {
            let stack_element = value_stack.pop().unwrap();
            value_stack.push(StackElement {
                reg: expected_reg,
                valtype: *result_type,
            });
            match (stack_element.reg, expected_reg) {
                (Reg::IReg(reg), Reg::IReg(expected_reg)) => {
                    machinecode.push(processing::mov_reg(
                        expected_reg,
                        reg,
                        map_valtype_to_regsize(result_type),
                    ));
                }
                _ => panic!("Unsupported register type for block result"),
            }
        }
    }

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
            register_pool.index = frame.register_index.unwrap();

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
        Opcode::Block => {
            for patch in frame.patches {
                match patch.instruction {
                    Instruction::Br => {
                        let offset = (machinecode.len() - patch.location) as i32 * 4;
                        let location = machinecode
                            .get_mut(patch.location)
                            .expect("patch location should point to valid location");
                        branch::patch_branch(offset, location);
                    }
                    Instruction::Cbz => {
                        let offset = (machinecode.len() - patch.location) as i32 * 4;
                        let location = machinecode
                            .get_mut(patch.location)
                            .expect("patch location should point to valid location");
                        branch::patch_cbz(offset, location);
                    }
                }
            }
        }
    }
    false
}

pub fn compile_call(
    function_index: u32,
    module_ctx: &ModuleContext,
    control_stack: &mut Vec<ControlFrame>,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        function_index < module_ctx.functions.len() as u32,
        "call(): function index out of bounds"
    );

    // extract the function's type index from the module context
    let type_index = module_ctx
        .functions
        .get(function_index as usize)
        .expect("call(): function not found");

    // get the actual function type from the module context using the type index
    let func_type = module_ctx.types.get(*type_index as usize).expect(
        format!(
            "call(): function type for function_index {} not found",
            function_index
        )
        .as_str(),
    );
    assert!(
        func_type.results().len() <= 1,
        "call(): function must have at most one return value"
    );
    assert!(
        func_type.params().len() >= value_stack.len(),
        "call(): insufficient operands on stack for function call"
    );
    assert!(
        func_type.params().len() <= 8,
        "call(): function must have at most 8 parameters"
    );

    // move parameters from value stack to registers
    for (i, param_type) in func_type.params().iter().enumerate().rev() {
        let stack_element = value_stack.pop().unwrap();
        assert_eq!(
            stack_element.valtype, *param_type,
            "call(): parameter type mismatch for function call"
        );
        match stack_element.reg {
            Reg::IReg(reg) => {
                machinecode.push(processing::mov_reg(
                    IReg::try_from((func_type.params().len() - 1 - i) as u32).unwrap(),
                    reg,
                    map_valtype_to_regsize(param_type),
                ));
                register_pool.free();
            }
            _ => panic!("Unsupported register type for function parameter"),
        }
    }

    // copy return values from register to value stack
    if !func_type.results().is_empty() {
        let return_type = func_type.results().first().unwrap();
        let stack_element = StackElement {
            valtype: *return_type,
            reg: Reg::IReg(IReg::try_from(0).unwrap()),
        };
        value_stack.push(stack_element);
    }

}
