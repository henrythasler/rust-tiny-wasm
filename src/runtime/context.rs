use super::*;

pub const WASM_PAGE_SIZE: u64 = 65536; // 64 KiB

#[derive(Debug, Default)]
#[repr(C)]
pub struct RuntimeCtx {
    pub jit_base: *const u8,
    pub jit_len: u32,
    pub _pad1: u32, // keep 8-byte alignment for the pointer below
    pub func_table_base: *mut FuncTableElement, // ptr to funcref table (heap-allocated, NOT in code buffer)
    pub func_table_len: u32,
    pub _pad2: u32, // keep 8-byte alignment for the pointer below
    pub memory_object: *mut LinearMemory, // ptr to linear memory object (heap-allocated, NOT in code buffer)
    pub memory_base: *mut u8,             // linear memory base, if you have one; otherwise NULL
    pub memory_len_bytes: u64,
    pub memory_len_pages: u32,
    pub _pad3: u32, // keep 8-byte alignment for the pointer below
    pub globals_base: *mut i64,
    pub hostfn_base: *const usize, // fn ptr for calling back into Rust for builtins (e.g. memory.grow, etc.)
}

pub mod ctx_offsets {
    pub const JIT_BASE: u32 = 0;
    pub const JIT_LEN: u32 = 8;
    pub const FUNC_TABLE_BASE: u32 = 16;
    pub const FUNC_TABLE_LEN: u32 = 24;
    pub const MEMORY_OBJECT: u32 = 32;
    pub const MEMORY_BASE: u32 = 40;
    pub const MEMORY_LEN_BYTES: u32 = 48;
    pub const MEMORY_LEN_PAGES: u32 = 56;
    pub const GLOBALS_BASE: u32 = 64;
    pub const HOSTFN_BASE: u32 = 72;
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

#[derive(Debug)]
pub struct LinearMemory {
    pub memory: Vec<u8>,
    pub length: u64,
    pub max_length: Option<u64>,
}

impl LinearMemory {
    pub fn new(initial_len: u64, max_len: Option<u64>) -> Self {
        let memory = vec![0; initial_len as usize];
        LinearMemory {
            memory,
            length: initial_len,
            max_length: max_len,
        }
    }

    pub fn sync_to_context(&mut self, ctx: &mut RuntimeCtx) {
        ctx.memory_base = self.memory.as_mut_ptr();
        ctx.memory_len_bytes = self.length;
        ctx.memory_len_pages = (self.length / WASM_PAGE_SIZE) as u32;
    }
}

pub mod hostfn_offsets {
    pub const MEMORY_GROW: u32 = 0;
}

#[derive(Debug, Clone)]
pub struct HostFunctions {
    pub elements: Vec<usize>,
}

impl Default for HostFunctions {
    fn default() -> Self {
        Self::new()
    }
}

impl HostFunctions {
    pub fn new() -> Self {
        let elements = vec![0; 1]; // currently only memory.grow
        Self { elements }
    }

    pub fn sync_to_context(&mut self, ctx: &mut RuntimeCtx) {
        self.elements[0] = memory_grow as *const () as usize;
        ctx.hostfn_base = self.elements.as_ptr();
    }
}
