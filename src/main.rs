use current_platform::{COMPILED_ON, CURRENT_PLATFORM};
use owo_colors::OwoColorize;
use std::env;

mod loader;

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
                    println!("    - {}", export.name.bright_yellow());
                }
            }
            loader::Sections::Code(code_section) => {
                println!("  Section ID: {}", code_section.name().bright_blue());
                println!(
                    "  Number of Entries: {}",
                    code_section.entries.len().bright_green()
                );
                for entry in &code_section.entries {
                    println!("    - Locals: {}", entry.get_locals().len().bright_green());
                    println!(
                        "    - Content ({:#?} Bytes): {}",
                        entry.get_code().len(),
                        entry.get_code().escape_ascii().bright_yellow()
                    )
                }
            }
            _ => (),
        }
    }
    Ok(())
}
