use clap::Parser;
use owo_colors::OwoColorize;
use std::fs;
use std::path::Path;
use tiny_wasm::*;

/// Simple program to greet a person
#[derive(Parser, Debug)]
#[command(version, about, long_about = None, trailing_var_arg = true)]
pub struct Args {
    /// Path to wasm-module
    #[arg(short, long)]
    module: String,

    /// Function to call
    #[arg(short, long, default_value_t = String::from("_start"))]
    function: String,
}

fn main() -> Result<()> {
    // parse command line arguments
    let args = Args::parse();
    let file_path = Path::new(&args.module);
    let func_name = &args.function;

    // load, compile and instantiate WebAssembly module
    println!("Loading '{}'", file_path.display().bright_blue());
    let module = fs::read(file_path).unwrap();
    print_module(&module)?;
    let instance = get_module_instance(&module)?;

    // get the function pointer and call the function
    let entrypoint = unsafe { instance.get_function::<fn() -> i32>(func_name) };
    println!("{}", entrypoint());
    Ok(())
}
