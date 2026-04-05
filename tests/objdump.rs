use object::write::{Object, Symbol, SymbolSection};
use object::{
    Architecture, BinaryFormat, Endianness, SectionKind, SymbolFlags, SymbolKind, SymbolScope,
};

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_objdump() {
    let base = Path::new("tests/assets");
    fs::create_dir_all(base.join("jit")).expect("Should be able to create dir");

    let blocked = ["invalid", "draft", "dummy"];

    for entry in fs::read_dir(base).expect("Should be able to read the folder content") {
        let entry = entry.unwrap();
        let file = entry.path();

        // Skip if not a .wasm file
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
            println!("dumping {:?}", &file);
            let wasm_module = fs::read(Path::new(&file)).unwrap();
            let linked_module = compiler::compile(&wasm_module).unwrap();

            let mut object =
                Object::new(BinaryFormat::Elf, Architecture::Aarch64, Endianness::Little);

            let text_section = object.add_section(
                vec![],            // segment
                b".text".to_vec(), // section name
                SectionKind::Text, // section kind
            );

            let bytes: &[u8] = bytemuck::cast_slice(&linked_module.machinecode);
            object.set_section_data(text_section, bytes, 16); // 16-byte alignment            

            // Add a symbol for the function
            for function in &linked_module.functions {
                object.add_symbol(Symbol {
                    name: function.name.clone().into_bytes(),
                    value: (function.offset * assembler::aarch64::INSTRUCTION_SIZE) as u64,
                    size: (function.length * assembler::aarch64::INSTRUCTION_SIZE) as u64,
                    kind: SymbolKind::Text,
                    scope: SymbolScope::Compilation,
                    weak: false,
                    section: SymbolSection::Section(text_section),
                    flags: SymbolFlags::None,
                });
            }

            let mut output_path = base.join("jit").join(file.file_name().unwrap());
            output_path.set_extension("o");
            println!(
                "File: {}, Output: {}\n",
                &file.display(),
                output_path.display()
            );
            fs::write(&output_path, object.write().unwrap())
                .expect("fs::write() should be able to write");
        }
    }
}
