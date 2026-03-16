#![allow(unused)]

use kaitai::{BytesReader, KStruct, OptRc};
use std::fs;
use std::path::{Path, PathBuf};
use wasmparser::{BinaryReaderError, Chunk, Parser, Payload::*};

mod vlq_base128_le;
pub mod webassembly;
use webassembly::{Webassembly, Webassembly_ExportTypes, Webassembly_ValTypes};

#[derive(Debug)]
pub struct Local {
    count: i32,
    r#type: Webassembly_ValTypes,
}

#[derive(Debug)]
pub struct FuncType {
    pub parameters: Vec<Webassembly_ValTypes>,
    pub results: Vec<Webassembly_ValTypes>,
}

#[derive(Debug)]
pub struct Code {
    pub locals: Vec<Local>,
    pub code: Vec<u8>,
}

#[derive(Debug)]
pub struct Export {
    pub name: String,
    pub r#type: wasmparser::ExternalKind,
    pub index: u32,
}

#[derive(Debug, Default)]
pub struct WasmModule {
    pub types: Vec<FuncType>,
    pub exports: Vec<Export>,
    pub code: Vec<Code>,
    pub functions: Vec<u32>,
}

pub fn wasmparser(file_path: &Path) -> Result<WasmModule, BinaryReaderError> {
    let buf = fs::read(file_path).unwrap();
    let parser = Parser::new(0);
    let mut module = WasmModule::default();

    for payload in parser.parse_all(&buf) {
        match payload? {
            // Sections for WebAssembly modules
            Version { .. } => { /* ... */ }
            TypeSection(reader) => { 
                for (i, ty) in reader.into_iter().enumerate() {
                    let ty = ty?;
                    println!("Type {}: {:?}", i, ty);
                }                
             }
            ImportSection(_) => { /* ... */ }
            FunctionSection(reader) => { 
                for func in reader {
                    module.functions.push(func?);
                }                
             }
            TableSection(_) => { /* ... */ }
            MemorySection(_) => { /* ... */ }
            TagSection(_) => { /* ... */ }
            GlobalSection(_) => { /* ... */ }
            ExportSection(reader) => { 
                for export in reader {
                    let export = export?;
                    module.exports.push(Export { name: export.name.to_string(), r#type: export.kind, index: export.index });
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
            CodeSectionStart { .. } => { /* ... */ }
            CodeSectionEntry(body) => {
                let mut reader = body.get_binary_reader_for_operators().unwrap();
                let mut code:Vec<u8> = vec![];

                while !reader.eof() {
                    let op: u32 = reader.read().unwrap();
                    code.push((op & 0xff) as u8);
                }

                module.code.push(Code{
                    locals: vec![],
                    code
                });
                // here we can iterate over `body` to parse the function
                // and its locals
            }

            // Sections for WebAssembly components
            ModuleSection { .. } => { /* ... */ }
            InstanceSection(_) => { /* ... */ }
            CoreTypeSection(_) => { /* ... */ }
            ComponentSection { .. } => { /* ... */ }
            ComponentInstanceSection(_) => { /* ... */ }
            ComponentAliasSection(_) => { /* ... */ }
            ComponentTypeSection(_) => { /* ... */ }
            ComponentCanonicalSection(_) => { /* ... */ }
            ComponentStartSection { .. } => { /* ... */ }
            ComponentImportSection(_) => { /* ... */ }
            ComponentExportSection(_) => { /* ... */ }

            CustomSection(_) => { /* ... */ }

            // Once we've reached the end of a parser we either resume
            // at the parent parser or the payload iterator is at its
            // end and we're done.
            End(_) => {}

            // most likely you'd return an error here, but if you want
            // you can also inspect the raw contents of unknown sections
            other => {
                match other.as_section() {
                    Some((id, range)) => { /* ... */ }
                    None => { /* ... */ }
                }
            }
        }
    }
    Ok(module)
}
