// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_arithmetic_0() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/arithmetic_0.wasm"))?;
    let instance = get_module_instance(&module)?;
    
    let func = instance.get_function::<(i32, i32, ), i32>("add")?;
        assert_eq!(func.call(1, 1)?, 2);
        assert_eq!(func.call(1, 0)?, 1);
        assert_eq!(func.call(-1, -1)?, -2);
        assert_eq!(func.call(-1, 1)?, 0);
        assert_eq!(func.call(2147483647, 1)?, -2147483648);
        assert_eq!(func.call(-2147483648, -1)?, 2147483647);
        assert_eq!(func.call(-2147483648, -2147483648)?, 0);
        assert_eq!(func.call(1073741823, 1)?, 1073741824);
        
    let func = instance.get_function::<(i32, i32, ), i32>("sub")?;
        assert_eq!(func.call(1, 1)?, 0);
        assert_eq!(func.call(1, 0)?, 1);
        assert_eq!(func.call(-1, -1)?, 0);
        assert_eq!(func.call(2147483647, -1)?, -2147483648);
        assert_eq!(func.call(-2147483648, 1)?, 2147483647);
        assert_eq!(func.call(-2147483648, -2147483648)?, 0);
        assert_eq!(func.call(1073741823, -1)?, 1073741824);
        
    let func = instance.get_function::<(i32, i32, ), i32>("mul")?;
        assert_eq!(func.call(1, 1)?, 1);
        assert_eq!(func.call(1, 0)?, 0);
        assert_eq!(func.call(-1, -1)?, 1);
        assert_eq!(func.call(268435456, 4096)?, 0);
        assert_eq!(func.call(-2147483648, 0)?, 0);
        assert_eq!(func.call(-2147483648, -1)?, -2147483648);
        assert_eq!(func.call(2147483647, -1)?, -2147483647);
        assert_eq!(func.call(19088743, 1985229328)?, 898528368);
        assert_eq!(func.call(2147483647, 2147483647)?, 1);
        Ok(())
}

#[test]
fn test_arithmetic_1() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/arithmetic_1.wasm"))?;
    let instance = get_module_instance(&module)?;
    
    let func = instance.get_function::<(i64, i64, ), i64>("add")?;
        assert_eq!(func.call(1, 1)?, 2);
        assert_eq!(func.call(1, 0)?, 1);
        assert_eq!(func.call(-1, -1)?, -2);
        assert_eq!(func.call(-1, 1)?, 0);
        assert_eq!(func.call(9223372036854775807, 1)?, -9223372036854775808);
        assert_eq!(func.call(-9223372036854775808, -1)?, 9223372036854775807);
        assert_eq!(func.call(-9223372036854775808, -9223372036854775808)?, 0);
        assert_eq!(func.call(1073741823, 1)?, 1073741824);
        
    let func = instance.get_function::<(i64, i64, ), i64>("sub")?;
        assert_eq!(func.call(1, 1)?, 0);
        assert_eq!(func.call(1, 0)?, 1);
        assert_eq!(func.call(-1, -1)?, 0);
        assert_eq!(func.call(9223372036854775807, -1)?, -9223372036854775808);
        assert_eq!(func.call(-9223372036854775808, 1)?, 9223372036854775807);
        assert_eq!(func.call(-9223372036854775808, -9223372036854775808)?, 0);
        assert_eq!(func.call(1073741823, -1)?, 1073741824);
        
    let func = instance.get_function::<(i64, i64, ), i64>("mul")?;
        assert_eq!(func.call(1, 1)?, 1);
        assert_eq!(func.call(1, 0)?, 0);
        assert_eq!(func.call(-1, -1)?, 1);
        assert_eq!(func.call(1152921504606846976, 4096)?, 0);
        assert_eq!(func.call(-9223372036854775808, 0)?, 0);
        assert_eq!(func.call(-9223372036854775808, -1)?, -9223372036854775808);
        assert_eq!(func.call(9223372036854775807, -1)?, -9223372036854775807);
        assert_eq!(func.call(81985529216486895, -81985529216486896)?, 2465395958572223728);
        assert_eq!(func.call(9223372036854775807, 9223372036854775807)?, 1);
        Ok(())
}
