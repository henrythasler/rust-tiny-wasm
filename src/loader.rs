use std::fs;

pub fn load_wasm_module(file_path: &String) -> Vec<u8> {
    let contents: Vec<u8> = fs::read(file_path).expect("Should have been able to read the file");
    contents
}
