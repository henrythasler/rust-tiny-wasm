use super::*;

/// Add optionally-shifted register
///
/// This instruction adds a register value and an optionally-shifted register value, and writes the result to the destination register.
///
/// Encoding: `ADD <rd>, <rn>, <rm>{, <shift> #<amount>}`
///
/// # Arguments
///
/// * `rd` - destination register
/// * `rn` - first source register
/// * `rm` - second source register
/// * `shift` - shift type to be applied to the second source register (00=LSL, 01=LSR, 10=ASR, 11=RESERVED)
/// * `amount` - shift amount in the range 0..63 (64-bit) or 0..31 (32-bit)
///
/// # Returns
///
/// The encoded instruction
///
/// # Examples
///
/// ```
/// let instr = add_shifted_reg(Reg::W0, Reg::W1, Reg::W0, 0, Shift::Lsl, RegSize::Reg32bit);
/// assert_eq!(instr, 0x0b000020);
/// ```
pub fn add_shifted_reg(rd: Reg, rn: Reg, rm: Reg, shift: Shift, amount: u32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x0b000000, 0x8b000000, size);
    instr |= ((shift as u32) & 0x03) << 22; // shift operator on rm
    instr |= (amount & 0x3F) << 10; // shift amount in imm6 field
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

pub fn add_imm(rd: Reg, rn: Reg, imm12: u32, shift12: bool, size: RegSize) -> u32 {
    let mut instr = select_instr(0x11000000, 0x91000000, size);
    instr |= if shift12 { 0x400000 } else { 0 }; // optional left shift (LSL #12)
    instr |= (imm12 & 0xFFF) << 10; // imm12 field
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

pub fn sub_shifted_reg(rd: Reg, rn: Reg, rm: Reg, shift: Shift, amount: u32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x4b000000, 0xcb000000, size);
    instr |= ((shift as u32) & 0x03) << 22; // shift operator on rm
    instr |= (amount & 0x3F) << 10; // shift amount in imm6 field
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)    
    instr
}

/// This instruction subtracts an optionally-shifted register value from a register value, and writes the result to the destination register. It updates the condition flags based on the result.
pub fn subs_shifted_reg(
    rd: Reg,
    rn: Reg,
    rm: Reg,
    shift: Shift,
    amount: u32,
    size: RegSize,
) -> u32 {
    let mut instr = select_instr(0x6B000000, 0xEB000000, size);
    instr |= ((shift as u32) & 0x3) << 22; // shift type
    instr |= (amount & 0x3F) << 10; // shift amount (0-63 for 64-bit, 0-31 for 32-bit)
    instr |= (rm & 0x1F) << 16; // Rm (operand register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (destination register)
    instr
}

/// This instruction subtracts an optionally-shifted register value from a register value. It updates the condition flags based on the result and discards the result.
pub fn cmp_shifted_reg(rn: Reg, rm: Reg, shift: Shift, amount: u32, size: RegSize) -> u32 {
    subs_shifted_reg(
        if size == RegSize::Reg64bit {
            Reg::XZR
        } else {
            Reg::WZR
        },
        rn,
        rm,
        shift,
        amount,
        size,
    )
}

pub fn sub_extended_reg(
    rd: Reg,
    rn: Reg,
    rm: Reg,
    option: Extend,
    amount: u32,
    size: RegSize,
) -> u32 {
    let mut instr = select_instr(0x4b200000, 0xcb200000, size);
    instr |= ((option as u32) & 0x07) << 13; // extend type
    instr |= (amount & 0x7) << 10; // imm3 field
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

pub fn sub_imm(rd: Reg, rn: Reg, imm12: u32, shift12: bool, size: RegSize) -> u32 {
    let mut instr = select_instr(0x51000000, 0xD1000000, size);
    instr |= if shift12 { 0x400000 } else { 0 }; // optional left shift (LSL #12)
    instr |= (imm12 & 0xFFF) << 10; // imm12 field
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

pub fn madd_reg(rd: Reg, rn: Reg, rm: Reg, ra: Reg, size: RegSize) -> u32 {
    let mut instr = select_instr(0x1b000000, 0x9b000000, size);
    instr |= (rm & 0x1F) << 16; // Rm (multiplier source register)
    instr |= (ra & 0x1F) << 10; // Ra (addend source register)
    instr |= (rn & 0x1F) << 5; // Rn (multiplicand source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

pub fn mul_reg(rd: Reg, rn: Reg, rm: Reg, size: RegSize) -> u32 {
    madd_reg(rd, rn, rm, Reg::WZR, size)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add_shifted_reg() {
        assert_eq!(
            add_shifted_reg(Reg::W0, Reg::W1, Reg::W0, Shift::Lsl, 0, RegSize::Reg32bit),
            0x0b000020
        );
        assert_eq!(
            add_shifted_reg(
                Reg::X10,
                Reg::X11,
                Reg::X20,
                Shift::Lsl,
                4,
                RegSize::Reg64bit
            ),
            0x8b14116a
        );
    }

    #[test]
    fn test_add_imm() {
        // add sp, sp, #0x40
        assert_eq!(
            add_imm(Reg::SP, Reg::SP, 0x40, false, RegSize::Reg64bit),
            0x910103FF
        );
        // add w1, w0, #10
        assert_eq!(
            add_imm(Reg::W1, Reg::W0, 10, false, RegSize::Reg32bit),
            0x11002801
        );

        // add w1, w10, #0x10, LSL #12
        assert_eq!(
            add_imm(Reg::W1, Reg::W10, 0x10, true, RegSize::Reg32bit),
            0x11404141
        );
    }

    #[test]
    fn test_sub_shifted_reg() {
        // SUB X10, X10, X11
        assert_eq!(
            sub_shifted_reg(
                Reg::X10,
                Reg::X10,
                Reg::X11,
                Shift::Lsl,
                0,
                RegSize::Reg64bit
            ),
            0xCB0B014A
        );
        // SUB w10, w10, w11, LSL 8
        assert_eq!(
            sub_shifted_reg(
                Reg::W10,
                Reg::W10,
                Reg::W11,
                Shift::Lsl,
                8,
                RegSize::Reg32bit
            ),
            0x4B0B214A
        );
    }

    #[test]
    fn test_sub_extended_reg() {
        // sub sp, sp, x8
        assert_eq!(
            sub_extended_reg(
                Reg::SP,
                Reg::SP,
                Reg::X8,
                Extend::Uxtx,
                0,
                RegSize::Reg64bit
            ),
            0xCB2863FF
        );
    }

    #[test]
    fn test_sub_imm() {
        // sub sp, sp, #0x40
        assert_eq!(
            sub_imm(Reg::SP, Reg::SP, 0x40, false, RegSize::Reg64bit),
            0xD10103FF
        );
        // sub w0, w0, #1
        assert_eq!(
            sub_imm(Reg::W0, Reg::W0, 1, false, RegSize::Reg32bit),
            0x51000400
        );
        // sub x1, x10, #0x100, LSL #12
        assert_eq!(
            sub_imm(Reg::X1, Reg::X10, 0x100, true, RegSize::Reg64bit),
            0xD1440141
        );
    }
}
