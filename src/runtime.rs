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
