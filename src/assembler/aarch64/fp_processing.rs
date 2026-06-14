use super::*;

pub fn fmov(rd: Reg, rn: Reg, size_rn: RegSize) -> u32 {
    match (rd, rn) {
        (Reg::IReg(rd), Reg::FReg(rn)) => match size_rn {
            RegSize::Float32bit => 0x1E260000 | (rn & 0x1F) << 5 | rd & 0x1F,
            RegSize::Float64bit => 0x9E660000 | (rn & 0x1F) << 5 | rd & 0x1F,
            _ => panic!("Invalid register sizes for fmov"),
        },
        (Reg::FReg(rd), Reg::IReg(rn)) => match size_rn {
            RegSize::Float32bit => 0x1E270000 | (rn & 0x1F) << 5 | rd & 0x1F,
            RegSize::Float64bit => 0x9E670000 | (rn & 0x1F) << 5 | rd & 0x1F,
            _ => panic!("Invalid register sizes for fmov"),
        },
        _ => panic!("Invalid register types for fmov"),
    }
}

pub fn fadd_scalar(rd: FReg, rn: FReg, rm: FReg, size: RegSize) -> u32 {
    match size {
        RegSize::Float32bit => 0x1E202800 | (rm & 0x1F) << 16 | (rn & 0x1F) << 5 | rd & 0x1F,
        RegSize::Float64bit => 0x1E602800 | (rm & 0x1F) << 16 | (rn & 0x1F) << 5 | rd & 0x1F,
        _ => panic!("Invalid register sizes for fadd"),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_fmov() {
        // fmov x0, d1
        assert_eq!(
            fmov(
                Reg::IReg(IReg::X0),
                Reg::FReg(FReg::D1),
                RegSize::Float64bit
            ),
            0x9E660020
        );
    }

    #[test]
    fn test_fadd_scalar() {
        // fadd s10, s13, s17
        assert_eq!(
            fadd_scalar(FReg::S10, FReg::S13, FReg::S17, RegSize::Float32bit),
            0x1E3129AA
        );
    }
}
