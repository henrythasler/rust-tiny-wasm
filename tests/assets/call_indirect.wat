(module
  ;; Define three functions with different signatures
  (func $add (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.add
  )
  
  (func $multiply (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.mul
  )
  
  (func $square (param i32) (result i32)
    local.get 0
    local.get 0
    i32.mul
  )

  (func $nop
  )

  ;; Create a table with 8 slots
  (table $funcTable 8 16 funcref)
  
  ;; Populate the table: put function references at specific indices
  (elem (i32.const 2) $add $multiply $square $nop)
  ;; This puts:
  ;; - indices 0 and 1 remain null as defined by the offset expression
  ;; - $add at index 2
  ;; - $multiply at index 3
  ;; - $square at index 4
  ;; - $nop at index 5
  ;; - indices 6 and 7 remain null
  
  ;; Now use call_indirect
  (func $calculate (param i32 i32 i32) (result i32)
    local.get 1    ;; first operand
    local.get 2    ;; second operand
    local.get 0    ;; table index (which operation to perform)
    call_indirect (param i32 i32) (result i32)
  )
  
  (export "calculate" (func $calculate))
)