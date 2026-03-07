use bytemuck;
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
    pub fn get_function(&self) -> fn(i32, i32) -> i32 {
        unsafe { mem::transmute::<*const u8, fn(i32, i32) -> i32>(self.machinecode.as_ptr()) }
    }
}

pub fn get_module_instance(jit_code: &[u32]) -> Runtime {
    // Allocate executable memory and copy JIT code into that region
    let bytes = bytemuck::cast_slice(jit_code);
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
