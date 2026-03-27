use owo_colors::OwoColorize;
use std::fs;
use std::path::Path;
use wasmparser::{Parser, Payload::*, ValType};

pub mod assembler;
pub mod compiler;
pub mod runtime;

pub type Result<T> = std::result::Result<T, TinyWasmError>;

#[derive(Debug, PartialEq, Eq)]
pub enum TrapCode {
    None,
}

impl TrapCode {
    pub fn from_code(code: i64) -> Self {
        match code {
            0 => TrapCode::None,
            _ => panic!("Unknown error code: {}", code),
        }
    }
}

#[derive(Debug, PartialEq, Eq)]
pub enum TinyWasmError {
    Io(std::io::ErrorKind),
    Parser(String),
    Compiler(String),
    Runtime(String),
    Trap(TrapCode),
}

impl From<std::io::Error> for TinyWasmError {
    fn from(err: std::io::Error) -> Self {
        TinyWasmError::Io(err.kind())
    }
}

impl From<wasmparser::BinaryReaderError> for TinyWasmError {
    fn from(err: wasmparser::BinaryReaderError) -> Self {
        TinyWasmError::Parser(err.message().to_string())
    }
}

/// Prints the structure of a WebAssembly module in a human-readable format, including its sections, exports, and code entries.
///
/// This function takes a byte slice representing a WebAssembly module and uses the `wasmparser` crate
/// to parse its contents. It prints the type section, export section, and code section of the module, along with
/// relevant details such as function signatures, export names, and local variable information.
///
/// # Arguments
/// * `module` - A byte slice containing the WebAssembly module to be printed
///
/// # Returns
/// * `Result<()>` - An empty result if the module is successfully printed, or an error message if the parsing fails
///
/// # Errors
/// This function will return an error if the module cannot be parsed correctly.
pub fn print_module(module: &[u8]) -> Result<()> {
    let parser = Parser::new(0);
    let mut exports: Vec<&str> = Vec::new();
    let mut function_index = 0;

    for payload in parser.parse_all(module) {
        match payload? {
            // Sections for WebAssembly modules
            TypeSection(reader) => {
                println!("  {}", "Type Section".bright_blue());
                for ty in reader.into_iter() {
                    for (_, item) in ty?.into_types_and_offsets() {
                        if let wasmparser::CompositeInnerType::Func(func) =
                            item.composite_type.inner
                        {
                            println!("    - {}", func.bright_yellow());
                        }
                    }
                }
            }
            ExportSection(reader) => {
                println!("  {}", "Export Section".bright_blue());
                for export in reader {
                    let export = export?;
                    println!(
                        "    - {} ({:#?}, {})",
                        export.name.white().bold(),
                        export.kind.bright_yellow(),
                        export.index.bright_yellow()
                    );
                    exports.push(export.name);
                }
            }
            CodeSectionStart { count, .. } => {
                println!("  {}", "Code Section".bright_blue());
                println!("    Entries: {}", count.bright_green());
                function_index = 0;
            }
            CodeSectionEntry(body) => {
                let function_id = exports
                    .get(function_index)
                    .map_or(format!("$func{function_index}"), |v| v.to_string());

                let mut locals: Vec<(u32, ValType)> = Vec::new();
                let locals_reader = body.get_locals_reader()?;
                for local in locals_reader {
                    locals.push(local.unwrap());
                }

                println!("    - {}", function_id.white().bold());
                println!("      Locals: {:?}", locals.bright_yellow());
                println!(
                    "      Code ({:#?} Bytes): {:02X?}",
                    body.as_bytes().len(),
                    body.as_bytes().bright_yellow()
                );
                function_index += 1;
            }
            End(_) => {}
            _ => {}
        }
    }
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
///
/// # Returns
/// * `Result<runtime::Runtime, String>` - The instantiated module or an error message if the compilation or instantiation fails
///
/// # Errors
/// This function will return an error if the module cannot be compiled or instantiated.
pub fn get_module_instance(module: &[u8]) -> Result<runtime::Runtime> {
    let linked_module = compiler::compile(module)?;
    runtime::instantiate_module(&linked_module)
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
/// * `Result<i32>` - The i32-result of the function execution or an error
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
    let entrypoint = instance.get_function::<(), i32>(function)?;
    entrypoint.call()
}

/// This function is a convenience wrapper around the `execute` function to run the `_start` function
pub fn execute_start(filename: &Path) -> Result<i32> {
    execute(filename, "_start")
}
