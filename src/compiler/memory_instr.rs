use wasmparser::MemArg;

use super::*;

pub fn compile_load(
    memarg: MemArg,
    module_ctx: &ModuleContext,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
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

    // Add the offset to the register containing the address
    match element.reg {
        Reg::IReg(reg) => {
            let result_reg = register_pool.alloc();
            value_stack.push(StackElement {
                reg: Reg::IReg(result_reg),
                valtype: ValType::I32,
            });

            machinecode.push(memory::ldr_imm_unsigned_offset(
                result_reg,
                CONTEXT_REG,
                ctx_offsets::MEMORY_BASE,
                MemSize::Mem64bit,
                RegSize::Int64bit,
            ));

            machinecode.push(arithmetic::add_shifted_reg(
                result_reg,
                result_reg,
                reg,
                Shift::Lsl,
                0,
                RegSize::Int64bit,
            ));

            machinecode.push(memory::ldr_imm_unsigned_offset(
                result_reg,
                result_reg,
                memarg.offset as u32, // Assuming each global is 8 bytes; adjust as necessary
                MemSize::Mem32bit,
                RegSize::Int32bit,
            ));
        }
        _ => panic!("Only integer registers are supported for memory.load instruction"),
    }
}
