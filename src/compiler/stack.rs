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
) -> usize {
    let mut stack_size = func_type
        .params()
        .iter()
        .fold(0, |acc, x| acc + valtype_to_usize(x));
    stack_size += locals
        .iter()
        .fold(0, |acc, x| acc + x.0 as usize * valtype_to_usize(&x.1));
    stack_size = stack_size.div_ceil(STACK_ALIGNMENT) * STACK_ALIGNMENT;
    assert!(
        stack_size % STACK_ALIGNMENT == 0,
        "stack size not aligned properly: {}",
        stack_size
    );
    stack_size
}

// pub fn get_aligned_stack_size(vars: &[LocalVar]) -> usize {
//     let stack_size = vars
//         .iter()
//         .fold(0, |acc, x| acc + valtype_to_usize(&x.valtype));

//     let stack_size = ((stack_size + (STACK_ALIGNMENT - 1)) / STACK_ALIGNMENT) * STACK_ALIGNMENT;
//     assert!(
//         stack_size % STACK_ALIGNMENT == 0,
//         "stack size not aligned properly"
//     );
//     stack_size
// }

// pub fn expand_locals(func_type: &wasmparser::FuncType, locals: &[(u32, ValType)]) -> Vec<LocalVar> {
//     let mut merged = vec![];
//     let mut offset = 0;
//     for item in func_type.params() {
//         merged.push(LocalVar {
//             offset,
//             valtype: *item,
//         });
//         offset += valtype_to_usize(item);
//     }
//     for item in locals {
//         let size = valtype_to_usize(&item.1);
//         for _ in 0..item.0 {
//             merged.push(LocalVar {
//                 offset,
//                 valtype: item.1,
//             });
//             offset += size;
//         }
//     }
//     merged
// }

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
            *offset -= valtype_to_usize(&item.1);
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
        *offset -= valtype_to_usize(valtype);
    }
    variables
}
