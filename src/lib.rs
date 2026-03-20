use std::fs;
use std::path::Path;

pub mod assembler;
pub mod compiler;
pub mod runtime;

pub type Result<T> = std::result::Result<T, TinyWasmError>;

#[derive(Debug)]
pub enum TinyWasmError {
    Io(std::io::Error),
    Parser(String),
    Compiler(String),
}

impl From<std::io::Error> for TinyWasmError {
    fn from(err: std::io::Error) -> Self {
        TinyWasmError::Io(err)
    }
}

impl From<wasmparser::BinaryReaderError> for TinyWasmError {
    fn from(err: wasmparser::BinaryReaderError) -> Self {
        TinyWasmError::Parser(err.message().to_string())
    }
}

// pub fn dump_module_info(filename: &Path) {
//     println!("Loading '{}'...", filename.display().bright_blue());
//     let wasm_module = loader::wasmparser(filename).unwrap();

//     println!(
//         "Found {} section(s)",
//         wasm_module.sections().len().bright_green()
//     );
//     for section in wasm_module.sections() {
//         match section {
//             loader::Section::Export(export_section) => {
//                 println!("  Section ID: {}", export_section.name().bright_blue());
//                 println!(
//                     "  Number of Exports: {}",
//                     export_section.exports.len().bright_green()
//                 );

//                 for export in &export_section.exports {
//                     println!(
//                         "    - {} ({:#?}, {})",
//                         export.name.bright_yellow(),
//                         export.r#type.white(),
//                         export.index.white()
//                     );
//                 }
//             }
//             loader::Section::Code(code_section) => {
//                 println!("  Section ID: {}", code_section.name().bright_blue());
//                 println!(
//                     "  Number of Entries: {}",
//                     code_section.entries.len().bright_green()
//                 );
//                 for entry in &code_section.entries {
//                     println!(
//                         "    - Locals: {} ({:?})",
//                         entry.get_locals().len().bright_green(),
//                         entry.locals
//                     );
//                     println!(
//                         "      Content ({:#?} Bytes): {:02X?}\n",
//                         entry.get_code().len(),
//                         entry.get_code().bright_yellow()
//                     )
//                 }
//             }
//             _ => {}
//         }
//     }
// }

pub fn print_module(_filename: &Path) -> Result<()> {
    Ok(())
}

/// Compiles a WebAssembly module from the given byte array, and then instantiates it using the runtime module.
///
/// This function takes a byte array representing a WebAssembly module, compiles it using
/// the `compiler` module, and then instantiates it using the `runtime` module.
/// It returns a `Result` containing the instantiated module or an error message if the compilation or instantiation fails.
///
/// # Arguments
/// * `module` - A byte slice containing the WebAssembly module to be compiled and instantiated
/// # Returns
/// * `Result<runtime::Runtime, String>` - The instantiated module or an error message if the compilation or instantiation fails
/// # Errors
/// This function will return an error if the module cannot be compiled or instantiated.
pub fn get_module_instance(module: &[u8]) -> Result<runtime::Runtime> {
    let linked_module = compiler::compile(module)?;
    Ok(runtime::instantiate_module(&linked_module))
}

/// This function load a WebAssembly module, compiles and executes the given function
///
/// Loads the WebAssembly module from the specified file, compiles it using the compiler
/// module, and then instantiates it using the runtime module. Finally, it retrieves the
/// specified function and executes it, returning the result as an i32.
///
/// # Arguments
/// * `filename` - Path to the WebAssembly module
/// * `function` - Name of the function to execute
/// # Returns
/// * `Result<i32, Box<dyn std::error::Error>>` - The i32-result of the function execution or an error
/// # Errors
/// This function will return an error if the module cannot be loaded, compiled, instantiated, or if the specified function cannot be found or executed.
/// # Example
/// ```
/// use std::path::Path;
/// use tiny_wasm::execute;
/// let result = execute(&Path::new("path/to/module.wasm"), "function_name").unwrap();
/// println!("Result: {}", result);
/// ```
pub fn execute(filename: &Path, function: &str) -> Result<i32> {
    let module = fs::read(filename)?;
    let instance = get_module_instance(&module)?;
    let _start = unsafe { instance.get_function::<fn() -> i32>(function) };
    Ok(_start())
}

/// This function is a convenience wrapper around the `execute` function to run the `_start` function
pub fn execute_start(filename: &Path) -> Result<i32> {
    execute(filename, "_start")
}
