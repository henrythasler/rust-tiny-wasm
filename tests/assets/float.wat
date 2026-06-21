(module
  (export "get_pi_f32" (func $get_pi_f32))
  (export "get_e_f64" (func $get_e_f64))
  (export "echo_f32" (func $echo_f32))
  (export "echo_f64" (func $echo_f64))
  (export "add_f32" (func $add_f32))
  (export "add_f64" (func $add_f64))
  (export "sub_f32" (func $sub_f32))
  (export "sub_f64" (func $sub_f64))
  (export "mul_f32" (func $mul_f32))
  (export "mul_f64" (func $mul_f64))
  (export "div_f32" (func $div_f32))
  (export "div_f64" (func $div_f64))

  (func $get_pi_f32 (result f32)
    f32.const 3.14159274
  )
  (func $get_e_f64 (result f64)
    f64.const 2.7182818284590451
  )
  (func $echo_f32 (param $first f32) (result f32)
  (local $var0 f32) (local $var1 f64) (local $var2 i32)
    local.get $first
    local.tee $var0
    i32.const 0
    local.set $var2
  )
  (func $echo_f64 (param $first f64) (result f64)
  (local $var0 f32) (local $var1 f64) (local $var2 i32)
    local.get $first
    local.tee $var1
    i32.const 0
    local.set $var2
  )
  (func $add_f32 (param $first f32) (param $second f32) (result f32)
    local.get $first
    local.get $second
    f32.add
  )
  (func $add_f64 (param $first f64) (param $second f64) (result f64)
    local.get $first
    local.get $second
    f64.add
  )
  (func $sub_f32 (param $first f32) (param $second f32) (result f32)
    local.get $first
    local.get $second
    f32.sub
  )
  (func $sub_f64 (param $first f64) (param $second f64) (result f64)
    local.get $first
    local.get $second
    f64.sub
  )
  (func $mul_f32 (param $first f32) (param $second f32) (result f32)
    local.get $first
    local.get $second
    f32.mul
  )
  (func $mul_f64 (param $first f64) (param $second f64) (result f64)
    local.get $first
    local.get $second
    f64.mul
  )
  (func $div_f32 (param $first f32) (param $second f32) (result f32)
    local.get $first
    local.get $second
    f32.div
  )
  (func $div_f64 (param $first f64) (param $second f64) (result f64)
    local.get $first
    local.get $second
    f64.div
  )
)