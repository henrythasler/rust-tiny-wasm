use super::*;

/// wasm memory.grow: returns old size in pages, or u32::MAX (-1 as i32) on failure.
///
/// # Safety
/// This function is unsafe because it dereferences a raw pointer to the runtime context.
/// Make sure that the pointer is valid and points to a properly initialized `RuntimeCtx` before calling this function.
pub unsafe extern "C" fn memory_grow(ctx: *mut RuntimeCtx, delta_pages: u32) -> u32 {
    let ctx = unsafe { &mut *ctx };
    unsafe { ctx.memory_object.as_mut() }.map_or(u32::MAX, |linear_memory| {
        let current_pages = linear_memory.pages;
        let new_pages = current_pages + delta_pages as u64;

        // Check if the new size exceeds the maximum allowed pages; if it does, return u32::MAX (-1) to indicate failure.
        if new_pages > linear_memory.max_pages.unwrap_or(u64::MAX) {
            return u32::MAX;
        }

        println!(
            "memory_grow called with delta_pages: {}, current length: {}, max_length: {:?}",
            delta_pages, linear_memory.pages, linear_memory.max_pages
        );

        linear_memory.memory.resize((new_pages * WASM_PAGE_SIZE) as usize, 0);
        linear_memory.pages = new_pages;
        linear_memory.sync_to_context(ctx);

        println!(
            "memory_grow: ctx.memory_base: {:p}, ctx.memory_len_bytes: {}, ctx.memory_len_pages: {}",
            ctx.memory_base, ctx.memory_len_bytes, ctx.memory_len_pages
        );

        current_pages as u32
    })
}
