use tiny_wasm::{add_i32, dump_module_info};

#[test]
fn test_dump_module_info() {
    dump_module_info("tests/assets/empty-fn.wasm");
}

#[test]
fn test_add_i32() {
    assert_eq!(add_i32(3, 4), 7);
    assert_eq!(add_i32(-3, -4), -7);
    assert_eq!(
        add_i32(i32::pow(2, 10), i32::pow(2, 10)),
        2 * i32::pow(2, 10)
    );
}
