use clap::Parser;
use current_platform::{COMPILED_ON, CURRENT_PLATFORM};
use owo_colors::OwoColorize;
use tiny_wasm::*;

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
    // Chapter 1
    println!("Compiled on '{}' for '{}'\n", COMPILED_ON, CURRENT_PLATFORM);

    // Chapter 2
    let args = Args::parse();
    dump_module_info(&args.module);

    // Chapter 3
    let res = add_i32(args.first, args.second);
    println!("{} + {} = {}", args.first, args.second, res.bright_green());

    // Chapter 4
    let res = asm_add_i32(args.first, args.second);
    println!("{} + {} = {}", args.first, args.second, res.bright_green());

    // Chapter 5
    load_and_run(&args.module, "start");

    Ok(())
}
