use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_dump_module_info() {
    // just making sure it does not panic
    dump_module_info(Path::new("tests/assets/empty-fn.wasm"));
}
