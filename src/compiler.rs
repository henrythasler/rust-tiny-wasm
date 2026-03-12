//! Processes a Webassembly module and returns a LinkedModule for subsequent execution

use super::loader::*;
use function::*;
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
    // let export_section = module.export_section();

    let mut machinecode: Vec<u32> = Vec::new();

    if let Some(c) = code_section {
        for entry in &c.entries {
            compile_function(entry, &mut machinecode);
        }
    }

    LinkedModule { machinecode }
}
