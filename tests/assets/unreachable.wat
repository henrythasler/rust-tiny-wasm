(module
  (func (export "binop_after_unreachable") (result i32)
    unreachable
    i32.add)
  (func (export "block_result_unreachable") (result i32)
    (block (result i32)
      unreachable))
  (func (export "dead_operands_after_br") (result i32)
    (block (result i32)
      i32.const 7
      br 0
      i32.const 1
      i32.add))
  (func (export "dead_nested_block") (result i32)
    (block (result i32)
      i32.const 3
      br 0
      (block
        i32.const 1
        drop)
      (loop
        br 0)))
  (func (export "dead_if_else") (param i32) (result i32)
    (block (result i32)
      i32.const 5
      br 0
      local.get 0
      (if (result i32)
        (then i32.const 1)
        (else i32.const 2))
      i32.add))
  (func (export "float_block") (result f32)
    (block (result f32)
      f32.const 1.5
      br 0
      f32.const 2.5
      f32.add))
  (func (export "float_unreachable_tail") (param i32) (result f32)
    local.get 0
    (if
      (then unreachable))
    f32.const 2.5)
  (func (export "return_then_dead") (result i32)
    i32.const 42
    return
    i32.const 1
    i32.add)
)
