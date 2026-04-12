use super::*;

pub fn compile_binop(
    op: &Operator,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let len = value_stack.len();
    assert!(len >= 2, "insufficient operands on stack for binop");

    let op2 = value_stack.pop().unwrap();
    let op1 = value_stack.pop().unwrap();

    let valtype = map_op_to_valtype(op);
    assert_eq!(op1.valtype, valtype, "Operand 1 type mismatch for binop");
    assert_eq!(op2.valtype, valtype, "Operand 2 type mismatch for binop");

    match op {
        Operator::I32Add | Operator::I64Add => machinecode.push(arithmetic::add_shifted_reg(
            op1.reg,
            op1.reg,
            op2.reg,
            Shift::Lsl,
            0,
            map_valtype_to_regsize(&valtype),
        )),
        Operator::I32Sub | Operator::I64Sub => machinecode.push(arithmetic::sub_shifted_reg(
            op1.reg,
            op1.reg,
            op2.reg,
            Shift::Lsl,
            0,
            map_valtype_to_regsize(&valtype),
        )),
        Operator::I32Mul | Operator::I64Mul => machinecode.push(arithmetic::mul_reg(
            op1.reg,
            op1.reg,
            op2.reg,
            map_valtype_to_regsize(&valtype),
        )),
        _ => panic!("Binary operator '{:?}' not supported", op),
    }

    value_stack.push(op1);
    register_pool.free();
}

pub fn compile_relop(
    op: &Operator,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let len = value_stack.len();
    assert!(len >= 2, "insufficient operands on stack for relop");

    let op2 = value_stack.pop().unwrap();
    let op1 = value_stack.pop().unwrap();

    let valtype = map_op_to_valtype(op);
    let size = map_valtype_to_regsize(&valtype);

    assert_eq!(op1.valtype, valtype, "Operand 1 type mismatch for relop");
    assert_eq!(op2.valtype, valtype, "Operand 2 type mismatch for relop");

    machinecode.push(arithmetic::cmp_shifted_reg(
        op1.reg,
        op2.reg,
        Shift::Lsl,
        0,
        size,
    ));

    match op {
        Operator::I32LtS | Operator::I64LtS => {
            machinecode.push(conditionals::cset(
                op1.reg,
                Condition::from_u32(Condition::LT ^ 1).unwrap(),
                RegSize::Reg32bit,
            ));
        }
        _ => panic!("Relation operator '{:?}' not supported", op),
    }

    value_stack.push(StackElement {
        reg: op1.reg,
        valtype: ValType::I32,
    });
    register_pool.free();
}

pub fn compile_const<T: Into<i64>>(
    op: &Operator,
    value: T,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let reg = register_pool.alloc();
    let valtype = map_op_to_valtype(op);

    value_stack.push(StackElement { reg, valtype });

    compound::mov_large_immediate(
        reg,
        value.into(),
        map_valtype_to_regsize(&valtype),
        machinecode,
    );
}
