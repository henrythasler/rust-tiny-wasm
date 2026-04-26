use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_parameters() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/arithmetics.wasm"))?;
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

    let add64 = instance.get_function::<(i64, i64), i64>("add64")?;
    assert_eq!(add64.call(0, 0)?, 0);
    assert_eq!(add64.call(1, 0)?, 1);
    assert_eq!(add64.call(0, 1)?, 1);
    assert_eq!(add64.call(1, 1)?, 2);
    assert_eq!(add64.call(-1, -1)?, -2);
    assert_eq!(add64.call(-1, 1)?, 0);
    assert_eq!(add64.call(1, -1)?, 0);
    assert_eq!(add64.call(i64::MAX, 1)?, i64::MIN);
    assert_eq!(add64.call(i64::MIN, -1)?, i64::MAX);
    assert_eq!(add64.call(i64::MAX, -i64::MAX)?, 0);
    assert_eq!(add64.call(i64::MIN + 1, -(i64::MIN + 1))?, 0);
    assert_eq!(add64.call(0x3fffffffffffffff, 1)?, 0x4000000000000000);

    let sub = instance.get_function::<(i32, i32), i32>("sub")?;
    assert_eq!(sub.call(0, 0)?, 0);
    assert_eq!(sub.call(1, 0)?, 1);
    assert_eq!(sub.call(0, 1)?, -1);
    assert_eq!(sub.call(0, -10)?, 10);
    assert_eq!(sub.call(1, 1)?, 0);
    assert_eq!(sub.call(-1, -1)?, 0);
    assert_eq!(sub.call(-1, 1)?, -2);
    assert_eq!(sub.call(1, -1)?, 2);
    assert_eq!(sub.call(i32::MAX, -1)?, i32::MIN);
    assert_eq!(sub.call(i32::MIN, 1)?, i32::MAX);
    assert_eq!(sub.call(i32::MIN, i32::MIN)?, 0);
    assert_eq!(sub.call(0x3fffffff, -1)?, 0x40000000);

    let sub64 = instance.get_function::<(i64, i64), i64>("sub64")?;
    assert_eq!(sub64.call(0, 0)?, 0);
    assert_eq!(sub64.call(1, 0)?, 1);
    assert_eq!(sub64.call(0, 1)?, -1);
    assert_eq!(sub64.call(0, -10)?, 10);
    assert_eq!(sub64.call(1, 1)?, 0);
    assert_eq!(sub64.call(-1, -1)?, 0);
    assert_eq!(sub64.call(-1, 1)?, -2);
    assert_eq!(sub64.call(1, -1)?, 2);
    assert_eq!(sub64.call(i64::MAX, -1)?, i64::MIN);
    assert_eq!(sub64.call(i64::MIN, 1)?, i64::MAX);
    assert_eq!(sub64.call(i64::MIN, i64::MIN)?, 0);
    assert_eq!(sub64.call(0x3fffffffffffffff, -1)?, 0x4000000000000000);

    let mul = instance.get_function::<(i32, i32), i32>("mul")?;
    assert_eq!(mul.call(0, 0)?, 0);
    assert_eq!(mul.call(1, 0)?, 0);
    assert_eq!(mul.call(0, 1)?, 0);
    assert_eq!(mul.call(1, 1)?, 1);
    assert_eq!(mul.call(-1, -1)?, 1);
    assert_eq!(mul.call(-1, 1)?, -1);
    assert_eq!(mul.call(1, -1)?, -1);

    assert_eq!(mul.call(0x10000000, 4096)?, 0);
    assert_eq!(mul.call(i32::MIN, 0)?, 0);
    assert_eq!(mul.call(i32::MIN, -1)?, i32::MIN);
    assert_eq!(mul.call(i32::MAX, -1)?, i32::MIN + 1);
    assert_eq!(mul.call(0x01234567, 0x76543210)?, 0x358e7470);
    assert_eq!(mul.call(i32::MAX, i32::MAX)?, 1);

    let mul64 = instance.get_function::<(i64, i64), i64>("mul64")?;
    assert_eq!(mul64.call(0, 0)?, 0);
    assert_eq!(mul64.call(1, 0)?, 0);
    assert_eq!(mul64.call(0, 1)?, 0);
    assert_eq!(mul64.call(1, 1)?, 1);
    assert_eq!(mul64.call(-1, -1)?, 1);
    assert_eq!(mul64.call(-1, 1)?, -1);
    assert_eq!(mul64.call(1, -1)?, -1);

    assert_eq!(mul64.call(0x1000000000000000, 4096)?, 0);
    assert_eq!(mul64.call(i64::MIN, 0)?, 0);
    assert_eq!(mul64.call(i64::MIN, -1)?, i64::MIN);
    assert_eq!(mul64.call(i64::MAX, -1)?, i64::MIN + 1);
    assert_eq!(mul64.call(0x0123456789abcdef, 0x10)?, 0x123456789abcdef0);
    assert_eq!(mul64.call(i64::MAX, i64::MAX)?, 1);

    let square = instance.get_function::<(i32,), i32>("square")?;
    assert_eq!(square.call(6624)?, 6624 * 6624);

    let square64 = instance.get_function::<(i64,), i64>("square64")?;
    assert_eq!(square64.call(66240000)?, 66240000 * 66240000);

    Ok(())
}
