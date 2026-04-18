use super::*;

/// Moves a large immediate value into a register by breaking it down into 16-bit chunks.
///
/// This function handles both positive and negative values. For negative values,
/// it uses the `movn` instruction to set the register to the bitwise NOT of the value,
/// and then uses `movk` to set the remaining bits.
/// For positive values, it uses `movz` to set the initial bits and `movk` for the rest.
///
/// # Arguments
/// * `rd` - The destination register.
/// * `value` - The immediate value to be moved into the register.
/// * `size` - The size of the register (32-bit or 64-bit).
/// * `machinecode` - A mutable reference to a vector where the generated machine code will be stored.
pub fn mov_large_immediate(rd: Reg, value: i64, size: RegSize, machinecode: &mut Vec<u32>) {
    let chunk_limit = if size == RegSize::Reg32bit { 2 } else { 4 };
    let negative = value < 0;
    let uval = if negative {
        !value as u64
    } else {
        value as u64
    };
    for i in 0..chunk_limit {
        let chunk = ((uval >> (i << 4)) & 0xFFFF) as u32;
        if i == 0 {
            if negative {
                machinecode.push(processing::movn(rd, chunk, 0, size));
            } else {
                machinecode.push(processing::movz(rd, chunk, 0, size));
            }
        } else if chunk != 0 {
            machinecode.push(processing::movk(
                rd,
                if negative { !chunk } else { chunk },
                i << 4,
                size,
            ));
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

    #[test]
    fn test_mov_large_negative2() {
        let mut machinecode: Vec<u32> = Vec::new();
        mov_large_immediate(
            Reg::X0,
            -0x0001_0002_0003_0004_i64,
            RegSize::Reg64bit,
            &mut machinecode,
        );
        assert_eq!(
            machinecode,
            vec![0x92800060, 0xF2BFFF80, 0xF2DFFFA0, 0xF2FFFFC0]
        );
    }
}
