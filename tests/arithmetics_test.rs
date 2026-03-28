use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_parameters() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/arithmetics.wasm")))?;
    let instance = get_module_instance(&module)?;

    let add = instance.get_function::<(i32, i32), i32>("add")?;
    assert_eq!(add.call(42, 24)?, 42 + 24);

    let sub = instance.get_function::<(i32, i32), i32>("sub")?;
    // assert_eq!(sub.call(66, 24)?, 66 - 24);

    let mul = instance.get_function::<(i32, i32), i32>("mul")?;
    // assert_eq!(mul.call(66, 24)?, 66 * 25);

    Ok(())
}
