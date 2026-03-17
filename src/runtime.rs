use memmap2::{Mmap, MmapMut};
use std::mem;

use super::assembler::*;
use super::compiler::*;

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

pub struct Runtime {
    machinecode: Mmap,
    functions: Vec<WasmFunction>,
}

impl Runtime {
    /// # Safety
    ///
    /// This function casts the memory address to a function. The user **MUST** ensure that the signature used for the
    /// generic matches the actual function that is called.
    pub unsafe fn get_function<F>(&self, name: &str) -> F
    where
        F: Sized,
    {
        let value = self
            .functions
            .iter()
            .find(|&x| x.name == name)
            .expect("Requested function should be found");
        let ptr = self
            .machinecode
            .as_ptr()
            .wrapping_add(value.offset * aarch64::INSTRUCTION_SIZE);

        // Ensure validity, proper alignment and size for function pointers
        assert!(!ptr.is_null());
        assert_eq!((ptr as usize) % mem::align_of::<F>(), 0);
        assert_eq!(mem::size_of::<F>(), mem::size_of::<*const u8>());

        unsafe { mem::transmute_copy(&ptr) }
    }
}

pub fn instantiate_module(module: &LinkedModule) -> Runtime {
    // Allocate executable memory and copy JIT code into that region
    let bytes = bytemuck::cast_slice(&module.machinecode);
    assert!(!bytes.is_empty());
    let mut mmap = MmapMut::map_anon(bytes.len()).expect("map_anon() failed");
    mmap.copy_from_slice(bytes);

    // clear instruction cache on aarch64 target
    #[cfg(target_arch = "aarch64")]
    unsafe {
        clear_cache(mmap.as_mut_ptr(), mmap.len());
    }

    // set execution permissions
    let machinecode = mmap.make_exec().expect("make_exec() failed");
    Runtime {
        machinecode,
        functions: module.functions.to_vec(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn simple_jit_code() {
        let module = LinkedModule::new(
            vec![0x0b000020, 0xd65f03c0],
            vec![WasmFunction {
                name: String::from("test"),
                offset: 0,
                length: 2,
            }],
        );
        let instance = instantiate_module(&module);
        let _ = unsafe { instance.get_function::<fn()>("test") };
    }

    #[test]
    #[should_panic(expected = "!bytes.is_empty()")]
    fn invalid_jit_code() {
        let module = LinkedModule::new(
            vec![],
            vec![WasmFunction {
                name: String::from("empty"),
                offset: 0,
                length: 2,
            }],
        );
        let _ = instantiate_module(&module);
    }

    #[test]
    #[should_panic(expected = "should be found")]
    fn unknown_function() {
        let module = LinkedModule::new(
            vec![0x0b000020, 0xd65f03c0],
            vec![WasmFunction {
                name: String::from("test"),
                offset: 0,
                length: 2,
            }],
        );
        let instance = instantiate_module(&module);
        let _ = unsafe { instance.get_function::<fn()>("unknown") };
    }
}
