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
    assert_eq!(op1.valtype, op2.valtype, "Operand types mismatch");

    match valtype {
        ValType::I32 => machinecode.push(arithmetic::add_shifted_reg(
            op1.reg,
            op1.reg,
            op2.reg,
            Shift::Lsl,
            0,
            RegSize::Reg32bit,
        )),
        ValType::I64 => machinecode.push(arithmetic::add_shifted_reg(
            op1.reg,
            op1.reg,
            op2.reg,
            Shift::Lsl,
            0,
            RegSize::Reg64bit,
        )),
        _ => {
            panic!("unsupported valtype {} in add()", valtype)
        }
    }

    register_pool.free_register(&op2.reg);
    value_stack.pop();
}
