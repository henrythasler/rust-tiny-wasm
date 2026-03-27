use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_parameters() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/parameters.wasm")))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_func::<(i32, i32), i32>("get_first_i32")?;
    let res = func.call(42, 24)?;
    assert_eq!(res, 42);

    let func = instance.get_func::<(i32, i32, i32), i32>("get_third_i32")?;
    let res = func.call(1000, 24, 42)?;
    assert_eq!(res, 42);

    let func = instance.get_func::<(i64, i64), i64>("get_second_i64")?;
    let res = func.call(100000, 0x1234567890aabbcc)?;
    assert_eq!(res, 0x1234567890aabbcc);

    let func = instance.get_func::<(i64, i64, i64, i64), i64>("get_fourth_i64")?;
    let res = func.call(100000, 0, 0, 0x1234567890aabbcc)?;
    assert_eq!(res, 0x1234567890aabbcc);

    Ok(())
}
