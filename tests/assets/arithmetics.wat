(module
  (export "add" (func $add))
  (export "sub" (func $sub))
  (export "mul" (func $mul))
  (export "square" (func $square))
  (func $add (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.add
  )

  (func $sub (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.sub
  )

  (func $mul (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.mul
  )

  (func $square (param $first i32) (result i32)
    local.get $first
    local.get $first
    i32.mul
  )
)