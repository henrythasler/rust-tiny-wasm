use tiny_wasm::loader::load_wasm_module;

#[test]
fn test_get_name() {
    load_wasm_module(&"tests/assets/empty-fn.wat".to_string());
}
