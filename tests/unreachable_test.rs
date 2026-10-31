use std::fs;
use std::path::Path;
use tiny_wasm::runtime::{TinyWasmError, TrapCode};
use tiny_wasm::*;

fn is_unreachable_trap(err: TinyWasmError) -> bool {
    matches!(err, TinyWasmError::Trap(code) if code == TrapCode::UnreachableCodeReached)
}

#[test]
fn test_unreachable() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/unreachable.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), i32>("binop_after_unreachable")?;
    assert!(is_unreachable_trap(func.call().unwrap_err()));

    let func = instance.get_function::<(), i32>("block_result_unreachable")?;
    assert!(is_unreachable_trap(func.call().unwrap_err()));

    let func = instance.get_function::<(), i32>("dead_operands_after_br")?;
    assert_eq!(func.call()?, 7);

    let func = instance.get_function::<(), i32>("dead_nested_block")?;
    assert_eq!(func.call()?, 3);

    let func = instance.get_function::<(i32,), i32>("dead_if_else")?;
    assert_eq!(func.call(0)?, 5);

    let func = instance.get_function::<(), f32>("float_block")?;
    assert_eq!(func.call()?, 1.5);

    let func = instance.get_function::<(i32,), f32>("float_unreachable_tail")?;
    assert_eq!(func.call(0)?, 2.5);
    assert!(is_unreachable_trap(func.call(1).unwrap_err()));

    let func = instance.get_function::<(), i32>("return_then_dead")?;
    assert_eq!(func.call()?, 42);

    Ok(())
}
