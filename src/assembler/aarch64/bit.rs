use super::*;

pub fn orr_reg(rd: Reg, rn: Reg, rm: Reg, shift: Shift, amount: u32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x2A000000, 0xAA000000, size);
    instr |= ((shift as u32) & 0x03) << 22; // shift operator on rm
    instr |= (amount & 0x3F) << 10; // shift amount in imm6 field
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

/// Unsigned bitfield move
///
/// If <imms> is greater than or equal to <immr>, this copies a bitfield of (<imms>-<immr>+1) bits starting from bit position <immr> in the source register to the least significant bits of the destination register.
/// If <imms> is less than <immr>, this copies a bitfield of (<imms>+1) bits from the least significant bits of the source register to bit position (regsize-<immr>) of the destination register, where regsize is the destination register size of 32 or 64 bits.
/// In both cases, the destination bits below and above the bitfield are set to zero.
pub fn ubfm(rd: Reg, rn: Reg, immr: u32, imms: u32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x53000000, 0xD3400000, size);
    instr |= (immr & 0x3F) << 16; // immr
    instr |= (imms & 0x3F) << 10; // imms
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (destination register)
    instr
}

/// Logical Shift Right (immediate).
///
/// This instruction shifts a register value right by an immediate number of bits, shifting in zeros, and writes the result to the destination register.
pub fn lsr_imm(rd: Reg, rn: Reg, shift: u32, size: RegSize) -> u32 {
    ubfm(
        rd,
        rn,
        shift,
        if size == RegSize::Reg32bit { 31 } else { 63 },
        size,
    )
}

/**
 * This instruction counts the number of consecutive binary zero bits, starting from the most significant bit in the source register, and places the
 * count in the destination register.
 *
 * `CLZ rd, rn`
 * @param rd destination register
 * @param rm source register
 * @param size 32-bit or 64-bit variant
 * @return the encoded instruction
 */
pub fn clz(rd: Reg, rn: Reg, size: RegSize) -> u32 {
    let mut instr = select_instr(0x5ac01000, 0xdac01000, size);
    instr |= (rn & 0x1F) << 5; // Rn (dividend source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

/**
 * This instruction reverses the bit order in a register.
 *
 * `RBIT rd, rn`
 * @param rd destination register
 * @param rm source register
 * @param size 32-bit or 64-bit variant
 * @return the encoded instruction
 */
pub fn rbit(rd: Reg, rn: Reg, size: RegSize) -> u32 {
    let mut instr = select_instr(0x5ac00000, 0xdac00000, size);
    instr |= (rn & 0x1F) << 5; // Rn (dividend source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_orr_reg() {
        // orr x10, x11, x12
        assert_eq!(
            orr_reg(
                Reg::X10,
                Reg::X11,
                Reg::X12,
                Shift::Lsl,
                0,
                RegSize::Reg64bit
            ),
            0xAA0C016A
        );
        // orr w13, w14, w15, lsl 15
        assert_eq!(
            orr_reg(
                Reg::W13,
                Reg::W14,
                Reg::W15,
                Shift::Lsl,
                15,
                RegSize::Reg32bit
            ),
            0x2A0F3DCD
        );
    }

    #[test]
    fn test_ubfm() {}

    #[test]
    fn test_lsr_imm() {
        // lsr x10, x11, #32
        assert_eq!(
            lsr_imm(Reg::X10, Reg::X11, 32, RegSize::Reg64bit),
            0xD360FD6A
        );
        // lsr w3, w7, #3
        assert_eq!(lsr_imm(Reg::W3, Reg::W7, 3, RegSize::Reg32bit), 0x53037CE3);
    }
}
