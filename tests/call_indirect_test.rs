use std::fs;
use std::path::Path;
use tiny_wasm::runtime::{TinyWasmError, TrapCode};
use tiny_wasm::*;

#[test]
fn test_call_indirect() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/call_indirect.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32, i32), i32>("calculate")?;

    // call invalid table index
    let res = func.call(7, 0, 0).unwrap_err();
    assert!(matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::TableOutOfBounds));

    let res = func.call(0x10000000, 0, 0).unwrap_err();
    assert!(matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::TableOutOfBounds));

    let res = func.call(-1, 0, 0).unwrap_err();
    assert!(matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::TableOutOfBounds));

    // call uninitialized table entry
    let res = func.call(0, 0, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::IndirectCallToNull)
    );

    // wrong function type; calling square() which takes 1 parameter instead of the expected 2 for calculate()
    let res = func.call(4, 0, 0).unwrap_err();
    assert!(matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::BadSignature));

    // index 2 is the "add" function, which takes 2 parameters and returns their sum
    assert_eq!(func.call(2, 13, 24)?, 13 + 24);

    // index 3 is the "multiply" function, which takes 2 parameters and returns their product
    assert_eq!(func.call(3, 13, 24)?, 13 * 24);

    Ok(())
}
