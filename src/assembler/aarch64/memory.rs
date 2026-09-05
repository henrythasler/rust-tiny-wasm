use super::*;

/// This instruction loads a word or doubleword from memory and writes it to a register.
///
/// The address that is used for the load is calculated from a base register and an immediate offset.
/// For information about addressing modes, see Load/Store addressing modes.
/// The Unsigned offset variant scales the immediate offset value by the size of the value accessed before adding it to the base register value.
///
/// # Instructions
/// `LDR Xt, [Xn, imm]`
/// `LDR Wt, [Xn, imm]`
/// `LDRH Wt, [Xn, imm]`
/// `LDRB Wt, [Xn, imm]`
pub fn ldr_imm_unsigned_offset(rt: IReg, rn: IReg, imm: u32, mem: MemSize, size: RegSize) -> u32 {
    let mut imm = imm;
    let mut instr: u32 = if mem == MemSize::Mem64bit && size == RegSize::Int64bit {
        imm >>= 3;
        0xF9400000
    } else if mem == MemSize::Mem32bit && size == RegSize::Int32bit {
        imm >>= 2;
        0xB9400000
    } else if mem == MemSize::Mem16bit && size == RegSize::Int32bit {
        imm >>= 1;
        0x79400000
    } else if mem == MemSize::Mem8bit && size == RegSize::Int32bit {
        0x39400000
    } else {
        panic!("invalid MemSize or RegSize in ldr_imm_unsigned_offset")
    };

    instr |= (imm & 0xFFF) << 10; // imm12 field
    instr |= (rn & 0x1F) << 5; // Rn (base register)
    instr |= rt & 0x1F; // Rt (source register)

    instr
}

/// This instruction calculates an address from a base register value and an offset register value, loads a word from memory, and writes it to a register. The offset register value can optionally be shifted and extended.
///
/// # Instructions
/// `LDR <rt>, [<rn|SP>, <rm>{, <extend> {<amount>}}]`
/// `LDRH <rt>, [<rn|SP>, <rm>{, <extend> {<amount>}}]`
/// `LDRB <rt>, [<rn|SP>, <rm>, <extend> {<amount>}]`
///
/// # Arguments
/// * `rt` - The destination register (IReg).
/// * `rn` - The base register (IReg).
/// * `rm` - The offset register (IReg).
/// * `option` - The index extend option (IndexExtend).
/// * `amount` - The shift amount (u32).
/// * `mem` - The memory size (MemSize).
/// * `size` - The register size (RegSize).
/// # Returns
/// * A 32-bit unsigned integer representing the encoded LDR instruction.
pub fn ldr_reg(
    rt: IReg,
    rn: IReg,
    rm: IReg,
    option: IndexExtend,
    amount: u32,
    mem: MemSize,
    size: RegSize,
) -> u32 {
    let mut instr: u32 = if mem == MemSize::Mem64bit && size == RegSize::Int64bit {
        // LDR (64-bit)
        0xF8600800 | if amount == 3 { 0x1000 } else { 0 } | (option as u32) << 13
    } else if mem == MemSize::Mem32bit && size == RegSize::Int32bit {
        // LDR (32-bit)
        0xB8600800 | if amount == 2 { 0x1000 } else { 0 } | (option as u32) << 13
    } else if mem == MemSize::Mem16bit && size == RegSize::Int32bit {
        // LDRH (16-bit)
        0x78600800 | if amount == 1 { 0x1000 } else { 0 } | (option as u32) << 13
    } else if mem == MemSize::Mem8bit && size == RegSize::Int32bit {
        // LDRB (8-bit)
        0x38600800 | if amount == 0 { 0x1000 } else { 0 } | (option as u32) << 13
    } else {
        panic!("invalid MemSize or RegSize in ldr_reg")
    };

    instr |= (rm & 0x1F) << 16; // Rm (index register)
    instr |= (rn & 0x1F) << 5; // Rn (base register)
    instr |= rt & 0x1F; // Rt (source register)

    instr
}

pub fn ldr_reg_signed(
    rt: IReg,
    rn: IReg,
    rm: IReg,
    option: IndexExtend,
    amount: u32,
    mem: MemSize,
    size: RegSize,
) -> u32 {
    let mut instr: u32 = if mem == MemSize::Mem64bit && size == RegSize::Int64bit {
        // LDR (64-bit)
        0xF8600800 | if amount == 3 { 0x1000 } else { 0 } | (option as u32) << 13
    } else if mem == MemSize::Mem32bit && size == RegSize::Int32bit {
        // LDR (32-bit)
        0xB8600800 | if amount == 2 { 0x1000 } else { 0 } | (option as u32) << 13
    } else if mem == MemSize::Mem16bit && size == RegSize::Int32bit {
        // LDRSH (16-bit sign-extended)
        0x78E00800 | if amount == 1 { 0x1000 } else { 0 } | (option as u32) << 13
    } else if mem == MemSize::Mem8bit && size == RegSize::Int32bit {
        // LDRSB (8-bit sign-extended)
        0x38E00800 | if amount == 0 { 0x1000 } else { 0 } | (option as u32) << 13
    } else {
        panic!("invalid MemSize or RegSize in ldr_reg")
    };

    instr |= (rm & 0x1F) << 16; // Rm (index register)
    instr |= (rn & 0x1F) << 5; // Rn (base register)
    instr |= rt & 0x1F; // Rt (source register)

    instr
}

/// This instruction stores a word or a doubleword from a register to memory. The address that is used for the store is calculated from a base register and an immediate offset.
///
/// # Examples
/// ```
/// let instr = str_imm_unsigned_offset(Reg::X0, Reg::SP, 16, MemSize::Mem64bit, RegSize::Int64bit);
/// ```
pub fn str_imm_unsigned_offset(rt: IReg, rn: IReg, imm: u32, mem: MemSize, size: RegSize) -> u32 {
    let mut imm = imm;
    let mut instr: u32 = if mem == MemSize::Mem64bit && size == RegSize::Int64bit {
        imm >>= 3;
        0xF9000000
    } else if mem == MemSize::Mem32bit && size == RegSize::Int32bit {
        imm >>= 2;
        0xB9000000
    } else if mem == MemSize::Mem16bit && size == RegSize::Int32bit {
        imm >>= 1;
        0x79000000
    } else if mem == MemSize::Mem8bit && size == RegSize::Int32bit {
        0x39000000
    } else {
        panic!("invalid MemSize or RegSize in ldr_imm_unsigned_offset")
    };

    instr |= (imm & 0xFFF) << 10; // imm12 field
    instr |= (rn & 0x1F) << 5; // Rn (base register)
    instr |= rt & 0x1F; // Rt (source register)

    instr
}

/// This instruction adds an immediate value that is shifted left by 12 bits, to the PC value to form a PC-relative address, with the bottom 12 bits masked out, and writes the result to the destination register.
///
/// # Instructions
/// `ADRP <rd>, <imm>`
///
/// # Arguments
/// * `rd` - The destination register (IReg).
/// * `imm` - The immediate value to be added to the PC, shifted left by 12 bits. The immediate value must be a multiple of 4096 (0x1000).
/// # Returns
/// * A 32-bit unsigned integer representing the encoded ADRP instruction.
pub fn adrp(rd: IReg, imm: i64) -> u32 {
    let mut instr: u32 = 0x90000000; // ADRP opcode
    let imm = imm >> 12; // Shift right by 12 to get the page number
    instr |= ((imm & 0x3) as u32) << 29; // immlo
    instr |= (((imm >> 2) & 0x7FFFF) as u32) << 5; // immhi
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ldr_imm_unsigned_offset() {
        // ldrb w8, [sp, 1]
        assert_eq!(
            ldr_imm_unsigned_offset(IReg::W8, IReg::SP, 1, MemSize::Mem8bit, RegSize::Int32bit),
            0x394007E8
        );
        // ldrh w9, [sp, 6]
        assert_eq!(
            ldr_imm_unsigned_offset(IReg::W9, IReg::SP, 6, MemSize::Mem16bit, RegSize::Int32bit),
            0x79400FE9
        );
        // ldr w0, [sp, 24]
        assert_eq!(
            ldr_imm_unsigned_offset(IReg::W0, IReg::SP, 24, MemSize::Mem32bit, RegSize::Int32bit),
            0xB9401BE0
        );
        // ldr x1, [sp, 16]
        assert_eq!(
            ldr_imm_unsigned_offset(IReg::X1, IReg::SP, 16, MemSize::Mem64bit, RegSize::Int64bit),
            0xF9400BE1
        );
    }

    #[test]
    #[should_panic]
    fn test_ldr_imm_unsigned_offset_panic() {
        ldr_imm_unsigned_offset(IReg::X1, IReg::SP, 16, MemSize::Mem64bit, RegSize::Int32bit);
    }

    #[test]
    fn test_ldr_reg() {
        // LDRB w0, [x0, x0]
        assert_eq!(
            ldr_reg(
                IReg::W0,
                IReg::X0,
                IReg::X0,
                IndexExtend::Lsl,
                0,
                MemSize::Mem8bit,
                RegSize::Int32bit
            ),
            0x38607800
        );

        // LDRH w0, [x0, x0, lsl #1]
        assert_eq!(
            ldr_reg(
                IReg::W0,
                IReg::X0,
                IReg::X0,
                IndexExtend::Lsl,
                1,
                MemSize::Mem16bit,
                RegSize::Int32bit
            ),
            0x78607800
        );

        // LDR w0, [x0, x0, lsl #2]
        assert_eq!(
            ldr_reg(
                IReg::W0,
                IReg::X0,
                IReg::X0,
                IndexExtend::Lsl,
                2,
                MemSize::Mem32bit,
                RegSize::Int32bit
            ),
            0xB8607800
        );
        // LDR x0, [x0, x0, lsl #3]
        assert_eq!(
            ldr_reg(
                IReg::X0,
                IReg::X0,
                IReg::X0,
                IndexExtend::Lsl,
                3,
                MemSize::Mem64bit,
                RegSize::Int64bit
            ),
            0xF8607800
        );
    }

    #[test]
    fn test_str_imm_unsigned_offset() {
        // strb w8, [sp, 1]
        assert_eq!(
            str_imm_unsigned_offset(IReg::W8, IReg::SP, 1, MemSize::Mem8bit, RegSize::Int32bit),
            0x390007E8
        );
        // strh w9, [sp, 6]
        assert_eq!(
            str_imm_unsigned_offset(IReg::W9, IReg::SP, 6, MemSize::Mem16bit, RegSize::Int32bit),
            0x79000FE9
        );
        // str w0, [sp, 24]
        assert_eq!(
            str_imm_unsigned_offset(IReg::W0, IReg::SP, 24, MemSize::Mem32bit, RegSize::Int32bit),
            0xB9001BE0
        );
        // str x1, [sp, 16]
        assert_eq!(
            str_imm_unsigned_offset(IReg::X1, IReg::SP, 16, MemSize::Mem64bit, RegSize::Int64bit),
            0xF9000BE1
        );
    }

    #[test]
    #[should_panic]
    fn test_str_imm_unsigned_offset_panic() {
        str_imm_unsigned_offset(IReg::X1, IReg::SP, 16, MemSize::Mem64bit, RegSize::Int32bit);
    }

    #[test]
    fn test_adrp() {
        // adrp x0, -0x10000000
        assert_eq!(adrp(IReg::X0, -0x10000000), 0x90F80000);
        // adrp x11, 0xf000
        assert_eq!(adrp(IReg::X11, 0xf000), 0xF000006B);
    }
}
