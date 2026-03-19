use clap::Parser;
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

fn main() -> Result<(), String> {
    // parse command line arguments
    let args = Args::parse();

    // load, compile and instantiate WebAssembly module
    let module = fs::read(Path::new(&args.module)).unwrap();
    let instance = get_module_instance(&module)?;

    // get the function pointer and call the function
    let entrypoint = unsafe { instance.get_function::<fn() -> i32>(&args.function) };
    println!("{}", entrypoint());
    Ok(())
}
