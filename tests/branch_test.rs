use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_branch() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/branch.wasm")))?;
    let instance = get_module_instance(&module)?;

    let simple_if = instance.get_function::<(i64,), i64>("simple_if")?;
    assert_eq!(simple_if.call(-10)?, -1);
    assert_eq!(simple_if.call(10)?, 1);

    Ok(())
}
