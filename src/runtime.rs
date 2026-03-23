use memmap2::{Mmap, MmapMut};
use std::mem;

use super::assembler::*;
use super::compiler::*;
use super::*;

#[cfg(target_arch = "aarch64")]
unsafe fn clear_cache(addr: *mut u8, len: usize) {
    // Use libc function
    unsafe extern "C" {
        fn __clear_cache(start: *mut u8, end: *mut u8);
    }
    unsafe {
        __clear_cache(addr, addr.add(len));
    }
}

#[derive(Debug)]
pub struct Runtime {
    machinecode: Mmap,
    functions: Vec<WasmFunction>,
}

impl Runtime {
    /// # Safety
    ///
    /// This function casts the memory address to a function. The user **MUST** ensure that the signature used for the
    /// generic matches the actual function that is called.
    pub unsafe fn get_function<F>(&self, name: &str) -> Result<F>
    where
        F: Sized,
    {
        let function =
            self.functions
                .iter()
                .find(|&x| x.name == name)
                .ok_or(TinyWasmError::Runtime(format!(
                    "Function '{}' not found in module exports",
                    name
                )))?;
        let ptr = self
            .machinecode
            .as_ptr()
            .wrapping_add(function.offset * aarch64::INSTRUCTION_SIZE);

        // Ensure validity, proper alignment and size for function pointers
        assert!(!ptr.is_null());
        assert_eq!((ptr as usize) % mem::align_of::<F>(), 0);
        assert_eq!(mem::size_of::<F>(), mem::size_of::<*const u8>());

        Ok(unsafe { mem::transmute_copy(&ptr) })
    }

    // /// Calls a WebAssembly function by name with the given argument and returns the result.
    // ///
    // /// The function is expected to return a tuple of (value, tag), where 'value' is the actual return value and 'tag' indicates whether the call was successful (0) or resulted in a trap (1). The result is returned as a `Result<R>`, where `R` is the expected return type of the WebAssembly function.
    // ///
    // /// # Safety
    // ///
    // /// This function calls a WebAssembly function by name
    // pub unsafe fn call_function<P, R: Into<i64>>(&self, name: &str, arg: P) -> Result<R> {
    //     let entrypoint = unsafe { self.get_function::<unsafe extern "C" fn(P) -> (R, i64)>(name) }?;

    //     let (value, tag) = unsafe { entrypoint(arg) };
    //     let result: Result<R> = match tag {
    //         0 => Ok(value),
    //         1 => Err(TinyWasmError::Trap(TrapCode::from_code(value.into()))),
    //         _ => Err(TinyWasmError::Runtime(format!(
    //             "Invalid result tag: {}",
    //             tag
    //         ))),
    //     };
    //     result
    // }
}

pub fn wrap_result<R: Into<i64>>(res: (R, i64)) -> Result<R> {
    let result: Result<R> = match res.1 {
        0 => Ok(res.0),
        1 => Err(TinyWasmError::Trap(TrapCode::from_code(res.0.into()))),
        _ => Err(TinyWasmError::Runtime(format!(
            "Invalid result tag: {}",
            res.1
        ))),
    };
    result
}

#[macro_export]
macro_rules! define_handler {
    (
        $(
            fn $method_name:ident($name:expr, 
                $($param:ident: $param_type:ty),*
            ) -> $return_type:ty
        );* $(;)?
    ) => {
        impl Runtime {
            $(
                pub fn $method_name(&self, $($param: $param_type),*) -> Result<$return_type> {
                    let func = unsafe { self.get_function::<fn($($param: $param_type),*) -> ($return_type, i64)>($name) }?;
                    let (value, tag) = func($($param),*);
                    wrap_result((value, tag))
                }
            )*
        }
    };
}

// define_handler! {
//     fn call_get_first("get_first", a: i32, b:i32) -> i32;
// }

pub fn instantiate_module(module: &LinkedModule) -> Result<Runtime> {
    // Allocate executable memory and copy JIT code into that region
    let bytes = bytemuck::cast_slice(&module.machinecode);
    if bytes.is_empty() {
        return Err(TinyWasmError::Runtime(String::from("JIT code is empty")));
    }
    let mut mmap = MmapMut::map_anon(bytes.len()).expect("map_anon() failed");
    mmap.copy_from_slice(bytes);

    // clear instruction cache on aarch64 target
    #[cfg(target_arch = "aarch64")]
    unsafe {
        clear_cache(mmap.as_mut_ptr(), mmap.len());
    }

    // set execution permissions
    let machinecode = mmap.make_exec().expect("make_exec() failed");
    Ok(Runtime {
        machinecode,
        functions: module.functions.to_vec(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn simple_jit_code() -> Result<()> {
        let module = LinkedModule::new(
            vec![0x0b000020, 0xd65f03c0],
            vec![WasmFunction {
                name: String::from("test"),
                offset: 0,
                length: 2,
            }],
        );
        let instance = instantiate_module(&module)?;
        let _ = unsafe { instance.get_function::<fn()>("test")? };
        Ok(())
    }

    #[test]
    fn invalid_result_tag() -> Result<()> {
        let module = LinkedModule::new(
            // result tag in X1 is 255, which is invalid
            vec![0xAA1F03E0, 0xD2801FE1, 0xd65f03c0], // [MOV X0, XZR; MOV X1, 0xFF; RET]
            vec![WasmFunction {
                name: String::from("invalid_result"),
                offset: 0,
                length: 2,
            }],
        );
        let instance = instantiate_module(&module)?;
        let func = unsafe { instance.get_function::<fn() -> (i32, i64)>("invalid_result") }?;
        let res = wrap_result::<i32>(func());
        assert!(
            matches!(res.unwrap_err(), TinyWasmError::Runtime(msg) if msg.contains("result tag"))
        );
        Ok(())
    }

    #[test]
    fn trap_code() -> Result<()> {
        let module = LinkedModule::new(
            // Tag in X1 is 1, which indicates a trap
            // Value in X0 is 0, which is TrapCode::None
            vec![0xAA1F03E0, 0xD2800021, 0xd65f03c0], // [MOV X0, XZR; MOV X1, 1; RET]
            vec![WasmFunction {
                name: String::from("trap_code"),
                offset: 0,
                length: 2,
            }],
        );
        let instance = instantiate_module(&module)?;
        let func = unsafe { instance.get_function::<fn() -> (i32, i64)>("trap_code") }?;
        let res = wrap_result::<i32>(func());
        assert!(matches!(res.unwrap_err(), TinyWasmError::Trap(value) if value==TrapCode::None));
        Ok(())
    }

    #[test]
    fn invalid_jit_code() -> Result<()> {
        let module = LinkedModule::new(
            vec![],
            vec![WasmFunction {
                name: String::from("empty"),
                offset: 0,
                length: 2,
            }],
        );
        assert_eq!(
            instantiate_module(&module).unwrap_err(),
            TinyWasmError::Runtime(String::from("JIT code is empty"))
        );
        Ok(())
    }

    #[test]
    fn unknown_function() -> Result<()> {
        let module = LinkedModule::new(
            vec![0x0b000020, 0xd65f03c0],
            vec![WasmFunction {
                name: String::from("test"),
                offset: 0,
                length: 2,
            }],
        );
        let instance = instantiate_module(&module)?;
        assert_eq!(
            unsafe { instance.get_function::<fn()>("unknown") }.unwrap_err(),
            TinyWasmError::Runtime(String::from(
                "Function 'unknown' not found in module exports"
            ))
        );
        Ok(())
    }
}
