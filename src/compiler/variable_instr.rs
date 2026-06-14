use super::*;

pub fn compile_local_get(
    variable: &LocalVar,
    offset: usize,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    match variable.valtype {
        ValType::I32 | ValType::I64 => {
            let reg = register_pool.alloc();
            value_stack.push(StackElement {
                reg: Reg::IReg(reg),
                valtype: variable.valtype,
            });
            machinecode.push(memory::ldr_imm_unsigned_offset(
                reg,
                IReg::SP,
                offset as u32,
                map_valtype_to_memsize(&variable.valtype),
                map_valtype_to_regsize(&variable.valtype),
            ));
        }
        ValType::F32 | ValType::F64 => {
            let reg = register_pool.alloc_float();
            value_stack.push(StackElement {
                reg: Reg::FReg(reg),
                valtype: variable.valtype,
            });
            machinecode.push(fp_memory::ldr_imm_unsigned_offset(
                reg,
                IReg::SP,
                offset as u32,
                map_valtype_to_regsize(&variable.valtype),
            ));
        }
        _ => panic!("Unsupported variable type for local.get"),
    }
}

pub fn compile_local_set(
    variable: &LocalVar,
    offset: usize,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let element = value_stack
        .pop()
        .expect("value stack should contain at least one element on 'local.set' opcode");

    assert_eq!(
        variable.valtype, element.valtype,
        "ValType mismatch on 'local.set'"
    );

    match element.reg {
        Reg::IReg(reg) => machinecode.push(memory::str_imm_unsigned_offset(
            reg,
            IReg::SP,
            offset as u32,
            map_valtype_to_memsize(&variable.valtype),
            map_valtype_to_regsize(&variable.valtype),
        )),
        _ => panic!("Unsupported register type for local.set"),
    }
    register_pool.free();
}

pub fn compile_local_tee(
    variable: &LocalVar,
    offset: usize,
    value_stack: &mut Vec<StackElement>,
    machinecode: &mut Vec<u32>,
) {
    let element = value_stack
        .pop()
        .expect("value stack should contain at least one element on 'local.tee' opcode");

    assert_eq!(
        variable.valtype, element.valtype,
        "ValType mismatch on 'local.tee'"
    );

    match element.reg {
        Reg::IReg(reg) => machinecode.push(memory::str_imm_unsigned_offset(
            reg,
            IReg::SP,
            offset as u32,
            map_valtype_to_memsize(&variable.valtype),
            map_valtype_to_regsize(&variable.valtype),
        )),
        _ => panic!("Unsupported register type for local.tee"),
    }
    value_stack.push(element);
}
