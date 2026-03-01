use current_platform::{COMPILED_ON, CURRENT_PLATFORM};

mod names;

fn main() {
    let name: &str = names::get_name();
    println!("Compiled on '{}' for '{}'", COMPILED_ON, CURRENT_PLATFORM);
    println!("Hello, {}!", name);
}
