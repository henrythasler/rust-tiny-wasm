use crate::assembler::*;
use crate::loader::Code;

pub fn compile_function(entry: &Code, machinecode: &mut Vec<u32>) {
    emit_prologue(machinecode);

    let mut iter = entry.code.iter();
    while let Some(&opcode) = iter.next() {
        print!("{:02X?} ", opcode);
    }
    println!();

    emit_epilogue(machinecode);
}
