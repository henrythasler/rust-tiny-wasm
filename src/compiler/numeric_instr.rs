use wasmparser::{Ieee32, Ieee64};

use super::*;

pub enum IeeeFloat {
    F32(Ieee32),
    F64(Ieee64),
}

pub trait RegisterInfo: Sized {
    fn to_reg_size(&self) -> RegSize;
    fn to_ireg_size(&self) -> RegSize;
    fn bits(&self) -> u64;
}

impl RegisterInfo for IeeeFloat {
    fn to_reg_size(&self) -> RegSize {
        match self {
            IeeeFloat::F32(_) => RegSize::Float32bit,
            IeeeFloat::F64(_) => RegSize::Float64bit,
        }
    }
    fn to_ireg_size(&self) -> RegSize {
        match self {
            IeeeFloat::F32(_) => RegSize::Int32bit,
            IeeeFloat::F64(_) => RegSize::Int64bit,
        }
    }

    fn bits(&self) -> u64 {
        match self {
            IeeeFloat::F32(f) => f.bits() as u64,
            IeeeFloat::F64(f) => f.bits(),
        }
    }
}

pub fn compile_unop(
    op: &Operator,
    value_stack: &mut Vec<StackElement>,
    machinecode: &mut Vec<u32>,
) {
    let len = value_stack.len();
    assert!(len >= 1, "insufficient operands on stack for unop");

    let operand = value_stack.pop().unwrap();

    let valtype = map_op_to_valtype(op);
    assert_eq!(
        operand.valtype, valtype,
        "Operand 1 type mismatch for binop"
    );

    match op {
        Operator::I32Ctz | Operator::I64Ctz => match operand.reg {
            Reg::IReg(reg) => {
                compound::ctz(reg, reg, map_valtype_to_regsize(&valtype), machinecode)
            }
            _ => panic!("ctz operator only supports integer registers"),
        },
        _ => panic!("Unary operator '{:?}' not supported", op),
    }
    value_stack.push(operand);
}

pub fn compile_testop(
    op: &Operator,
    value_stack: &mut Vec<StackElement>,
    machinecode: &mut Vec<u32>,
) {
    let len = value_stack.len();
    assert!(len >= 1, "insufficient operands on stack for testop");

    let operand = value_stack.pop().unwrap();

    let valtype = map_op_to_valtype(op);
    assert_eq!(
        operand.valtype, valtype,
        "Operand 1 type mismatch for testop"
    );

    match op {
        Operator::I32Eqz | Operator::I64Eqz => match operand.reg {
            Reg::IReg(reg) => {
                machinecode.push(arithmetic::cmp_imm(
                    reg,
                    0,
                    false,
                    map_valtype_to_regsize(&valtype),
                ));
                machinecode.push(conditionals::cset(
                    reg,
                    Condition::from_u32(Condition::EQ ^ 1).unwrap(),
                    RegSize::Int32bit,
                ));
            }
            _ => panic!("eqz operator only supports integer registers"),
        },
        _ => panic!("Unary operator '{:?}' not supported", op),
    }
    value_stack.push(operand);
}

pub fn compile_binop(
    op: &Operator,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    trap_locations: &mut Vec<Patch>,
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
        Operator::I32Add | Operator::I64Add => {
            match (op1.reg, op2.reg) {
                (Reg::IReg(reg1), Reg::IReg(reg2)) => {
                    machinecode.push(arithmetic::add_shifted_reg(
                        reg1,
                        reg1,
                        reg2,
                        Shift::Lsl,
                        0,
                        map_valtype_to_regsize(&valtype),
                    ))
                }
                _ => panic!("add operator only supports integer registers"),
            }
            register_pool.free();
        }
        Operator::F32Add | Operator::F64Add => {
            match (op1.reg, op2.reg) {
                (Reg::FReg(reg1), Reg::FReg(reg2)) => machinecode.push(fp_processing::fadd_scalar(
                    reg1,
                    reg1,
                    reg2,
                    map_valtype_to_regsize(&valtype),
                )),
                _ => panic!("add operator only supports float registers"),
            }
            register_pool.free_float();
        }
        Operator::F32Sub | Operator::F64Sub => {
            match (op1.reg, op2.reg) {
                (Reg::FReg(reg1), Reg::FReg(reg2)) => machinecode.push(fp_processing::fsub_scalar(
                    reg1,
                    reg1,
                    reg2,
                    map_valtype_to_regsize(&valtype),
                )),
                _ => panic!("sub operator only supports float registers"),
            }
            register_pool.free_float();
        }
        Operator::F32Mul | Operator::F64Mul => {
            match (op1.reg, op2.reg) {
                (Reg::FReg(reg1), Reg::FReg(reg2)) => machinecode.push(fp_processing::fmul_scalar(
                    reg1,
                    reg1,
                    reg2,
                    map_valtype_to_regsize(&valtype),
                )),
                _ => panic!("mul operator only supports float registers"),
            }
            register_pool.free_float();
        }
        Operator::I32Sub | Operator::I64Sub => {
            match (op1.reg, op2.reg) {
                (Reg::IReg(reg1), Reg::IReg(reg2)) => {
                    machinecode.push(arithmetic::sub_shifted_reg(
                        reg1,
                        reg1,
                        reg2,
                        Shift::Lsl,
                        0,
                        map_valtype_to_regsize(&valtype),
                    ))
                }
                _ => panic!("sub operator only supports integer registers"),
            }
            register_pool.free();
        }
        Operator::I32Mul | Operator::I64Mul => {
            match (op1.reg, op2.reg) {
                (Reg::IReg(reg1), Reg::IReg(reg2)) => machinecode.push(arithmetic::mul_reg(
                    reg1,
                    reg1,
                    reg2,
                    map_valtype_to_regsize(&valtype),
                )),
                _ => panic!("mul operator only supports integer registers"),
            }
            register_pool.free();
        }
        Operator::I32DivS | Operator::I64DivS | Operator::I32DivU | Operator::I64DivU => {
            match (op1.reg, op2.reg) {
                (Reg::IReg(reg1), Reg::IReg(reg2)) => {
                    // check for div by zero; jump over trap code if not zero
                    machinecode.push(branch::cbnz(
                        reg2,
                        TRAP_SKIP_BRANCH * INSTRUCTION_SIZE as i32,
                        map_valtype_to_regsize(&valtype),
                    ));
                    trap_inline(TrapCode::IntegerDivisionByZero, trap_locations, machinecode);

                    match op {
                        Operator::I32DivS | Operator::I64DivS => {
                            let reg_size = map_valtype_to_regsize(&valtype);

                            // need to check for integer overflow (INT_MIN/-1)
                            // (1) check if divisor is -1
                            machinecode.push(arithmetic::cmn_imm(
                                reg2,
                                1,
                                false,
                                map_valtype_to_regsize(&valtype),
                            ));
                            machinecode.push(branch::branch_cond(
                                Condition::NE,
                                (TRAP_SKIP_BRANCH + 3) * INSTRUCTION_SIZE as i32,
                            ));

                            // (2) Yes! Now check if dividend is INT(32|64)_MIN
                            let temp_reg = register_pool.alloc();
                            let shift = if reg_size == RegSize::Int32bit {
                                16
                            } else {
                                48
                            };

                            machinecode.push(processing::movz(temp_reg, 0x8000, shift, reg_size));
                            machinecode.push(arithmetic::cmp_shifted_reg(
                                reg1,
                                temp_reg,
                                Shift::Lsl,
                                0,
                                reg_size,
                            ));
                            machinecode.push(branch::branch_cond(
                                Condition::NE,
                                TRAP_SKIP_BRANCH * INSTRUCTION_SIZE as i32,
                            ));
                            trap_inline(TrapCode::IntegerOverflow, trap_locations, machinecode);
                            register_pool.free();

                            machinecode.push(arithmetic::sdiv(
                                reg1,
                                reg1,
                                reg2,
                                map_valtype_to_regsize(&valtype),
                            ));
                        }
                        Operator::I32DivU | Operator::I64DivU => machinecode.push(
                            arithmetic::udiv(reg1, reg1, reg2, map_valtype_to_regsize(&valtype)),
                        ),
                        _ => panic!("Binary operator '{:?}' not supported", op),
                    }
                }
                _ => panic!("div operator only supports integer registers"),
            }
            register_pool.free();
        }
        _ => panic!("Binary operator '{:?}' not supported", op),
    }

    value_stack.push(op1);
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

    match op {
        Operator::I32LtS | Operator::I64LtS => match (op1.reg, op2.reg) {
            (Reg::IReg(reg1), Reg::IReg(reg2)) => {
                machinecode.push(arithmetic::cmp_shifted_reg(reg1, reg2, Shift::Lsl, 0, size));
                machinecode.push(conditionals::cset(
                    reg1,
                    Condition::from_u32(Condition::LT ^ 1).unwrap(),
                    RegSize::Int32bit,
                ))
            }
            _ => panic!("relop operator '{:?}' only supports integer registers", op),
        },
        Operator::I32LeU | Operator::I64LeU => match (op1.reg, op2.reg) {
            (Reg::IReg(reg1), Reg::IReg(reg2)) => {
                machinecode.push(arithmetic::cmp_shifted_reg(reg1, reg2, Shift::Lsl, 0, size));
                machinecode.push(conditionals::cset(
                    reg1,
                    Condition::from_u32(Condition::LS ^ 1).unwrap(),
                    RegSize::Int32bit,
                ))
            }
            _ => panic!("relop operator '{:?}' only supports integer registers", op),
        },
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

    value_stack.push(StackElement {
        reg: Reg::IReg(reg),
        valtype,
    });

    compound::mov_large_immediate(
        reg,
        value.into(),
        map_valtype_to_regsize(&valtype),
        machinecode,
    );
}

pub fn compile_float_const(
    op: &Operator,
    value: IeeeFloat,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let reg = register_pool.alloc_float();
    let valtype = map_op_to_valtype(op);

    value_stack.push(StackElement {
        reg: Reg::FReg(reg),
        valtype,
    });

    let temp_reg = register_pool.alloc();
    compound::mov_large_immediate(
        temp_reg,
        value.bits() as i64,
        value.to_ireg_size(),
        machinecode,
    );
    machinecode.push(fp_processing::fmov(
        Reg::FReg(reg),
        Reg::IReg(temp_reg),
        value.to_reg_size(),
    ));
    register_pool.free();
}
