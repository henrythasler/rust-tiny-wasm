use std::fs;
use std::path::Path;
use tiny_wasm::runtime::wrap_result;
use tiny_wasm::*;

#[test]
fn test_parameters() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/parameters.wasm")))?;
    let instance = get_module_instance(&module)?;

    let entrypoint =
        unsafe { instance.get_function::<fn(i32, i32) -> (i32, i64)>("get_first_i32") }?;
    let res = wrap_result::<i32>(entrypoint(42, 24))?;
    assert_eq!(res, 42);

    let entrypoint =
        unsafe { instance.get_function::<fn(i32, i32, i32) -> (i32, i64)>("get_third_i32") }?;
    let res = wrap_result::<i32>(entrypoint(1000, 24, 42))?;
    assert_eq!(res, 42);

    let entrypoint =
        unsafe { instance.get_function::<fn(i64, i64) -> (i64, i64)>("get_second_i64") }?;
    let res = wrap_result::<i64>(entrypoint(100000, 0x1234567890aabbcc))?;
    assert_eq!(res, 0x1234567890aabbcc);

    let entrypoint =
        unsafe { instance.get_function::<fn(i64, i64, i64, i64) -> (i64, i64)>("get_fourth_i64") }?;
    let res = wrap_result::<i64>(entrypoint(100000, 0, 0, 0x1234567890aabbcc))?;
    assert_eq!(res, 0x1234567890aabbcc);

    Ok(())
}
