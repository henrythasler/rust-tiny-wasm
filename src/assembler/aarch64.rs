#![allow(dead_code)]

use num_enum::TryFromPrimitive;
use std::ops::{BitAnd, BitXor};

pub mod arithmetic;
pub mod bit;
pub mod branch;
pub mod compound;
pub mod conditionals;
pub mod hint;
pub mod memory;
pub mod processing;

// floating point instructions
pub mod fp_memory;
pub mod fp_processing;

pub const INSTRUCTION_SIZE: usize = std::mem::size_of::<u32>();

pub const INT32_SIZE: usize = std::mem::size_of::<i32>();
pub const INT64_SIZE: usize = std::mem::size_of::<i64>();
pub const FLOAT32_SIZE: usize = std::mem::size_of::<f32>();
pub const FLOAT64_SIZE: usize = std::mem::size_of::<f64>();

pub const STACK_ALIGNMENT: usize = 16;

#[derive(Debug, Copy, Clone, Eq, PartialEq, PartialOrd, Ord)]
pub enum Reg {
    FReg(FReg),
    IReg(IReg),
}

#[repr(u32)]
#[derive(TryFromPrimitive, Debug, Copy, Clone, Eq, PartialEq, PartialOrd, Ord)]
#[allow(clippy::upper_case_acronyms)]
pub enum IReg {
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

impl IReg {
    // 32-bit register aliases
    pub const W0: IReg = IReg::X0;
    pub const W1: IReg = IReg::X1;
    pub const W2: IReg = IReg::X2;
    pub const W3: IReg = IReg::X3;
    pub const W4: IReg = IReg::X4;
    pub const W5: IReg = IReg::X5;
    pub const W6: IReg = IReg::X6;
    pub const W7: IReg = IReg::X7;
    pub const W8: IReg = IReg::X8;
    pub const W9: IReg = IReg::X9;
    pub const W10: IReg = IReg::X10;
    pub const W11: IReg = IReg::X11;
    pub const W12: IReg = IReg::X12;
    pub const W13: IReg = IReg::X13;
    pub const W14: IReg = IReg::X14;
    pub const W15: IReg = IReg::X15;
    pub const W16: IReg = IReg::X16;
    pub const W17: IReg = IReg::X17;
    pub const W18: IReg = IReg::X18;
    pub const W19: IReg = IReg::X19;
    pub const W20: IReg = IReg::X20;
    pub const W21: IReg = IReg::X21;
    pub const W22: IReg = IReg::X22;
    pub const W23: IReg = IReg::X23;
    pub const W24: IReg = IReg::X24;
    pub const W25: IReg = IReg::X25;
    pub const W26: IReg = IReg::X26;
    pub const W27: IReg = IReg::X27;
    pub const W28: IReg = IReg::X28;
    pub const W29: IReg = IReg::X29;
    pub const W30: IReg = IReg::X30;
    pub const WZR: IReg = IReg::XZR;

    // Special register aliases
    pub const SP: IReg = IReg::XZR; // Stack Pointer
    pub const WSP: IReg = IReg::XZR;

    pub const FP: IReg = IReg::X29; // Frame Pointer (X29)
    pub const LR: IReg = IReg::X30; // Link Register (X30)
}

impl BitAnd<u32> for IReg {
    type Output = u32;

    fn bitand(self, rhs: u32) -> Self::Output {
        (self as u32) & rhs
    }
}

/// double-precision floating-point registers (D0-D31) and their single-precision aliases (S0-S31)
#[repr(u32)]
#[derive(TryFromPrimitive, Debug, Copy, Clone, Eq, PartialEq, PartialOrd, Ord)]
#[allow(clippy::upper_case_acronyms)]
pub enum FReg {
    D0 = 0,
    D1,
    D2,
    D3,
    D4,
    D5,
    D6,
    D7,
    D8,
    D9,
    D10,
    D11,
    D12,
    D13,
    D14,
    D15,
    D16,
    D17,
    D18,
    D19,
    D20,
    D21,
    D22,
    D23,
    D24,
    D25,
    D26,
    D27,
    D28,
    D29,
    D30,
    D31 = 31,
}

impl FReg {
    // byte (float8) register aliases
    pub const B0: FReg = FReg::D0;
    pub const B1: FReg = FReg::D1;
    pub const B2: FReg = FReg::D2;
    pub const B3: FReg = FReg::D3;
    pub const B4: FReg = FReg::D4;
    pub const B5: FReg = FReg::D5;
    pub const B6: FReg = FReg::D6;
    pub const B7: FReg = FReg::D7;
    pub const B8: FReg = FReg::D8;
    pub const B9: FReg = FReg::D9;
    pub const B10: FReg = FReg::D10;
    pub const B11: FReg = FReg::D11;
    pub const B12: FReg = FReg::D12;
    pub const B13: FReg = FReg::D13;
    pub const B14: FReg = FReg::D14;
    pub const B15: FReg = FReg::D15;
    pub const B16: FReg = FReg::D16;
    pub const B17: FReg = FReg::D17;
    pub const B18: FReg = FReg::D18;
    pub const B19: FReg = FReg::D19;
    pub const B20: FReg = FReg::D20;
    pub const B21: FReg = FReg::D21;
    pub const B22: FReg = FReg::D22;
    pub const B23: FReg = FReg::D23;
    pub const B24: FReg = FReg::D24;
    pub const B25: FReg = FReg::D25;
    pub const B26: FReg = FReg::D26;
    pub const B27: FReg = FReg::D27;
    pub const B28: FReg = FReg::D28;
    pub const B29: FReg = FReg::D29;
    pub const B30: FReg = FReg::D30;
    pub const B31: FReg = FReg::D31;

    // halfword (float16) register aliases
    pub const H0: FReg = FReg::D0;
    pub const H1: FReg = FReg::D1;
    pub const H2: FReg = FReg::D2;
    pub const H3: FReg = FReg::D3;
    pub const H4: FReg = FReg::D4;
    pub const H5: FReg = FReg::D5;
    pub const H6: FReg = FReg::D6;
    pub const H7: FReg = FReg::D7;
    pub const H8: FReg = FReg::D8;
    pub const H9: FReg = FReg::D9;
    pub const H10: FReg = FReg::D10;
    pub const H11: FReg = FReg::D11;
    pub const H12: FReg = FReg::D12;
    pub const H13: FReg = FReg::D13;
    pub const H14: FReg = FReg::D14;
    pub const H15: FReg = FReg::D15;
    pub const H16: FReg = FReg::D16;
    pub const H17: FReg = FReg::D17;
    pub const H18: FReg = FReg::D18;
    pub const H19: FReg = FReg::D19;
    pub const H20: FReg = FReg::D20;
    pub const H21: FReg = FReg::D21;
    pub const H22: FReg = FReg::D22;
    pub const H23: FReg = FReg::D23;
    pub const H24: FReg = FReg::D24;
    pub const H25: FReg = FReg::D25;
    pub const H26: FReg = FReg::D26;
    pub const H27: FReg = FReg::D27;
    pub const H28: FReg = FReg::D28;
    pub const H29: FReg = FReg::D29;
    pub const H30: FReg = FReg::D30;
    pub const H31: FReg = FReg::D31;

    // single precision (float32) register aliases
    pub const S0: FReg = FReg::D0;
    pub const S1: FReg = FReg::D1;
    pub const S2: FReg = FReg::D2;
    pub const S3: FReg = FReg::D3;
    pub const S4: FReg = FReg::D4;
    pub const S5: FReg = FReg::D5;
    pub const S6: FReg = FReg::D6;
    pub const S7: FReg = FReg::D7;
    pub const S8: FReg = FReg::D8;
    pub const S9: FReg = FReg::D9;
    pub const S10: FReg = FReg::D10;
    pub const S11: FReg = FReg::D11;
    pub const S12: FReg = FReg::D12;
    pub const S13: FReg = FReg::D13;
    pub const S14: FReg = FReg::D14;
    pub const S15: FReg = FReg::D15;
    pub const S16: FReg = FReg::D16;
    pub const S17: FReg = FReg::D17;
    pub const S18: FReg = FReg::D18;
    pub const S19: FReg = FReg::D19;
    pub const S20: FReg = FReg::D20;
    pub const S21: FReg = FReg::D21;
    pub const S22: FReg = FReg::D22;
    pub const S23: FReg = FReg::D23;
    pub const S24: FReg = FReg::D24;
    pub const S25: FReg = FReg::D25;
    pub const S26: FReg = FReg::D26;
    pub const S27: FReg = FReg::D27;
    pub const S28: FReg = FReg::D28;
    pub const S29: FReg = FReg::D29;
    pub const S30: FReg = FReg::D30;
    pub const S31: FReg = FReg::D31;

    // quadword (float128) register aliases
    pub const Q0: FReg = FReg::D0;
    pub const Q1: FReg = FReg::D1;
    pub const Q2: FReg = FReg::D2;
    pub const Q3: FReg = FReg::D3;
    pub const Q4: FReg = FReg::D4;
    pub const Q5: FReg = FReg::D5;
    pub const Q6: FReg = FReg::D6;
    pub const Q7: FReg = FReg::D7;
    pub const Q8: FReg = FReg::D8;
    pub const Q9: FReg = FReg::D9;
    pub const Q10: FReg = FReg::D10;
    pub const Q11: FReg = FReg::D11;
    pub const Q12: FReg = FReg::D12;
    pub const Q13: FReg = FReg::D13;
    pub const Q14: FReg = FReg::D14;
    pub const Q15: FReg = FReg::D15;
    pub const Q16: FReg = FReg::D16;
    pub const Q17: FReg = FReg::D17;
    pub const Q18: FReg = FReg::D18;
    pub const Q19: FReg = FReg::D19;
    pub const Q20: FReg = FReg::D20;
    pub const Q21: FReg = FReg::D21;
    pub const Q22: FReg = FReg::D22;
    pub const Q23: FReg = FReg::D23;
    pub const Q24: FReg = FReg::D24;
    pub const Q25: FReg = FReg::D25;
    pub const Q26: FReg = FReg::D26;
    pub const Q27: FReg = FReg::D27;
    pub const Q28: FReg = FReg::D28;
    pub const Q29: FReg = FReg::D29;
    pub const Q30: FReg = FReg::D30;
    pub const Q31: FReg = FReg::D31;
}

impl BitAnd<u32> for FReg {
    type Output = u32;

    fn bitand(self, rhs: u32) -> Self::Output {
        (self as u32) & rhs
    }
}

#[repr(u32)]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum RegSize {
    Reg32bit,
    Reg64bit,
    Float8bit,
    Float16bit,
    Float32bit,
    Float64bit,
    Float128bit,
}

#[repr(u32)]
#[derive(Debug, PartialEq, Eq)]
pub enum MemSize {
    Mem8bit,
    Mem16bit,
    Mem32bit,
    Mem64bit,
    Mem128bit,
}

#[repr(u32)]
#[derive(Debug, PartialEq, Eq)]
pub enum AddressingMode {
    Simple,
    Offset,
    PreIndex,
    PostIndex,
}

#[repr(u32)]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Shift {
    Lsl,
    Lsr,
    Asr,
    Ror,
}

#[repr(u32)]
pub enum Extend {
    Uxtb = 0, // Unsigned extend byte
    Uxth = 1, // Unsigned extend halfword
    Uxtw = 2, // Unsigned extend word
    Uxtx = 3, // Unsigned extend doubleword
    Sxtb = 4, // Signed extend byte
    Sxth = 5, // Signed extend halfword
    Sxtw = 6, // Signed extend word
    Sxtx = 7, // Signed extend doubleword
}

#[repr(u32)]
pub enum Condition {
    /// equal
    EQ = 0b0000,
    /// not equal
    NE = 0b0001,
    /// Carry set (identical to HS)
    CS = 0b0010,
    /// Carry clear (identical to LO)
    CC = 0b0011,
    /// Minus or negative result
    MI = 0b0100,
    /// Positive or zero result
    PL = 0b0101,
    /// Signed Overflow
    VS = 0b0110,
    /// No signed Overflow
    VC = 0b0111,
    /// Unsigned higher
    HI = 0b1000,
    /// Unsigned lower or same
    LS = 0b1001,
    /// Signed greater than or equal
    GE = 0b1010,
    /// Signed less than
    LT = 0b1011,
    /// Signed greater than
    GT = 0b1100,
    /// Signed less than or equal
    LE = 0b1101,
    /// Always (this is the default)
    AL = 0b1110,
    /// Never executed
    NV = 0b1111,
}

impl Condition {
    pub const HS: Condition = Condition::CS; // Unsigned Higher or same (identical to CS)
    pub const LO: Condition = Condition::CC; // Unsigned Lower (identical to CC)

    pub fn from_u32(v: u32) -> Option<Self> {
        match v {
            0b0000 => Some(Self::EQ),
            0b0001 => Some(Self::NE),
            0b0010 => Some(Self::CS),
            0b0011 => Some(Self::CC),
            0b0100 => Some(Self::MI),
            0b0101 => Some(Self::PL),
            0b0110 => Some(Self::VS),
            0b0111 => Some(Self::VC),
            0b1000 => Some(Self::HI),
            0b1001 => Some(Self::LS),
            0b1010 => Some(Self::GE),
            0b1011 => Some(Self::LT),
            0b1100 => Some(Self::GT),
            0b1101 => Some(Self::LE),
            0b1110 => Some(Self::AL),
            0b1111 => Some(Self::NV),
            _ => None,
        }
    }
}

impl BitXor<u32> for Condition {
    type Output = u32;

    fn bitxor(self, rhs: u32) -> Self::Output {
        (self as u32) ^ rhs
    }
}

#[derive(Debug, Clone)]
pub struct RegisterPool {
    registers: Vec<IReg>,
    float_registers: Vec<FReg>,
    pub index: i32,
    pub float_index: i32,
}

impl Default for RegisterPool {
    fn default() -> Self {
        Self::new()
    }
}

impl RegisterPool {
    pub fn new() -> Self {
        Self {
            registers: vec![
                IReg::X8,
                IReg::X9,
                IReg::X10,
                IReg::X11,
                IReg::X12,
                IReg::X13,
                IReg::X14,
                IReg::X15,
            ],
            float_registers: vec![
                FReg::D0,
                FReg::D1,
                FReg::D2,
                FReg::D3,
                FReg::D4,
                FReg::D5,
                FReg::D6,
                FReg::D7,
            ],
            index: 0,
            float_index: 0,
        }
    }

    pub fn current(&self) -> IReg {
        self.registers[self.index as usize]
    }

    pub fn current_float(&self) -> FReg {
        self.float_registers[self.float_index as usize]
    }

    pub fn from_i32(&self, index: &i32) -> IReg {
        self.registers[*index as usize]
    }

    pub fn alloc(&mut self) -> IReg {
        let reg = self.registers[self.index as usize];
        self.index += 1;
        assert!(self.index < self.registers.len() as i32);
        reg
    }

    pub fn alloc_float(&mut self) -> FReg {
        let freg = self.float_registers[self.float_index as usize];
        self.float_index += 1;
        assert!(self.float_index < self.float_registers.len() as i32);
        freg
    }

    pub fn free(&mut self) {
        assert!(self.index > 0);
        self.index -= 1;
    }

    pub fn free_float(&mut self) {
        assert!(self.float_index > 0);
        self.float_index -= 1;
    }
}

fn select_instr(instr_32bit: u32, instr_64bit: u32, size: RegSize) -> u32 {
    match size {
        RegSize::Reg32bit => instr_32bit,
        RegSize::Reg64bit => instr_64bit,
        _ => panic!("unsupported register size for select_instr"),
    }
}

fn select_float_instr(instr_32bit: u32, instr_64bit: u32, size: RegSize) -> u32 {
    match size {
        RegSize::Float32bit => instr_32bit,
        RegSize::Float64bit => instr_64bit,
        _ => panic!("unsupported register size for select_float_instr"),
    }
}

pub fn map_valtype_to_regsize(item: &wasmparser::ValType) -> RegSize {
    if *item == wasmparser::ValType::I32 {
        RegSize::Reg32bit
    } else if *item == wasmparser::ValType::I64 {
        RegSize::Reg64bit
    } else if *item == wasmparser::ValType::F32 {
        RegSize::Float32bit
    } else if *item == wasmparser::ValType::F64 {
        RegSize::Float64bit
    } else {
        panic!("can't map {} to RegSize", item)
    }
}

pub fn map_valtype_to_memsize(item: &wasmparser::ValType) -> MemSize {
    if *item == wasmparser::ValType::I32 || *item == wasmparser::ValType::F32 {
        MemSize::Mem32bit
    } else {
        MemSize::Mem64bit
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
    fn test_registerpool() {
        let mut pool = RegisterPool::new();
        assert_eq!(pool.alloc(), IReg::X8);
        assert_eq!(pool.alloc(), IReg::X9);
        assert_eq!(pool.alloc(), IReg::X10);
        assert_eq!(pool.alloc(), IReg::X11);
        pool.free();
        pool.free();
        pool.free();
        assert_eq!(pool.alloc(), IReg::X9);
        assert_eq!(pool.alloc(), IReg::X10);
        assert_eq!(pool.alloc(), IReg::X11);
    }

    #[test]
    #[should_panic]
    fn test_pool_exhaustion() {
        let mut pool = RegisterPool::new();
        for _ in 0..i32::MAX {
            pool.alloc();
        }
    }

    #[test]
    #[should_panic]
    fn test_map_valtype_to_regsize_invalid() {
        map_valtype_to_regsize(&wasmparser::ValType::V128);
    }
}
