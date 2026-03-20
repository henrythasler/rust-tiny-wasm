use super::*;

pub fn load_results(
    value_stack: &mut Vec<StackElement>,
    num_results: usize,
    machinecode: &mut Vec<u32>,
) -> Result<()> {
    assert!(
        !value_stack.is_empty(),
        "[{}:{}]: Wasm stack underflow when loading result",
        module_path!(),
        line!()
    );

    assert!(
        num_results <= 1,
        "[{}:{}]: Multiple result values is currently not supported",
        module_path!(),
        line!()
    );

    for _ in 0..num_results {
        let item = value_stack.pop().unwrap();
        let reg_size = map_valtype_to_regsize(item.valtype);
        machinecode.push(processing::mov_reg(Reg::X0, item.reg, reg_size));
        // the source register should be released but since the function returns anyway, we skip this here
    }

    Ok(())
}
