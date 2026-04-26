use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_constants() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/constants.wasm"))?;
    let instance = get_module_instance(&module)?;

    let entrypoint = instance.get_function::<(), i32>("get_42")?;
    let res = entrypoint.call()?;
    assert_eq!(res, 42);

    let entrypoint = instance.get_function::<(), i32>("get_minus_1")?;
    let res = entrypoint.call()?;
    assert_eq!(res, -1);

    let entrypoint = instance.get_function::<(), i64>("get_large_num")?;
    let res = entrypoint.call()?;
    assert_eq!(res, 0x1234567890aabbcc);

    let entrypoint = instance.get_function::<(), i64>("get_i64_min")?;
    let res = entrypoint.call()?;
    assert_eq!(res, -9223372036854775808);

    Ok(())
}
