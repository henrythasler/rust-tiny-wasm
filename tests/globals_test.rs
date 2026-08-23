use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_globals() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/globals.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("get_int32")?;
    assert_eq!(func.call()?, -2);

    let func = instance.get_function::<(), i64>("get_int64")?;
    assert_eq!(func.call()?, -5);

    let func = instance.get_function::<(), f32>("get_float32")?;
    assert_eq!(func.call()?, std::f32::consts::PI);

    let func = instance.get_function::<(), f64>("get_float64")?;
    assert_eq!(func.call()?, std::f64::consts::E);

    Ok(())
}
