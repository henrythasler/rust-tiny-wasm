use super::*;

pub fn orr_reg(rd: Reg, rn: Reg, rm: Reg, shift: Shift, amount: u32, size: RegSize) -> u32 {
    let mut instr = select_instr(0x2A0003E0, 0xAA0003E0, size);
    instr |= ((shift as u32) & 0x03) << 22; // shift operator on rm
    instr |= (amount & 0x3F) << 10; // shift amount in imm6 field
    instr |= (rm & 0x1F) << 16; // Rm (second source register)
    instr |= (rn & 0x1F) << 5; // Rn (source register)
    instr |= rd & 0x1F; // Rd (desination register)
    instr
}
