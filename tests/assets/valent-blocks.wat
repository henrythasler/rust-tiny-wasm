(module
  (export "add_const" (func $add_const))
  (func $add_const (result i32)
    i32.const 16
    i32.const 24
    i32.add
    i32.const 10
    i32.add
  )
)