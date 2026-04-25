use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_loop() -> Result<()> {
    let module = fs::read(Path::new(Path::new("tests/assets/loop.wasm")))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(i64,), i64>("loop_n")?;
    assert_eq!(func.call(10)?, 10);
    assert_eq!(func.call(1000)?, 1000);

    let func = instance.get_function::<(i64, i64), i64>("loop_nm")?;
    assert_eq!(func.call(10, 20)?, 10);
    assert_eq!(func.call(1000, 1234)?, 234);
    assert_eq!(func.call(-1000, -800)?, 200);

    Ok(())
}
