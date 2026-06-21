use crate::runtime::WasmReturnCode;

use super::*;

pub fn compile_function(
    reader: &mut wasmparser::OperatorsReader<'_>,
    func_type: &wasmparser::FuncType,
    locals: &[(u32, ValType)],
    machinecode: &mut Vec<u32>,
) -> Result<usize> {
    // Value stack starts empty
    let mut value_stack: Vec<StackElement> = vec![];

    // Control stack is initialized with the (implicit) outer func-block
    let mut control_stack: Vec<ControlFrame> = vec![ControlFrame {
        opcode: Opcode::Func,
        start_types: func_type.params().to_vec(),
        end_types: func_type.results().to_vec(),
        stack_height: value_stack.len(),
        value_stack: None,
        register_index: None,
        result_register: None,
        machinecode_offset: machinecode.len(),
        patches: vec![],
    }];

    let mut trap_locations: Vec<Patch> = vec![];

    let initial_size = machinecode.len();
    let mut register_pool = RegisterPool::new();

    // calculate initial stack size from all parameters and locals
    let (_variables_size, stack_size) = get_aligned_stack_size(func_type, locals);
    // println!("{} {:?}", _variables_size, stack_size);

    // every functions starts with an epilogue to save the initial state and create a new stack frame
    emit_prologue(stack_size, &mut register_pool, machinecode);

    let mut variables: Vec<LocalVar> = vec![];
    let mut stack_offset = 0;
    // save parameters to stack
    if !func_type.params().is_empty() {
        variables.extend(save_parameters_to_stack(
            &mut stack_offset,
            func_type.params(),
            machinecode,
        ));
    }

    if !locals.is_empty() {
        variables.extend(save_locals_to_stack(&mut stack_offset, locals, machinecode));
    }

    'expression: while !reader.eof() {
        let index = reader.original_position();
        let op = reader.read().unwrap();
        match op {
            Operator::Drop => compile_drop(&mut value_stack, &mut register_pool),
            Operator::Return => compile_return(&mut control_stack, &value_stack, machinecode),
            Operator::Block { blockty } => {
                compile_block(
                    blockty,
                    &mut control_stack,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::Br { relative_depth } => {
                compile_br(
                    relative_depth,
                    &mut control_stack,
                    &value_stack,
                    // &mut register_pool,
                    machinecode,
                );
            }
            Operator::BrIf { relative_depth } => {
                compile_brif(
                    relative_depth,
                    &mut control_stack,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::Loop { blockty } => {
                compile_loop(
                    blockty,
                    &mut control_stack,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::If { blockty } => {
                compile_if(
                    blockty,
                    &mut control_stack,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::Else => {
                compile_else(
                    &mut control_stack,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::End => {
                if compile_end(
                    &mut control_stack,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                ) {
                    break 'expression;
                }
            }
            Operator::I32LtS | Operator::I64LtS | Operator::I32LeU | Operator::I64LeU => {
                compile_relop(&op, &mut value_stack, &mut register_pool, machinecode)
            }
            Operator::I32Eqz | Operator::I64Eqz => {
                compile_testop(&op, &mut value_stack, machinecode)
            }
            Operator::I32Const { value } => {
                compile_const(
                    &op,
                    value,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::I64Const { value } => {
                compile_const(
                    &op,
                    value,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::F32Const { value } => {
                compile_float_const(
                    &op,
                    IeeeFloat::F32(value),
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::F64Const { value } => {
                compile_float_const(
                    &op,
                    IeeeFloat::F64(value),
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::LocalGet { local_index } => {
                let var = variables.get(local_index as usize).unwrap();
                compile_local_get(
                    var,
                    var.offset,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::LocalSet { local_index } => {
                let var = variables.get(local_index as usize).unwrap();
                compile_local_set(
                    var,
                    var.offset,
                    &mut value_stack,
                    &mut register_pool,
                    machinecode,
                );
            }
            Operator::LocalTee { local_index } => {
                let var = variables.get(local_index as usize).unwrap();
                compile_local_tee(var, var.offset, &mut value_stack, machinecode);
            }
            Operator::I32Add
            | Operator::I64Add
            | Operator::I32Sub
            | Operator::I64Sub
            | Operator::I32Mul
            | Operator::I64Mul
            | Operator::I32DivU
            | Operator::I64DivU
            | Operator::I32DivS
            | Operator::I64DivS
            | Operator::F32Add
            | Operator::F64Add
            | Operator::F32Sub
            | Operator::F64Sub
            | Operator::F32Mul
            | Operator::F64Mul
            | Operator::F32Div
            | Operator::F64Div => {
                compile_binop(
                    &op,
                    &mut value_stack,
                    &mut register_pool,
                    &mut trap_locations,
                    machinecode,
                );
            }
            Operator::I32Ctz | Operator::I64Ctz => {
                compile_unop(&op, &mut value_stack, machinecode);
            }
            _ => {
                return Err(TinyWasmError::Compiler(format!(
                    "unsupported instruction: {:?} at position {}",
                    op, index
                )));
            }
        }
    }

    // move result values to result registers according to Aarch64 Procedure Call Standard (X0..X7)
    // X0: Return Code (0=Ok, 1=Trap),
    // X1: Result or Trap code
    if func_type.results().is_empty() {
        // Return Code =Ok (0)
        machinecode.push(processing::mov_imm(
            IReg::X0,
            WasmReturnCode::Ok as u32,
            RegSize::Int64bit,
        ));
        // Result=0
        machinecode.push(processing::mov_reg(IReg::X1, IReg::XZR, RegSize::Int64bit));
    } else {
        load_results(&mut value_stack, func_type.results().len(), machinecode)?;
    }

    for patch in trap_locations {
        match patch.instruction {
            Instruction::Br => {
                let offset = (machinecode.len() - patch.location) as i32 * 4;
                let location = machinecode
                    .get_mut(patch.location)
                    .expect("patch location should point to valid location");
                branch::patch_branch(offset, location);
            }
            _ => panic!("unexpected instruction"),
        }
    }

    // restore initial state before returning to the caller
    emit_epilogue(stack_size, machinecode);

    // add padding to INSTRUCTION_SIZE to align subsequent functions to the correct size
    let padding_instructions =
        ((machinecode.len() * INSTRUCTION_SIZE) % mem::align_of::<fn()>()) / INSTRUCTION_SIZE;
    for _ in 0..padding_instructions {
        machinecode.push(hint::nop());
    }

    Ok(machinecode.len() - initial_size)
}

pub fn map_op_to_valtype(op: &Operator) -> ValType {
    match op {
        Operator::I32Add
        | Operator::I32Sub
        | Operator::I32Mul
        | Operator::I32Const { .. }
        | Operator::I32Ctz
        | Operator::I32LtS
        | Operator::I32LeU
        | Operator::I32Eqz
        | Operator::I32DivS
        | Operator::I32DivU => ValType::I32,
        Operator::I64Add
        | Operator::I64Sub
        | Operator::I64Mul
        | Operator::I64Const { .. }
        | Operator::I64Ctz
        | Operator::I64LtS
        | Operator::I64LeU
        | Operator::I64Eqz
        | Operator::I64DivS
        | Operator::I64DivU => ValType::I64,
        Operator::F32Const { .. } => ValType::F32,
        Operator::F64Const { .. } => ValType::F64,
        Operator::F32Add | Operator::F32Sub | Operator::F32Mul | Operator::F32Div => ValType::F32,
        Operator::F64Add | Operator::F64Sub | Operator::F64Mul | Operator::F64Div => ValType::F64,
        _ => panic!("Operator '{:?}' not supported", op),
    }
}
