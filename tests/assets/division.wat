(module
  (func (;0;) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.div_s
  )
  (func (;1;) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.div_u
  )
  (func (;2;) (param i64 i64) (result i64)
    local.get 0
    local.get 1
    i64.div_s
  )
  (func (;3;) (param i64 i64) (result i64)
    local.get 0
    local.get 1
    i64.div_u
  )
  (func (;4;)
    i32.const 1
    i32.const 0
    i32.div_s
    drop
  )
  (export "div_s32" (func 0))
  (export "div_u32" (func 1))
  (export "div_s64" (func 2))
  (export "div_u64" (func 3))
  (export "div_by_zero" (func 4))
)
