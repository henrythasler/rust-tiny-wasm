use super::*;

/// wasm memory.grow: returns old size in pages, or u32::MAX (-1 as i32) on failure.
///
/// # Safety
/// This function is unsafe because it dereferences a raw pointer to the runtime context.
/// Make sure that the pointer is valid and points to a properly initialized `RuntimeCtx` before calling this function.
pub unsafe extern "C" fn memory_grow(ctx: *mut RuntimeCtx, delta_pages: u32) -> u32 {
    let ctx = unsafe { &mut *ctx };
    unsafe { ctx.memory_object.as_mut() }.map_or(u32::MAX, |linear_memory| {
        let current_pages = linear_memory.grow(delta_pages);
        linear_memory.sync_to_context(ctx);

        // println!(
        //     "memory_grow called with delta_pages: {}, current length: {}, max_length: {:?}",
        //     delta_pages, current_pages, linear_memory.max_pages
        // );
        current_pages
    })
}
