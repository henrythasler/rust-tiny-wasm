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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ldr_imm_unsigned_offset() {
        // ldrb w8, [sp, 1]
        assert_eq!(
            ldr_imm_unsigned_offset(Reg::W8, Reg::SP, 1, MemSize::Mem8bit, RegSize::Reg32bit),
            0x394007E8
        );
        // ldrh w9, [sp, 6]
        assert_eq!(
            ldr_imm_unsigned_offset(Reg::W9, Reg::SP, 6, MemSize::Mem16bit, RegSize::Reg32bit),
            0x79400FE9
        );
        // ldr w0, [sp, 24]
        assert_eq!(
            ldr_imm_unsigned_offset(Reg::W0, Reg::SP, 24, MemSize::Mem32bit, RegSize::Reg32bit),
            0xB9401BE0
        );
        // ldr x1, [sp, 16]
        assert_eq!(
            ldr_imm_unsigned_offset(Reg::X1, Reg::SP, 16, MemSize::Mem64bit, RegSize::Reg64bit),
            0xF9400BE1
        );
    }

    #[test]
    #[should_panic]
    fn test_ldr_imm_unsigned_offset_panic() {
        ldr_imm_unsigned_offset(Reg::X1, Reg::SP, 16, MemSize::Mem64bit, RegSize::Reg32bit);
    }

    #[test]
    fn test_str_imm_unsigned_offset() {
        // strb w8, [sp, 1]
        assert_eq!(
            str_imm_unsigned_offset(Reg::W8, Reg::SP, 1, MemSize::Mem8bit, RegSize::Reg32bit),
            0x390007E8
        );
        // strh w9, [sp, 6]
        assert_eq!(
            str_imm_unsigned_offset(Reg::W9, Reg::SP, 6, MemSize::Mem16bit, RegSize::Reg32bit),
            0x79000FE9
        );
        // str w0, [sp, 24]
        assert_eq!(
            str_imm_unsigned_offset(Reg::W0, Reg::SP, 24, MemSize::Mem32bit, RegSize::Reg32bit),
            0xB9001BE0
        );
        // str x1, [sp, 16]
        assert_eq!(
            str_imm_unsigned_offset(Reg::X1, Reg::SP, 16, MemSize::Mem64bit, RegSize::Reg64bit),
            0xF9000BE1
        );
    }

    #[test]
    #[should_panic]
    fn test_str_imm_unsigned_offset_panic() {
        str_imm_unsigned_offset(Reg::X1, Reg::SP, 16, MemSize::Mem64bit, RegSize::Reg32bit);
    }
}
