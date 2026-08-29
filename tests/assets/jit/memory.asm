
tests/assets/jit/memory.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 load_i32


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 091040f9 2901088b  ......@...@.)...
 0020 290140b9 000080d2 e10309aa ff430091  ).@..........C..
 0030 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <load_i32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9400be8 	ldr	w8, [sp, #8]
  18:	f9401009 	ldr	x9, [x0, #32]
  1c:	8b080129 	add	x9, x9, x8
  20:	b9400129 	ldr	w9, [x9]
  24:	d2800000 	mov	x0, #0x0                   	// #0
  28:	aa0903e1 	mov	x1, x9
  2c:	910043ff 	add	sp, sp, #0x10
  30:	a8c17bfd 	ldp	x29, x30, [sp], #16
  34:	d65f03c0 	ret
