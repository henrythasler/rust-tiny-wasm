use current_platform::{COMPILED_ON, CURRENT_PLATFORM};
use owo_colors::OwoColorize;
use std::env;

mod loader;

fn main() -> Result<(), String> {
    println!("Compiled on '{}' for '{}'", COMPILED_ON, CURRENT_PLATFORM);
    let args: Vec<String> = env::args().collect();
    let file_path = &args[1];

    print!("Loading '{}'... ", file_path);
    let module = loader::load_wasm_module(file_path).expect("Error parsing WebAssembly module");
    println!("OK");
    println!();

    println!(
        "  Magic Number: {} ({} Bytes)",
        module.magic().escape_ascii(),
        module.magic().len()
    );
    println!("  Version: {}", module.version());
    println!();

    for section in module.sections().iter() {
        println!("  Section ID: {:#?}", section.id().bright_blue());
        println!("  Size: {} Bytes", section.content_raw().len().bright_green());
        println!("  Content: {}", section.content_raw().escape_ascii().white());
        println!();
    }
    Ok(())
}
