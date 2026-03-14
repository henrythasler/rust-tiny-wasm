use std::io::{Cursor, Read, Seek};

use super::function::*;
use crate::assembler::aarch64::*;

pub fn compile_const(
    opcode: &u8,
    cursor: &mut Cursor<&[u8]>,
    value_stack: &mut Vec<StackElement>,
    machinecode: &mut Vec<u32>,
) -> usize {
    let registerSize = if *opcode == 0x41 {
        RegSize::Reg32bit
    } else {
        RegSize::Reg64bit
    };

    let _ = cursor.seek_relative(1);
    let val = leb128::read::signed(cursor).expect("Should read number");
    println!("leb128={} at index {}", val, cursor.position());

        // auto registerSize = (*(stream - 1) == 0x41) ? arm64::reg_size_t::SIZE_32BIT : arm64::reg_size_t::SIZE_64BIT;
        // auto constValue = decoder::LEB128Decoder::decodeSigned(stream, streamEnd); // n
        // auto reg = registerPool.allocateRegister();
        // stack.emplace_back(reg);
        // arm64::emit_mov_large_immediate(reg, uint64_t(constValue), registerSize, machinecode);

    (cursor.position() - 2) as usize
}
