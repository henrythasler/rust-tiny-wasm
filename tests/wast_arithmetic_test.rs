// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_arithmetic_0() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/arithmetic.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), ()>("add")?;
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    let func = instance.get_function::<(), ()>("sub")?;
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    let func = instance.get_function::<(), ()>("mul")?;
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    Ok(())
}

#[test]
fn test_arithmetic_1() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/arithmetic.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), ()>("add")?;
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    let func = instance.get_function::<(), ()>("sub")?;
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    let func = instance.get_function::<(), ()>("mul")?;
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    func.call();
    Ok(())
}
