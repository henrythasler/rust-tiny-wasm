use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_memory_extended() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory_extended.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("mem_bytes")?;
    assert_eq!(func.call()?, 0x10000);

    let func = instance.get_function::<(i32,), i32>("p32")?;
    assert_eq!(func.call(0)? as u32, 0x9E3779B9);

    let func = instance.get_function::<(i32,), i64>("p64")?;
    assert_eq!(func.call(0)? as u64, 0x9E3779B97F4A7C15);

    let func = instance.get_function::<(), i32>("memtest")?;
    assert_eq!(func.call()?, 0);

    Ok(())
}
