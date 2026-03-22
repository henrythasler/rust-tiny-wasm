use std::fs;
use std::path::Path;
use tiny_wasm::runtime::wrap_result;
use tiny_wasm::*;

#[test]
fn test_constants() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/constants.wasm")))?;
    let instance = get_module_instance(&module)?;

    let entrypoint = unsafe { instance.get_function::<fn() -> (i32, i64)>("get_42") }?;
    let res = wrap_result::<i32>(entrypoint())?;
    // let res = unsafe { instance.call_function::<(), i32>("get_42", ()) }?;
    assert_eq!(res, 42);

    let entrypoint = unsafe { instance.get_function::<fn() -> (i32, i64)>("get_minus_1") }?;
    let res = wrap_result::<i32>(entrypoint())?;
    // let res = unsafe { instance.call_function::<(), i32>("get_minus_1", ()) }?;
    assert_eq!(res, -1);

    let entrypoint = unsafe { instance.get_function::<fn() -> (i64, i64)>("get_large_num") }?;
    let res = wrap_result::<i64>(entrypoint())?;
    // let res = unsafe { instance.call_function::<(), i64>("get_large_num", ()) }?;
    assert_eq!(res, 0x1234567890aabbcc);

    let entrypoint = unsafe { instance.get_function::<fn() -> (i64, i64)>("get_i64_min") }?;
    let res = wrap_result::<i64>(entrypoint())?;
    // let res = unsafe { instance.call_function::<(), i64>("get_i64_min", ()) }?;
    assert_eq!(res, -9223372036854775808);

    Ok(())
}
