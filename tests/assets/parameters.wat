(module
  (export "get_first_i32" (func $get_first_i32))
  (func $get_first_i32 (param $first i32) (param $second i32) (result i32)
    local.get $first
  )

  (export "get_third_i32" (func $get_third_i32))
  (func $get_third_i32 (param $first i32) (param $second i32) (param $third i32) (result i32)
    local.get $third
  )

  (export "get_second_i64" (func $get_second_i64))
  (func $get_second_i64 (param $first i64) (param $second i64) (result i64)
    local.get $second
  )

  (export "get_fourth_i64" (func $get_fourth_i64))
  (func $get_fourth_i64 (param $first i64) (param $second i64) (param $third i64) (param $fourth i64) (result i64)
    local.get $fourth
  )
)