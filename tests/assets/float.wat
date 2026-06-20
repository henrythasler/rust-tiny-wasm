(module
  (export "get_pi_f32" (func $get_pi_f32))
  (export "get_e_f64" (func $get_e_f64))
  (export "add_f32" (func $add_f32))
  (export "add_f64" (func $add_f64))
  (export "sub_f32" (func $sub_f32))
  (export "sub_f64" (func $sub_f64))

  (func $get_pi_f32 (result f32)
    f32.const 3.14159274
  )
  (func $get_e_f64 (result f64)
    f64.const 2.7182818284590451
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
)