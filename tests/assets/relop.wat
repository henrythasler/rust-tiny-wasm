(module
  (func (export "i32_lts") (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.lt_s
  )
  (func (export "i32_leu") (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.le_u
  )  
  (func (export "i32_gtu") (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.gt_u
  )  
  (func (export "i32_ne") (param $first i32) (param $second i32) (result i32)
    local.get $first
    local.get $second
    i32.ne
  )  
)