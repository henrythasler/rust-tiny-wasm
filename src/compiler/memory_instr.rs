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
        "Module does not have a memory defined for load instructions"
    );

    assert!(
        memarg.memory == 0,
        "Only memory index 0 is supported for load instructions"
    );

    let element = value_stack
        .pop()
        .expect("value stack should contain at least one element on 'memory.load' instruction");

    assert!(
        element.valtype == wasmparser::ValType::I32,
        "Only i32 is supported for memory.load instruction"
    );

    let (register_size, signed_variant, mem_size) = match op {
        Operator::I32Load { .. } => (RegSize::Int32bit, false, MemSize::Mem32bit),
        Operator::I64Load { .. } => (RegSize::Int64bit, false, MemSize::Mem64bit),
        _ => panic!("Unsupported load instruction"),
    };

    let dynamic_offset_reg = match element.reg {
        Reg::IReg(reg) => reg,
        _ => panic!("Only integer registers are supported for memory.load instruction"),
    };

    // value_stack.push(StackElement {
    //     reg: Reg::IReg(address_reg),
    //     valtype: ValType::I32,
    // });

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
                RegSize::Int32bit,
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

    let length_reg = register_pool.alloc();
    machinecode.push(memory::ldr_imm_unsigned_offset(
        length_reg,
        CONTEXT_REG,
        ctx_offsets::MEMORY_LEN,
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
        Condition::LO,
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

    let result_reg = dynamic_offset_reg;
    machinecode.push(memory::ldr_reg(
        result_reg,
        result_reg,
        dynamic_offset_reg,
        IndexExtend::Lsl,
        0,
        mem_size,
        register_size,
    ));
    register_pool.free(); // address_reg

    value_stack.push(StackElement {
        reg: Reg::IReg(result_reg),
        valtype: ValType::I32,
    });
}
