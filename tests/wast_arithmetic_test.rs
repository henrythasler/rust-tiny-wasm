// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_arithmetic_0() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/arithmetic_0.wasm"))?;
    let instance = get_module_instance(&module)?;
    
    let func = instance.get_function::<(i32, i32, ), i32>("add")?;
    assert_eq!(func.call(1i32, 1i32)?, 2i32);
    assert_eq!(func.call(1i32, 0i32)?, 1i32);
    assert_eq!(func.call(-1i32, -1i32)?, -2i32);
    assert_eq!(func.call(-1i32, 1i32)?, 0i32);
    assert_eq!(func.call(2147483647i32, 1i32)?, -2147483648i32);
    assert_eq!(func.call(-2147483648i32, -1i32)?, 2147483647i32);
    assert_eq!(func.call(-2147483648i32, -2147483648i32)?, 0i32);
    assert_eq!(func.call(1073741823i32, 1i32)?, 1073741824i32);
    
    let func = instance.get_function::<(i32, i32, ), i32>("sub")?;
    assert_eq!(func.call(1i32, 1i32)?, 0i32);
    assert_eq!(func.call(1i32, 0i32)?, 1i32);
    assert_eq!(func.call(-1i32, -1i32)?, 0i32);
    assert_eq!(func.call(2147483647i32, -1i32)?, -2147483648i32);
    assert_eq!(func.call(-2147483648i32, 1i32)?, 2147483647i32);
    assert_eq!(func.call(-2147483648i32, -2147483648i32)?, 0i32);
    assert_eq!(func.call(1073741823i32, -1i32)?, 1073741824i32);
    
    let func = instance.get_function::<(i32, i32, ), i32>("mul")?;
    assert_eq!(func.call(1i32, 1i32)?, 1i32);
    assert_eq!(func.call(1i32, 0i32)?, 0i32);
    assert_eq!(func.call(-1i32, -1i32)?, 1i32);
    assert_eq!(func.call(268435456i32, 4096i32)?, 0i32);
    assert_eq!(func.call(-2147483648i32, 0i32)?, 0i32);
    assert_eq!(func.call(-2147483648i32, -1i32)?, -2147483648i32);
    assert_eq!(func.call(2147483647i32, -1i32)?, -2147483647i32);
    assert_eq!(func.call(19088743i32, 1985229328i32)?, 898528368i32);
    assert_eq!(func.call(2147483647i32, 2147483647i32)?, 1i32);
    Ok(())
}

#[test]
fn test_arithmetic_1() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/arithmetic_1.wasm"))?;
    let instance = get_module_instance(&module)?;
    
    let func = instance.get_function::<(i64, i64, ), i64>("add")?;
    assert_eq!(func.call(1i64, 1i64)?, 2i64);
    assert_eq!(func.call(1i64, 0i64)?, 1i64);
    assert_eq!(func.call(-1i64, -1i64)?, -2i64);
    assert_eq!(func.call(-1i64, 1i64)?, 0i64);
    assert_eq!(func.call(9223372036854775807i64, 1i64)?, -9223372036854775808i64);
    assert_eq!(func.call(-9223372036854775808i64, -1i64)?, 9223372036854775807i64);
    assert_eq!(func.call(-9223372036854775808i64, -9223372036854775808i64)?, 0i64);
    assert_eq!(func.call(1073741823i64, 1i64)?, 1073741824i64);
    
    let func = instance.get_function::<(i64, i64, ), i64>("sub")?;
    assert_eq!(func.call(1i64, 1i64)?, 0i64);
    assert_eq!(func.call(1i64, 0i64)?, 1i64);
    assert_eq!(func.call(-1i64, -1i64)?, 0i64);
    assert_eq!(func.call(9223372036854775807i64, -1i64)?, -9223372036854775808i64);
    assert_eq!(func.call(-9223372036854775808i64, 1i64)?, 9223372036854775807i64);
    assert_eq!(func.call(-9223372036854775808i64, -9223372036854775808i64)?, 0i64);
    assert_eq!(func.call(1073741823i64, -1i64)?, 1073741824i64);
    
    let func = instance.get_function::<(i64, i64, ), i64>("mul")?;
    assert_eq!(func.call(1i64, 1i64)?, 1i64);
    assert_eq!(func.call(1i64, 0i64)?, 0i64);
    assert_eq!(func.call(-1i64, -1i64)?, 1i64);
    assert_eq!(func.call(1152921504606846976i64, 4096i64)?, 0i64);
    assert_eq!(func.call(-9223372036854775808i64, 0i64)?, 0i64);
    assert_eq!(func.call(-9223372036854775808i64, -1i64)?, -9223372036854775808i64);
    assert_eq!(func.call(9223372036854775807i64, -1i64)?, -9223372036854775807i64);
    assert_eq!(func.call(81985529216486895i64, -81985529216486896i64)?, 2465395958572223728i64);
    assert_eq!(func.call(9223372036854775807i64, 9223372036854775807i64)?, 1i64);
    Ok(())
}
