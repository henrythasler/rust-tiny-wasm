use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_constants() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/float.wasm"))?;
    let instance = get_module_instance(&module)?;

    let entrypoint = instance.get_function::<(), f32>("get_pi_f32")?;
    let res = entrypoint.call()?;
    assert_eq!(res, std::f32::consts::PI);

    let entrypoint = instance.get_function::<(), f64>("get_e_f64")?;
    let res = entrypoint.call()?;
    assert_eq!(res, std::f64::consts::E);

    Ok(())
}
