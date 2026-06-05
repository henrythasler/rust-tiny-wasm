use std::{fs, path::Path};
use tiny_wasm::runtime::{TinyWasmError, TrapCode};
use tiny_wasm::*;

#[test]
fn test_division() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/division.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("div_s32")?;
    assert_eq!(func.call(1, 1)?, 1);
    assert_eq!(func.call(0, 1)?, 0);
    assert_eq!(func.call(0, -1)?, 0);
    assert_eq!(func.call(-1, -1)?, 1);
    assert_eq!(func.call(-2147483648i32, 2)?, -1073741824i32);
    assert_eq!(func.call(-2147483647i32, 1000)?, -2147483i32);
    assert_eq!(func.call(5, 2)?, 2);
    assert_eq!(func.call(-5, 2)?, -2);
    assert_eq!(func.call(5, -2)?, -2);
    assert_eq!(func.call(-5, -2)?, 2);
    assert_eq!(func.call(32, 8)?, 4);

    let res = func.call(1, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::IntegerDivisionByZero)
    );

    let res = func.call(0, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::IntegerDivisionByZero)
    );

    let res = func.call(-2147483648i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::IntegerDivisionByZero)
    );

    let res = func.call(-2147483648i32, -1).unwrap_err();
    assert!(matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::IntegerOverflow));

    let func = instance.get_function::<(), ()>("div_by_zero")?;
    assert!(
        matches!(func.call().unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::IntegerDivisionByZero)
    );

    Ok(())
}
