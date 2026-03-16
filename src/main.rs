use clap::Parser;
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
    // Chapter 2
    let args = Args::parse();
    // dump_module_info(Path::new(&args.module));

    // Chapter 5
    // load_and_run(Path::new(&args.module), &args.function);

    let module = loader::wasmparser(Path::new(&args.module)).unwrap();
    println!("{:#?}", module);

    Ok(())
}
