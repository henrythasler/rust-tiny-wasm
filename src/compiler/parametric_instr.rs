use super::*;

pub fn compile_drop(value_stack: &mut Vec<StackElement>, register_pool: &mut RegisterPool) {
    value_stack
        .pop()
        .expect("value stack should contain at least one element for 'drop' opcode");
    register_pool.free();
}
