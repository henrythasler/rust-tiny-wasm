(module
  (func $return_42 (result i32)
    i32.const 1
    if
      i32.const 42
      return
    end
    unreachable
    ;; i32.const 0xdead
  )
)
