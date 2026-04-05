#![allow(dead_code)]
//! Processes a Webassembly module and returns a LinkedModule for subsequent execution
use std::mem;

use wasmparser::{Operator, Parser, Payload::*, ValType};

use super::*;
use crate::assembler::aarch64::*;
use crate::assembler::{emit_epilogue, emit_prologue};

use function::*;
use procedure_call::*;
use stack::*;

mod function;
mod procedure_call;
mod stack;

#[derive(Debug)]
pub struct Export {
    pub name: String,
    pub r#type: wasmparser::ExternalKind,
    pub index: u32,
}

pub fn compile(module: &[u8]) -> Result<LinkedModule> {
    let mut machinecode: Vec<u32> = Vec::new();
    let mut wasm_functions: Vec<WasmFunction> = Vec::new();

    let parser = Parser::new(0);

    // temporary module sections for lookup
    let mut types: Vec<wasmparser::FuncType> = Vec::new();
    let mut exports: Vec<Export> = Vec::new();
    let mut functions: Vec<u32> = Vec::new();

    let mut function_index = 0;

    for payload in parser.parse_all(module) {
        match payload? {
            // Sections for WebAssembly modules
            Version { .. } => { /* ... */ }
            CustomSection(_) => { /* ... */ }
            TypeSection(reader) => {
                for ty in reader.into_iter() {
                    for (_, item) in ty?.into_types_and_offsets() {
                        if let wasmparser::CompositeInnerType::Func(func) =
                            item.composite_type.inner
                        {
                            types.push(func);
                        }
                    }
                }
            }
            ImportSection(_) => { /* ... */ }
            FunctionSection(reader) => {
                for func in reader {
                    functions.push(func?);
                }
            }
            TableSection(_) => { /* ... */ }
            MemorySection(_) => { /* ... */ }
            GlobalSection(_) => { /* ... */ }
            ExportSection(reader) => {
                for export in reader {
                    let export = export?;
                    exports.push(Export {
                        name: export.name.to_string(),
                        r#type: export.kind,
                        index: export.index,
                    });
                }
            }
            StartSection { .. } => { /* ... */ }
            ElementSection(_) => { /* ... */ }
            DataCountSection { .. } => { /* ... */ }
            DataSection(_) => { /* ... */ }

            // Here we know how many functions we'll be receiving as
            // `CodeSectionEntry`, so we can prepare for that, and
            // afterwards we can parse and handle each function
            // individually.
            CodeSectionStart { .. } => {}
            CodeSectionEntry(body) => {
                // here we can iterate over `body` to parse the function and its locals

                let mut locals: Vec<(u32, ValType)> = Vec::new();
                let locals_reader = body.get_locals_reader()?;
                for local in locals_reader {
                    locals.push(local.unwrap());
                }

                let offset = machinecode.len();
                let mut reader = body.get_operators_reader()?;
                let fn_idx = *functions.get(function_index).unwrap() as usize;

                compile_function(
                    &mut reader,
                    types.get(fn_idx).unwrap(),
                    &locals,
                    &mut machinecode,
                )?;

                let function_id = exports
                    .get(function_index)
                    .map_or(format!("$func{function_index}"), |v| v.name.clone());

                wasm_functions.push(WasmFunction {
                    name: function_id,
                    offset,
                    length: machinecode.len() - offset,
                });
                function_index += 1;
            }

            // Once we've reached the end of a parser we either resume
            // at the parent parser or the payload iterator is at its
            // end and we're done.
            End(_) => {}

            // most likely you'd return an error here, but if you want
            // you can also inspect the raw contents of unknown sections
            _ => {
                return Err(TinyWasmError::Parser(String::from(
                    "Found unknown section identifier",
                )));
            }
        }
    }

    Ok(LinkedModule {
        machinecode,
        functions: wasm_functions,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty_module() -> Result<()> {
        let module = vec![0x00, 0x61, 0x73, 0x6D, 0x01, 0x00, 0x00, 0x00];
        compile(&module)?;
        Ok(())
    }

    #[test]
    fn invalid_module() -> Result<()> {
        let module = vec![0x00, 0x61, 0x73, 0xFF, 0x01, 0x00, 0x00, 0x00];
        let res = compile(&module).unwrap_err();
        assert!(matches!(res, TinyWasmError::Parser(msg) if msg.contains("bad magic number")));
        Ok(())
    }

    #[test]
    fn invalid_section() -> Result<()> {
        let module = vec![
            0x00, 0x61, 0x73, 0x6D, 0x01, 0x00, 0x00, 0x00, 0x10, 0x01, 0x00,
        ];
        let res = compile(&module).unwrap_err();
        assert!(matches!(res, TinyWasmError::Parser(msg) if msg.contains("unknown section")));
        Ok(())
    }

    #[test]
    fn unsupported_instruction() -> Result<()> {
        // hexdump -v -e '1/1 "%02x "' tests/assets/dummy-empty.wasm
        // contains unreachable
        let module = vec![
            0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x01, 0x04, 0x01, 0x60, 0x00, 0x00,
            0x03, 0x02, 0x01, 0x00, 0x07, 0x07, 0x01, 0x03, 0x66, 0x6f, 0x6f, 0x00, 0x00, 0x0a,
            0x05, 0x01, 0x03, 0x00, 0x00, 0x0b,
        ];
        let res = compile(&module).unwrap_err();
        assert!(
            matches!(res, TinyWasmError::Compiler(msg) if msg.contains("unsupported instruction"))
        );
        Ok(())
    }
}
