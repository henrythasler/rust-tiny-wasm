(module
    (func $basic (result i64)
        call $one
    )

    (func $one (result i64)
        i64.const 1
    )

    (func $back (result i64)
        call $one
    )

    (func $four (result i64)
        i64.const 3
        call $one
        i64.add
    )

    (func $trap
        unreachable
    )

    (func $call_trap
        call $trap
    )

    (func $myadd (param $first i32) (param $second i32) (result i32)
        local.get $first
        local.get $second
        i32.add
    )

    (func $plus_one (param $first i32) (param $second i32) (result i32)
        local.get $first
        local.get $second
        call $myadd
        i32.const 1
        i32.add
    )

    (func $square_f32 (param $number f32) (result f32)
        local.get $number
        call $mysquare
    )

    (func $mysquare (param $number f32) (result f32)
        local.get $number
        local.get $number
        f32.mul
    )

    (export "basic" (func $basic))
    (export "one" (func $one))
    (export "back" (func $back))
    (export "four" (func $four))
    (export "call_trap" (func $call_trap))
    (export "plus_one" (func $plus_one))
    (export "square_f32" (func $square_f32))    
)