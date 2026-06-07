use super::*;

pub fn csinc(rd: IReg, rn: IReg, rm: IReg, cond: Condition, size: RegSize) -> u32 {
    let mut instr = select_instr(0x1A800400, 0x9A800400, size);
    instr |= ((cond as u32) & 0x0F) << 12; // standard condition
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)    
    instr
}

pub fn cset(rd: IReg, cond: Condition, size: RegSize) -> u32 {
    csinc(rd, IReg::XZR, IReg::XZR, cond, size)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_csinc() {
        // csinc x7, x8, x9, le
        assert_eq!(
            csinc(
                IReg::X7,
                IReg::X8,
                IReg::X9,
                Condition::LE,
                RegSize::Reg64bit
            ),
            0x9A89D507
        );
        // csinc w2, w18, w19, hi
        assert_eq!(
            csinc(
                IReg::W2,
                IReg::W18,
                IReg::W19,
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
                IReg::X15,
                Condition::from_u32(Condition::LE ^ 1).unwrap(),
                RegSize::Reg64bit
            ),
            0x9A9FC7EF
        );
        // cset w25, eq
        assert_eq!(
            cset(
                IReg::W25,
                Condition::from_u32(Condition::EQ ^ 1).unwrap(),
                RegSize::Reg32bit
            ),
            0x1A9F17F9
        );
    }
}
