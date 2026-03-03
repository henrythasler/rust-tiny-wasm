use kaitai::{BytesReader, KStruct, OptRc};
use std::fs;

mod vlq_base128_le;
pub mod webassembly;
use webassembly::Webassembly;

pub fn load_wasm_module(file_path: &str) -> Result<OptRc<Webassembly>, String> {
    let bytes = fs::read(file_path).expect("Should have been able to read the file");
    let io = BytesReader::from(bytes);
    let parsed = Webassembly::read_into::<BytesReader, Webassembly>(&io, None, None)
        .expect("Failed to parse WebAssembly module");
    Ok(parsed)
}
