#![allow(unused)]

use kaitai::{BytesReader, KStruct, OptRc};
use std::fs;

mod vlq_base128_le;
pub mod webassembly;
use webassembly::{Webassembly, Webassembly_ExportTypes, Webassembly_ValTypes};

#[derive(Debug)]
pub struct Local {
    count: i32,
    r#type: Webassembly_ValTypes,
}

pub struct Code {
    pub locals: Vec<Local>,
    pub code: Vec<u8>,
}

impl Code {
    pub fn get_code(&self) -> &[u8] {
        &self.code
    }
    pub fn get_locals(&self) -> &[Local] {
        &self.locals
    }
}

pub struct CodeSection {
    pub entries: Vec<Code>,
}

impl CodeSection {
    pub fn name(&self) -> String {
        String::from("code_section")
    }
}

pub struct Export {
    pub name: String,
    pub r#type: Webassembly_ExportTypes,
    pub index: i32,
}

pub struct ExportSection {
    pub exports: Vec<Export>,
}

impl ExportSection {
    pub fn name(&self) -> String {
        String::from("export_section")
    }
}

pub enum Sections {
    Export(ExportSection),
    Code(CodeSection),
}

pub struct WasmModule {
    file_path: String,
    pub sections: Vec<Sections>,
}

fn kaitai_parse_module(file_path: &str) -> Result<OptRc<Webassembly>, String> {
    let bytes = fs::read(file_path).expect("Could not load file");
    let io = BytesReader::from(bytes);
    let parsed = Webassembly::read_into::<BytesReader, Webassembly>(&io, None, None)
        .expect("Failed to parse WebAssembly module");
    Ok(parsed)
}

pub fn load_wasm_module(file_path: &str) -> WasmModule {
    let wasm = kaitai_parse_module(file_path).expect("Error parsing WebAssembly module");

    // we simplify the rather complex parser result and move the content to our own structure
    let mut wasm_module = WasmModule {
        file_path: String::from(file_path),
        sections: Vec::new(),
    };

    for section in wasm.sections().iter() {
        let content_ref = section.content();
        let content = content_ref.as_ref();

        match content {
            Some(webassembly::Webassembly_Section_Content::Webassembly_ExportSection(section)) => {
                let export_section = section.get();
                let mut new_export_section = ExportSection {
                    exports: Vec::new(),
                };

                let exports = export_section.exports();
                for export in exports.iter() {
                    let export_name = export.name();
                    let export_name_str = export_name.value();
                    new_export_section.exports.push(Export {
                        name: export_name_str.clone(),
                        r#type: export.exportdesc().clone(),
                        index: *export.idx().value().unwrap(),
                    });
                }
                wasm_module
                    .sections
                    .push(Sections::Export(new_export_section));
            }
            Some(webassembly::Webassembly_Section_Content::Webassembly_CodeSection(section)) => {
                let code_section = section.get();
                let mut new_code_section = CodeSection {
                    entries: Vec::new(),
                };

                for entry in code_section.entries().iter() {
                    let func = entry.func();
                    let locals = func.locals();

                    let mut new_locals: Vec<Local> = Vec::new();

                    for local in locals.iter() {
                        new_locals.push(Local {
                            count: *local.num_valtype().value().unwrap(),
                            r#type: local.valtype().clone(),
                        });
                    }

                    new_code_section.entries.push(Code {
                        locals: new_locals,
                        code: func.expr().clone(),
                    });
                }

                wasm_module.sections.push(Sections::Code(new_code_section));
            }
            _ => (),
        }
    }
    wasm_module
}
