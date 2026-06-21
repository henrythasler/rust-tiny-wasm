use super::*;

pub fn fmov(rd: Reg, rn: Reg, size_rn: RegSize) -> u32 {
    match (rd, rn) {
        (Reg::IReg(rd), Reg::FReg(rn)) => {
            select_float_instr(0x1E260000, 0x9E660000, size_rn) | (rn & 0x1F) << 5 | rd & 0x1F
        }
        (Reg::FReg(rd), Reg::IReg(rn)) => {
            select_float_instr(0x1E270000, 0x9E670000, size_rn) | (rn & 0x1F) << 5 | rd & 0x1F
        }
        _ => panic!("Invalid register types for fmov"),
    }
}

pub fn fadd_scalar(rd: FReg, rn: FReg, rm: FReg, size: RegSize) -> u32 {
    let instr = select_float_instr(0x1E202800, 0x1E602800, size);
    instr | (rm & 0x1F) << 16 | (rn & 0x1F) << 5 | rd & 0x1F
}

pub fn fsub_scalar(rd: FReg, rn: FReg, rm: FReg, size: RegSize) -> u32 {
    let instr = select_float_instr(0x1E203800, 0x1E603800, size);
    instr | (rm & 0x1F) << 16 | (rn & 0x1F) << 5 | rd & 0x1F
}

pub fn fmul_scalar(rd: FReg, rn: FReg, rm: FReg, size: RegSize) -> u32 {
    let instr = select_float_instr(0x1E200800, 0x1E600800, size);
    instr | (rm & 0x1F) << 16 | (rn & 0x1F) << 5 | rd & 0x1F
}

pub fn fdiv_scalar(rd: FReg, rn: FReg, rm: FReg, size: RegSize) -> u32 {
    let instr = select_float_instr(0x1E201800, 0x1E601800, size);
    instr | (rm & 0x1F) << 16 | (rn & 0x1F) << 5 | rd & 0x1F
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
        // fadd d1, d3, d7
        assert_eq!(
            fadd_scalar(FReg::D1, FReg::D3, FReg::D7, RegSize::Float64bit),
            0x1E672861
        );
    }

    #[test]
    fn test_fsub_scalar() {
        // fsub s10, s13, s17
        assert_eq!(
            fsub_scalar(FReg::S10, FReg::S13, FReg::S17, RegSize::Float32bit),
            0x1E3139AA
        );
        // fsub d1, d3, d7
        assert_eq!(
            fsub_scalar(FReg::D1, FReg::D3, FReg::D7, RegSize::Float64bit),
            0x1E673861
        );
    }

    #[test]
    fn test_fmul_scalar() {
        // fmul s10, s13, s17
        assert_eq!(
            fmul_scalar(FReg::S10, FReg::S13, FReg::S17, RegSize::Float32bit),
            0x1E3109AA
        );
        // fmul d1, d3, d7
        assert_eq!(
            fmul_scalar(FReg::D1, FReg::D3, FReg::D7, RegSize::Float64bit),
            0x1E670861
        );
    }

    #[test]
    fn test_fdiv_scalar() {
        // fdiv s10, s13, s17
        assert_eq!(
            fdiv_scalar(FReg::S10, FReg::S13, FReg::S17, RegSize::Float32bit),
            0x1E3119AA
        );
        // fdiv d1, d3, d7
        assert_eq!(
            fdiv_scalar(FReg::D1, FReg::D3, FReg::D7, RegSize::Float64bit),
            0x1E671861
        );
    }

    #[test]
    #[should_panic]
    fn test_fadd_scalar_panic() {
        fadd_scalar(FReg::S10, FReg::S13, FReg::S17, RegSize::Int32bit);
    }

    #[test]
    #[should_panic]
    fn test_fmov_panic() {
        fmov(Reg::IReg(IReg::X0), Reg::FReg(FReg::D1), RegSize::Int32bit);
    }

    #[test]
    #[should_panic]
    fn test_fmov_panic2() {
        fmov(
            Reg::FReg(FReg::S0),
            Reg::FReg(FReg::S0),
            RegSize::Float32bit,
        );
    }
}
