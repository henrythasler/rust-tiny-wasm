use aarch64::*;

pub mod aarch64;

pub fn emit_prologue(
    stack_size: usize,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    machinecode.push(0xA9BF7BFD); // stp fp, lr, [sp, #-16]!  ; create a new stack frame
    machinecode.push(processing::mov_sp(IReg::FP, IReg::SP, RegSize::Int64bit)); // mov fp, sp

    if stack_size > 0 {
        if stack_size < 0x10000 {
            machinecode.push(arithmetic::sub_imm(
                IReg::SP,
                IReg::SP,
                stack_size as u32,
                false,
                RegSize::Int64bit,
            ));
        } else {
            let reg = register_pool.alloc();
            compound::mov_large_immediate(reg, stack_size as i64, RegSize::Int64bit, machinecode);
            machinecode.push(arithmetic::sub_extended_reg(
                IReg::SP,
                IReg::SP,
                reg,
                Extend::Uxtx,
                0,
                RegSize::Int64bit,
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
            RegSize::Int64bit,
        ));
    }
    machinecode.push(0xA8C17BFD); // ldp fp, lr, [sp], #16  ; destroy stack frame and restore FP, LR and SP
    machinecode.push(branch::ret(IReg::LR)); // ret
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
