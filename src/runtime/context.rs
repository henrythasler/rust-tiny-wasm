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
    pub memory_len_pages: u64,
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
    mmap: MmapMut,
    pub pages: u64,
    pub max_pages: u64,
}

impl LinearMemory {
    pub fn new(initial_pages: u64, max_pages: Option<u64>) -> Self {
        // max_pages is optional; if not provided, we default to the maximum possible number of pages allowed by the Wasm spec (u16::MAX).
        let max_pages = max_pages.unwrap_or(u16::MAX as u64);
        assert!(
            max_pages <= u16::MAX as u64,
            "max_pages must be less than or equal to u16::MAX"
        );
        let reserve_bytes = (max_pages * WASM_PAGE_SIZE) as usize;

        // reserve the full address space up front, but don't commit any physical memory yet. This allows us to grow the linear memory without moving the base pointer.
        let mmap = MmapMut::map_anon(reserve_bytes).expect("Failed to map linear memory");
        LinearMemory {
            mmap,
            pages: initial_pages,
            max_pages,
        }
    }

    /// Grows the linear memory by the specified number of pages.
    ///
    /// By using `mmap` to reserve the full address space up front, grow becomes pure bookkeeping — no syscall, no pointer movement, memory_base fixed for the life of the object.
    ///
    /// # Evaluation
    ///
    /// ## Pro
    /// hardware-trap guard pages. Since the whole max_pages region is RW from construction, a codegen bounds-check bug that lets an access past your current pages but still within max_pages will silently succeed and corrupt live Wasm memory instead of faulting — you won't get the SIGSEGV safety net for that range, only for accesses past max_pages entirely (which falls outside the mapping and does fault).
    ///
    /// ## Con
    /// simplicity, and you still have your explicit cmp/b.ls bounds check in codegen doing the real enforcement against pages, not against max_pages. The hardware fault was always a second line of defense, not your primary mechanism — your primary mechanism is the JIT bounds check you're already generating correctly (once the unit bug and pointer-staleness bug are fixed).
    ///
    /// # Alternative Solution
    ///
    /// reserve the full 4GB (or max_pages worth) of virtual address space up front via mmap, but only back a small portion with physical pages — so memory_base never needs to move, ever, regardless of how many times memory.grow is called.
    ///
    /// [Certain] Wasm32 linear memory addresses are 32-bit offsets, so the theoretical max is 4GiB. Virtual address space is cheap — reserving 4GiB of it costs you nothing until pages are actually touched. The trick: separate "reserve address space" from "commit physical memory."
    ///
    /// ## How it works
    /// - Reserve: Call mmap with PROT_NONE (or no read/write) for the full max size — either 4GiB, or max_pages * WASM_PAGE_SIZE if the module declares a maximum. This just claims a range of virtual addresses; the kernel doesn't allocate physical pages or commit any actual memory. memory_base is set once, here, and never changes again.
    /// - Commit incrementally: When the memory starts (initial pages) or grows, call mprotect on just the newly-needed range to flip it to PROT_READ | PROT_WRITE. The kernel then lazily backs those pages with physical memory on first touch (demand paging) — you're not pre-zeroing or allocating anything beyond what's committed.
    /// - memory.grow becomes mprotect, not realloc: Growing from 1 page to 2 pages is just extending the PROT_READ|WRITE region by WASM_PAGE_SIZE bytes, starting at the same base pointer. No copy, no pointer invalidation, no need to re-sync ctx.memory_base anywhere.
    pub fn grow(&mut self, delta_pages: u32) -> u32 {
        let new_pages = self.pages + delta_pages as u64;
        if new_pages > self.max_pages {
            return u32::MAX;
        }
        let current_pages = self.pages;
        self.pages = new_pages;
        current_pages as u32
    }

    pub fn initialize_from_data(&mut self, offset: usize, data: &[u8]) {
        let end_offset = (offset + data.len()) as u64;
        if end_offset > self.max_pages * WASM_PAGE_SIZE {
            panic!(
                "Data segment exceeds linear memory bounds ({} pages)",
                self.max_pages
            );
        }
        self.mmap[offset..end_offset as usize].copy_from_slice(data);
        self.pages = end_offset.div_ceil(WASM_PAGE_SIZE);
    }

    pub fn sync_to_context(&mut self, ctx: &mut RuntimeCtx) {
        ctx.memory_base = self.mmap.as_mut_ptr();
        ctx.memory_len_bytes = self.pages * WASM_PAGE_SIZE;
        ctx.memory_len_pages = self.pages;
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
