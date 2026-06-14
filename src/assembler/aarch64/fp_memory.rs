use super::*;

pub fn str_imm_unsigned_offset(rt: FReg, rn: IReg, imm: u32, size: RegSize) -> u32 {
    let mut imm = imm;
    let mut instr: u32 = if size == RegSize::Float8bit {
        0x3D000000
    } else if size == RegSize::Float16bit {
        imm >>= 1;
        0x7D000000
    } else if size == RegSize::Float32bit {
        imm >>= 2;
        0xBD000000
    } else if size == RegSize::Float64bit {
        imm >>= 3;
        0xFD000000
    } else if size == RegSize::Float128bit {
        imm >>= 4;
        0x3D800000
    } else {
        panic!("invalid RegSize in ldr_imm_unsigned_offset")
    };

    instr |= (imm & 0xFFF) << 10; // imm12 field
    instr |= (rn & 0x1F) << 5; // Rn (base register)
    instr |= rt & 0x1F; // Rt (source register)

    instr
}

pub fn ldr_imm_unsigned_offset(rt: FReg, rn: IReg, imm: u32, size: RegSize) -> u32 {
    let mut imm = imm;
    let mut instr: u32 = if size == RegSize::Float8bit {
        0x3D400000
    } else if size == RegSize::Float16bit {
        imm >>= 1;
        0x7D400000
    } else if size == RegSize::Float32bit {
        imm >>= 2;
        0xBD400000
    } else if size == RegSize::Float64bit {
        imm >>= 3;
        0xFD400000
    } else if size == RegSize::Float128bit {
        imm >>= 4;
        0x3DC00000
    } else {
        panic!("invalid RegSize in ldr_imm_unsigned_offset")
    };

    instr |= (imm & 0xFFF) << 10; // imm12 field
    instr |= (rn & 0x1F) << 5; // Rn (base register)
    instr |= rt & 0x1F; // Rt (source register)

    instr
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_str_imm_unsigned_offset() {
        // str b0, [sp, 1]
        assert_eq!(
            str_imm_unsigned_offset(FReg::B0, IReg::SP, 1, RegSize::Float8bit),
            0x3D0007E0
        );
        // str h9, [sp, 6]
        assert_eq!(
            str_imm_unsigned_offset(FReg::H9, IReg::SP, 6, RegSize::Float16bit),
            0x7D000FE9
        );
        // str s0, [sp, 24]
        assert_eq!(
            str_imm_unsigned_offset(FReg::S0, IReg::SP, 24, RegSize::Float32bit),
            0xBD001BE0
        );
        // str d1, [sp, 16]
        assert_eq!(
            str_imm_unsigned_offset(FReg::D1, IReg::SP, 16, RegSize::Float64bit),
            0xFD000BE1
        );
        // str q19, [sp, 256]
        assert_eq!(
            str_imm_unsigned_offset(FReg::Q19, IReg::SP, 256, RegSize::Float128bit),
            0x3D8043F3
        );
    }

    #[test]
    fn test_ldr_imm_unsigned_offset() {
        // ldr b10, [sp, 1]
        assert_eq!(
            ldr_imm_unsigned_offset(FReg::B10, IReg::SP, 1, RegSize::Float8bit),
            0x3D4007EA
        );
        // ldr h9, [sp, 6]
        assert_eq!(
            ldr_imm_unsigned_offset(FReg::H9, IReg::SP, 6, RegSize::Float16bit),
            0x7D400FE9
        );
        // ldr s0, [sp, 24]
        assert_eq!(
            ldr_imm_unsigned_offset(FReg::S0, IReg::SP, 24, RegSize::Float32bit),
            0xBD401BE0
        );
        // ldr d1, [sp, 16]
        assert_eq!(
            ldr_imm_unsigned_offset(FReg::D1, IReg::SP, 16, RegSize::Float64bit),
            0xFD400BE1
        );
        // ldr q19, [sp, 256]
        assert_eq!(
            ldr_imm_unsigned_offset(FReg::Q19, IReg::SP, 256, RegSize::Float128bit),
            0x3DC043F3
        );
    }

    #[test]
    #[should_panic]
    fn test_str_imm_unsigned_offset_panic() {
        str_imm_unsigned_offset(FReg::Q19, IReg::SP, 256, RegSize::Int32bit);
    }

    #[test]
    #[should_panic]
    fn test_ldr_imm_unsigned_offset_panic() {
        ldr_imm_unsigned_offset(FReg::Q19, IReg::SP, 256, RegSize::Int32bit);
    }
}
