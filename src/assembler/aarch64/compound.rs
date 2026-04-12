use super::*;

pub fn mov_large_immediate(rd: Reg, value: i64, size: RegSize, machinecode: &mut Vec<u32>) {
    let chunk_limit = if size == RegSize::Reg32bit { 2 } else { 4 };
    let negative = value < 0;
    let val = if negative { !value } else { value };
    for i in 0..chunk_limit {
        let chunk = ((val >> (i << 4)) & 0xFFFF) as u32;
        if i == 0 {
            if negative {
                machinecode.push(processing::movn(rd, chunk, 0, size));
            } else {
                machinecode.push(processing::movz(rd, chunk, 0, size));
            }
        } else if chunk != 0 {
            if negative {
                machinecode.push(processing::movk(rd, !chunk, i << 4, size));
            } else {
                machinecode.push(processing::movk(rd, chunk, i << 4, size));
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_mov_large_immediate() {
        let mut machinecode: Vec<u32> = Vec::new();
        mov_large_immediate(
            Reg::X8,
            0x123456789abcdef0,
            RegSize::Reg64bit,
            &mut machinecode,
        );
        assert_eq!(
            machinecode,
            vec![0xd29bde08, 0xf2b35788, 0xf2cacf08, 0xf2e24688]
        );
    }

    #[test]
    fn test_mov_large_immediate2() {
        let mut machinecode: Vec<u32> = Vec::new();
        mov_large_immediate(Reg::X8, 0x80000, RegSize::Reg64bit, &mut machinecode);
        assert_eq!(machinecode, vec![0xD2800008, 0xF2A00108]);
    }

    #[test]
    fn test_mov_negative() {
        let mut machinecode: Vec<u32> = Vec::new();
        mov_large_immediate(Reg::X0, -1, RegSize::Reg64bit, &mut machinecode);
        assert_eq!(machinecode, vec![0x92800000]);
    }

    #[test]
    fn test_mov_large_negative() {
        let mut machinecode: Vec<u32> = Vec::new();
        mov_large_immediate(Reg::X0, -0x10002, RegSize::Reg64bit, &mut machinecode);
        assert_eq!(machinecode, vec![0x92800020, 0xF2BFFFC0]);
    }
}
