use super::*;
use std::io::Cursor;
use wasmparser::ValType;

pub fn compile_const(
    opcode: &u8,
    cursor: &mut Cursor<&[u8]>,
    value_stack: &mut Vec<StackElement>,
    register_pool: &RegisterPool,
    machinecode: &mut Vec<u32>,
) -> usize {
    let register_size = if *opcode == 0x41 {
        RegSize::Reg32bit
    } else {
        RegSize::Reg64bit
    };

    let valtype = if *opcode == 0x41 {
        ValType::I32
    } else {
        ValType::I64
    };

    let value = leb128::read::signed(cursor).expect("Should read number");
    let reg = register_pool.allocate_register();
    value_stack.push(StackElement { reg, valtype });
    compound::mov_large_immediate(reg, value, register_size, machinecode);

    cursor.position() as usize
}
