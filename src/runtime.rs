use memmap2::{Mmap, MmapMut};
use std::mem;

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
}

impl Runtime {
    /// # Safety
    ///
    /// This function casts the memory address to a function. The user **MUST** ensure that the signature used for the
    /// generic matches the actual function that is called.
    pub unsafe fn get_function<F>(&self) -> F
    where
        F: Sized,
    {
        let ptr = self.machinecode.as_ptr();

        // Ensure validity, proper alignment and size for function pointers
        assert!(!ptr.is_null());
        assert_eq!((ptr as usize) % mem::align_of::<F>(), 0);
        assert_eq!(mem::size_of::<F>(), mem::size_of::<*const u8>());

        unsafe { mem::transmute_copy(&ptr) }
    }
}

pub fn get_jit_instance(jit_code: &[u32]) -> Runtime {
    // Allocate executable memory and copy JIT code into that region
    let bytes = bytemuck::cast_slice(jit_code);
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
    Runtime { machinecode }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn simple_jit_code() {
        let jit_code: Vec<u32> = vec![0x0b000020, 0xd65f03c0];
        get_jit_instance(&jit_code);
    }

    #[test]
    #[should_panic(expected = "!bytes.is_empty()")]
    fn invalid_jit_code() {
        let jit_code: Vec<u32> = vec![];
        get_jit_instance(&jit_code);
    }
}
