use clap::Parser;
use current_platform::{COMPILED_ON, CURRENT_PLATFORM};
use owo_colors::OwoColorize;
use tiny_wasm::{add_i32, dump_module_info};

/// Simple program to greet a person
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
pub struct Args {
    /// Path to wasm-module
    #[arg(short, long)]
    module: String,

    /// First addend
    #[arg(short, long)]
    pub first: i32,

    /// Second addend
    #[arg(short, long)]
    pub second: i32,
}

fn main() -> Result<(), String> {
    println!("Compiled on '{}' for '{}'\n", COMPILED_ON, CURRENT_PLATFORM);
    let args = Args::parse();

    // Chapter 1
    dump_module_info(&args.module);

    // Chapter 2
    let res = add_i32(args.first, args.second);
    println!("{} + {} = {}", args.first, args.second, res.bright_green());

    Ok(())
}
