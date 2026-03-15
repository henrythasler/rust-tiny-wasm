(module
  (export "get_42" (func $get_42))
  (func $get_42 (result i32)
    i32.const 42
  )

  (export "get_minus_1" (func $get_minus_1))
  (func $get_minus_1 (result i32)
    i32.const -1
  )

  (export "get_large_num" (func $get_large_num))
  (func $get_large_num (result i64)
    i64.const 0x1234567890aabbcc
  )

  (export "get_i64_min" (func $get_i64_min))
  (func $get_i64_min (result i64)
    i64.const -9223372036854775808
  )
)