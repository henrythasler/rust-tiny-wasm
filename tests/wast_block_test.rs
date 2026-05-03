// @generated — do not edit by hand

use std::fs;
use std::path::Path;
use tiny_wasm::*;

#[test]
fn test_block_0() -> Result<()> {
    let module = fs::read(Path::new("tests/assets/wast/block_0.wasm"))?;
    let instance = get_module_instance(&module)?;
    
    let func = instance.get_function::<(), ()>("type-i32")?;
        func.call()?;
        
    let func = instance.get_function::<(), ()>("type-i64")?;
        func.call()?;
        
    let func = instance.get_function::<(), i32>("type-i32-value")?;
        assert_eq!(func.call()?, 1);
        
    let func = instance.get_function::<(), i64>("type-i64-value")?;
        assert_eq!(func.call()?, 2);
        
    let func = instance.get_function::<(i32, ), i32>("as-block-first")?;
        assert_eq!(func.call(0)?, 2);
        assert_eq!(func.call(1)?, 3);
        
    let func = instance.get_function::<(i32, ), i32>("as-block-first-value")?;
        assert_eq!(func.call(0)?, 11);
        assert_eq!(func.call(1)?, 10);
        
    let func = instance.get_function::<(), i32>("as-binary-left")?;
        assert_eq!(func.call()?, 1);
        
    let func = instance.get_function::<(), i32>("as-binary-right")?;
        assert_eq!(func.call()?, 1);
        
    let func = instance.get_function::<(), i32>("as-test-operand")?;
        assert_eq!(func.call()?, 0);
        
    let func = instance.get_function::<(), i32>("as-compare-left")?;
        assert_eq!(func.call()?, 1);
        
    let func = instance.get_function::<(), i32>("as-compare-right")?;
        assert_eq!(func.call()?, 1);
        
    let func = instance.get_function::<(), i32>("as-br_if-value")?;
        assert_eq!(func.call()?, 8);
        
    let func = instance.get_function::<(), i32>("as-br_if-value-cond")?;
        assert_eq!(func.call()?, 9);
        
    let func = instance.get_function::<(), i32>("nested-br-value")?;
        assert_eq!(func.call()?, 9);
        
    let func = instance.get_function::<(), i32>("nested-br_if-value")?;
        assert_eq!(func.call()?, 9);
        Ok(())
}
