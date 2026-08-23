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
        Reg::FReg(reg) => machinecode.push(fp_memory::str_imm_unsigned_offset(
            reg,
            IReg::SP,
            offset as u32,
            map_valtype_to_regsize(&variable.valtype),
        )),
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
        Reg::FReg(reg) => machinecode.push(fp_memory::str_imm_unsigned_offset(
            reg,
            IReg::SP,
            offset as u32,
            map_valtype_to_regsize(&variable.valtype),
        )),
    }
    value_stack.push(element);
}

pub fn compile_global_get(
    global_index: u32,
    module_ctx: &ModuleContext,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    // Retrieve the global variable from the module context; will panic if the index is out of bounds or if globals are not initialized
    let global = module_ctx
        .globals
        .as_ref()
        .unwrap()
        .get(global_index as usize)
        .expect("Global index out of bounds");

    match global.mutable {
        true => {
            match global.valtype {
                ValType::I32 | ValType::I64 => {
                    let reg = register_pool.alloc();
                    value_stack.push(StackElement {
                        reg: Reg::IReg(reg),
                        valtype: global.valtype,
                    });

                    machinecode.push(memory::ldr_imm_unsigned_offset(
                        reg,
                        CONTEXT_REG,
                        ctx_offsets::GLOBALS_BASE,
                        MemSize::Mem64bit,
                        RegSize::Int64bit,
                    ));

                    machinecode.push(memory::ldr_imm_unsigned_offset(
                        reg,
                        reg,
                        global_index * 8, // Assuming each global is 8 bytes; adjust as necessary
                        map_valtype_to_memsize(&global.valtype),
                        map_valtype_to_regsize(&global.valtype),
                    ));
                }
                ValType::F32 | ValType::F64 => {
                    let reg = register_pool.alloc_float();
                    value_stack.push(StackElement {
                        reg: Reg::FReg(reg),
                        valtype: global.valtype,
                    });
                    machinecode.push(fp_memory::ldr_imm_unsigned_offset(
                        reg,
                        IReg::X0, // Assuming X0 holds the base address of globals
                        (global_index as usize * 8) as u32, // Assuming each global is 8 bytes; adjust as necessary
                        map_valtype_to_regsize(&global.valtype),
                    ));
                }
                _ => panic!("Unsupported variable type for global.get"),
            }
        }
        false => compile_const(
            global.valtype,
            global.value.clone(),
            value_stack,
            register_pool,
            machinecode,
        ),
    }
}

pub fn compile_global_set(
    global_index: u32,
    module_ctx: &ModuleContext,
    value_stack: &mut Vec<StackElement>,
    register_pool: &mut RegisterPool,
    machinecode: &mut Vec<u32>,
) {
    let element = value_stack
        .pop()
        .expect("value stack should contain at least one element on 'local.set' opcode");
}
