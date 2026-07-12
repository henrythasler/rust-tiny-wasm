// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
#[rustfmt::skip]
fn test_call_0() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/call_0.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("type-i32")?;
    assert_eq!(func.call()?, 306);

    let func = instance.get_function::<(), i64>("type-i64")?;
    assert_eq!(func.call()?, 356);

    let func = instance.get_function::<(), i32>("type-first-i32")?;
    assert_eq!(func.call()?, 32);

    let func = instance.get_function::<(), i64>("type-first-i64")?;
    assert_eq!(func.call()?, 64);

    let func = instance.get_function::<(), i64>("type-second-i64")?;
    assert_eq!(func.call()?, 64);

    let func = instance.get_function::<(i64, i64), i64>("fac-acc")?;
    assert_eq!(func.call(0, 1)?, 1);
    assert_eq!(func.call(1, 1)?, 1);
    assert_eq!(func.call(5, 1)?, 120);
    assert_eq!(func.call(25, 1)?, 7034535277573963776);

    let func = instance.get_function::<(i64, ), i64>("fib")?;
    assert_eq!(func.call(0)?, 1);
    assert_eq!(func.call(1)?, 1);
    assert_eq!(func.call(2)?, 2);
    assert_eq!(func.call(5)?, 8);
    assert_eq!(func.call(20)?, 10946);

    let func = instance.get_function::<(i64, ), i32>("even")?;
    assert_eq!(func.call(0)?, 44);
    assert_eq!(func.call(1)?, 99);
    assert_eq!(func.call(100)?, 44);
    assert_eq!(func.call(77)?, 99);

    let func = instance.get_function::<(i64, ), i32>("odd")?;
    assert_eq!(func.call(0)?, 99);
    assert_eq!(func.call(1)?, 44);
    assert_eq!(func.call(200)?, 99);
    assert_eq!(func.call(77)?, 44);
    Ok(())
}
