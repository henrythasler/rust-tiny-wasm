use gen_elf::{Arch, ObjectWriter, SymbolDesc};

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_objdump() {
    let base = Path::new("tests/assets");
    fs::create_dir_all(base.join("jit")).expect("Should be able to create dir");

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
            let wasm_module = loader::load_wasm_module(&file);
            let linked_module = compiler::compile(&wasm_module);

            let writer = ObjectWriter::new(Arch::Aarch64);            

            let mut output_path = base.join("jit").join(file.file_name().unwrap());
            output_path.set_extension("o");
            println!(
                "File: {}, Output: {}\n",
                &file.display(),
                output_path.display()
            );

            let bytes = bytemuck::cast_slice(linked_module.get_machinecode());

            let symbols = vec![
                SymbolDesc::global_func("_start", bytes),
                SymbolDesc::global_object("globals", &[0xaa, 0x55, 0xaa, 0x55]),
                SymbolDesc::global_tls("function_table", &[0x00; 32]),
            ];            

            writer.write_file(&output_path, &symbols, &[]).expect("objectfile should have been written");

            // let bytes = bytemuck::cast_slice(linked_module.get_machinecode());
            // fs::write(&output_path, bytes).expect("fs::write() should be able to write");
        }
    }
}
