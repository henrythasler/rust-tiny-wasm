use super::*;

// Represents a block of machine code instructions
// #[derive(Debug, Clone)]
// struct MachineCodeBlock {
//     code: Vec<u32>,
//     description: String,
// }

// impl MachineCodeBlock {
//     fn new() -> Self {
//         MachineCodeBlock {
//             code: Vec::new(),
//             description: String::new(),
//         }
//     }

//     // fn emit(&mut self, instr: u32) {
//     //     self.code.push(instr);
//     // }

//     // fn emit32(&mut self, value: u32) {
//     //     self.code.push((value & 0xFF) as u8);
//     //     self.code.push(((value >> 8) & 0xFF) as u8);
//     //     self.code.push(((value >> 16) & 0xFF) as u8);
//     //     self.code.push(((value >> 24) & 0xFF) as u8);
//     // }
// }

// A Valent-Block: a logical partition of the virtual stack that can be
// independently emitted as machine code
// #[derive(Debug)]
// struct ValentBlock {
//     virtual_stack: Vec<VirtualStackEntry>,
//     delayed_instructions: Vec<u32>,
//     is_emitted: bool,
// }

// impl ValentBlock {
//     fn new() -> Self {
//         ValentBlock {
//             virtual_stack: Vec::new(),
//             delayed_instructions: Vec::new(),
//             is_emitted: false,
//         }
//     }

//     // Push a value onto the virtual stack (delayed emission)
//     fn push_value(&mut self, valtype: ValType, is_const: bool, val: i64) {
//         println!(
//             "  [Virtual Stack] Pushing {}",
//             if is_const { "constant" } else { "value" }
//         );
//         self.virtual_stack
//             .push(VirtualStackEntry::new(valtype, is_const, val));
//     }

//     // Process a WebAssembly instruction - delays emission until optimization opportunity
//     fn process_instruction(&mut self, wasm_op: &Operator, position: &usize) {
//         println!("\n[Processing] WASM instruction: {:?}", wasm_op);

//         match wasm_op {
//             Operator::End => {}
//             // Example: i32.const - push constant to virtual stack
//             Operator::I32Const { value } => {
//                 self.push_value(ValType::I32, true, *value as i64);
//                 println!("  → Delayed emission (buffered on virtual stack)");
//             }
//             // Example: i32.add - opportunity for instruction merging
//             Operator::I32Add => {
//                 if self.virtual_stack.len() >= 2 {
//                     let op2 = self.virtual_stack.pop().unwrap();
//                     let op1 = self.virtual_stack.pop().unwrap();

//                     // OPTIMIZATION: Constant folding
//                     if op1.is_constant && op2.is_constant {
//                         println!(
//                             "  → Optimization: Constant folding ({} + {})",
//                             op1.const_value, op2.const_value
//                         );
//                         self.push_value(ValType::I32, true, op1.const_value + op2.const_value);
//                     }
//                     // // OPTIMIZATION: Add immediate (one operand is constant)
//                     // else if op2.is_constant {
//                     //     println!("  → Optimization: Instruction merging (ADD immediate)");
//                     //     let mut block = MachineCodeBlock::new();
//                     //     block.description = format!("ADD reg, #{}", op2.const_value);
//                     //     // Pseudo x86: ADD EAX, imm32
//                     //     block.emit(0x05); // ADD EAX, imm32
//                     //     block.emit32(op2.const_value as u32);
//                     //     self.delayed_instructions.push(block);
//                     //     self.push_value(ValType::I32, false, 0);
//                     // }
//                     // // Regular add - still delayed
//                     // else {
//                     //     println!("  → Delayed: Regular ADD (buffered)");
//                     //     let mut block = MachineCodeBlock::new();
//                     //     block.description = "ADD reg, reg".to_string();
//                     //     // Pseudo x86: ADD EAX, EBX
//                     //     block.emit(0x01);
//                     //     block.emit(0xC3);
//                     //     self.delayed_instructions.push(block);
//                     //     self.push_value(ValType::I32, false, 0);
//                     // }
//                 }
//             }
//             _ => panic!(
//                 "unsupported instruction: {:?} at position {}",
//                 wasm_op, position
//             ),
//         }
//     }

//     // Emit accumulated machine code for this valent-block
//     fn emit(&mut self) -> Vec<u32> {
//         if self.is_emitted {
//             println!("\n[Warning] Block already emitted!");
//             return Vec::new();
//         }

//         println!("\n=== EMITTING VALENT-BLOCK ===");
//         println!(
//             "Virtual stack depth at emission: {}",
//             self.virtual_stack.len()
//         );
//         println!(
//             "Delayed instructions count: {}",
//             self.delayed_instructions.len()
//         );

//         println!(
//             "Total machine code bytes: {}",
//             &self.delayed_instructions.len()
//         );
//         self.is_emitted = true;
//         self.delayed_instructions.clone()
//     }

//     fn get_stack_depth(&self) -> usize {
//         self.virtual_stack.len()
//     }

//     fn needs_emission(&self) -> bool {
//         !self.delayed_instructions.is_empty() && !self.is_emitted
//     }
// }

// // Simple compiler demonstrating the Valent-Blocks approach
// struct ValentBlocksCompiler {
//     blocks: Vec<ValentBlock>,
//     current_block_index: usize,
// }

// impl ValentBlocksCompiler {
//     fn new() -> Self {
//         let mut compiler = ValentBlocksCompiler {
//             blocks: Vec::new(),
//             current_block_index: 0,
//         };
//         // Start with initial block
//         compiler.blocks.push(ValentBlock::new());
//         compiler
//     }

//     fn compile_instruction(&mut self, wasm_op: &Operator, position: &usize) {
//         self.blocks[self.current_block_index].process_instruction(wasm_op, position);

//         // Emit block if it reaches a certain complexity threshold
//         // (In real implementation, this would be based on control flow, stack depth, etc.)
//         let stack_depth = self.blocks[self.current_block_index].get_stack_depth();
//         if stack_depth > 8 || *wasm_op == Operator::End {
//             if self.blocks[self.current_block_index].needs_emission() {
//                 self.blocks[self.current_block_index].emit();
//             }

//             // Start new valent-block if needed
//             if *wasm_op == Operator::End {
//                 self.blocks.push(ValentBlock::new());
//                 self.current_block_index = self.blocks.len() - 1;
//             }
//         }
//     }

//     fn finalize_compilation(&mut self) {
//         println!("\n\n=== FINALIZING COMPILATION ===");
//         println!("Total valent-blocks created: {}", self.blocks.len());
//         println!("{:?}, self.current_block_index: {}", self.blocks, self.current_block_index);

//         // Emit any remaining blocks
//         if self.blocks[self.current_block_index].needs_emission() {
//             self.blocks[self.current_block_index].emit();
//         }

//         println!("\n✓ Compilation complete!");
//     }
// }

// pub fn compile_function_vb(
//     reader: &mut wasmparser::OperatorsReader<'_>,
//     func_type: &wasmparser::FuncType,
//     locals: &[(u32, ValType)],
//     machinecode: &mut Vec<u32>,
// ) -> Result<usize> {
//     // Value stack starts empty
//     let mut virtual_stack: Vec<VirtualStackEntry> = vec![];

//     // Control stack is initialized with the (implicit) outer func-block
//     let mut control_stack: Vec<ControlFrame> = vec![ControlFrame {
//         opcode: Opcode::Func,
//         start_types: func_type.params().to_vec(),
//         end_types: func_type.results().to_vec(),
//         stack_height: virtual_stack.len(),
//         patches: vec![],
//     }];

//     let initial_size = machinecode.len();
//     let mut register_pool = RegisterPool::default();

//     // calculate initial stack size from all parameters and locals
//     let (_variables_size, stack_size) = get_aligned_stack_size(func_type, locals);
//     // println!("{} {:?}", _variables_size, stack_size);

//     // every functions starts with an epilogue to save the initial state and create a new stack frame
//     emit_prologue(stack_size, &mut register_pool, machinecode);

//     let mut variables: Vec<LocalVar> = vec![];
//     let mut stack_offset = 0;
//     // save parameters to stack
//     if !func_type.params().is_empty() {
//         variables.extend(save_parameters_to_stack(
//             &mut stack_offset,
//             func_type.params(),
//             machinecode,
//         ));
//     }

//     if !locals.is_empty() {
//         variables.extend(save_locals_to_stack(&mut stack_offset, locals, machinecode));
//     }

//     'expression: while !reader.eof() {
//         let position = reader.original_position();
//         let op = reader.read().unwrap();
//         match op {
//             Operator::End => {
//                 // if compile_end(&mut control_stack, &mut virtual_stack, machinecode) {
//                 //     break 'expression;
//                 // }
//             }
//             Operator::Return => {
//                 compile_return(&mut control_stack, machinecode);
//             }
//             Operator::I32Const { value } => {
//                 virtual_stack.push(VirtualStackEntry { valtype: ValType::I32, is_constant: true, const_value: value as i64, virtual_register: 0, reg: None });
//                 // compile_const(
//                 //     &op,
//                 //     value,
//                 //     &mut virtual_stack,
//                 //     &mut register_pool,
//                 //     machinecode,
//                 // );
//             }
//             Operator::I64Const { value } => {
//                 // compile_const(
//                 //     &op,
//                 //     value,
//                 //     &mut virtual_stack,
//                 //     &mut register_pool,
//                 //     machinecode,
//                 // );
//             }
//             Operator::LocalGet { local_index } => {
//                 // let var = variables.get(local_index as usize).unwrap();
//                 // compile_local_get(
//                 //     var,
//                 //     var.offset,
//                 //     &mut virtual_stack,
//                 //     &mut register_pool,
//                 //     machinecode,
//                 // );
//             }
//             Operator::LocalSet { local_index } => {
//                 // let var = variables.get(local_index as usize).unwrap();
//                 // compile_local_set(
//                 //     var,
//                 //     var.offset,
//                 //     &mut virtual_stack,
//                 //     &mut register_pool,
//                 //     machinecode,
//                 // );
//             }
//             Operator::I32Add
//             | Operator::I64Add
//             | Operator::I32Sub
//             | Operator::I64Sub
//             | Operator::I32Mul
//             | Operator::I64Mul => {
//                 // compile_binop(&op, &mut virtual_stack, &mut register_pool, machinecode);
//             }
//             _ => {
//                 return Err(TinyWasmError::Compiler(format!(
//                     "unsupported instruction: {:?} at position {}",
//                     op, position
//                 )));
//             }
//         }
//     }

//     // move result values to result registers according to Aarch64 Procedure Call Standard (X0..X7)
//     // X0: Result, X1: Tag (0=Ok, 1=Trap)
//     if !func_type.results().is_empty() {
//         // load_results(&mut virtual_stack, func_type.results().len(), machinecode)?;
//     } else {
//         // Result=0
//         machinecode.push(processing::mov_reg(Reg::X0, Reg::XZR, RegSize::Reg64bit));
//         // Tag=Ok (0)
//         machinecode.push(processing::mov_reg(Reg::X1, Reg::XZR, RegSize::Reg64bit));
//     }

//     // restore initial state before returning to the caller
//     emit_epilogue(stack_size, machinecode);

//     // add padding to INSTRUCTION_SIZE to align subsequent functions to the correct size
//     let padding_instructions =
//         ((machinecode.len() * INSTRUCTION_SIZE) % mem::align_of::<fn()>()) / INSTRUCTION_SIZE;
//     for _ in 0..padding_instructions {
//         machinecode.push(hint::nop());
//     }

//     Ok(machinecode.len() - initial_size)
// }

// #[derive(Debug, Clone)]
// struct VirtualStackEntry {
//     valtype: ValType,
//     is_constant: bool,
//     const_value: i64,      // For constant folding
//     virtual_register: i32, // Virtual register assignment
// }

// impl VirtualStackEntry {
//     fn new(valtype: ValType, is_constant: bool, const_value: i64) -> Self {
//         VirtualStackEntry {
//             valtype,
//             is_constant,
//             const_value,
//             virtual_register: -1,
//         }
//     }
// }

// #[derive(Debug)]
// struct ValentBlock {
//     virtual_stack: Vec<VirtualStackEntry>,
//     delayed_instructions: Vec<u32>,
//     is_emitted: bool,
// }

// struct ValentBlocksCompiler {
//     blocks: Vec<ValentBlock>,
// }

// impl ValentBlocksCompiler {
//     fn new() -> Self {
//         let mut compiler = ValentBlocksCompiler { blocks: Vec::new() };
//         compiler.blocks.push(ValentBlock::new());
//         compiler
//     }
// }



#[derive(Debug)]
struct OperandStackEntry {
    reg: Option<Reg>,
    valtype: wasmparser::ValType,
    value: i64,
}


pub fn compile_function_vb(
    reader: &mut wasmparser::OperatorsReader<'_>,
    func_type: &wasmparser::FuncType,
    locals: &[(u32, ValType)],
    machinecode: &mut Vec<u32>,
) -> Result<usize> {
    // Value stack starts empty
    let mut value_stack: Vec<OperandStackEntry> = vec![];

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
