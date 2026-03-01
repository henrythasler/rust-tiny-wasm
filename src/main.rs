use current_platform::{COMPILED_ON, CURRENT_PLATFORM};
use std::env;

mod loader;

fn main() {
    println!("Compiled on '{}' for '{}'", COMPILED_ON, CURRENT_PLATFORM);
    let args: Vec<String> = env::args().collect();
    let file_path = &args[1];

    print!("Loading '{}'... ", file_path);
    let content = loader::load_wasm_module(file_path);
    println!("{} Bytes OK", content.len());

    // print file content as hex bytes
    print!("Content (hex): ");
    for byte in content {
        print!("{:02x} ", byte);
    }
    println!();
}
