use super::Reg;

pub fn ret(rn: Reg) -> u32 {
    0xD65F0000 | ((rn & 0x1F) << 5)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ret() {
        assert_eq!(ret(Reg::X30), 0xd65f03c0);
        assert_eq!(ret(Reg::X0), 0xd65f0000);
    }
}
