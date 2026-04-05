use super::*;

pub fn compile_local_get(
    variable: &LocalVar,
    offset: usize,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let reg = register_pool.allocate_register();
    value_stack.push(StackElement {
        reg,
        valtype: variable.valtype,
    });

    machinecode.push(memory::ldr_imm_unsigned_offset(
        reg,
        Reg::SP,
        offset as u32,
        map_valtype_to_memsize(&variable.valtype),
        map_valtype_to_regsize(&variable.valtype),
    ));
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
        "ValType mismatch on 'local.tee'"
    );

    machinecode.push(memory::str_imm_unsigned_offset(
        element.reg,
        Reg::SP,
        offset as u32,
        map_valtype_to_memsize(&variable.valtype),
        map_valtype_to_regsize(&variable.valtype),
    ));
    register_pool.free_register(&element.reg);
}

pub fn compile_local_tee(
    variable: &LocalVar,
    offset: usize,
    value_stack: &mut Vec<StackElement>,
    machinecode: &mut Vec<u32>,
) {
    let element = value_stack
        .pop()
        .expect("value stack should contain at least one element on 'local.set' opcode");

    assert_eq!(
        variable.valtype, element.valtype,
        "ValType mismatch on 'local.tee'"
    );

    machinecode.push(memory::str_imm_unsigned_offset(
        element.reg,
        Reg::SP,
        offset as u32,
        map_valtype_to_memsize(&variable.valtype),
        map_valtype_to_regsize(&variable.valtype),
    ));
    value_stack.push(element);
}
