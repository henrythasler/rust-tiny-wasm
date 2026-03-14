use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_objdump() {
    let base = Path::new("tests/assets");
    let file = "skeleton";

    let output_path = base.join("jit").join(format!("{file}.o"));
    if let Some(parent) = output_path.parent() {
        fs::create_dir_all(parent).expect("Should be able to create dir");
    }

    let blocked = ["invalid", "draft"];

    for entry in fs::read_dir(base).expect("Should be able to read the folder content") {
        let entry = entry.unwrap();
        let file = entry.path();

        // Skip if not a .txt file
        if file.extension().and_then(|e| e.to_str()) != Some("wasm") {
            continue;
        }

        // Skip if filename contains any blocked substring
        if let Some(file_name) = file.file_name().and_then(|f| f.to_str()) {
            if blocked.iter().any(|sub| file_name.contains(sub)) {
                println!("Skipping blocked file: {}", file_name);
                continue;
            }
        }

        if file.extension().and_then(|ext| ext.to_str()) == Some("wasm") {
            println!("File: {}\n", &file.display());
            let wasm_module = loader::load_wasm_module(&file);
            let linked_module = compiler::compile(&wasm_module);

            let bytes = bytemuck::cast_slice(linked_module.get_machinecode());
            fs::write(&output_path, bytes).expect("fs::write() should be able to write");
        }
    }
}
