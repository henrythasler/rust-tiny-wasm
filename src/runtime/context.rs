#[derive(Debug, Default)]
#[repr(C)]
pub struct RuntimeCtx {
    pub jit_base: *const u8,
    pub jit_len: u32,
    pub _pad1: u32, // keep 8-byte alignment for the pointer below
    pub func_table_base: *mut FuncTableElement, // ptr to funcref table (heap-allocated, NOT in code buffer)
    pub func_table_len: u32,
    pub _pad2: u32,           // keep 8-byte alignment for the pointer below
    pub memory_base: *mut u8, // linear memory base, if you have one
    pub memory_len: u32,
    pub _pad3: u32, // keep 8-byte alignment for the pointer below
    pub globals_base: *mut i64,
    pub host_call: *const u8, // fn ptr for calling back into Rust (see §5)
                              // ... add fields as needed, but NEVER reorder existing ones once JIT code
                              //     has been generated referencing their offsets — you'll break old code silently.
}

pub mod ctx_offsets {
    pub const JIT_BASE: u32 = 0;
    pub const JIT_LEN: u32 = 8;
    pub const FUNC_TABLE_BASE: u32 = 16;
    pub const FUNC_TABLE_LEN: u32 = 24;
    pub const MEMORY_BASE: u32 = 32;
    pub const MEMORY_LEN: u32 = 40;
    pub const GLOBALS_BASE: u32 = 48;
    pub const HOST_CALL: u32 = 56;
}

#[derive(Debug, Clone)]
#[repr(C)]
pub struct FuncTableElement {
    pub code_ptr: *const u8,
    pub type_id: u32,
    _pad: u32, // keep 16-byte alignment for each element
}

pub mod func_table_offsets {
    pub const CODE_PTR: u32 = 0;
    pub const TYPE_ID: u32 = 8;
}

#[derive(Debug, Clone)]
pub struct FuncTable {
    pub elements: Vec<FuncTableElement>,
}

impl FuncTable {
    pub fn new(initial_len: usize) -> Self {
        let elements = vec![
            FuncTableElement {
                code_ptr: std::ptr::null(),
                type_id: u32::MAX,
                _pad: 0,
            };
            initial_len
        ];
        FuncTable { elements }
    }

    // called once at instantiation, and again after any grow
    pub fn sync_to_context(&mut self, ctx: &mut RuntimeCtx) {
        ctx.func_table_base = self.elements.as_mut_ptr();
        ctx.func_table_len = self.elements.len() as u32;
    }
}
