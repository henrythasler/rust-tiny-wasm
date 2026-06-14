use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_constants() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/float.wasm"))?;
    let instance = get_module_instance(&module)?;

    let func = instance.get_function::<(), f32>("get_pi_f32")?;
    let res = func.call()?;
    assert_eq!(res, std::f32::consts::PI);

    let func = instance.get_function::<(), f64>("get_e_f64")?;
    let res = func.call()?;
    assert_eq!(res, std::f64::consts::E);

    let func = instance.get_function::<(f32, f32), f32>("add_f32")?;
    let res = func.call(std::f32::consts::PI, std::f32::consts::E)?;
    assert_eq!(res, std::f32::consts::PI + std::f32::consts::E);

    let func = instance.get_function::<(f32, f32), f32>("add_f32")?;
    let res = func.call(f32::MIN, f32::MAX)?;
    assert_eq!(res, f32::MIN + f32::MAX);

    let func = instance.get_function::<(f32, f32), f32>("add_f32")?;
    let res = func.call(f32::MAX, f32::MAX)?;
    assert_eq!(res, f32::INFINITY);

    Ok(())
}
