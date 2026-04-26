use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_locals() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/locals.wasm"))?;
    let instance = get_module_instance(&module)?;

    let entrypoint = instance.get_function::<(i64,), i64>("store_i64")?;
    let res = entrypoint.call(0x1234567890aabbcci64)?;
    assert_eq!(res, 0x1234567890aabbcci64);

    let entrypoint = instance.get_function::<(), i64>("store_i64_const")?;
    let res = entrypoint.call()?;
    assert_eq!(res, 9223372036854775807i64);

    let entrypoint = instance.get_function::<(i32,), i32>("many_locals")?;
    let res = entrypoint.call(10000001i32)?;
    assert_eq!(res, 10000001i32);

    let entrypoint = instance.get_function::<(), i64>("tee_i64")?;
    let res = entrypoint.call()?;
    assert_eq!(res, 9223372036854775807i64);

    Ok(())
}
