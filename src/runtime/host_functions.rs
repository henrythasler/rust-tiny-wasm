use super::*;

/// wasm memory.grow: returns old size in pages, or u32::MAX (-1 as i32) on failure.
///
/// # Safety
/// This function is unsafe because it dereferences a raw pointer to the runtime context.
/// Make sure that the pointer is valid and points to a properly initialized `RuntimeCtx` before calling this function.
pub unsafe extern "C" fn memory_grow(ctx: *mut RuntimeCtx, delta_pages: u32) -> u32 {
    let ctx = unsafe { &mut *ctx };
    unsafe { ctx.memory_object.as_mut() }.map_or(u32::MAX, |linear_memory| {
        let current_len = linear_memory.length;
        let new_len = current_len + delta_pages as u64 * WASM_PAGE_SIZE;

        if new_len > linear_memory.max_length.unwrap_or(u64::MAX) {
            return u32::MAX;
        }

        println!(
            "memory_grow called with delta_pages: {}, current length: {}, max_length: {:?}",
            delta_pages, linear_memory.length, linear_memory.max_length
        );

        linear_memory.memory.resize(new_len as usize, 0);
        linear_memory.length = new_len;
        linear_memory.sync_to_context(ctx);

        println!(
            "memory_grow: ctx.memory_base: {:p}, ctx.memory_len_bytes: {}, ctx.memory_len_pages: {}",
            ctx.memory_base, ctx.memory_len_bytes, ctx.memory_len_pages
        );

        (current_len / WASM_PAGE_SIZE) as u32
    })
}
