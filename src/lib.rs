use owo_colors::OwoColorize;
use std::path::Path;

mod assembler;
pub mod compiler;
pub mod loader;
pub mod runtime;

pub fn dump_module_info(filename: &Path) {
    println!("Loading '{}'...", filename.display().bright_blue());
    let wasm_module = loader::load_wasm_module(filename);

    println!(
        "Found {} section(s)",
        wasm_module.sections().len().bright_green()
    );
    for section in wasm_module.sections() {
        match section {
            loader::Section::Export(export_section) => {
                println!("  Section ID: {}", export_section.name().bright_blue());
                println!(
                    "  Number of Exports: {}",
                    export_section.exports.len().bright_green()
                );

                for export in &export_section.exports {
                    println!(
                        "    - {} ({:#?}, {})",
                        export.name.bright_yellow(),
                        export.r#type.white(),
                        export.index.white()
                    );
                }
            }
            loader::Section::Code(code_section) => {
                println!("  Section ID: {}", code_section.name().bright_blue());
                println!(
                    "  Number of Entries: {}",
                    code_section.entries.len().bright_green()
                );
                for entry in &code_section.entries {
                    println!(
                        "    - Locals: {} ({:?})",
                        entry.get_locals().len().bright_green(),
                        entry.locals
                    );
                    println!(
                        "      Content ({:#?} Bytes): {:02X?}\n",
                        entry.get_code().len(),
                        entry.get_code().bright_yellow()
                    )
                }
            }
        }
    }
}

pub fn load_and_run(filename: &Path, function: &str) {
    let wasm_module = loader::load_wasm_module(filename);
    let linked_module = compiler::compile(&wasm_module);
    let instance = runtime::instantiate_module(&linked_module);
    let _start = unsafe { instance.get_function::<fn()>(function) };
    println!("{:X?}", linked_module.get_machinecode());
    _start();
}

pub fn get_module_instance(filename: &Path) -> runtime::Runtime {
    let wasm_module = loader::load_wasm_module(filename);
    let linked_module = compiler::compile(&wasm_module);
    runtime::instantiate_module(&linked_module)
}