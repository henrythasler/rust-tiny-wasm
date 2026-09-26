use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_i32_lts() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/relop.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("i32_lts")?;
    assert_eq!(func.call(0, 0)?, 0);
    assert_eq!(func.call(0, 1)?, 1);
    assert_eq!(func.call(-1000, -999)?, 1);
    assert_eq!(func.call(-1000, -1000)?, 0);

    Ok(())
}

#[test]
fn test_i32_leu() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/relop.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("i32_leu")?;
    assert_eq!(func.call(0, 0)?, 1);
    assert_eq!(func.call(0, 1)?, 1);
    assert_eq!(func.call(-1000, -999)?, 1);
    assert_eq!(func.call(-1000, -1000)?, 1);
    assert_eq!(func.call(1000, 0)?, 0);

    Ok(())
}

#[test]
fn test_i32_gtu() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/relop.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("i32_gtu")?;
    assert_eq!(func.call(0, 0)?, 0);
    assert_eq!(func.call(0, 1)?, 0);
    assert_eq!(func.call(1, 0)?, 1);
    assert_eq!(func.call(1000, 999)?, 1);
    assert_eq!(func.call(-1000, -1000)?, 0);
    assert_eq!(func.call(-1000, 0)?, 1);

    Ok(())
}

#[test]
fn test_i32_ne() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/relop.wasm"))?;
    let mut instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i32, i32), i32>("i32_ne")?;
    assert_eq!(func.call(0, 0)?, 0);
    assert_eq!(func.call(0, 1)?, 1);
    assert_eq!(func.call(1, 0)?, 1);
    assert_eq!(func.call(1000, 999)?, 1);
    assert_eq!(func.call(1000, -1000)?, 1);
    assert_eq!(func.call(-1000, -1000)?, 0);

    Ok(())
}
