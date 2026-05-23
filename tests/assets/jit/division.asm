
tests/assets/jit/division.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 div_s32
0000000000000038 l     F .text	0000000000000038 div_u32
0000000000000070 l     F .text	0000000000000038 div_s64
00000000000000a8 l     F .text	0000000000000038 div_u64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e10700b9 e80340b9 e90740b9 080dc91a  ......@...@.....
 0020 e003082a e1031f2a ff430091 fd7bc1a8  ...*...*.C...{..
 0030 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0040 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0050 e90740b9 0809c91a e003082a e1031f2a  ..@........*...*
 0060 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0070 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0080 e10700f9 e80340f9 e90740f9 080dc99a  ......@...@.....
 0090 e00308aa e1031faa ff430091 fd7bc1a8  .........C...{..
 00a0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00b0 ff4300d1 e00300f9 e10700f9 e80340f9  .C............@.
 00c0 e90740f9 0809c99a e00308aa e1031faa  ..@.............
 00d0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <div_s32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007e1 	str	w1, [sp, #4]
  14:	b94003e8 	ldr	w8, [sp]
  18:	b94007e9 	ldr	w9, [sp, #4]
  1c:	1ac90d08 	sdiv	w8, w8, w9
  20:	2a0803e0 	mov	w0, w8
  24:	2a1f03e1 	mov	w1, wzr
  28:	910043ff 	add	sp, sp, #0x10
  2c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  30:	d65f03c0 	ret
  34:	d503201f 	nop

0000000000000038 <div_u32>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	b90003e0 	str	w0, [sp]
  48:	b90007e1 	str	w1, [sp, #4]
  4c:	b94003e8 	ldr	w8, [sp]
  50:	b94007e9 	ldr	w9, [sp, #4]
  54:	1ac90908 	udiv	w8, w8, w9
  58:	2a0803e0 	mov	w0, w8
  5c:	2a1f03e1 	mov	w1, wzr
  60:	910043ff 	add	sp, sp, #0x10
  64:	a8c17bfd 	ldp	x29, x30, [sp], #16
  68:	d65f03c0 	ret
  6c:	d503201f 	nop

0000000000000070 <div_s64>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	f90003e0 	str	x0, [sp]
  80:	f90007e1 	str	x1, [sp, #8]
  84:	f94003e8 	ldr	x8, [sp]
  88:	f94007e9 	ldr	x9, [sp, #8]
  8c:	9ac90d08 	sdiv	x8, x8, x9
  90:	aa0803e0 	mov	x0, x8
  94:	aa1f03e1 	mov	x1, xzr
  98:	910043ff 	add	sp, sp, #0x10
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop

00000000000000a8 <div_u64>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10043ff 	sub	sp, sp, #0x10
  b4:	f90003e0 	str	x0, [sp]
  b8:	f90007e1 	str	x1, [sp, #8]
  bc:	f94003e8 	ldr	x8, [sp]
  c0:	f94007e9 	ldr	x9, [sp, #8]
  c4:	9ac90908 	udiv	x8, x8, x9
  c8:	aa0803e0 	mov	x0, x8
  cc:	aa1f03e1 	mov	x1, xzr
  d0:	910043ff 	add	sp, sp, #0x10
  d4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d8:	d65f03c0 	ret
  dc:	d503201f 	nop
