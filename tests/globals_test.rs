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

    let func = instance.get_function::<(), i32>("get_special")?;
    assert_eq!(func.call()?, 186384);

    let func = instance.get_function::<(i32,), i32>("store_int32")?;
    assert_eq!(func.call(-42)?, -42);
    assert_eq!(func.call(i32::MAX)?, i32::MAX);
    assert_eq!(func.call(i32::MIN)?, i32::MIN);

    let func = instance.get_function::<(i64,), i64>("store_int64")?;
    assert_eq!(func.call(-42)?, -42);
    assert_eq!(func.call(i64::MAX)?, i64::MAX);
    assert_eq!(func.call(i64::MIN)?, i64::MIN);

    let func = instance.get_function::<(f32,), f32>("store_float32")?;
    assert_eq!(func.call(-42.0)?, -42.0);
    assert_eq!(func.call(f32::MAX)?, f32::MAX);
    assert_eq!(func.call(f32::MIN)?, f32::MIN);

    let func = instance.get_function::<(f64,), f64>("store_float64")?;
    assert_eq!(func.call(-42.0)?, -42.0);
    assert_eq!(func.call(f64::MAX)?, f64::MAX);
    assert_eq!(func.call(f64::MIN)?, f64::MIN);

    Ok(())
}
