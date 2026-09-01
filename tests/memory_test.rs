use std::fs;
use std::path::Path;
use tiny_wasm::runtime::context::WASM_PAGE_SIZE;
use tiny_wasm::runtime::{TinyWasmError, TrapCode};
use tiny_wasm::*;

#[test]
fn test_memory() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i32>("load_i32")?;
    assert_eq!(func.call(0)?, 0);
    assert_eq!(func.call(200)?, 0);
    assert_eq!(func.call(768)?, 0x33323130);
    assert_eq!(func.call(768 + 4)?, 0x37363534);
    assert_eq!(func.call(768 + 16)?, 0);

    // last valid 
    assert_eq!(func.call(WASM_PAGE_SIZE as i32 - 4)?, 0);
    let res = func.call(WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}
