use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_parameters() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/parameters.wasm")))?;
    let instance = get_module_instance(&module)?;

    let res = unsafe {
        instance.invoke_2::<fn(i32, i32) -> (i32, i64), _, _, _>("get_first_i32", 42, 24)?
    };
    assert_eq!(res, 42);

    let res = unsafe {
        instance.invoke_3::<fn(i32, i32, i32) -> (i32, i64), _, _, _, _>(
            "get_third_i32",
            1000,
            24,
            42,
        )?
    };
    assert_eq!(res, 42);

    let res = unsafe {
        instance.invoke_2::<fn(i64, i64) -> (i64, i64), i64, i64, i64>(
            "get_second_i64",
            100000,
            0x1234567890aabbcc,
        )?
    };
    assert_eq!(res, 0x1234567890aabbcc);

    let res = unsafe {
        instance.invoke_4::<fn(i64, i64, i64, i64) -> (i64, i64), _, _, _, _, _>(
            "get_fourth_i64",
            100000,
            0,
            0,
            0x1234567890aabbcc,
        )?
    };
    assert_eq!(res, 0x1234567890aabbcc);

    Ok(())
}
