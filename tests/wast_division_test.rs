// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
#[rustfmt::skip]
fn test_division_0() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/division_0.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("div_s")?;
    assert!(matches!(func.call(1, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    assert!(matches!(func.call(0, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    assert!(matches!(func.call(-2147483648, -1).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerOverflow));
    assert!(matches!(func.call(-2147483648, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    assert_eq!(func.call(1, 1)?, 1);
    assert_eq!(func.call(0, 1)?, 0);
    assert_eq!(func.call(0, -1)?, 0);
    assert_eq!(func.call(-1, -1)?, 1);
    assert_eq!(func.call(-2147483648, 2)?, -1073741824);
    assert_eq!(func.call(-2147483647, 1000)?, -2147483);
    assert_eq!(func.call(5, 2)?, 2);
    assert_eq!(func.call(-5, 2)?, -2);
    assert_eq!(func.call(5, -2)?, -2);
    assert_eq!(func.call(-5, -2)?, 2);
    assert_eq!(func.call(7, 3)?, 2);
    assert_eq!(func.call(-7, 3)?, -2);
    assert_eq!(func.call(7, -3)?, -2);
    assert_eq!(func.call(-7, -3)?, 2);
    assert_eq!(func.call(11, 5)?, 2);
    assert_eq!(func.call(17, 7)?, 2);

    let func = instance.get_function::<(i32, i32), i32>("div_u")?;
    assert!(matches!(func.call(1, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    assert!(matches!(func.call(0, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    assert_eq!(func.call(11, 5)?, 2);
    assert_eq!(func.call(17, 7)?, 2);
    Ok(())
}

#[test]
#[rustfmt::skip]
fn test_division_1() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/division_1.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i64, i64), i64>("div_s")?;
    assert!(matches!(func.call(1, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    assert!(matches!(func.call(0, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    assert!(matches!(func.call(-9223372036854775808, -1).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerOverflow));
    assert!(matches!(func.call(-9223372036854775808, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    assert_eq!(func.call(1, 1)?, 1);
    assert_eq!(func.call(0, 1)?, 0);
    assert_eq!(func.call(0, -1)?, 0);
    assert_eq!(func.call(-1, -1)?, 1);
    assert_eq!(func.call(-9223372036854775808, 2)?, -4611686018427387904);
    assert_eq!(func.call(-9223372036854775807, 1000)?, -9223372036854775);
    assert_eq!(func.call(5, 2)?, 2);
    assert_eq!(func.call(-5, 2)?, -2);
    assert_eq!(func.call(5, -2)?, -2);
    assert_eq!(func.call(-5, -2)?, 2);
    assert_eq!(func.call(7, 3)?, 2);
    assert_eq!(func.call(-7, 3)?, -2);
    assert_eq!(func.call(7, -3)?, -2);
    assert_eq!(func.call(-7, -3)?, 2);
    assert_eq!(func.call(11, 5)?, 2);
    assert_eq!(func.call(17, 7)?, 2);

    let func = instance.get_function::<(i64, i64), ()>("div_u")?;
    assert!(matches!(func.call(1, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    assert!(matches!(func.call(0, 0).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero));
    Ok(())
}
