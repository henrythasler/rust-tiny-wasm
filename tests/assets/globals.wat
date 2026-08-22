(module
  (global $int32 i32 (i32.const -2))
  (global $int64 i64 (i64.const -5))
  (global $float32 f32 (f32.const 3.14159274))
  (global $float64 f64 (f64.const 2.7182818284590451))
  (global $mutint32 (mut i32) (i32.const -12))
  (global $mutint64 (mut i64) (i64.const 100))
  (global $mutfloat32 (mut f32) (f32.const 3.14159274))
  (global $mutfloat64 (mut f64) (f64.const 2.7182818284590451))
  ;; this is a special case where the LEB128 encoded number has 0x0B as it's last byte which collides with the init_exp terminator
  (global $mut3 (mut i32) (i32.const 186384))
  (export "get_int32" (func $get_int32))
  ;; (export "store_int32" (func $store_int32))
  ;; (export "store_int64" (func $store_int64))
  (func $get_int32 (result i32)
    global.get $int32
  )
  ;; (func $store_int32 (param $arg i32) (result i32)
  ;;   local.get $arg
  ;;   global.set $mutint32
  ;;   global.get $mutint32   
  ;; )
  ;; (func $store_int64 (param $arg i64) (result i64)
  ;;   local.get $arg
  ;;   global.set $mutint64
  ;;   global.get $mutint64
  ;; )
)