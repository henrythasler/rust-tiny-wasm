// use std::borrow::Borrow;

use tiny_wasm::loader::load_wasm_module;
use tiny_wasm::runtime::get_module_instance;

#[test]
fn test_get_name() {
    let _ = load_wasm_module(&String::from("tests/assets/empty-fn.wasm"));
}

#[test]
fn test_get_module_instance() {
    let jit_code: Vec<u32> = vec![0x0b000020, 0xd65f03c0];
    let instance = get_module_instance(&jit_code);
    let add = unsafe { instance.get_function::<fn(i32, i32) -> i32>() };
    assert_eq!(add(3, 4), 7);
    assert_eq!(add(-3, -4), -7);
}
