use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_rust_arithmetics() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/rs/arithmetics.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i64, i64), i64>("add")?;
    assert_eq!(func.call(1, 2)?, 3);

    Ok(())
}
