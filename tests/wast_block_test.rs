// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_block_0() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/block.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), ()>("type-i32")?;
    func.call();
    let func = instance.get_function::<(), ()>("type-i64")?;
    func.call();
    let func = instance.get_function::<(), ()>("type-i32-value")?;
    func.call();
    let func = instance.get_function::<(), ()>("type-i64-value")?;
    func.call();
    let func = instance.get_function::<(), ()>("as-block-first")?;
    func.call();
    func.call();
    let func = instance.get_function::<(), ()>("as-block-first-value")?;
    func.call();
    func.call();
    let func = instance.get_function::<(), ()>("as-binary-left")?;
    func.call();
    let func = instance.get_function::<(), ()>("as-binary-right")?;
    func.call();
    let func = instance.get_function::<(), ()>("as-test-operand")?;
    func.call();
    let func = instance.get_function::<(), ()>("as-compare-left")?;
    func.call();
    let func = instance.get_function::<(), ()>("as-compare-right")?;
    func.call();
    let func = instance.get_function::<(), ()>("as-br_if-value")?;
    func.call();
    let func = instance.get_function::<(), ()>("as-br_if-value-cond")?;
    func.call();
    let func = instance.get_function::<(), ()>("nested-br-value")?;
    func.call();
    let func = instance.get_function::<(), ()>("nested-br_if-value")?;
    func.call();
    Ok(())
}
