use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_globals() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/globals.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("get_const0")?;
    // assert_eq!(func.call()?, -2);

    Ok(())
}
