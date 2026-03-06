// use std::borrow::Borrow;

use tiny_wasm::loader::load_wasm_module;

#[test]
fn test_get_name() {
    let _ = load_wasm_module(&String::from("tests/assets/empty-fn.wasm"));
}
