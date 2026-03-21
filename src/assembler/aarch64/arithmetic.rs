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

pub fn sub_imm(rd: Reg, rn: Reg, imm12: u32, shift12: bool, size: RegSize) -> u32 {
    let mut instr = select_instr(0x51000000, 0xD1000000, size);
    instr |= if shift12 { 0x400000 } else { 0 }; // optional left shift (LSL #12)
    instr |= (imm12 & 0xFFF) << 10; // imm12 field
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
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
    }
}
