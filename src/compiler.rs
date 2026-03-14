//! Processes a Webassembly module and returns a LinkedModule for subsequent execution

use super::loader::*;

use function::*;
use owo_colors::OwoColorize;
mod control_instructions;
mod function;

pub struct LinkedModule {
    machinecode: Vec<u32>,
}

impl LinkedModule {
    pub fn get_machinecode(&self) -> &[u32] {
        &self.machinecode
    }
}

pub fn compile(module: &WasmModule) -> LinkedModule {
    let code_section = module.code_section();
    let export_section = module.export_section();

    let mut machinecode: Vec<u32> = Vec::new();

    if let Some(c) = code_section {
        let mut iter = c.entries.iter().enumerate();
        while let Some((index, entry)) = iter.next() {
            match compile_function(entry, &mut machinecode) {
                Ok(()) => (),
                Err(error) => {
                    let function_id = match export_section {
                        Some(val) => &val.exports.get(index).unwrap().name,
                        None => &index.to_string(),
                    };
                    let error_msg = format!("Error in function '{function_id}()': {error}");
                    panic!("{}", error_msg.red());
                }
            }
        }
    }

    LinkedModule { machinecode }
}
