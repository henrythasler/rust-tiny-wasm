use clap::Parser;
use current_platform::{COMPILED_ON, CURRENT_PLATFORM};
use owo_colors::OwoColorize;

use crate::runtime::get_module_instance;

mod loader;
mod runtime;

/// Simple program to greet a person
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// Path to wasm-module
    #[arg(short, long)]
    module: String,

    /// First addend
    #[arg(short, long)]
    first: i32,

    /// Second addend
    #[arg(short, long)]
    second: i32,
}

fn main() -> Result<(), String> {
    println!("Compiled on '{}' for '{}'\n", COMPILED_ON, CURRENT_PLATFORM);
    let args = Args::parse();

    println!("Loading '{}'...", args.module.bright_blue());
    let wasm_module = loader::load_wasm_module(&args.module);

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
    println!(
        "{} + {} = {}",
        args.first,
        args.second,
        add(args.first, args.second).bright_green()
    );
    Ok(())
}
