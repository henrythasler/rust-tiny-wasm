use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_constants() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/empty-fn.wasm")))?;
    print_module(&module)
}
