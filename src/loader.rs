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

pub enum Section {
    Export(ExportSection),
    Code(CodeSection),
}

pub struct WasmModule {
    file_path: String,
    sections: Vec<Section>,
}

impl WasmModule {
    pub fn code_section(&self) -> Option<&CodeSection> {
        self.sections.iter().find_map(|x| match x {
            Section::Code(v) => Some(v),
            _ => None,
        })
    }

    pub fn sections(&self) -> &Vec<Section> {
        &self.sections
    }
}

fn kaitai_parser(file_path: &str) -> OptRc<Webassembly> {
    let bytes = fs::read(file_path)
        .expect("fs::read() should be able to load the file in `kaitai_parser()`");
    let io = BytesReader::from(bytes);
    Webassembly::read_into::<BytesReader, Webassembly>(&io, None, None)
        .expect("Webassembly::read_into() should be able to parse the WebAssembly module in `kaitai_parser()`")
}

pub fn load_wasm_module(file_path: &str) -> WasmModule {
    let wasm = kaitai_parser(file_path);

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
                    .push(Section::Export(new_export_section));
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

                wasm_module.sections.push(Section::Code(new_code_section));
            }
            _ => (),
        }
    }
    wasm_module
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    #[should_panic(expected = "should be able to load the file")]
    fn file_error() {
        let _ = load_wasm_module(&String::from("does_not.exist"));
    }

    #[test]
    #[should_panic(expected = "should be able to parse the WebAssembly module")]
    fn invalid_module() {
        let _ = load_wasm_module(&String::from("tests/assets/invalid-module.wasm"));
    }

    #[test]
    fn test_get_name() {
        let wasm_module = load_wasm_module(&String::from("tests/assets/empty-fn.wasm"));
        assert!(wasm_module.sections.len() == 2);

        for section in &wasm_module.sections {
            match section {
                Section::Export(export_section) => {
                    assert_eq!(export_section.name(), "export_section");
                    assert_eq!(export_section.exports.len(), 2);
                    for export in &export_section.exports {
                        assert!(matches!(export.name.as_str(), "foo" | "bar"));
                        assert_eq!(export.r#type, Webassembly_ExportTypes::FuncType);
                    }
                }
                Section::Code(code_section) => {
                    assert_eq!(code_section.name(), "code_section");
                    assert_eq!(code_section.entries.len(), 2);
                    for entry in &code_section.entries {
                        assert!(matches!(entry.get_locals().len(), 0 | 1));
                    }
                }
            }
        }
    }
}
