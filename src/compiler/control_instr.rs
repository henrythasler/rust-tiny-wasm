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
                    _ => panic!("unexpected patch instruction"),
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
                    _ => panic!("unexpected patch instruction"),
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
                    _ => panic!("unexpected patch instruction"),
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
                    _ => panic!("unexpected patch instruction"),
                }
            }
        }
    }
    false
}

pub fn compile_call(
    function_index: u32,
    module_ctx: &ModuleContext,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    call_patches: &mut Vec<FunctionPatch>,
    trap_locations: &mut Vec<Patch>,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        function_index < module_ctx.functions.len() as u32,
        "call(): function index out of bounds"
    );

    let function = module_ctx
        .functions
        .get(function_index as usize)
        .expect("call(): function not found");

    // get the actual function type from the module context using the type index
    let func_type = module_ctx
        .types
        .get(function.type_index)
        .expect("call(): function type for function_index not found");

    assert!(
        func_type.results().len() <= 1,
        "call(): function must have at most one return value"
    );
    assert!(
        value_stack.len() >= func_type.params().len(),
        "call(): insufficient operands on stack for function call index {}: {} < {}",
        function_index,
        func_type.params().len(),
        value_stack.len(),
    );
    assert!(
        func_type.params().len() <= MAX_ARGUMENTS,
        "call(): function must have at most {} parameters",
        MAX_ARGUMENTS
    );

    // move parameters from value stack to procedure call standard registers
    // reverse the sequence to move the top-most stack element (last parameter) to the highest target register since `i` is also reversed
    for (i, param_type) in func_type.params().iter().enumerate().rev() {
        let stack_element = value_stack.pop().unwrap();
        assert_eq!(
            stack_element.valtype, *param_type,
            "call(): parameter type mismatch for function call"
        );
        match stack_element.reg {
            Reg::IReg(reg) => {
                machinecode.push(processing::mov_reg(
                    INTEGER_ARGUMENT_REGS[i],
                    reg,
                    map_valtype_to_regsize(param_type),
                ));
                register_pool.free();
            }
            Reg::FReg(reg) => {
                machinecode.push(fp_processing::fmov(
                    Reg::FReg(FLOAT_ARGUMENT_REGS[i]),
                    Reg::FReg(reg),
                    map_valtype_to_regsize(param_type),
                ));
                register_pool.free_float();
            }
        }
    }

    load_context_from_stack(machinecode);

    let mut stack_size = 0;
    if register_pool.index > 0 {
        // save registers to stack before the call
        stack_size = save_registers(register_pool, machinecode);
    }

    // need to mark the location of the call instruction for later patching, since we may not know the address of the function to call yet
    call_patches.push(FunctionPatch {
        location: machinecode.len(),
        instruction: Instruction::Call,
        function_index,
    });
    machinecode.push(branch::branch_link(0));

    // restore registers from stack after the call
    if stack_size > 0 {
        restore_registers(stack_size, register_pool, machinecode);
    }

    // result values according to Aarch64 Procedure Call Standard (X0..X7) are
    // X0: Return Code (0=Ok, 1=Trap),
    // X1: Result or Trap code

    // if the return code is 1 (cbnz), we will return from this function immediately.
    trap_locations.push(Patch {
        location: machinecode.len(),
        instruction: Instruction::Cbnz,
    });
    machinecode.push(branch::cbnz(
        RETURN_STATUS_REGISTER,
        0, // jump to epilogue if return code is 1 (Trap)
        RegSize::Int64bit,
    ));

    // copy return value from RETURN_VALUE_REGISTER to value stack
    if !func_type.results().is_empty() {
        let return_type = func_type.results().first().unwrap();
        match return_type {
            ValType::I64 | ValType::I32 => {
                let reg = register_pool.alloc();
                machinecode.push(processing::mov_reg(
                    reg,
                    RETURN_VALUE_REGISTER,
                    map_valtype_to_regsize(return_type),
                ));
                let stack_element = StackElement {
                    valtype: *return_type,
                    reg: Reg::IReg(reg),
                };
                value_stack.push(stack_element);
            }
            ValType::F32 | ValType::F64 => {
                let reg = register_pool.alloc_float();
                machinecode.push(fp_processing::fmov(
                    Reg::FReg(reg),
                    Reg::IReg(RETURN_VALUE_REGISTER),
                    map_valtype_to_regsize(return_type),
                ));
                let stack_element = StackElement {
                    valtype: *return_type,
                    reg: Reg::FReg(reg),
                };
                value_stack.push(stack_element);
            }
            _ => panic!("Unsupported return type for function call"),
        }
    }
}

pub fn compile_call_indirect(
    type_index: u32,
    _table_index: u32,
    module_ctx: &ModuleContext,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    // _call_patches: &mut Vec<FunctionPatch>,
    trap_locations: &mut Vec<Patch>,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        module_ctx.compiler_func_table.is_some(),
        "call_indirect(): function table is not defined in the module"
    );

    // get the actual function type from the module context using the type index
    let func_type = module_ctx
        .types
        .get(type_index as usize)
        .expect("call_indirect(): function type for type_index not found");

    assert!(
        func_type.results().len() <= 1,
        "call_indirect(): function must have at most one return value"
    );
    assert!(
        func_type.params().len() <= MAX_ARGUMENTS,
        "call_indirect(): function must have at most {} parameters",
        MAX_ARGUMENTS
    );

    assert!(
        !value_stack.is_empty(),
        "call_indirect(): insufficient operands on stack for call_indirect"
    );

    let table_index = value_stack.pop().unwrap();
    assert_eq!(
        table_index.valtype,
        ValType::I32,
        "Operand type mismatch in 'call_indirect'"
    );

    // emit runtime check that the value in register 'tableidx' is smaller than the size of the table
    // branch_cond over next instruction if result is <= FUNC_TABLE_LEN; otherwise trap with table index out of bounds

    let table_index_reg = match table_index.reg {
        Reg::IReg(reg) => reg,
        _ => panic!("call_indirect(): expected IReg as table_index"),
    };

    let table_len_reg = register_pool.alloc();
    machinecode.push(memory::ldr_imm_unsigned_offset(
        table_len_reg,
        CONTEXT_REG,
        ctx_offsets::FUNC_TABLE_LEN,
        MemSize::Mem32bit,
        RegSize::Int32bit,
    ));
    machinecode.push(arithmetic::cmp_shifted_reg(
        table_index_reg,
        table_len_reg,
        Shift::Lsl,
        0,
        RegSize::Int32bit,
    ));
    machinecode.push(branch::branch_cond(
        Condition::LT,
        TRAP_SKIP_BRANCH * INSTRUCTION_SIZE as i32,
    ));
    trap_inline(TrapCode::TableOutOfBounds, trap_locations, machinecode);
    register_pool.free();

    // load the 

    // // load the function (offset, type_index) tuple from the function table into a register
    // let func_index_reg = register_pool.alloc();
    // let funct_table_offset =
    //     module_ctx.compiler_func_table.as_ref().unwrap().offset as i64 * INSTRUCTION_SIZE as i64;
    // let page_offset =
    //     funct_table_offset & (!0xfff - machinecode.len() as i64 * INSTRUCTION_SIZE as i64) & !0xfff;
    // machinecode.push(memory::adrp(func_index_reg, page_offset));
    // machinecode.push(arithmetic::add_imm(
    //     func_index_reg,
    //     func_index_reg,
    //     (funct_table_offset & 0xfff) as u32,
    //     false,
    //     RegSize::Int64bit,
    // ));

    // machinecode.push(memory::ldr_reg(
    //     func_index_reg,
    //     func_index_reg,
    //     table_index_reg,
    //     IndexExtend::Lsl, // need to shift left by 3 to get the correct offset for the function table entry (each entry is 8 bytes)
    //     3,
    //     MemSize::Mem64bit,
    //     RegSize::Int64bit,
    // ));

    // runtime check that the table element is NOT uninitialized (i.e. the function offset is not 0xFFFFFFFF)
    // CMN = Compare Negative → adds operand and sets flags; If w0 == 0xFFFFFFFF, then w0 + 1 == 0; Z flag is set on match

    // machinecode.push(arithmetic::cmn_imm(
    //     func_index_reg,
    //     1,
    //     false,
    //     RegSize::Int64bit,
    // ));

    // machinecode.push(branch::branch_cond(
    //     Condition::NE,
    //     TRAP_SKIP_BRANCH * INSTRUCTION_SIZE as i32,
    // ));
    // trap_inline(TrapCode::IndirectCallToNull, trap_locations, machinecode);

    // runtime check that the function type of the function at the given table index matches the expected function type
    // (1) Load the type index of the function at the given table index from the function table into a register
    // (2) compare it with the expected function type index if they don't match, trap

    // let type_reg = register_pool.alloc();
    // machinecode.push(bit::lsr_imm(
    //     type_reg,
    //     func_index_reg,
    //     32,
    //     RegSize::Int64bit,
    // ));
    // machinecode.push(arithmetic::cmp_imm(
    //     type_reg,
    //     type_index,
    //     false,
    //     RegSize::Int32bit,
    // ));
    // machinecode.push(branch::branch_cond(
    //     Condition::NE,
    //     TRAP_SKIP_BRANCH * INSTRUCTION_SIZE as i32,
    // ));
    // trap_inline(TrapCode::BadSignature, trap_locations, machinecode);
    // register_pool.free(); // type_reg
    // register_pool.free(); // table_index_reg

    // load the address of the function to be called (callee)
}
