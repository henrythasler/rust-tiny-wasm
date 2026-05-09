use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_block() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/mixed.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i32>("conditional_return")?;
    assert_eq!(func.call(1)?, 0xaa);
    assert_eq!(func.call(10)?, 0xaa);
    assert_eq!(func.call(0)?, 0x55);

    Ok(())
}
