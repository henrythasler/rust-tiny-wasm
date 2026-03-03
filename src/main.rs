use current_platform::{COMPILED_ON, CURRENT_PLATFORM};
use owo_colors::OwoColorize;
use std::env;

mod loader;
use loader::webassembly;

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
        println!("  Section ID: {:?}", section.id().bright_blue());
        println!(
            "  Size: {} Bytes",
            section.content_raw().len().bright_green()
        );
        println!(
            "  Content ({:#?} Bytes): {}",
            Some(section.len_content()).unwrap().value().expect("empty"),
            section.content_raw().escape_ascii().white()
        );

        let content_ref = section.content();
        let content = content_ref.as_ref();

        match content {
            Some(webassembly::Webassembly_Section_Content::Webassembly_ExportSection(section)) => {
                let export_section = section.get();
                let num_exports_wrapper = export_section.num_exports();
                let num_exports = num_exports_wrapper.value().expect("value missing");
                println!("  Number of Exports: {}", num_exports);

                let exports = export_section.exports();
                for export in exports.iter() {
                    let export_name = export.name();
                    let export_name_str = export_name.value();
                    println!("    - {}", export_name_str.bright_yellow());
                }
            }
            _ => (),
        }
        println!();
    }
    Ok(())
}
