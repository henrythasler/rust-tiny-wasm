use std::fs;
use std::path::Path;
use tiny_wasm::runtime::{TinyWasmError, TrapCode};
use tiny_wasm::*;

#[test]
fn test_call() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/call.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i64>("basic")?;
    assert_eq!(func.call()?, 1);

    let func = instance.get_function::<(), i64>("back")?;
    assert_eq!(func.call()?, 1);

    let func = instance.get_function::<(), i64>("four")?;
    assert_eq!(func.call()?, 4);

    let func = instance.get_function::<(), i64>("call_trap")?;
    let res = func.call().unwrap_err();
    assert!(
        matches!(res, TinyWasmError::Trap(trap_code) if trap_code==TrapCode::UnreachableCodeReached)
    );

    let func = instance.get_function::<(i32, i32), i32>("plus_one")?;
    assert_eq!(func.call(3, 4)?, 8);
    assert_eq!(func.call(-1, 1)?, 1);

    Ok(())
}
