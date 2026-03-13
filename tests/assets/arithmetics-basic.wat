(module
  (export "add" (func $add))
  (func $add (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.add
  )
)