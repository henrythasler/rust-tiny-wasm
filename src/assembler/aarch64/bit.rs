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
}
