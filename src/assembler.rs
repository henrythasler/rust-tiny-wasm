use super::*;
use crate::runtime::{TrapCode, WasmReturnCode};
use aarch64::*;
use std::collections::HashMap;

pub mod aarch64;

pub fn emit_prologue(
    stack_size: usize,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    machinecode.push(0xA9BF7BFD); // stp fp, lr, [sp, #-16]!  ; create a new stack frame
    machinecode.push(processing::mov_sp(IReg::FP, IReg::SP, RegSize::Reg64bit)); // mov fp, sp

    if stack_size > 0 {
        if stack_size < 0x10000 {
            machinecode.push(arithmetic::sub_imm(
                IReg::SP,
                IReg::SP,
                stack_size as u32,
                false,
                RegSize::Reg64bit,
            ));
        } else {
            let reg = register_pool.alloc();
            compound::mov_large_immediate(reg, stack_size as i64, RegSize::Reg64bit, machinecode);
            machinecode.push(arithmetic::sub_extended_reg(
                IReg::SP,
                IReg::SP,
                reg,
                Extend::Uxtx,
                0,
                RegSize::Reg64bit,
            ));
            register_pool.free();
        }
    }
}

pub fn emit_epilogue(stack_size: usize, machinecode: &mut Vec<u32>) {
    if stack_size > 0 {
        // deallocate stack memory (add sp, sp, #stackSize)
        machinecode.push(arithmetic::add_imm(
            IReg::SP,
            IReg::SP,
            stack_size as u32,
            false,
            RegSize::Reg64bit,
        ));
    }
    machinecode.push(0xA8C17BFD); // ldp fp, lr, [sp], #16  ; destroy stack frame and restore FP, LR and SP
    machinecode.push(branch::ret(IReg::LR)); // ret
}

pub fn emit_trap_handler(
    machinecode: &mut Vec<u32>,
    trap_offsets: &mut HashMap<TrapCode, usize>,
) -> WasmFunction {
    let offset = machinecode.len();
    for (trap_cnt, &code) in TrapCode::ALL.iter().enumerate() {
        // store offset to current trap code
        trap_offsets.insert(code, machinecode.len());
        // emit a trap handler for each trap code, which moves the trap code to X1 and returns with X0=Trap (1)
        machinecode.push(processing::mov_imm(
            IReg::X1,
            code as u32,
            RegSize::Reg64bit,
        ));
        machinecode.push(branch::branch(
            ((TrapCode::ALL.len() - trap_cnt) as i32 * 2 - 1) * INSTRUCTION_SIZE as i32,
        )); // b <next trap handler>
    }
    machinecode.push(processing::mov_imm(
        IReg::X0,
        WasmReturnCode::Trap as u32,
        RegSize::Reg64bit,
    ));
    machinecode.push(branch::ret(IReg::LR)); // ret

    WasmFunction {
        name: String::from("trap_handler"),
        offset,
        length: machinecode.len() - offset,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_oversized_stack() {
        let mut register_pool = RegisterPool::default();
        let mut machinecode: Vec<u32> = vec![];
        emit_prologue(0x80000, &mut register_pool, &mut machinecode);
        assert_eq!(
            machinecode,
            vec![0xA9BF7BFD, 0x910003FD, 0xD2800008, 0xF2A00108, 0xCB2863FF]
        );
    }
}
