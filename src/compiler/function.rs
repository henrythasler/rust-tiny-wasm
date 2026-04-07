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
        patches: vec![],
    }];

    let initial_size = machinecode.len();
    let mut register_pool = RegisterPool::default();

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
            Operator::End => {
                if compile_end(&mut control_stack, &mut value_stack, machinecode) {
                    break 'expression;
                }
            }
            Operator::Return => {
                compile_return(&mut control_stack, machinecode);
            }
            Operator::If { blockty } => {
                
            }
            Operator::Else => {}
            Operator::I64LtS => {
                compile_relop(&op, &mut value_stack, &mut register_pool, machinecode)
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
            | Operator::I64Mul => {
                compile_binop(&op, &mut value_stack, &mut register_pool, machinecode);
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
    // X0: Result, X1: Tag (0=Ok, 1=Trap)
    if !func_type.results().is_empty() {
        load_results(&mut value_stack, func_type.results().len(), machinecode)?;
    } else {
        // Result=0
        machinecode.push(processing::mov_reg(Reg::X0, Reg::XZR, RegSize::Reg64bit));
        // Tag=Ok (0)
        machinecode.push(processing::mov_reg(Reg::X1, Reg::XZR, RegSize::Reg64bit));
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
        | Operator::I32LtS => ValType::I32,
        Operator::I64Add
        | Operator::I64Sub
        | Operator::I64Mul
        | Operator::I64Const { .. }
        | Operator::I64LtS => ValType::I64,
        _ => panic!("Operator '{:?}' not supported", op),
    }
}
