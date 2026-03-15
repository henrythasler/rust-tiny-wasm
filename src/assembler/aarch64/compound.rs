use super::*;

pub fn mov_large_immediate(rd: Reg, value: i64, size: RegSize, machinecode: &mut Vec<u32>) {
    let chunk_limit = if size == RegSize::Reg32bit { 2 } else { 4 };
    for i in 0..chunk_limit {
        let chunk = ((value >> (i << 4)) & 0xFFFF) as u32;
        if i == 0 {
            machinecode.push(processing::movz(rd, chunk, 0, size));
        } else if chunk != 0 {
            machinecode.push(processing::movk(rd, chunk, i << 4, size));
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_mov_large_immediate() {
        let mut machinecode: Vec<u32> = Vec::new();
        // long int a = 0x123456789abcdef0;
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
}
