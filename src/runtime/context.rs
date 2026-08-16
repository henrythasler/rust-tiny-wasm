#[derive(Default)]
#[repr(C)]
pub struct RuntimeCtx {
    pub func_table_base: *mut TableElement,  // ptr to funcref table (heap-allocated, NOT in code buffer)
    pub func_table_len: u32,
    pub _pad: u32,                      // keep 8-byte alignment for the pointer below
    pub memory_base: *mut u8,           // linear memory base, if you have one
    pub memory_len: u32,
    pub globals_base: *mut u8,
    pub host_call: *const u8,           // fn ptr for calling back into Rust (see §5)
    // ... add fields as needed, but NEVER reorder existing ones once JIT code
    //     has been generated referencing their offsets — you'll break old code silently.
}

#[derive(Clone)]
#[repr(C)]
pub struct TableElement {
    pub code_ptr: *const u8,
    pub type_id: u32,
    pub _pad: u32,
}

pub mod ctx_offsets {
    pub const FUNC_TABLE_BASE: i32 = 0;
    pub const FUNC_TABLE_LEN: i32 = 8;
    pub const MEMORY_BASE: i32 = 16;
    pub const MEMORY_LEN: i32 = 24;
    pub const GLOBALS_BASE: i32 = 32;
    pub const HOST_CALL: i32 = 40;
}

pub struct WasmTable {
    elements: Vec<TableElement>,
}

impl WasmTable {
    pub fn new(initial_len: usize) -> Self {
        let elements = vec![
            TableElement { code_ptr: std::ptr::null(), type_id: u32::MAX, _pad: 0 };
            initial_len
        ];
        WasmTable { elements }
    }

    // called once at instantiation, and again after any grow
    pub fn sync_to_context(&mut self, ctx: &mut RuntimeCtx) {
        ctx.func_table_base = self.elements.as_mut_ptr();
        ctx.func_table_len = self.elements.len() as u32;
    }
}