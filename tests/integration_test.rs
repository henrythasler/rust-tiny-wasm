use tiny_wasm::dump_module_info;

#[test]
fn test_dump_module_info() {
    // just making sure it does not panic
    dump_module_info("tests/assets/empty-fn.wasm");
}
