use super::*;

pub fn orr_reg(rd: IReg, rn: IReg, rm: IReg, shift: Shift, amount: u32, size: RegSize) -> u32 {
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
pub fn ubfm(rd: IReg, rn: IReg, immr: u32, imms: u32, size: RegSize) -> u32 {
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
pub fn lsr_imm(rd: IReg, rn: IReg, shift: u32, size: RegSize) -> u32 {
    ubfm(
        rd,
        rn,
        shift,
        if size == RegSize::Int32bit { 31 } else { 63 },
        size,
    )
}

/// This instruction shifts a register value left by a variable number of bits, shifting in zeros, and writes the result to the destination register. The value of the second source register modulo the register size in bits gives the number of bits by which the first source register is left-shifted.
///
/// `LSLV rd, rn, rm`
pub fn lslv(rd: IReg, rn: IReg, rm: IReg, size: RegSize) -> u32 {
    let mut instr = select_instr(0x1AC02000, 0x9AC02000, size);
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

/// Logical shift left (register)
///
/// `LSL rd, rn, rm`
pub fn lsl_reg(rd: IReg, rn: IReg, rm: IReg, size: RegSize) -> u32 {
    lslv(rd, rn, rm, size)
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
pub fn clz(rd: IReg, rn: IReg, size: RegSize) -> u32 {
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
pub fn rbit(rd: IReg, rn: IReg, size: RegSize) -> u32 {
    let mut instr = select_instr(0x5ac00000, 0xdac00000, size);
    instr |= (rn & 0x1F) << 5; // Rn (dividend source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

/// This instruction performs a bitwise AND of two registers, with an optional shift applied to the second source register, and writes the result to the destination register.
///
/// `AND rd, rn, rm{, shift #imm6}`
///
/// # Arguments
/// * `rd` - The destination register where the result will be stored.
/// * `rn` - The first source register.
/// * `rm` - The second source register, which can be optionally shifted before the AND operation.
/// * `shift` - The type of shift to apply to the second source register (rm). It can be one of the following: LSL (Logical Shift Left), LSR (Logical Shift Right), ASR (Arithmetic Shift Right), or ROR (Rotate Right).
/// * `amount` - The amount by which to shift the second source register (rm). This is a 6-bit immediate value (0-63).
/// * `size` - The size of the registers involved in the operation. It can be either 32-bit or 64-bit.
///
/// # Returns
/// The encoded 32-bit instruction for the AND operation with the specified parameters.
pub fn and_reg(rd: IReg, rn: IReg, rm: IReg, shift: Shift, amount: u32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x0A000000, 0x8A000000, size);
    instr |= ((shift as u32) & 0x03) << 22; // shift operator on rm

    match size {
        RegSize::Int32bit => instr |= (amount & 0x1F) << 10, // for 32-bit variant, only allow shift amounts 0-31
        RegSize::Int64bit => instr |= (amount & 0x3F) << 10, // for 64-bit variant, allow shift amounts 0-63
        _ => panic!("Invalid register size for AND instruction"),
    }
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

/// This instruction performs a bitwise exclusive OR of two registers, with an optional shift applied to the second source register, and writes the result to the destination register.
///
/// `EOR rd, rn, rm{, shift #imm6}`
///
/// # Arguments
/// * `rd` - The destination register where the result will be stored.
/// * `rn` - The first source register.
/// * `rm` - The second source register, which can be optionally shifted before the EOR operation.
/// * `shift` - The type of shift to apply to the second source register (rm). It can be one of the following: LSL (Logical Shift Left), LSR (Logical Shift Right), ASR (Arithmetic Shift Right), or ROR (Rotate Right).
/// * `amount` - The amount by which to shift the second source register (rm). This is a 6-bit immediate value (0-63).
/// * `size` - The size of the registers involved in the operation. It can be either 32-bit or 64-bit.
///
/// # Returns
/// The encoded 32-bit instruction for the EOR operation with the specified parameters.
pub fn eor_reg(rd: IReg, rn: IReg, rm: IReg, shift: Shift, amount: u32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x4A000000, 0xCA000000, size);
    instr |= ((shift as u32) & 0x03) << 22; // shift operator on rm

    match size {
        RegSize::Int32bit => instr |= (amount & 0x1F) << 10, // for 32-bit variant, only allow shift amounts 0-31
        RegSize::Int64bit => instr |= (amount & 0x3F) << 10, // for 64-bit variant, allow shift amounts 0-63
        _ => panic!("Invalid register size for EOR instruction"),
    }
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
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
                IReg::X10,
                IReg::X11,
                IReg::X12,
                Shift::Lsl,
                0,
                RegSize::Int64bit
            ),
            0xAA0C016A
        );
        // orr w13, w14, w15, lsl 15
        assert_eq!(
            orr_reg(
                IReg::W13,
                IReg::W14,
                IReg::W15,
                Shift::Lsl,
                15,
                RegSize::Int32bit
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
            lsr_imm(IReg::X10, IReg::X11, 32, RegSize::Int64bit),
            0xD360FD6A
        );
        // lsr w3, w7, #3
        assert_eq!(
            lsr_imm(IReg::W3, IReg::W7, 3, RegSize::Int32bit),
            0x53037CE3
        );
    }

    #[test]
    fn test_and_reg() {
        // and w13,w14,w15, LSL #16
        assert_eq!(
            and_reg(
                IReg::W13,
                IReg::W14,
                IReg::W15,
                Shift::Lsl,
                16,
                RegSize::Int32bit
            ),
            0x0A0F41CD
        );
        // AND X2, X0, X1
        assert_eq!(
            and_reg(
                IReg::X2,
                IReg::X0,
                IReg::X1,
                Shift::Lsl,
                0,
                RegSize::Int64bit
            ),
            0x8A010002
        );
    }

    #[test]
    fn test_eor_reg() {
        // eor w13,w14,w15, LSL #16
        assert_eq!(
            eor_reg(
                IReg::W13,
                IReg::W14,
                IReg::W15,
                Shift::Lsl,
                16,
                RegSize::Int32bit
            ),
            0x4A0F41CD
        );
        // EOR X2, X0, X1
        assert_eq!(
            eor_reg(
                IReg::X2,
                IReg::X0,
                IReg::X1,
                Shift::Lsl,
                0,
                RegSize::Int64bit
            ),
            0xCA010002
        );
    }

    #[test]
    fn test_lsl_reg() {
        // LSL X2, X0, X1
        assert_eq!(
            lsl_reg(IReg::X2, IReg::X0, IReg::X1, RegSize::Int64bit),
            0x9AC12002
        );

        // LSL w13, w14, w15
        assert_eq!(
            lsl_reg(IReg::W13, IReg::W14, IReg::W15, RegSize::Int32bit),
            0x1ACF21CD
        );
    }
}
