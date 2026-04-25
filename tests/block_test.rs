use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_loop() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/block.wasm")))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), ()>("simple")?;
    func.call()?;

    let func = instance.get_function::<(), i32>("simple-br-i32")?;
    assert_eq!(func.call()?, 42);

    let func = instance.get_function::<(), i32>("simple-return")?;
    assert_eq!(func.call()?, 42);

    let func = instance.get_function::<(), i32>("simple-br_if")?;
    assert_eq!(func.call()?, 42);

    let func = instance.get_function::<(i32,), i32>("parameter-br_if")?;
    assert_eq!(func.call(1)?, 42);
    assert_eq!(func.call(-1)?, 42);
    assert_eq!(func.call(100)?, 42);
    assert_eq!(func.call(0)?, -4);

    let func = instance.get_function::<(i32,), i32>("parameter-nested-return")?;
    assert_eq!(func.call(1)?, 42);
    assert_eq!(func.call(0)?, -4);

    let func = instance.get_function::<(), i32>("nested-br_if")?;
    assert_eq!(func.call()?, 42);

    Ok(())
}
