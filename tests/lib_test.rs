use std::{fs, path::Path};
use tiny_wasm::runtime::TinyWasmError;
use tiny_wasm::*;

#[test]
fn test_constants() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/empty-fn.wasm")))?;
    print_module(&module)
}

#[test]
fn test_execute() -> Result<()> {
    let res = execute(Path::new("tests/assets/constants.wasm"), "get_42")?;
    assert_eq!(res, 42);

    let res = execute(Path::new("tests/assets/constants.wasm"), "unknown").unwrap_err();
    assert!(matches!(res, TinyWasmError::Runtime(msg) if msg.contains("not found")));

    let res = execute(Path::new("not-found.wasm"), "").unwrap_err();
    assert_eq!(res, TinyWasmError::Io(std::io::ErrorKind::NotFound));

    let res = execute(Path::new("tests/assets/invalid-module.wasm"), "").unwrap_err();
    assert!(matches!(res, TinyWasmError::Parser(msg) if msg.contains("bad magic number")));

    Ok(())
}

#[test]
fn test_execute_start() -> Result<()> {
    execute_start(Path::new("tests/assets/skeleton.wasm"))?;
    Ok(())
}
