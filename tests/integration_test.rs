use tiny_wasm::names::get_name;

#[test]
fn test_get_name() {
    assert_eq!(get_name(), "world");
}