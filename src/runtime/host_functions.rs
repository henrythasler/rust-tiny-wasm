use super::*;

/// wasm memory.grow: returns old size in pages, or u32::MAX (-1 as i32) on failure.
pub unsafe extern "C" fn memory_grow(ctx: *mut RuntimeCtx, delta_pages: u32) -> u32 {
    let _ctx = unsafe { &mut *ctx };
    // let res = ctx.memory_object.as_mut().map_or(u32::MAX, |mem| {
    //     let old_len = mem.length;
    //     let new_len = old_len.checked_add(delta_pages as u64);
    //     match new_len {
    //         Some(new_len) => {
    //             if let Some(max_len) = mem.max_length {
    //                 if new_len > max_len {
    //                     return u32::MAX;
    //                 }
    //             }
    //             mem.memory.resize(new_len as usize, 0);
    //             mem.length = new_len;
    //             ctx.memory_base = mem.memory.as_mut_ptr();
    //             ctx.memory_len_bytes = new_len;
    //             ctx.memory_len_pages = (new_len / WASM_PAGE_SIZE as u64) as u32;
    //             old_len as u32
    //         }
    //         None => u32::MAX,
    //     }
    // });
    print!("memory.grow called with delta_pages: {}\n", delta_pages);
    delta_pages
}
