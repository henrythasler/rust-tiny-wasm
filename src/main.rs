use current_platform::{COMPILED_ON, CURRENT_PLATFORM};
use owo_colors::OwoColorize;
use std::env;

use crate::runtime::get_module_instance;

mod loader;
mod runtime;

fn main() -> Result<(), String> {
    println!("Compiled on '{}' for '{}'\n", COMPILED_ON, CURRENT_PLATFORM);
    let args: Vec<String> = env::args().collect();
    let file_path = &args[1];

    println!("Loading '{}'...", file_path.bright_blue());
    let wasm_module = loader::load_wasm_module(file_path);

    println!(
        "Found {} section(s)",
        wasm_module.sections.len().bright_green()
    );
    for section in &wasm_module.sections {
        match section {
            loader::Sections::Export(export_section) => {
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
            loader::Sections::Code(code_section) => {
                println!("  Section ID: {}", code_section.name().bright_blue());
                println!(
                    "  Number of Entries: {}",
                    code_section.entries.len().bright_green()
                );
                for entry in &code_section.entries {
                    println!(
                        "    - Locals: {} ({:#?})",
                        entry.get_locals().len().bright_green(),
                        entry.locals
                    );
                    println!(
                        "      Content ({:#?} Bytes): {}\n",
                        entry.get_code().len(),
                        entry.get_code().escape_ascii().bright_yellow()
                    )
                }
            } // _ => (),
        }
    }

    let jit_code: Vec<u32> = vec![0x0b000020, 0xd65f03c0];
    let instance = get_module_instance(&jit_code);
    let add = unsafe { instance.get_function::<fn(i32, i32) -> i32>() };
    println!("3 + 4 = {}", add(3, 4).bright_green());
    Ok(())
}
