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

pub fn get_initial_stack_size(
    func_type: &wasmparser::FuncType,
    locals: &[(u32, ValType)],
    reserved: i32,
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

    variables_size = variables_size.div_ceil(INTEGER_REGISTER_SIZE) * INTEGER_REGISTER_SIZE;
    variables_size += reserved as usize * INTEGER_REGISTER_SIZE;

    let stack_size = variables_size.div_ceil(STACK_ALIGNMENT) * STACK_ALIGNMENT;
    assert!(
        stack_size.is_multiple_of(STACK_ALIGNMENT),
        "stack size not aligned properly: {}",
        stack_size
    );
    (variables_size, stack_size)
}

/// Initialize locals by storing zero values and pushing a struct to the stack
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

            let reg_size = match valtype {
                ValType::I32 | ValType::F32 => RegSize::Int32bit,
                ValType::I64 | ValType::F64 => RegSize::Int64bit,
                _ => panic!("valtype not supported"),
            };

            machinecode.push(memory::str_imm_unsigned_offset(
                IReg::XZR,
                IReg::SP,
                *offset as u32,
                map_valtype_to_memsize(valtype),
                reg_size,
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
        let src_reg = match valtype {
            ValType::I32 | ValType::I64 => Reg::IReg(INTEGER_ARGUMENT_REGS[i]),
            ValType::F32 | ValType::F64 => Reg::FReg(FLOAT_ARGUMENT_REGS[i]),
            _ => panic!("valtype not supported"),
        };

        match src_reg {
            Reg::IReg(reg) => machinecode.push(memory::str_imm_unsigned_offset(
                reg,
                IReg::SP,
                *offset as u32,
                map_valtype_to_memsize(valtype),
                map_valtype_to_regsize(valtype),
            )),

            Reg::FReg(reg) => machinecode.push(fp_memory::str_imm_unsigned_offset(
                reg,
                IReg::SP,
                *offset as u32,
                map_valtype_to_regsize(valtype),
            )),
        }
        *offset += size;
    }
    variables
}

pub fn save_context_to_stack(offset: &mut usize, machinecode: &mut Vec<u32>) {
    machinecode.push(memory::str_imm_unsigned_offset(
        CONTEXT_REG,
        IReg::SP,
        *offset as u32,
        MemSize::Mem64bit,
        RegSize::Int64bit,
    ));
    *offset += INTEGER_REGISTER_SIZE;
}

pub fn load_context_from_stack(machinecode: &mut Vec<u32>) {
    machinecode.push(memory::ldr_imm_unsigned_offset(
        CONTEXT_REG,
        IReg::SP,
        0,
        MemSize::Mem64bit,
        RegSize::Int64bit,
    ));
}

pub fn save_registers(register_pool: &mut RegisterPool, machinecode: &mut Vec<u32>) -> usize {
    // determine the stack size needed to save all registers in the register pool; needs to be aligned to STACK_ALIGNMENT
    let stack_size = (register_pool.index as usize * INTEGER_REGISTER_SIZE)
        .div_ceil(STACK_ALIGNMENT)
        * STACK_ALIGNMENT;
    assert!(
        stack_size.is_multiple_of(STACK_ALIGNMENT),
        "stack size not aligned properly: {}",
        stack_size
    );

    // allocate stack memory (sub sp, sp, #stackSize)
    machinecode.push(arithmetic::sub_imm(
        IReg::SP,
        IReg::SP,
        stack_size as u32,
        false,
        RegSize::Int64bit,
    ));

    for (i, reg) in register_pool.get_allocated_registers().iter().enumerate() {
        machinecode.push(memory::str_imm_unsigned_offset(
            *reg,
            IReg::SP,
            i as u32 * INTEGER_REGISTER_SIZE as u32,
            MemSize::Mem64bit,
            RegSize::Int64bit,
        ));
    }
    stack_size
}

pub fn restore_registers(
    stack_size: usize,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    for (i, reg) in register_pool.get_allocated_registers().iter().enumerate() {
        machinecode.push(memory::ldr_imm_unsigned_offset(
            *reg,
            IReg::SP,
            i as u32 * INTEGER_REGISTER_SIZE as u32,
            MemSize::Mem64bit,
            RegSize::Int64bit,
        ));
    }

    // free stack memory (add sp, sp, #stackSize)
    machinecode.push(arithmetic::add_imm(
        IReg::SP,
        IReg::SP,
        stack_size as u32,
        false,
        RegSize::Int64bit,
    ));
}
