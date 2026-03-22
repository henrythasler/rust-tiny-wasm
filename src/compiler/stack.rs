use crate::assembler::aarch64::*;
use wasmparser::ValType;

pub fn valtype_to_usize(valtype: &ValType) -> usize {
    match valtype {
        ValType::I32 => INT32_SIZE,
        ValType::I64 => INT64_SIZE,
        ValType::F32 => FLOAT32_SIZE,
        ValType::F64 => FLOAT64_SIZE,
        ValType::V128 => 16,
        _ => panic!("valtype not supported"),
    }
}

#[derive(Debug)]
pub struct LocalVar {
    pub offset: usize,
    pub valtype: ValType,
}

pub fn get_aligned_stack_size(
    func_type: &wasmparser::FuncType,
    locals: &[(u32, ValType)],
) -> (usize, usize) {
    let mut variables_size = func_type
        .params()
        .iter()
        .fold(0, |acc, x| acc + valtype_to_usize(x));
    variables_size += locals
        .iter()
        .fold(0, |acc, x| acc + x.0 as usize * valtype_to_usize(&x.1));
    let stack_size = variables_size.div_ceil(STACK_ALIGNMENT) * STACK_ALIGNMENT;
    assert!(
        stack_size.is_multiple_of(STACK_ALIGNMENT),
        "stack size not aligned properly: {}",
        stack_size
    );
    (variables_size, stack_size)
}

pub fn save_locals_to_stack(
    offset: &mut usize,
    locals: &[(u32, ValType)],
    machinecode: &mut Vec<u32>,
) -> Vec<LocalVar> {
    let mut variables = vec![];

    for item in locals {
        for _ in 0..item.0 {
            variables.push(LocalVar {
                offset: *offset,
                valtype: item.1,
            });

            machinecode.push(memory::str_imm_unsigned_offset(
                Reg::XZR,
                Reg::SP,
                *offset as u32,
                map_valtype_to_memsize(&item.1),
                map_valtype_to_regsize(&item.1),
            ));
            *offset += valtype_to_usize(&item.1);
        }
    }
    variables
}

pub fn save_parameters_to_stack(
    offset: &mut usize,
    values: &[ValType],
    machinecode: &mut Vec<u32>,
) -> Vec<LocalVar> {
    let mut variables = vec![];
    for (i, valtype) in values.iter().enumerate() {
        variables.push(LocalVar {
            offset: *offset,
            valtype: *valtype,
        });
        machinecode.push(memory::str_imm_unsigned_offset(
            Reg::try_from(i as u32).unwrap(),
            Reg::SP,
            *offset as u32,
            map_valtype_to_memsize(valtype),
            map_valtype_to_regsize(valtype),
        ));
        *offset += valtype_to_usize(valtype);
    }
    variables
}
