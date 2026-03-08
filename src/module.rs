//! Processes a Webassembly module and returns a LinkedModule for subsequent execution

use super::loader::*;

pub struct LinkedModule {
    machinecode: Vec<u32>,
}

impl LinkedModule {
    pub fn get_machinecode(&self) -> &[u32] {
        &self.machinecode
    }
}

pub fn compile(module: &WasmModule) -> LinkedModule {
    let _code_section = module.code_section();
    let machinecode = vec![0x0b000020, 0xd65f03c0];
    LinkedModule { machinecode }
}
