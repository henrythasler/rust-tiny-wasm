use std::fs;
use std::path::Path;
use tiny_wasm::assembler::aarch64::*;
use tiny_wasm::runtime::context::WASM_PAGE_SIZE;
use tiny_wasm::runtime::{TinyWasmError, TrapCode};
use tiny_wasm::*;

#[test]
fn test_memory_load_i64() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i64>("load_i64")?;
    assert_eq!(func.call(0)?, 0);
    assert_eq!(func.call(200)?, 0);
    assert_eq!(func.call(768)?, 0x3736353433323130);
    assert_eq!(func.call(768 + 8)?, 0x4645444342413938);
    assert_eq!(func.call(768 + 16)?, 0);

    // last valid
    assert_eq!(func.call((WASM_PAGE_SIZE - INT64_SIZE as u64) as i32)?, 0);

    // first invalid
    let res = func.call(WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // way out of bounds
    let res = func.call(10 * WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}

#[test]
fn test_memory_load_i32() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i32>("load_i32")?;
    assert_eq!(func.call(0)?, 0);
    assert_eq!(func.call(200)?, 0);
    assert_eq!(func.call(768)?, 0x33323130);
    assert_eq!(func.call(768 + 4)?, 0x37363534);
    assert_eq!(func.call(768 + 12)?, 0x46454443);
    assert_eq!(func.call(768 + 16)?, 0);

    // last valid
    assert_eq!(func.call((WASM_PAGE_SIZE - INT32_SIZE as u64) as i32)?, 0);

    // first invalid
    let res = func.call(WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // way out of bounds
    let res = func.call(10 * WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}

#[test]
fn test_memory_load_u16() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i32>("load_i32_16u")?;
    assert_eq!(func.call(0)?, 0);
    assert_eq!(func.call(768)?, 0x3130);
    assert_eq!(func.call(768 + 2)?, 0x3332);
    assert_eq!(func.call(768 + 16)?, 0);

    // last valid
    assert_eq!(func.call((WASM_PAGE_SIZE - INT16_SIZE as u64) as i32)?, 0);

    // first invalid
    let res = func.call(WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // way out of bounds
    let res = func.call(10 * WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}

#[test]
fn test_memory_load_i16() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i32>("load_i32_16s")?;
    assert_eq!(func.call(0)?, 0);
    assert_eq!(func.call(766)?, -768);
    assert_eq!(func.call(768)?, 0x3130);

    Ok(())
}

#[test]
fn test_memory_load_u8() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i32>("load_i32_8u")?;
    assert_eq!(func.call(0)?, 0);
    assert_eq!(func.call(766)?, 0);
    assert_eq!(func.call(767)?, 0xfd);
    assert_eq!(func.call(768)?, 0x30);

    // last valid
    assert_eq!(func.call((WASM_PAGE_SIZE - INT8_SIZE as u64) as i32)?, 0);

    // first invalid
    let res = func.call(WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // way out of bounds
    let res = func.call(10 * WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}

#[test]
fn test_memory_load_i8() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i32>("load_i32_8s")?;
    assert_eq!(func.call(0)?, 0);
    assert_eq!(func.call(766)?, 0);
    assert_eq!(func.call(767)?, -3);
    assert_eq!(func.call(768)?, 0x30);

    Ok(())
}

#[test]
fn test_memory_load_u8_offset() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32,), i32>("load_i32_8u_offset")?;
    assert_eq!(func.call(0)?, 0x30);
    assert_eq!(func.call(1)?, 0x31);

    // last valid
    assert_eq!(
        func.call((WASM_PAGE_SIZE - INT8_SIZE as u64 - 768) as i32)?,
        0
    );

    // first invalid
    let res = func.call(WASM_PAGE_SIZE as i32 - 768).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // way out of bounds
    let res = func.call(10 * WASM_PAGE_SIZE as i32).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // offset is u32 so negative offset should be treated as large positive offset
    let res = func.call(-1).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}

#[test]
fn test_memory_store_i64() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i64), i64>("store_i64")?;
    assert_eq!(func.call(0, 1)?, 1);
    assert_eq!(func.call(768, 0x55aa55aa55aa55aa)?, 0x55aa55aa55aa55aa);

    // last valid
    assert_eq!(
        func.call(
            (WASM_PAGE_SIZE - INT64_SIZE as u64) as i32,
            0x1122334455667788
        )?,
        0x1122334455667788
    );

    // first invalid
    let res = func.call(WASM_PAGE_SIZE as i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // way out of bounds
    let res = func.call(10 * WASM_PAGE_SIZE as i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}

#[test]
fn test_memory_store_i32() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("store_i32")?;
    assert_eq!(func.call(0, 1)?, 1);
    assert_eq!(func.call(768, 0x55aa55aa)?, 0x55aa55aa);

    // last valid
    assert_eq!(
        func.call((WASM_PAGE_SIZE - INT32_SIZE as u64) as i32, 0x11223344)?,
        0x11223344
    );

    // first invalid
    let res = func.call(WASM_PAGE_SIZE as i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // way out of bounds
    let res = func.call(10 * WASM_PAGE_SIZE as i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}

#[test]
fn test_memory_store_u16() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("store_i32_16u")?;
    assert_eq!(func.call(0, 1)?, 1);
    assert_eq!(func.call(768, 0x55aa)?, 0x55aa);

    // last valid
    assert_eq!(
        func.call((WASM_PAGE_SIZE - INT16_SIZE as u64) as i32, 0x1122)?,
        0x1122
    );

    // first invalid
    let res = func.call(WASM_PAGE_SIZE as i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // way out of bounds
    let res = func.call(10 * WASM_PAGE_SIZE as i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}

#[test]
fn test_memory_store_u8() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("store_i32_8u")?;
    assert_eq!(func.call(0, 1)?, 1);
    assert_eq!(func.call(768, 0x55)?, 0x55);

    // last valid
    assert_eq!(
        func.call((WASM_PAGE_SIZE - INT8_SIZE as u64) as i32, 0x11)?,
        0x11
    );

    // first invalid
    let res = func.call(WASM_PAGE_SIZE as i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    // way out of bounds
    let res = func.call(10 * WASM_PAGE_SIZE as i32, 0).unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::MemoryOutOfBounds)
    );

    Ok(())
}

#[test]
fn test_memory_size() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("memory_size")?;
    assert_eq!(func.call()?, 1);

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
