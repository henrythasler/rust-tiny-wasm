use clap::Parser;
use owo_colors::OwoColorize;
use std::fs;
use std::path::Path;
use tiny_wasm::*;

/// Simple program to greet a person
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
pub struct Args {
    /// Path to wasm-module
    #[arg(short, long)]
    module: String,

    /// Function to call
    #[arg(short, long, default_value_t = String::from("_start"))]
    function: String,

    /// Trailing arguments
    #[arg(trailing_var_arg = true)]
    args: Vec<String>,
}

/// Command line interface of the TinyWasm runtime. It performs the following steps:
///
/// 1. Parses command line arguments to get the path to the WebAssembly module and the function to call.
/// 2. Loads the WebAssembly module from the specified file and prints its content.
/// 3. Instantiates the module using the `get_module_instance` function.
/// 4. Retrieves the specified function from the instantiated module and calls it, printing the return value.
/// 5. Handles any errors that may occur during the process and prints appropriate error messages.
///
/// # Errors
/// This function will return an error if the module cannot be loaded, compiled, instantiated, or if the specified function cannot be found or executed.
///
/// # Example
///
/// ```bash
/// qemu-aarch64 -L /usr/aarch64-linux-gnu/ target/aarch64-unknown-linux-gnu/debug/tiny-wasm -m path/to/module.wasm -f function_name arg1 arg2 arg3
/// ```
fn main() -> Result<()> {
    // parse command line arguments
    let args = Args::parse();
    let file_path = Path::new(&args.module);
    let func_name = &args.function;

    // load, compile and instantiate WebAssembly module
    println!("Loading '{}'", file_path.display().bright_blue());
    let module = fs::read(file_path)?;
    print_module(&module)?;
    let instance = get_module_instance(&module)?;

    // get the function pointer and call the function
    let func_arg = args
        .args
        .first()
        .map(|s| s.parse().unwrap_or(0))
        .unwrap_or(0);

    println!(
        "Calling {}({})",
        func_name.white().bold(),
        func_arg.bright_yellow()
    );

    // Call the function
    let entrypoint = instance.get_function::<(i32,), i32>(func_name)?;
    let result = entrypoint.call(func_arg)?;
    println!("Return value: {}", result.bright_green().bold());
    Ok(())
}
