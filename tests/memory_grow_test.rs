use std::fs;
use std::path::Path;
use tiny_wasm::assembler::aarch64::*;
use tiny_wasm::runtime::context::WASM_PAGE_SIZE;
use tiny_wasm::runtime::{TinyWasmError, TrapCode};
use tiny_wasm::*;

#[test]
fn test_memory_size() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("memory_size")?;
    assert_eq!(func.call()?, 1);

    let func = instance.get_function::<(), i32>("memory_size_bytes")?;
    assert_eq!(func.call()?, 0x10000);

    Ok(())
}

#[test]
fn test_memory_grow() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i32>("memory_grow")?;
    assert_eq!(func.call(3)?, 4);

    let func = instance.get_function::<(i32, i64), i64>("store_i64")?;
    assert_eq!(func.call(0, 1)?, 1);
    assert_eq!(func.call(768, 0x55aa55aa55aa55aa)?, 0x55aa55aa55aa55aa);

    // last valid
    assert_eq!(
        func.call(
            (4 * WASM_PAGE_SIZE - INT64_SIZE as u64) as i32,
            0x1122334455667788
        )?,
        0x1122334455667788
    );

    // first invalid
    let res = func.call(4 * WASM_PAGE_SIZE as i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // verify write operation
    let func = instance.get_function::<(i32,), i64>("load_i64")?;
    assert_eq!(
        func.call((4 * WASM_PAGE_SIZE - INT64_SIZE as u64) as i32)?,
        0x1122334455667788
    );

    Ok(())
}

#[test]
fn test_memory_loop() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("loop")?;
    assert_eq!(func.call()?, 0);

    Ok(())
}
