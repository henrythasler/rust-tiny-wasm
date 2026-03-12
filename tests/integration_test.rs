use std::fs;
use std::path::{Path, PathBuf};
use tiny_wasm::*;

#[test]
fn test_dump_module_info() {
    // just making sure it does not panic
    dump_module_info("tests/assets/empty-fn.wasm");
}

#[test]
fn test_objdump() {
    let base = Path::new("tests/assets");
    let file = "skeleton";
    
    let input_path = base.join(format!("{file}.wasm"));
    let wasm_module = loader::load_wasm_module(input_path.to_str().unwrap());
    let linked_module = compiler::compile(&wasm_module);

    let output_path = base.join("jit").join(format!("{file}.o")); 
    if let Some(parent) = output_path.parent() {
        fs::create_dir_all(parent).expect("Should be able to create dir");
    }    

    let bytes = bytemuck::cast_slice(linked_module.get_machinecode());
    fs::write(output_path, bytes).expect("fs::write() should be able to write");
}
