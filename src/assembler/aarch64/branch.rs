use super::*;

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

pub fn branch(offset: i32) -> u32 {
    0x14000000 | (offset & 0x3FFFFFF) as u32 // imm26 offset
}

pub fn patch_branch(offset: i32, location: &mut u32) {
    *location = 0x14000000 | (offset & 0x3FFFFFF) as u32 // imm26 offset
}

pub fn cbz(rt: Reg, offset: i32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x34000000, 0xB4000000, size);
    instr |= (((offset >> 2) & 0x7FFFF) as u32) << 5; // imm19 offset
    instr |= rt & 0x1F; // Rt (register to be tested)
    instr
}

pub fn patch_cbz(offset: i32, location: &mut u32) {
    *location &= 0xff00001f;
    *location |= (((offset >> 2) & 0x7FFFF) as u32) << 5; // imm19 offset
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
