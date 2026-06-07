(module
  (export "get_pi_f32" (func $get_pi_f32))
  (export "get_e_f64" (func $get_e_f64))

  (func $get_pi_f32 (result f32)
    f32.const 3.14159274
  )
  (func $get_e_f64 (result f64)
    f64.const 2.7182818284590451
  )
)