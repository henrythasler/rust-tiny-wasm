// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn block.wast.0() {
    let module = fs::read(Path::new(Path::new("tests/assets/wast/block.wast.0")))?;
    let instance = get_module_instance(&module)?;

}
