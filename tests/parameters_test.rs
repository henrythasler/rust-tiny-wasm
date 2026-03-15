use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_constants() {
    let instance = get_module_instance(Path::new("tests/assets/empty-fn.wasm"));

    let _get_const_i32 = unsafe { instance.get_function::<fn() -> i32>("get_const_i32") };
    // assert_eq!(get_const_i32(), 42);
}
