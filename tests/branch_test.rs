use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_branch() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/branch.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i64,), i64>("simple_if")?;
    assert_eq!(func.call(-10)?, 1);
    assert_eq!(func.call(10)?, 1);
    assert_eq!(func.call(0)?, 1);

    let func = instance.get_function::<(i64,), i64>("simple_if_return")?;
    assert_eq!(func.call(-10)?, -1);
    assert_eq!(func.call(10)?, 1);
    assert_eq!(func.call(0)?, 1);

    let func = instance.get_function::<(i64,), i64>("simple_if_else")?;
    assert_eq!(func.call(-10)?, -1);
    assert_eq!(func.call(10)?, 1);
    assert_eq!(func.call(0)?, 1);

    let func = instance.get_function::<(i64,), i64>("simple_if_add1")?;
    assert_eq!(func.call(-1)?, 0);
    assert_eq!(func.call(-10)?, 0);
    assert_eq!(func.call(1)?, 2);
    assert_eq!(func.call(10)?, 2);

    let func = instance.get_function::<(i64,), i64>("nested_if")?;
    assert_eq!(func.call(10)?, 1);
    assert_eq!(func.call(-1)?, -10);
    assert_eq!(func.call(-11)?, -100);

    let func = instance.get_function::<(i64,), i64>("nested_else")?;
    assert_eq!(func.call(-10)?, -1);
    assert_eq!(func.call(1)?, 10);
    assert_eq!(func.call(11)?, 100);

    let func = instance.get_function::<(i64,), i64>("nested_else_add1")?;
    assert_eq!(func.call(-10)?, 0);
    assert_eq!(func.call(1)?, 11);
    assert_eq!(func.call(11)?, 101);

    Ok(())
}
