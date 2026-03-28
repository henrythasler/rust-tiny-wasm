use super::*;

pub fn compile_add(
    valtype: ValType,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let len = value_stack.len();
    assert!(len >= 2, "insufficient operands on stack for add");

    let op1 = &value_stack[len - 2];
    let op2 = &value_stack[len - 1];
    assert_eq!(op1.valtype, valtype, "Operand 1 type mismatch for add");
    assert_eq!(op2.valtype, valtype, "Operand 2 type mismatch for add");

    machinecode.push(arithmetic::add_shifted_reg(
        op1.reg,
        op1.reg,
        op2.reg,
        Shift::Lsl,
        0,
        map_valtype_to_regsize(&valtype),
    ));

    register_pool.free_register(&op2.reg);
    value_stack.pop();
}

pub fn compile_sub(
    valtype: ValType,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let len = value_stack.len();
    assert!(len >= 2, "insufficient operands on stack for sub");

    let op1 = &value_stack[len - 2];
    let op2 = &value_stack[len - 1];
    assert_eq!(op1.valtype, valtype, "Operand 1 type mismatch for sub");
    assert_eq!(op2.valtype, valtype, "Operand 2 type mismatch for sub");

    machinecode.push(arithmetic::sub_shifted_reg(
        op1.reg,
        op1.reg,
        op2.reg,
        Shift::Lsl,
        0,
        map_valtype_to_regsize(&valtype),
    ));

    register_pool.free_register(&op2.reg);
    value_stack.pop();
}

pub fn compile_mul(
    valtype: ValType,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let len = value_stack.len();
    assert!(len >= 2, "insufficient operands on stack for mul");

    let op1 = &value_stack[len - 2];
    let op2 = &value_stack[len - 1];
    assert_eq!(op1.valtype, valtype, "Operand 1 type mismatch for mul");
    assert_eq!(op2.valtype, valtype, "Operand 2 type mismatch for mul");

    machinecode.push(arithmetic::mul_reg(
        op1.reg,
        op1.reg,
        op2.reg,
        map_valtype_to_regsize(&valtype),
    ));

    register_pool.free_register(&op2.reg);
    value_stack.pop();
}
