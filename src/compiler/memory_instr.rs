use wasmparser::MemArg;

use super::*;

pub fn compile_load(
    op: &Operator,
    memarg: MemArg,
    module_ctx: &ModuleContext,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    trap_locations: &mut Vec<Patch>,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        module_ctx.memory.is_some(),
        "Module does not have a memory defined for memory.load instructions"
    );

    assert!(
        memarg.memory == 0,
        "Only memory index 0 is supported for memory.load instructions"
    );

    let element = value_stack
        .pop()
        .expect("value stack should contain at least one element for memory.load instructions");

    assert!(
        element.valtype == wasmparser::ValType::I32,
        "Only i32 offset arguments are supported for memory.load instructions"
    );

    let (register_size, is_signed, mem_size) = match op {
        Operator::I64Load { .. } => (RegSize::Int64bit, false, MemSize::Mem64bit),
        Operator::I32Load { .. } => (RegSize::Int32bit, false, MemSize::Mem32bit),
        Operator::I32Load16S { .. } => (RegSize::Int32bit, true, MemSize::Mem16bit),
        Operator::I32Load16U { .. } => (RegSize::Int32bit, false, MemSize::Mem16bit),
        Operator::I32Load8S { .. } => (RegSize::Int32bit, true, MemSize::Mem8bit),
        Operator::I32Load8U { .. } => (RegSize::Int32bit, false, MemSize::Mem8bit),

        _ => panic!("Unsupported memory.load instruction"),
    };

    let dynamic_offset_reg = match element.reg {
        Reg::IReg(reg) => reg,
        _ => panic!("Only integer registers are supported for memory.load instructions"),
    };

    // add the static offset to the dynamic offset if it's greater than 0
    if memarg.offset > 0 {
        if memarg.offset < 0x10000 {
            machinecode.push(arithmetic::add_imm(
                dynamic_offset_reg,
                dynamic_offset_reg,
                memarg.offset as u32,
                false,
                RegSize::Int64bit,
            ));
        } else {
            let static_offset_reg = register_pool.alloc();
            compound::mov_large_immediate(
                static_offset_reg,
                memarg.offset as i64,
                RegSize::Int64bit,
                machinecode,
            );
            machinecode.push(arithmetic::add_shifted_reg(
                dynamic_offset_reg,
                dynamic_offset_reg,
                static_offset_reg,
                Shift::Lsl,
                0,
                RegSize::Int64bit,
            ));
            register_pool.free(); // Free the static_offset_reg after use
        }
    }

    // insert bounds check for the memory access
    let length_reg = register_pool.alloc();
    machinecode.push(memory::ldr_imm_unsigned_offset(
        length_reg,
        CONTEXT_REG,
        ctx_offsets::MEMORY_LEN_BYTES,
        MemSize::Mem64bit,
        RegSize::Int64bit,
    ));

    // substract length of the memory to read
    machinecode.push(arithmetic::sub_imm(
        length_reg,
        length_reg,
        mem_size.to_bytes(),
        false,
        RegSize::Int64bit,
    ));
    machinecode.push(arithmetic::cmp_shifted_reg(
        dynamic_offset_reg,
        length_reg,
        Shift::Lsl,
        0,
        RegSize::Int64bit,
    ));

    machinecode.push(branch::branch_cond(
        Condition::LS,
        TRAP_SKIP_BRANCH * INSTRUCTION_SIZE as i32,
    ));
    trap_inline(TrapCode::MemoryOutOfBounds, trap_locations, machinecode);
    register_pool.free(); // length_reg

    let address_reg = register_pool.alloc();

    machinecode.push(memory::ldr_imm_unsigned_offset(
        address_reg,
        CONTEXT_REG,
        ctx_offsets::MEMORY_BASE,
        MemSize::Mem64bit,
        RegSize::Int64bit,
    ));

    // load the actual data from linear memory using the computed address and offset
    // differentiate between signed and unsigned variants of the load instruction
    let result_reg = dynamic_offset_reg;
    match is_signed {
        true => machinecode.push(memory::ldr_reg_signed(
            result_reg,
            address_reg,
            dynamic_offset_reg,
            IndexExtend::Lsl,
            0,
            mem_size,
            register_size,
        )),
        false => machinecode.push(memory::ldr_reg(
            result_reg,
            address_reg,
            dynamic_offset_reg,
            IndexExtend::Lsl,
            0,
            mem_size,
            register_size,
        )),
    }
    register_pool.free(); // address_reg

    value_stack.push(StackElement {
        reg: Reg::IReg(result_reg),
        valtype: ValType::I32,
    });
}

pub fn compile_store(
    op: &Operator,
    memarg: MemArg,
    module_ctx: &ModuleContext,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    trap_locations: &mut Vec<Patch>,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        module_ctx.memory.is_some(),
        "Module does not have a memory defined for memory.store instructions"
    );

    assert!(
        memarg.memory == 0,
        "Only memory index 0 is supported for memory.store instructions"
    );

    let (register_size, mem_size) = match op {
        Operator::I64Store { .. } => (RegSize::Int64bit, MemSize::Mem64bit),
        Operator::I32Store { .. } => (RegSize::Int32bit, MemSize::Mem32bit),
        Operator::I32Store16 { .. } => (RegSize::Int32bit, MemSize::Mem16bit),
        Operator::I32Store8 { .. } => (RegSize::Int32bit, MemSize::Mem8bit),
        _ => panic!("Unsupported memory.store instruction"),
    };

    assert!(
        value_stack.len() >= 2,
        "value stack should contain at least two elements for memory.store instructions"
    );

    // extract and validate the value to be stored
    let value = value_stack
        .pop()
        .expect("value stack should contain at least one element for memory.store instructions");

    assert!(
        map_valtype_to_regsize(&value.valtype) == register_size,
        "Value type does not match memory size for memory.store instruction"
    );

    // extract and validate the dynamic offset
    let dynamic_offset = value_stack
        .pop()
        .expect("value stack should contain at least one element for memory.store instructions");

    assert!(
        dynamic_offset.valtype == wasmparser::ValType::I32,
        "Only i32 offset arguments are supported for memory.store instructions"
    );

    let dynamic_offset_reg = match dynamic_offset.reg {
        Reg::IReg(reg) => reg,
        _ => panic!("Only integer registers are supported for memory.store instructions"),
    };

    // add the static offset to the dynamic offset if it's greater than 0
    if memarg.offset > 0 {
        if memarg.offset < 0x10000 {
            machinecode.push(arithmetic::add_imm(
                dynamic_offset_reg,
                dynamic_offset_reg,
                memarg.offset as u32,
                false,
                RegSize::Int64bit,
            ));
        } else {
            let static_offset_reg = register_pool.alloc();
            compound::mov_large_immediate(
                static_offset_reg,
                memarg.offset as i64,
                RegSize::Int64bit,
                machinecode,
            );
            machinecode.push(arithmetic::add_shifted_reg(
                dynamic_offset_reg,
                dynamic_offset_reg,
                static_offset_reg,
                Shift::Lsl,
                0,
                RegSize::Int64bit,
            ));
            register_pool.free(); // Free the static_offset_reg after use
        }
    }

    // insert bounds check for the memory access
    let length_reg = register_pool.alloc();
    machinecode.push(memory::ldr_imm_unsigned_offset(
        length_reg,
        CONTEXT_REG,
        ctx_offsets::MEMORY_LEN_BYTES,
        MemSize::Mem64bit,
        RegSize::Int64bit,
    ));

    // substract length of the memory to write
    machinecode.push(arithmetic::sub_imm(
        length_reg,
        length_reg,
        mem_size.to_bytes(),
        false,
        RegSize::Int64bit,
    ));
    machinecode.push(arithmetic::cmp_shifted_reg(
        dynamic_offset_reg,
        length_reg,
        Shift::Lsl,
        0,
        RegSize::Int64bit,
    ));

    machinecode.push(branch::branch_cond(
        Condition::LS,
        TRAP_SKIP_BRANCH * INSTRUCTION_SIZE as i32,
    ));
    trap_inline(TrapCode::MemoryOutOfBounds, trap_locations, machinecode);
    register_pool.free(); // length_reg

    let address_reg = register_pool.alloc();

    machinecode.push(memory::ldr_imm_unsigned_offset(
        address_reg,
        CONTEXT_REG,
        ctx_offsets::MEMORY_BASE,
        MemSize::Mem64bit,
        RegSize::Int64bit,
    ));

    // load the actual data from linear memory using the computed address and offset
    // differentiate between signed and unsigned variants of the load instruction
    // let result_reg = dynamic_offset_reg;
    match value.reg {
        Reg::IReg(reg) => machinecode.push(memory::str_reg(
            reg,
            address_reg,
            dynamic_offset_reg,
            IndexExtend::Lsl,
            0,
            mem_size,
            register_size,
        )),
        Reg::FReg(_reg) => {
            panic!("Floating point store operations are not supported");
        }
    }
    register_pool.free(); // address_reg
    register_pool.free(); // dynamic_offset_reg
    register_pool.free(); // value.reg
}

pub fn compile_mem_size(
    memory_index: u32,
    module_ctx: &ModuleContext,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        module_ctx.memory.is_some(),
        "Module does not have a memory defined for memory.size instructions"
    );

    assert!(
        memory_index == 0,
        "Only memory index 0 is supported for memory.size instructions"
    );

    let result_reg = register_pool.alloc();

    machinecode.push(memory::ldr_imm_unsigned_offset(
        result_reg,
        CONTEXT_REG,
        ctx_offsets::MEMORY_LEN_PAGES,
        MemSize::Mem64bit,
        RegSize::Int64bit,
    ));

    value_stack.push(StackElement {
        reg: Reg::IReg(result_reg),
        valtype: ValType::I32,
    });
}

pub fn compile_mem_grow(
    memory_index: u32,
    module_ctx: &ModuleContext,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    assert!(
        module_ctx.memory.is_some(),
        "Module does not have a memory defined for memory.grow instructions"
    );

    assert!(
        memory_index == 0,
        "Only memory index 0 is supported for memory.grow instructions"
    );

    // extract and validate the pages to grow
    let pages = value_stack
        .pop()
        .expect("value stack should contain at least one element for memory.grow instructions");

    assert!(
        pages.valtype == wasmparser::ValType::I32,
        "Only i32 offset arguments are supported for memory.grow instructions"
    );

    let pages_reg = match pages.reg {
        Reg::IReg(reg) => reg,
        _ => panic!("Only integer registers are supported for memory.grow instructions"),
    };

    let code_ptr_reg = register_pool.alloc();

    load_context_from_stack(machinecode);
    machinecode.push(memory::ldr_imm_unsigned_offset(
        code_ptr_reg,
        CONTEXT_REG,
        ctx_offsets::HOSTFN_BASE + hostfn_offsets::MEMORY_GROW,
        MemSize::Mem64bit,
        RegSize::Int64bit,
    ));

    let mut stack_size = 0;
    if register_pool.index > 0 {
        // save registers to stack before the call
        stack_size = save_registers(register_pool, machinecode);
    }
    // address of the function to be called (callee) is in code_ptr_reg;
    machinecode.push(branch::branch_link_reg(code_ptr_reg));

    // restore registers from stack after the call; we do this here instead of after the trap check
    // because we want to free the stack space used for saving registers even if the call traps, so that the stack
    // is in a consistent state when the trap handler is called.
    if stack_size > 0 {
        restore_registers(stack_size, register_pool, machinecode);
    }
    register_pool.free(); // code_ptr_reg

    machinecode.push(processing::mov_reg(
        pages_reg,
        HOST_FUNCTION_RETURN_VALUE_REGISTER,
        RegSize::Int32bit,
    ));
    value_stack.push(pages);
}
