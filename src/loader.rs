#![allow(unused)]

use kaitai::{BytesReader, KStruct, OptRc};
use std::fs;
use std::path::{Path, PathBuf};

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
pub struct TypeSection {
    pub func_types: Vec<FuncType>,
}

impl TypeSection {
    pub fn name(&self) -> String {
        String::from("type_section")
    }
}

#[derive(Debug)]
pub struct FunctionSection {
    pub type_indices: Vec<usize>,
}

impl FunctionSection {
    pub fn name(&self) -> String {
        String::from("function_section")
    }
}

#[derive(Debug)]
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

#[derive(Debug)]
pub struct CodeSection {
    pub entries: Vec<Code>,
}

impl CodeSection {
    pub fn name(&self) -> String {
        String::from("code_section")
    }
}

#[derive(Debug)]
pub struct Export {
    pub name: String,
    pub r#type: Webassembly_ExportTypes,
    pub index: i32,
}

#[derive(Debug)]
pub struct ExportSection {
    pub exports: Vec<Export>,
}

impl ExportSection {
    pub fn name(&self) -> String {
        String::from("export_section")
    }
}

#[derive(Debug)]
pub enum Section {
    Types(TypeSection),
    Function(FunctionSection),
    Export(ExportSection),
    Code(CodeSection),
}

pub struct WasmModule {
    file_path: PathBuf,
    sections: Vec<Section>,
}

impl WasmModule {
    pub fn type_section(&self) -> Option<&TypeSection> {
        self.sections.iter().find_map(|x| match x {
            Section::Types(v) => Some(v),
            _ => None,
        })
    }

    pub fn function_section(&self) -> Option<&FunctionSection> {
        self.sections.iter().find_map(|x| match x {
            Section::Function(v) => Some(v),
            _ => None,
        })
    }

    pub fn export_section(&self) -> Option<&ExportSection> {
        self.sections.iter().find_map(|x| match x {
            Section::Export(v) => Some(v),
            _ => None,
        })
    }

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

fn kaitai_parser(file_path: &Path) -> OptRc<Webassembly> {
    let bytes = fs::read(file_path)
        .expect("fs::read() should be able to load the file in `kaitai_parser()`");
    let io = BytesReader::from(bytes);
    Webassembly::read_into::<BytesReader, Webassembly>(&io, None, None)
        .expect("Webassembly::read_into() should be able to parse the WebAssembly module in `kaitai_parser()`")
}

pub fn load_wasm_module(file_path: &Path) -> WasmModule {
    let wasm = kaitai_parser(file_path);

    // we simplify the rather complex parser result and move the content to our own structure
    let mut wasm_module = WasmModule {
        file_path: PathBuf::from(file_path),
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
            Some(webassembly::Webassembly_Section_Content::Webassembly_TypeSection(section)) => {
                let section_content = section.get();
                let mut new_section = TypeSection {
                    func_types: Vec::new(),
                };

                for item in section_content.functypes().iter() {
                    new_section.func_types.push(FuncType {
                        parameters: item
                            .parameters()
                            .get_value()
                            .as_ref()
                            .unwrap()
                            .valtype()
                            .clone(),
                        results: item
                            .results()
                            .get_value()
                            .as_ref()
                            .unwrap()
                            .valtype()
                            .clone(),
                    })
                }
                wasm_module.sections.push(Section::Types(new_section));
            }
            Some(webassembly::Webassembly_Section_Content::Webassembly_FunctionSection(
                section,
            )) => {
                let section_content = section.get();
                let mut new_section = FunctionSection {
                    type_indices: Vec::new(),
                };
                for item in section_content.typeidx().iter() {
                    let value = *item.get().value().unwrap();
                    new_section.type_indices.push(value as usize);
                }
                wasm_module.sections.push(Section::Function(new_section));
            }
            _ => (),
        }
    }
    // println!("{:#?}", wasm_module.sections);

    wasm_module
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    #[should_panic(expected = "should be able to load the file")]
    fn file_error() {
        let _ = load_wasm_module(Path::new("does_not.exist"));
    }

    #[test]
    #[should_panic(expected = "should be able to parse the WebAssembly module")]
    fn invalid_module() {
        let _ = load_wasm_module(Path::new("tests/assets/invalid-module.wasm"));
    }

    #[test]
    fn test_get_name() {
        let wasm_module = load_wasm_module(Path::new("tests/assets/empty-fn.wasm"));
        assert_eq!(
            wasm_module.sections.len(),
            4,
            "Section length is {}",
            wasm_module.sections.len()
        );

        for section in &wasm_module.sections {
            match section {
                Section::Function(type_section) => {
                    assert_eq!(type_section.name(), "function_section");
                    assert_eq!(type_section.type_indices.len(), 2);
                }
                Section::Types(type_section) => {
                    assert_eq!(type_section.name(), "type_section");
                    assert_eq!(type_section.func_types.len(), 1);
                    assert_eq!(type_section.func_types.get(0).unwrap().parameters.len(), 0);
                    assert_eq!(type_section.func_types.get(0).unwrap().results.len(), 0);
                }
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
