use aarch64::*;
pub mod aarch64;

pub fn emit_prologue(stack_size: usize, machinecode: &mut Vec<u32>) {
    machinecode.push(0xA9BF7BFD); // stp fp, lr, [sp, #-16]!  ; create a new stack frame
    machinecode.push(0x910003FD); // mov fp, sp

    if stack_size > 0 {
        let stack_size = ((stack_size + (STACK_ALIGNMENT - 1)) / STACK_ALIGNMENT) * STACK_ALIGNMENT;
        assert!(
            stack_size % STACK_ALIGNMENT == 0,
            "stack size not aligned properly"
        );
        assert!(
            stack_size < 65536,
            "stack size too large to encode in a single instruction"
        );
        machinecode.push(arithmetic::sub_imm(
            Reg::SP,
            Reg::SP,
            stack_size as u32,
            false,
            RegSize::Reg64bit,
        ));
    }
}

pub fn emit_epilogue(stack_size: usize, machinecode: &mut Vec<u32>) {
    if stack_size > 0 {
        // deallocate stack memory (add sp, sp, #stackSize)
        machinecode.push(arithmetic::add_imm(
            Reg::SP,
            Reg::SP,
            stack_size as u32,
            false,
            RegSize::Reg64bit,
        ));
    }
    machinecode.push(0xA8C17BFD); // ldp fp, lr, [sp], #16  ; destroy stack frame and restore FP, LR and SP
    machinecode.push(branch::ret(Reg::LR)); // ret
}
