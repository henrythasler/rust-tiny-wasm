use crate::runtime::WasmReturnCode;

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

    machinecode.push(processing::mov_imm(
        IReg::X0,
        WasmReturnCode::Ok as u32,
        RegSize::Reg64bit,
    ));

    for _ in 0..num_results {
        let item = value_stack.pop().unwrap();
        match item.valtype {
            wasmparser::ValType::I32 | wasmparser::ValType::I64 => match item.reg {
                Reg::IReg(reg) => {
                    machinecode.push(processing::mov_reg(IReg::X1, reg, RegSize::Reg64bit))
                }
                _ => panic!("Unsupported register type for return value"),
            },
            wasmparser::ValType::F32 | wasmparser::ValType::F64 => {
                machinecode.push(fp_processing::fmov(
                    Reg::IReg(IReg::X1),
                    item.reg,
                    map_valtype_to_regsize(&item.valtype),
                ))
            }
            _ => panic!("Unsupported return value type"),
        }
        // the source register should be released but since the function returns anyway, we skip this here
    }

    Ok(())
}
