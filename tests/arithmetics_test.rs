use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_parameters() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/arithmetics.wasm")))?;
    let instance = get_module_instance(&module)?;

    let add = instance.get_function::<(i32, i32), i32>("add")?;
    assert_eq!(add.call(0, 0)?, 0);
    assert_eq!(add.call(1, 0)?, 1);
    assert_eq!(add.call(0, 1)?, 1);
    assert_eq!(add.call(1, 1)?, 2);
    assert_eq!(add.call(-1, -1)?, -2);
    assert_eq!(add.call(-1, 1)?, 0);
    assert_eq!(add.call(1, -1)?, 0);
    assert_eq!(add.call(i32::MAX, 1)?, i32::MIN);
    assert_eq!(add.call(i32::MIN, -1)?, i32::MAX);
    assert_eq!(add.call(i32::MAX, -i32::MAX)?, 0);
    assert_eq!(add.call(i32::MIN + 1, -(i32::MIN + 1))?, 0);
    assert_eq!(add.call(0x3fffffff, 1)?, 0x40000000);

    let sub = instance.get_function::<(i32, i32), i32>("sub")?;
    assert_eq!(sub.call(66, 24)?, 66 - 24);

    let mul = instance.get_function::<(i32, i32), i32>("mul")?;
    assert_eq!(mul.call(66, 24)?, 66 * 24);

    let square = instance.get_function::<(i32,), i32>("square")?;
    assert_eq!(square.call(6624)?, 6624 * 6624);

    Ok(())
}
