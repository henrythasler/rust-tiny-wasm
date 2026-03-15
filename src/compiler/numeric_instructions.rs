use super::*;
use std::io::Cursor;

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

    let val_type = if *opcode == 0x41 {
        Webassembly_ValTypes::I32
    } else {
        Webassembly_ValTypes::I64
    };

    let value = leb128::read::signed(cursor).expect("Should read number");
    let reg = register_pool.allocate_register();
    value_stack.push(StackElement { reg, val_type });
    compound::mov_large_immediate(reg, value, register_size, machinecode);

    cursor.position() as usize
}
