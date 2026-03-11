use super::Reg;

/// Return from subroutine
///
/// This instruction branches unconditionally to an address in a register. This instruction provides a hint that this is a subroutine return.
///
/// Encoding: `RET {<rn>}`
///
/// # Arguments
///
/// * `rn` - register containing the return address
///
/// # Returns
///
/// The encoded instruction
///
/// # Examples
///
/// ```
/// let instr = ret(Reg::X30);
/// assert_eq!(instr, 0xd65f03c0);
/// ```
pub fn ret(rn: Reg) -> u32 {
    0xD65F0000 | ((rn & 0x1F) << 5)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ret() {
        assert_eq!(ret(Reg::X30), 0xd65f03c0);
        assert_eq!(ret(Reg::LR), 0xd65f03c0);
        assert_eq!(ret(Reg::X0), 0xd65f0000);
    }
}
