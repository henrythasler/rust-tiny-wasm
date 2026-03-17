#![allow(dead_code)]

use std::collections::BTreeMap;
use std::ops::BitAnd;

use wasmparser::ValType;
pub mod arithmetic;
pub mod branch;
pub mod compound;
pub mod hint;
pub mod processing;

pub const INSTRUCTION_SIZE: usize = std::mem::size_of::<u32>();

#[repr(u32)]
#[derive(Debug, Copy, Clone, Eq, PartialEq, PartialOrd, Ord)]
#[allow(clippy::upper_case_acronyms)]
pub enum Reg {
    X0 = 0,
    X1,
    X2,
    X3,
    X4,
    X5,
    X6,
    X7,
    X8,
    X9,
    X10,
    X11,
    X12,
    X13,
    X14,
    X15,
    X16,
    X17,
    X18,
    X19,
    X20,
    X21,
    X22,
    X23,
    X24,
    X25,
    X26,
    X27,
    X28,
    X29,
    X30,
    XZR = 31, // Zero Register (context dependent)
}

impl Reg {
    // 32-bit register aliases
    pub const W0: Reg = Reg::X0;
    pub const W1: Reg = Reg::X1;
    pub const W2: Reg = Reg::X2;
    pub const W3: Reg = Reg::X3;
    pub const W4: Reg = Reg::X4;
    pub const W5: Reg = Reg::X5;
    pub const W6: Reg = Reg::X6;
    pub const W7: Reg = Reg::X7;
    pub const W8: Reg = Reg::X8;
    pub const W9: Reg = Reg::X9;
    pub const W10: Reg = Reg::X10;
    pub const W11: Reg = Reg::X11;
    pub const W12: Reg = Reg::X12;
    pub const W13: Reg = Reg::X13;
    pub const W14: Reg = Reg::X14;
    pub const W15: Reg = Reg::X15;
    pub const W16: Reg = Reg::X16;
    pub const W17: Reg = Reg::X17;
    pub const W18: Reg = Reg::X18;
    pub const W19: Reg = Reg::X19;
    pub const W20: Reg = Reg::X20;
    pub const W21: Reg = Reg::X21;
    pub const W22: Reg = Reg::X22;
    pub const W23: Reg = Reg::X23;
    pub const W24: Reg = Reg::X24;
    pub const W25: Reg = Reg::X25;
    pub const W26: Reg = Reg::X26;
    pub const W27: Reg = Reg::X27;
    pub const W28: Reg = Reg::X28;
    pub const W29: Reg = Reg::X29;
    pub const W30: Reg = Reg::X30;
    pub const WZR: Reg = Reg::XZR;

    // Special register aliases
    pub const SP: Reg = Reg::XZR; // Stack Pointer
    pub const WSP: Reg = Reg::XZR;

    pub const FP: Reg = Reg::X29; // Frame Pointer (X29)
    pub const LR: Reg = Reg::X30; // Link Register (X30)
}

impl BitAnd<u32> for Reg {
    type Output = u32;

    fn bitand(self, rhs: u32) -> Self::Output {
        (self as u32) & rhs
    }
}

#[repr(u32)]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]

pub enum RegSize {
    Reg8bit,
    Reg16bit,
    Reg32bit,
    Reg64bit,
}
pub enum MemSize {
    Mem8bit,
    Mem16bit,
    Mem32bit,
    Mem64bit,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Shift {
    Lsl,
    Lsr,
    Asr,
    Ror,
}

pub struct RegisterPool {
    registers: BTreeMap<Reg, bool>,
}

impl Default for RegisterPool {
    fn default() -> Self {
        Self::new()
    }
}

impl RegisterPool {
    pub fn new() -> Self {
        Self {
            registers: BTreeMap::from([
                (Reg::X8, true),
                (Reg::X9, true),
                (Reg::X10, true),
                (Reg::X11, true),
                (Reg::X12, true),
                (Reg::X13, true),
                (Reg::X14, true),
                (Reg::X15, true),
            ]),
        }
    }

    pub fn allocate_register(&self) -> Reg {
        let mut available = self
            .registers
            .iter()
            .find(|(_, free)| **free)
            .expect("Register pool should not be exhausted");
        available.1 = &false;
        *available.0
    }
}

fn select_instr(instr_32bit: u32, instr_64bit: u32, size: RegSize) -> u32 {
    match size {
        RegSize::Reg32bit => instr_32bit,
        RegSize::Reg64bit => instr_64bit,
        _ => panic!("Instruction size should be 32 or 64 bit"),
    }
}

pub fn map_valtype_to_regsize(item: wasmparser::ValType) -> RegSize {
    if item == wasmparser::ValType::I32 {
        RegSize::Reg32bit
    } else {
        RegSize::Reg64bit
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_select_instr() {
        assert_eq!(select_instr(32, 64, RegSize::Reg32bit), 32);
        assert_eq!(select_instr(32, 64, RegSize::Reg64bit), 64);
    }

    #[test]
    #[should_panic]
    fn test_select_wrong_instr() {
        select_instr(32, 64, RegSize::Reg8bit);
    }
}
