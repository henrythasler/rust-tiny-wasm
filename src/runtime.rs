use bytemuck;
use memmap2::{Mmap, MmapMut};
use std::mem;

pub struct Runtime {
    machinecode: Mmap,
}

impl Runtime {
    pub fn get_function(&self) -> fn(i32, i32) -> i32 {
        unsafe { mem::transmute(self.machinecode.as_ptr()) }
    }
}

pub fn get_module_instance(jit_code: &[u32]) -> Runtime {
    // Allocate executable memory
    let bytes = bytemuck::cast_slice(jit_code);
    let mut mmap = MmapMut::map_anon(bytes.len()).expect("map_anon() failed");
    mmap.copy_from_slice(bytes);

    #[cfg(target_arch = "aarch64")]
    clear_cache(0, 0);

    let machinecode = mmap.make_exec().expect("make_exec() failed");

    Runtime { machinecode }
}
