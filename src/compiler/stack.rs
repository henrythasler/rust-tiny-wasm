use wasmparser::ValType;
use crate::assembler::aarch64::*;

pub fn valtype_to_usize(valtype: ValType) -> usize {
    match valtype {
        ValType::I32 => INT32_SIZE,
        ValType::I64 => INT64_SIZE,
        ValType::F32 => FLOAT32_SIZE,
        ValType::F64 => FLOAT64_SIZE,
        ValType::V128 => 16,
        _ => panic!("valtype not supported"),
    }
}
