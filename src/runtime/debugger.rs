/// This function is used to trigger a breakpoint for debugging purposes.
///
/// It uses architecture-specific assembly instructions to cause a trap if the `QEMU_DEBUG` environment variable is set, allowing developers to inspect the state of the program at that point.
///
/// # Notes
/// - On x86_64, it uses the `int3` instruction, which is a software breakpoint interrupt.
/// - On aarch64, it uses the `brk #0` instruction, which is a breakpoint instruction that causes a trap to the debugger.
///
/// # Important
///
/// `set $pc = $pc + 4` must be used to skip the breakpoint instruction itself when resuming execution after hitting the breakpoint.
///
/// # Example
///
/// ```bash
/// QEMU_DEBUG=1 qemu-aarch64 -L /usr/aarch64-linux-gnu/ -g 1234 target/aarch64-unknown-linux-gnu/debug/tiny-wasm
/// ```
#[inline(always)]
pub fn set_breakpoint() {
    // check for environment variable to determine if we should trigger a breakpoint
    if std::env::var_os("QEMU_DEBUG").is_some() {
        #[cfg(target_arch = "x86_64")]
        unsafe {
            std::arch::asm!("int3");
        }

        #[cfg(target_arch = "aarch64")]
        unsafe {
            std::arch::asm!("brk #0");
        }
    }
}
