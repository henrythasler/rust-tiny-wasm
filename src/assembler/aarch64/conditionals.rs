use super::*;

pub fn csinc(rd: Reg, rn: Reg, rm: Reg, cond: Condition, size: RegSize) -> u32 {
    let mut instr = select_instr(0x1A800400, 0x9A800400, size);
    instr |= ((cond as u32) & 0x0F) << 12; // standard condition
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)    
    instr
}

pub fn cset(rd: Reg, cond: Condition, size: RegSize) -> u32 {
    csinc(rd, Reg::XZR, Reg::XZR, cond, size)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_csinc() {
        // csinc x7, x8, x9, le
        assert_eq!(
            csinc(Reg::X7, Reg::X8, Reg::X9, Condition::LE, RegSize::Reg64bit),
            0x9A89D507
        );
        // csinc w2, w18, w19, hi
        assert_eq!(
            csinc(
                Reg::W2,
                Reg::W18,
                Reg::W19,
                Condition::HI,
                RegSize::Reg32bit
            ),
            0x1A938642
        );
    }

    #[test]
    fn test_cset() {
        // cset x15, le
        assert_eq!(
            cset(
                Reg::X15,
                Condition::from_u32(Condition::LE ^ 1).unwrap(),
                RegSize::Reg64bit
            ),
            0x9A9FC7EF
        );
        // cset w25, eq
        assert_eq!(
            cset(
                Reg::W25,
                Condition::from_u32(Condition::EQ ^ 1).unwrap(),
                RegSize::Reg32bit
            ),
            0x1A9F17F9
        );
    }
}
