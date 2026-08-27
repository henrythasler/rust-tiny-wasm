// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
#[rustfmt::skip]
fn test_global_0() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/global_0.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("get-a")?;
    assert_eq!(func.call()?, -2);

    let func = instance.get_function::<(), i64>("get-b")?;
    assert_eq!(func.call()?, -5);

    let func = instance.get_function::<(), i32>("get-x")?;
    assert_eq!(func.call()?, -12);

    let func = instance.get_function::<(), i64>("get-y")?;
    assert_eq!(func.call()?, -15);

    let func = instance.get_function::<(i32, ), ()>("set-x")?;
    func.call(6)?;

    let func = instance.get_function::<(i64, ), ()>("set-y")?;
    func.call(7)?;

    let func = instance.get_function::<(), i32>("as-if-then")?;
    assert_eq!(func.call()?, 6);

    let func = instance.get_function::<(), i32>("as-if-else")?;
    assert_eq!(func.call()?, 6);

    let func = instance.get_function::<(), i32>("as-br_if-first")?;
    assert_eq!(func.call()?, 6);

    let func = instance.get_function::<(), i32>("as-br_if-last")?;
    assert_eq!(func.call()?, 2);
    Ok(())
}
