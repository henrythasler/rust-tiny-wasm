(module
  (export "loop_n" (func $loop_n))
  (export "loop_n_tee" (func $loop_n_tee))
  (export "loop_nm" (func $loop_nm))
  (func $loop_n (param $limit i32) (result i32)
    (local $cnt i32)
    loop $label1
      local.get $cnt
      i32.const 1
      i32.add
      local.set $cnt
      local.get $cnt
      local.get $limit
      i32.lt_s
      br_if $label1
    end $label1
    local.get $cnt
  )
  (func $loop_n_tee (param $limit i32) (result i32)
    (local $cnt i32)
    loop $label1
      local.get $cnt
      i32.const 1
      i32.add
      local.tee $cnt
      local.get $limit
      i32.lt_s
      br_if $label1
    end $label1
    local.get $cnt
  )  
  (func $loop_nm (param $var0 i32) (param $var1 i32) (result i32)
    (local $cnt i32)
    loop $label1
      local.get $cnt
      i32.const 1
      i32.add
      local.set $cnt
      local.get $var0
      i32.const 1
      i32.add
      local.set $var0
      local.get $var0
      local.get $var1
      i32.lt_s
      br_if $label1
    end $label1
    local.get $cnt
  )
)