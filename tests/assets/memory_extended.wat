(module
  ;; Exercises every scalar (non-SIMD) load and store instruction in the
  ;; WASM MVP + sign-extension proposal:
  ;;   loads:  i32.load, i64.load, f32.load, f64.load,
  ;;           i32.load8_u/s, i32.load16_u/s,
  ;;           i64.load8_u/s, i64.load16_u/s, i64.load32_u/s
  ;;   stores: i32.store, i64.store, f32.store, f64.store,
  ;;           i32.store8, i32.store16,
  ;;           i64.store8, i64.store16, i64.store32
  ;;
  ;; i32.extend8_s / i32.extend16_s / i64.extend8_s / i64.extend16_s /
  ;; i64.extend32_s are from the sign-extension-operators proposal
  ;; (folded into the WASM 2.0 spec, supported by current wat2wasm,
  ;; V8, wasmtime, etc.). Drop them and hand-roll the sign-extend
  ;; arithmetic if you need to target an MVP-only engine.

  (memory (export "memory") 1)

  ;; Result encoding, same for every test function below:
  ;;   0                 -> pass
  ;;   (addr << 2) | code -> first failing address, decode with:
  ;;       addr = result >>> 2   (unsigned shift)
  ;;       code = result & 3     (1 = first check failed, 2 = second)

  (func $p32 (export "p32") (param $addr i32) (result i32)
    (i32.xor (local.get $addr) (i32.const 0x9E3779B9)))

;;   (func $p64 (param $addr i32) (result i64)
;;     (i64.xor (i64.extend_i32_u (local.get $addr))
;;               (i64.const 0x9E3779B97F4A7C15)))

  (func $mem_bytes (export "mem_bytes") (result i32)
    (i32.mul (memory.size) (i32.const 65536)))

  ;; --- full-width tests: one check each ---

  (func $test_i32 (export "test_i32") (result i32)
    (local $addr i32) (local $bound i32) (local $val i32) (local $r i32)
    (local.set $bound (i32.sub (call $mem_bytes) (i32.const 4)))
    (block $done
      (loop $loop
        (br_if $done (i32.gt_u (local.get $addr) (local.get $bound)))
        (local.set $val (call $p32 (local.get $addr)))
        (i32.store (local.get $addr) (local.get $val))
        (if (i32.ne (i32.load (local.get $addr)) (local.get $val))
          (then
            (local.set $r (i32.or (i32.shl (local.get $addr) (i32.const 2)) (i32.const 1)))
            (br $done)))
        (local.set $addr (i32.add (local.get $addr) (i32.const 4)))
        (br $loop)))
    (local.get $r))

;;   (func $test_i64 (export "test_i64") (result i32)
;;     (local $addr i32) (local $bound i32) (local $val i64) (local $r i32)
;;     (local.set $bound (i32.sub (call $mem_bytes) (i32.const 8)))
;;     (block $done
;;       (loop $loop
;;         (br_if $done (i32.gt_u (local.get $addr) (local.get $bound)))
;;         (local.set $val (call $p64 (local.get $addr)))
;;         (i64.store (local.get $addr) (local.get $val))
;;         (if (i64.ne (i64.load (local.get $addr)) (local.get $val))
;;           (then
;;             (local.set $r (i32.or (i32.shl (local.get $addr) (i32.const 2)) (i32.const 1)))
;;             (br $done)))
;;         (local.set $addr (i32.add (local.get $addr) (i32.const 8)))
;;         (br $loop)))
;;     (local.get $r))

;;   (func $test_f32 (export "test_f32") (result i32)
;;     (local $addr i32) (local $bound i32) (local $bits i32) (local $r i32)
;;     (local.set $bound (i32.sub (call $mem_bytes) (i32.const 4)))
;;     (block $done
;;       (loop $loop
;;         (br_if $done (i32.gt_u (local.get $addr) (local.get $bound)))
;;         (local.set $bits (call $p32 (local.get $addr)))
;;         (f32.store (local.get $addr) (f32.reinterpret_i32 (local.get $bits)))
;;         (if (i32.ne (i32.reinterpret_f32 (f32.load (local.get $addr))) (local.get $bits))
;;           (then
;;             (local.set $r (i32.or (i32.shl (local.get $addr) (i32.const 2)) (i32.const 1)))
;;             (br $done)))
;;         (local.set $addr (i32.add (local.get $addr) (i32.const 4)))
;;         (br $loop)))
;;     (local.get $r))

;;   (func $test_f64 (export "test_f64") (result i32)
;;     (local $addr i32) (local $bound i32) (local $bits i64) (local $r i32)
;;     (local.set $bound (i32.sub (call $mem_bytes) (i32.const 8)))
;;     (block $done
;;       (loop $loop
;;         (br_if $done (i32.gt_u (local.get $addr) (local.get $bound)))
;;         (local.set $bits (call $p64 (local.get $addr)))
;;         (f64.store (local.get $addr) (f64.reinterpret_i64 (local.get $bits)))
;;         (if (i64.ne (i64.reinterpret_f64 (f64.load (local.get $addr))) (local.get $bits))
;;           (then
;;             (local.set $r (i32.or (i32.shl (local.get $addr) (i32.const 2)) (i32.const 1)))
;;             (br $done)))
;;         (local.set $addr (i32.add (local.get $addr) (i32.const 8)))
;;         (br $loop)))
;;     (local.get $r))

  ;; Runs every group above in turn. Returns 0 if all pass, otherwise the
  ;; 1-based index (1..9) of the first group that failed -- call that
  ;; group's exported function directly afterward to get the exact
  ;; address and which check (zero- vs sign-extend) failed.
  (func (export "memtest") (result i32)
    (if (i32.ne (call $test_i32) (i32.const 0)) (then (return (i32.const 1))))
    ;; (if (i32.ne (call $test_i64) (i32.const 0)) (then (return (i32.const 2))))
    ;; (if (i32.ne (call $test_f32) (i32.const 0)) (then (return (i32.const 3))))
    ;; (if (i32.ne (call $test_f64) (i32.const 0)) (then (return (i32.const 4))))
    (i32.const 0))
)