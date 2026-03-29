use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_parameters() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/valent-blocks.wasm")))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("add_const")?;
    let res = func.call()?;
    assert_eq!(res, 50);

    Ok(())
}
