use std::fs;
use std::path::Path;
use tiny_wasm::runtime::{TinyWasmError, TrapCode};
use tiny_wasm::*;

#[test]
fn test_call_indirect() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/call_indirect.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32, i32), i32>("calculate")?;
    let res = func.call(7, 0, 0).unwrap_err();
    assert!(matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::TableOutOfBounds));

    Ok(())
}
