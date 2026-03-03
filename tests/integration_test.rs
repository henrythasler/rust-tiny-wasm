// use std::borrow::Borrow;

use tiny_wasm::loader::load_wasm_module;

#[test]
fn test_get_name() {
    let _ = load_wasm_module(&"tests/assets/empty-fn.wasm".to_string())
        .expect("Error parsing WebAssembly module");
    // let magic = module.magic().borrow();
    // assert_eq!(&magic[..], &[0, 1, 2, 3]);
}
