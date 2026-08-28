use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_memory() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/memory.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    Ok(())
}
