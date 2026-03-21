use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_constants() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/constants.wasm")))?;
    let instance = get_module_instance(&module)?;

    let get_42 = unsafe { instance.get_function::<fn() -> i32>("get_42") }?;
    let get_minus_1 = unsafe { instance.get_function::<fn() -> i32>("get_minus_1") }?;
    let get_large_num = unsafe { instance.get_function::<fn() -> i64>("get_large_num") }?;
    let get_i64_min = unsafe { instance.get_function::<fn() -> i64>("get_i64_min") }?;

    assert_eq!(get_42(), 42);
    assert_eq!(get_minus_1(), -1);
    assert_eq!(get_large_num(), 0x1234567890aabbcc);
    assert_eq!(get_i64_min(), -9223372036854775808);
    Ok(())
}
