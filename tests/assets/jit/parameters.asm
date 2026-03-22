
./tests/assets/jit/parameters.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000030 get_first_i32
0000000000000030 l     F .text	0000000000000030 get_third_i32
0000000000000060 l     F .text	0000000000000030 get_second_i64
0000000000000090 l     F .text	0000000000000038 get_fourth_i64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00b00b9  .{.......C......
 0010 e10f00b9 e80b40b9 e003082a e1031f2a  ......@....*...*
 0020 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0030 fd7bbfa9 fd030091 ff4300d1 e00700b9  .{.......C......
 0040 e10b00b9 e20f00b9 e80f40b9 e003082a  ..........@....*
 0050 e1031f2a ff430091 fd7bc1a8 c0035fd6  ...*.C...{...._.
 0060 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0070 e10700f9 e80740f9 e00308aa e1031faa  ......@.........
 0080 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0090 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 00a0 e10700f9 e20b00f9 e30f00f9 e80f40f9  ..............@.
 00b0 e00308aa e1031faa ff830091 fd7bc1a8  .............{..
 00c0 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <get_first_i32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b9000be0 	str	w0, [sp, #8]
  10:	b9000fe1 	str	w1, [sp, #12]
  14:	b9400be8 	ldr	w8, [sp, #8]
  18:	2a0803e0 	mov	w0, w8
  1c:	2a1f03e1 	mov	w1, wzr
  20:	910043ff 	add	sp, sp, #0x10
  24:	a8c17bfd 	ldp	x29, x30, [sp], #16
  28:	d65f03c0 	ret
  2c:	d503201f 	nop

0000000000000030 <get_third_i32>:
  30:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  34:	910003fd 	mov	x29, sp
  38:	d10043ff 	sub	sp, sp, #0x10
  3c:	b90007e0 	str	w0, [sp, #4]
  40:	b9000be1 	str	w1, [sp, #8]
  44:	b9000fe2 	str	w2, [sp, #12]
  48:	b9400fe8 	ldr	w8, [sp, #12]
  4c:	2a0803e0 	mov	w0, w8
  50:	2a1f03e1 	mov	w1, wzr
  54:	910043ff 	add	sp, sp, #0x10
  58:	a8c17bfd 	ldp	x29, x30, [sp], #16
  5c:	d65f03c0 	ret

0000000000000060 <get_second_i64>:
  60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  64:	910003fd 	mov	x29, sp
  68:	d10043ff 	sub	sp, sp, #0x10
  6c:	f90003e0 	str	x0, [sp]
  70:	f90007e1 	str	x1, [sp, #8]
  74:	f94007e8 	ldr	x8, [sp, #8]
  78:	aa0803e0 	mov	x0, x8
  7c:	aa1f03e1 	mov	x1, xzr
  80:	910043ff 	add	sp, sp, #0x10
  84:	a8c17bfd 	ldp	x29, x30, [sp], #16
  88:	d65f03c0 	ret
  8c:	d503201f 	nop

0000000000000090 <get_fourth_i64>:
  90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  94:	910003fd 	mov	x29, sp
  98:	d10083ff 	sub	sp, sp, #0x20
  9c:	f90003e0 	str	x0, [sp]
  a0:	f90007e1 	str	x1, [sp, #8]
  a4:	f9000be2 	str	x2, [sp, #16]
  a8:	f9000fe3 	str	x3, [sp, #24]
  ac:	f9400fe8 	ldr	x8, [sp, #24]
  b0:	aa0803e0 	mov	x0, x8
  b4:	aa1f03e1 	mov	x1, xzr
  b8:	910083ff 	add	sp, sp, #0x20
  bc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c0:	d65f03c0 	ret
  c4:	d503201f 	nop
