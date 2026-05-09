(module
  (export "conditional_return" (func $conditional_return))

  (func $conditional_return (param i32) (result i32)
    block $label0
      local.get 0
      br_if $label0
      i32.const 0x55
      return
    end
    i32.const 0xaa
  )
)