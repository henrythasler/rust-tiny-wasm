use owo_colors::OwoColorize;

mod assembler;
pub mod loader;
pub mod module;
pub mod runtime;

pub fn dump_module_info(filename: &str) {
    println!("Loading '{}'...", filename.bright_blue());
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
    let jit_code: Vec<u32> = assembler::get_add();
    let instance = runtime::get_jit_instance(&jit_code);
    let add = unsafe { instance.get_function::<fn(i32, i32) -> i32>("") };
    add(first, second)
}

pub fn asm_add_i32(first: i32, second: i32) -> i32 {
    let jit_code = assembler::assemble_add();
    let instance = runtime::get_jit_instance(&jit_code);
    let add = unsafe { instance.get_function::<fn(i32, i32) -> i32>("") };
    add(first, second)
}

pub fn load_and_run(filename: &str, export_function: &str) {
    let wasm_module = loader::load_wasm_module(filename);
    let linked_module = module::compile(&wasm_module);
    let instance = runtime::instantiate_module(&linked_module);
    let _start = unsafe { instance.get_function::<fn()>(export_function) };
    _start();
}
