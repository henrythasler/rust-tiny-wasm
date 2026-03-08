use super::*;

pub fn add_shifted_reg(rd: Reg, rn: Reg, rm: Reg, amount: u32, shift: Shift, size: RegSize) -> u32 {
    let mut instr = select_instr(0x0b000000, 0x8b000000, size);
    instr |= ((shift as u32) & 0x03) << 22; // shift operator on rm
    instr |= (amount & 0x3F) << 10; // shift amount in imm6 field
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
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
            add_shifted_reg(Reg::W0, Reg::W1, Reg::W0, 0, Shift::Lsl, RegSize::Reg32bit),
            0x0b000020
        );
        assert_eq!(
            add_shifted_reg(
                Reg::X10,
                Reg::X11,
                Reg::X20,
                4,
                Shift::Lsl,
                RegSize::Reg64bit
            ),
            0x8b14116a
        );
    }
}
