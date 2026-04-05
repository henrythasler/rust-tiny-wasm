(module
  (export "add" (func $add))
  (export "add64" (func $add64))
  (export "sub" (func $sub))
  (export "sub64" (func $sub64))
  (export "mul" (func $mul))
  (export "mul64" (func $mul64))
  (export "square" (func $square))
  (export "square64" (func $square64))
  (func $add (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.add
  )

  (func $add64 (param $first i64) (param $second i64) (result i64)
    local.get $first
    local.get $second
    i64.add
  )

  (func $sub (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.sub
  )

  (func $sub64 (param $first i64) (param $second i64) (result i64)
    local.get $first
    local.get $second
    i64.sub
  )

  (func $mul (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.mul
  )

  (func $mul64 (param $first i64) (param $second i64) (result i64)
    local.get $first
    local.get $second
    i64.mul
  )

  (func $square (param $first i32) (result i32)
    local.get $first
    local.get $first
    i32.mul
  )

  (func $square64 (param $first i64) (result i64)
    local.get $first
    local.get $first
    i64.mul
  )
)