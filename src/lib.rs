use owo_colors::OwoColorize;

pub mod loader;
pub mod runtime;

pub fn dump_module_info(filename: &str) {
    println!("Loading '{}'...", filename.bright_blue());
    let wasm_module = loader::load_wasm_module(filename);

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
                        "    - Locals: {} ({:?})",
                        entry.get_locals().len().bright_green(),
                        entry.locals
                    );
                    println!(
                        "      Content ({:#?} Bytes): {}\n",
                        entry.get_code().len(),
                        entry.get_code().escape_ascii().bright_yellow()
                    )
                }
            }
        }
    }
}

/// Instantiates a simple runtime and executes JIT-code to add two numbers (i32)
///
/// Uses two ARM64 instructions (`add` and `ret`).
///
/// ```
/// let result = tiny_wasm::add_i32(2, 3);
/// assert_eq!(result, 5);
/// ```
pub fn add_i32(first: i32, second: i32) -> i32 {
    let jit_code: Vec<u32> = vec![0x0b000020, 0xd65f03c0];
    let instance = runtime::get_jit_instance(&jit_code);
    let add = unsafe { instance.get_function::<fn(i32, i32) -> i32>() };
    add(first, second)
}
