use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_wasmparser() {
    let module = loader::wasmparser(Path::new("tests/assets/constants.wasm")).unwrap();
}
