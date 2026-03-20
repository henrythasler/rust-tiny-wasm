use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_constants() -> Result<()> {
    assert_eq!(execute(Path::new("tests/assets/constants.wasm"), "get_42")?, 42);
    Ok(())
}
