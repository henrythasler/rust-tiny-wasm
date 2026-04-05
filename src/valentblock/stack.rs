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
    let mut variables_size: usize = 0;
    for item in func_type.params() {
        let size = valtype_to_usize(item);
        // insert padding depending on size of type
        variables_size = variables_size.div_ceil(size) * size;
        variables_size += size;
    }

    for (count, valtype) in locals {
        let size = valtype_to_usize(valtype);
        variables_size = variables_size.div_ceil(size) * size;
        variables_size += *count as usize * size;
    }

    // let mut variables_size = func_type
    //     .params()
    //     .iter()
    //     .fold(0, |acc, x| acc + valtype_to_usize(x));
    // variables_size += locals
    //     .iter()
    //     .fold(0, |acc, x| acc + x.0 as usize * valtype_to_usize(&x.1));
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

    for (count, valtype) in locals {
        let size = valtype_to_usize(valtype);
        *offset = offset.div_ceil(size) * size;
        for _ in 0..*count {
            variables.push(LocalVar {
                offset: *offset,
                valtype: *valtype,
            });

            machinecode.push(memory::str_imm_unsigned_offset(
                Reg::XZR,
                Reg::SP,
                *offset as u32,
                map_valtype_to_memsize(valtype),
                map_valtype_to_regsize(valtype),
            ));
            *offset += size;
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
        let size = valtype_to_usize(valtype);
        *offset = offset.div_ceil(size) * size;
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
        *offset += size;
    }
    variables
}
