use std::fs;
use std::path::Path;
use tiny_wasm::runtime::wrap_result;
use tiny_wasm::*;

#[test]
fn test_locals() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/locals.wasm")))?;
    let instance = get_module_instance(&module)?;

    let entrypoint = unsafe { instance.get_function::<fn(i64) -> (i64, i64)>("store_i64") }?;
    let res = wrap_result::<i64>(entrypoint(0x1234567890aabbcci64))?;
    assert_eq!(res, 0x1234567890aabbcci64);

    let entrypoint = unsafe { instance.get_function::<fn() -> (i64, i64)>("store_i64_const") }?;
    let res = wrap_result::<i64>(entrypoint())?;
    assert_eq!(res, 9223372036854775807i64);

    let entrypoint = unsafe { instance.get_function::<fn(i32) -> (i32, i64)>("many_locals") }?;
    let res = wrap_result::<i32>(entrypoint(10000001i32))?;
    assert_eq!(res, 10000001i32);

    Ok(())
}
