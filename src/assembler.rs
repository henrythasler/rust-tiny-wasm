use aarch64::*;
mod aarch64;

pub fn get_add() -> Vec<u32> {
    vec![0x0b000020, 0xd65f03c0]
}

pub fn assemble_add() -> Vec<u32> {
    vec![
        arithmetics::add_shifted_reg(Reg::W0, Reg::W1, Reg::W0, 0, Shift::Lsl, RegSize::Reg32bit),
        branch::ret(Reg::X30),
    ]
}
