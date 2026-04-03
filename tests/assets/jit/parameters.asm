
./tests/assets/jit/parameters.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 get_first_i32
0000000000000028 l     F .text	0000000000000030 get_third_i32
0000000000000058 l     F .text	0000000000000028 get_second_i64
0000000000000080 l     F .text	0000000000000030 get_fourth_i64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e10700b9 e0031faa e1031faa ff430091  .............C..
 0020 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0030 ff4300d1 e00300b9 e10700b9 e20b00b9  .C..............
 0040 e0031faa e1031faa ff430091 fd7bc1a8  .........C...{..
 0050 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0060 ff4300d1 e00300f9 e10700f9 e0031faa  .C..............
 0070 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0080 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0090 e10700f9 e20b00f9 e30f00f9 e0031faa  ................
 00a0 e1031faa ff830091 fd7bc1a8 c0035fd6  .........{...._.

Disassembly of section .text:

0000000000000000 <get_first_i32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007e1 	str	w1, [sp, #4]
  14:	aa1f03e0 	mov	x0, xzr
  18:	aa1f03e1 	mov	x1, xzr
  1c:	910043ff 	add	sp, sp, #0x10
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret

0000000000000028 <get_third_i32>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d10043ff 	sub	sp, sp, #0x10
  34:	b90003e0 	str	w0, [sp]
  38:	b90007e1 	str	w1, [sp, #4]
  3c:	b9000be2 	str	w2, [sp, #8]
  40:	aa1f03e0 	mov	x0, xzr
  44:	aa1f03e1 	mov	x1, xzr
  48:	910043ff 	add	sp, sp, #0x10
  4c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  50:	d65f03c0 	ret
  54:	d503201f 	nop

0000000000000058 <get_second_i64>:
  58:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  5c:	910003fd 	mov	x29, sp
  60:	d10043ff 	sub	sp, sp, #0x10
  64:	f90003e0 	str	x0, [sp]
  68:	f90007e1 	str	x1, [sp, #8]
  6c:	aa1f03e0 	mov	x0, xzr
  70:	aa1f03e1 	mov	x1, xzr
  74:	910043ff 	add	sp, sp, #0x10
  78:	a8c17bfd 	ldp	x29, x30, [sp], #16
  7c:	d65f03c0 	ret

0000000000000080 <get_fourth_i64>:
  80:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  84:	910003fd 	mov	x29, sp
  88:	d10083ff 	sub	sp, sp, #0x20
  8c:	f90003e0 	str	x0, [sp]
  90:	f90007e1 	str	x1, [sp, #8]
  94:	f9000be2 	str	x2, [sp, #16]
  98:	f9000fe3 	str	x3, [sp, #24]
  9c:	aa1f03e0 	mov	x0, xzr
  a0:	aa1f03e1 	mov	x1, xzr
  a4:	910083ff 	add	sp, sp, #0x20
  a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ac:	d65f03c0 	ret
