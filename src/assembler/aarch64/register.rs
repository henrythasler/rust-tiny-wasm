use super::*;

pub fn movz(rd: Reg, imm16: u32, shift: u32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x52800000, 0xD2800000, size);
    instr |= ((shift >> 4) & 0x3) << 21; // hw field (0-3 for 64-bit, 0-1 for 32-bit)
    instr |= (imm16 & 0xFFFF) << 5; // imm16 field
    instr |= rd & 0x1F; // Rd (destination register)
    instr
}

pub fn movk(rd: Reg, imm16: u32, shift: u32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x72800000, 0xF2800000, size);
    instr |= ((shift >> 4) & 0x3) << 21; // hw field (0-3 for 64-bit, 0-1 for 32-bit)
    instr |= (imm16 & 0xFFFF) << 5; // imm16 field
    instr |= rd & 0x1F; // Rd (destination register)
    instr
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_movz() {
        // MOVZ X3, #0x1234, LSL #16
        assert_eq!(movz(Reg::X3, 0x1234, 16, RegSize::Reg64bit), 0xD2A24683);
        // MOVZ X7, 0xABCD, LSL #48
        assert_eq!(movz(Reg::X7, 0xabcd, 48, RegSize::Reg64bit), 0xD2F579A7);
    }

    fn test_movk() {
        // MOVK X15, #0xffff, LSL #32
        assert_eq!(movz(Reg::X15, 0xffff, 32, RegSize::Reg64bit), 0xF2DFFFEF);
        // MOVK W0, #0x80, LSL #16
        assert_eq!(movz(Reg::W0, 0x80, 16, RegSize::Reg32bit), 0x72A01000);
        //   EXPECT_THROW(encode_movk(X15, 0xFFFF, 32, reg_size_t::SIZE_8BIT), std::runtime_error);
    }
}
