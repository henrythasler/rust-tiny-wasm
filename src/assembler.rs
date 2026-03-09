use aarch64::*;
mod aarch64;

pub fn emit_prologue(machinecode: &mut Vec<u32>) {
    machinecode.push(0xA9BF7BFD); // stp fp, lr, [sp, #-16]!  ; create a new stack frame
    machinecode.push(0x910003FD); // mov fp, sp
}

pub fn emit_epilogue(machinecode: &mut Vec<u32>) {
    machinecode.push(0xA8C17BFD); // ldp fp, lr, [sp], #16  ; destroy stack frame and restore FP, LR and SP
    machinecode.push(branch::ret(Reg::LR)); // ret
}
