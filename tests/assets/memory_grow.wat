(module
  (memory 1)
  (global $__stack_pointer (;0;) (mut i32) (i32.const 9232))
  (export "load_i64" (func $load_i64))
  (export "store_i64" (func $store_i64))
  (export "memory_size" (func $memory_size))
  (export "memory_size_bytes" (func $memory_size_bytes))
  (export "memory_grow" (func $memory_grow))
  (export "loop" (func $loop))
  (func $load_i64 (param $index i32) (result i64)
    local.get $index
    i64.load
    i64.const 0 ;; make sure we got the correct valtype on the stack
    i64.or
  )
  (func $store_i64 (param $index i32) (param $value i64) (result i64)
    local.get $index
    local.get $value
    i64.store
    local.get $index
    i64.load
  )
  (func $memory_size (result i32)
    memory.size
  )
  (func $memory_size_bytes (result i32)
    memory.size
    i32.const 0x10000
    i32.mul
  )
  (func $memory_grow (param $pages i32) (result i32)
    local.get $pages
    memory.grow
  )
;; Initializes a 32-bit integer to 10 at offset 12 from the base address $var0.
;; The offset is a byte displacement added to $var0 to calculate the effective memory address.
;; Since $var0 points to a 16-byte stack allocation, offset 12 accesses the final 4 bytes
;; of that region. The i32.store instruction writes 4 bytes at $var0 + 12, and i32.load
;; reads the same 4 bytes to retrieve the integer.
;; The loop compares the loaded value against 20, increments it by 1, and stores the
;; updated value back at the same offset until the value reaches 20.  
  (func $loop (result i32)
    (local $var0 i32)
    i32.const 1
    memory.grow
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set $var0
    local.get $var0
    i32.const 10
    i32.store offset=12
    block $label0
      loop $label1
        local.get $var0
        i32.load offset=12
        i32.const 20
        i32.lt_s
        i32.const 1
        i32.and
        i32.eqz
        br_if $label0
        local.get $var0
        local.get $var0
        i32.load offset=12
        i32.const 1
        i32.add
        i32.store offset=12
        br $label1
      end $label1
    end $label0
    i32.const 0
    return
  )
)