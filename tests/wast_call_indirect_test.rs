// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
#[rustfmt::skip]
fn test_call_indirect_0() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/call_indirect_0.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, ), i32>("callt")?;
    assert_eq!(func.call(0)?, 1);
    assert_eq!(func.call(1)?, 2);
    assert_eq!(func.call(2)?, 3);
    assert_eq!(func.call(5)?, 1);
    assert_eq!(func.call(6)?, 3);
    assert!(matches!(func.call(7).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::TableOutOfBounds));
    assert!(matches!(func.call(100).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::TableOutOfBounds));
    assert!(matches!(func.call(-1).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::TableOutOfBounds));

    let func = instance.get_function::<(i32, ), i32>("callu")?;
    assert_eq!(func.call(3)?, 4);
    assert_eq!(func.call(4)?, 5);
    assert!(matches!(func.call(7).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::TableOutOfBounds));
    assert!(matches!(func.call(100).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::TableOutOfBounds));
    assert!(matches!(func.call(-1).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::TableOutOfBounds));
    Ok(())
}

#[test]
#[rustfmt::skip]
fn test_call_indirect_1() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/call_indirect_1.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, ), i32>("callt")?;
    assert_eq!(func.call(0)?, 1);
    assert_eq!(func.call(1)?, 2);
    Ok(())
}

#[test]
#[rustfmt::skip]
fn test_call_indirect_2() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/call_indirect_2.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("call_indirect")?;
    assert_eq!(func.call(0, 10)?, 11);
    assert!(matches!(func.call(1, 10).unwrap_err(), runtime::TinyWasmError::Trap(trap_code) if trap_code==runtime::TrapCode::BadSignature));
    Ok(())
}
