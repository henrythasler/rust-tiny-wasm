use super::*;

/// This instruction loads a word or doubleword from memory and writes it to a register.
///
/// The address that is used for the load is calculated from a base register and an immediate offset.
/// For information about addressing modes, see Load/Store addressing modes.
/// The Unsigned offset variant scales the immediate offset value by the size of the value accessed before adding it to the base register value.
///
/// # Instructions
/// `LDR Xt, [Xn, imm]`
/// `LDR Wt, [Xn, imm]`
/// `LDRH Wt, [Xn, imm]`
/// `LDRB Wt, [Xn, imm]`
pub fn ldr_imm_unsigned_offset(rt: Reg, rn: Reg, imm: u32, mem: MemSize, size: RegSize) -> u32 {
    let mut imm = imm;
    let mut instr: u32 = if mem == MemSize::Mem64bit && size == RegSize::Reg64bit {
        imm >>= 3;
        0xF9400000
    } else if mem == MemSize::Mem32bit && size == RegSize::Reg32bit {
        imm >>= 2;
        0xB9400000
    } else if mem == MemSize::Mem16bit && size == RegSize::Reg32bit {
        imm >>= 1;
        0x79400000
    } else if mem == MemSize::Mem8bit && size == RegSize::Reg32bit {
        0x39400000
    } else {
        panic!("invalid MemSize or RegSize in ldr_imm_unsigned_offset")
    };

    instr |= (imm & 0xFFF) << 10; // imm12 field
    instr |= (rn & 0x1F) << 5; // Rn (base register)
    instr |= rt & 0x1F; // Rt (source register)

    instr
}

pub fn str_imm_unsigned_offset(rt: Reg, rn: Reg, imm: u32, mem: MemSize, size: RegSize) -> u32 {
    let mut imm = imm;
    let mut instr: u32 = if mem == MemSize::Mem64bit && size == RegSize::Reg64bit {
        imm >>= 3;
        0xF9000000
    } else if mem == MemSize::Mem32bit && size == RegSize::Reg32bit {
        imm >>= 2;
        0xB9000000
    } else if mem == MemSize::Mem16bit && size == RegSize::Reg32bit {
        imm >>= 1;
        0x79000000
    } else if mem == MemSize::Mem8bit && size == RegSize::Reg32bit {
        0x39000000
    } else {
        panic!("invalid MemSize or RegSize in ldr_imm_unsigned_offset")
    };

    instr |= (imm & 0xFFF) << 10; // imm12 field
    instr |= (rn & 0x1F) << 5; // Rn (base register)
    instr |= rt & 0x1F; // Rt (source register)

    instr
}
