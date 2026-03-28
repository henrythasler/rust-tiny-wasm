use memmap2::{Mmap, MmapMut};
use std::mem;

use super::Result;
use super::assembler::*;
use super::compiler::*;
use debugger::*;

mod debugger;

#[derive(Debug, PartialEq, Eq)]
pub enum TrapCode {
    None,
}

impl TrapCode {
    pub fn from_code(code: i64) -> Self {
        match code {
            0 => TrapCode::None,
            _ => panic!("Unknown error code: {}", code),
        }
    }
}

#[derive(Debug, PartialEq, Eq)]
pub enum TinyWasmError {
    Io(std::io::ErrorKind),
    Parser(String),
    Compiler(String),
    Runtime(String),
    Trap(TrapCode),
}

impl From<std::io::Error> for TinyWasmError {
    fn from(err: std::io::Error) -> Self {
        TinyWasmError::Io(err.kind())
    }
}

impl From<wasmparser::BinaryReaderError> for TinyWasmError {
    fn from(err: wasmparser::BinaryReaderError) -> Self {
        TinyWasmError::Parser(err.message().to_string())
    }
}

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
pub struct Callable<P, R> {
    ptr: *const u8,
    _marker: std::marker::PhantomData<fn(P) -> R>,
}

impl<P, R> Callable<P, R> {
    /// This function casts the memory address to a function.
    ///
    /// # Safety
    /// The user **MUST** ensure that the signature used for the
    /// generic matches the actual function that is called.
    pub unsafe fn new(ptr: *const u8) -> Self
    where
        R: Into64,
    {
        Self {
            ptr,
            _marker: std::marker::PhantomData,
        }
    }
}

macro_rules! impl_call {
    () => {
        impl<R> Callable<(), R>
        where
        R: Into64,
        {
            pub fn call(&self) -> Result<R> {
                let res = unsafe {
                let func: extern "C" fn() -> (R, i64) =
                    std::mem::transmute(self.ptr);
                set_breakpoint();
                func()
                };
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
        }
    };

    ($($arg:ident),+) => {
        impl<$($arg,)+ R> Callable<($($arg,)+), R>
        where
        R: Into64,
         {
            #[allow(non_snake_case)]
            #[allow(clippy::too_many_arguments)]
            /// This function calls the JIT-compiled WebAssembly function with the provided arguments and returns the result.
            ///
            /// The function is expected to return a tuple of (value, tag), where 'value' is the actual return value and 'tag'
            /// indicates whether the call was successful (0) or resulted in a trap (1).
            /// The result is returned as a `Result<R>`, where `R` is the expected return type of the WebAssembly function.
            pub fn call(
                &self,
                $($arg: $arg),+
            ) -> Result<R> {
                let res = unsafe {
                let func: extern "C" fn($($arg),+) -> (R, i64) =
                    std::mem::transmute(self.ptr);
                set_breakpoint();
                func($($arg),+)
                };
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
        }
    };
}

impl_call!();
impl_call!(A);
impl_call!(A, B);
impl_call!(A, B, C);
impl_call!(A, B, C, D);
impl_call!(A, B, C, D, E);
impl_call!(A, B, C, D, E, F);
impl_call!(A, B, C, D, E, F, G);
impl_call!(A, B, C, D, E, F, G, H);

pub trait Into64 {
    fn into(self) -> i64;
}

impl Into64 for i32 {
    fn into(self) -> i64 {
        self as i64
    }
}

impl Into64 for i64 {
    fn into(self) -> i64 {
        self
    }
}

// For void functions:
impl Into64 for () {
    fn into(self) -> i64 {
        0
    } // or panic if you never use it
}

#[derive(Debug)]
pub struct Runtime {
    machinecode: Mmap,
    functions: Vec<WasmFunction>,
}

impl Runtime {
    pub fn get_function<P, R>(&self, name: &str) -> Result<Callable<P, R>>
    where
        R: Into64,
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

        assert!(!ptr.is_null());
        assert_eq!((ptr as usize) % mem::align_of::<extern "C" fn(P) -> R>(), 0);
        assert_eq!(
            mem::size_of::<extern "C" fn(P) -> R>(),
            mem::size_of::<*const u8>()
        );

        let callable = unsafe { Callable::<P, R>::new(ptr) };
        Ok(callable)
    }
}

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
    fn into64_test() {
        assert_eq!(Into64::into(1i64), 1);
        assert_eq!(Into64::into(1i32), 1);
        assert_eq!(Into64::into(()), 0);
    }

    #[test]
    #[should_panic]
    fn unknown_trapcode() {
        let _ = TrapCode::from_code(0xdead);
    }

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
        let _ = instance.get_function::<(), i32>("test")?;
        Ok(())
    }

    #[test]
    fn void_fn() -> Result<()> {
        let module = LinkedModule::new(
            // does not return anything
            vec![0xAA1F03E0, 0xAA1F03E1, 0xd65f03c0], // [MOV X0, XZR; MOV X1, XZR; RET]
            vec![WasmFunction {
                name: String::from("void"),
                offset: 0,
                length: 3,
            }],
        );
        let instance = instantiate_module(&module)?;
        let func = instance.get_function::<(), ()>("void")?;
        let res = func.call()?;
        assert_eq!(res, ());
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
                length: 3,
            }],
        );
        let instance = instantiate_module(&module)?;
        let func = instance.get_function::<(), i64>("invalid_result")?;
        let res = func.call();
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
                length: 3,
            }],
        );
        let instance = instantiate_module(&module)?;
        let func = instance.get_function::<(), i32>("trap_code")?;
        let res = func.call();
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
                length: 0,
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
            instance.get_function::<(), i32>("unknown").unwrap_err(),
            TinyWasmError::Runtime(String::from(
                "Function 'unknown' not found in module exports"
            ))
        );
        Ok(())
    }
}
