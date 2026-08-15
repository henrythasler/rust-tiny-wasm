
tests/assets/jit/parameters.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000030 get_first_i32
0000000000000030 l     F .text	0000000000000038 get_third_i32
0000000000000068 l     F .text	0000000000000030 get_second_i64
0000000000000098 l     F .text	0000000000000038 get_fourth_i64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e20f00b9 e80b40b9 000080d2  ..........@.....
 0020 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0030 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0040 e10b00b9 e20f00b9 e31300b9 e81340b9  ..............@.
 0050 000080d2 e10308aa ff830091 fd7bc1a8  .............{..
 0060 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0070 ff8300d1 e00300f9 e10700f9 e20b00f9  ................
 0080 e80b40f9 000080d2 e10308aa ff830091  ..@.............
 0090 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00a0 ffc300d1 e00300f9 e10700f9 e20b00f9  ................
 00b0 e30f00f9 e41300f9 e81340f9 000080d2  ..........@.....
 00c0 e10308aa ffc30091 fd7bc1a8 c0035fd6  .........{...._.

Disassembly of section .text:

0000000000000000 <get_first_i32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9000fe2 	str	w2, [sp, #12]
  18:	b9400be8 	ldr	w8, [sp, #8]
  1c:	d2800000 	mov	x0, #0x0                   	// #0
  20:	aa0803e1 	mov	x1, x8
  24:	910043ff 	add	sp, sp, #0x10
  28:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2c:	d65f03c0 	ret

0000000000000030 <get_third_i32>:
  30:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  34:	910003fd 	mov	x29, sp
  38:	d10083ff 	sub	sp, sp, #0x20
  3c:	f90003e0 	str	x0, [sp]
  40:	b9000be1 	str	w1, [sp, #8]
  44:	b9000fe2 	str	w2, [sp, #12]
  48:	b90013e3 	str	w3, [sp, #16]
  4c:	b94013e8 	ldr	w8, [sp, #16]
  50:	d2800000 	mov	x0, #0x0                   	// #0
  54:	aa0803e1 	mov	x1, x8
  58:	910083ff 	add	sp, sp, #0x20
  5c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  60:	d65f03c0 	ret
  64:	d503201f 	nop

0000000000000068 <get_second_i64>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10083ff 	sub	sp, sp, #0x20
  74:	f90003e0 	str	x0, [sp]
  78:	f90007e1 	str	x1, [sp, #8]
  7c:	f9000be2 	str	x2, [sp, #16]
  80:	f9400be8 	ldr	x8, [sp, #16]
  84:	d2800000 	mov	x0, #0x0                   	// #0
  88:	aa0803e1 	mov	x1, x8
  8c:	910083ff 	add	sp, sp, #0x20
  90:	a8c17bfd 	ldp	x29, x30, [sp], #16
  94:	d65f03c0 	ret

0000000000000098 <get_fourth_i64>:
  98:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  9c:	910003fd 	mov	x29, sp
  a0:	d100c3ff 	sub	sp, sp, #0x30
  a4:	f90003e0 	str	x0, [sp]
  a8:	f90007e1 	str	x1, [sp, #8]
  ac:	f9000be2 	str	x2, [sp, #16]
  b0:	f9000fe3 	str	x3, [sp, #24]
  b4:	f90013e4 	str	x4, [sp, #32]
  b8:	f94013e8 	ldr	x8, [sp, #32]
  bc:	d2800000 	mov	x0, #0x0                   	// #0
  c0:	aa0803e1 	mov	x1, x8
  c4:	9100c3ff 	add	sp, sp, #0x30
  c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  cc:	d65f03c0 	ret
