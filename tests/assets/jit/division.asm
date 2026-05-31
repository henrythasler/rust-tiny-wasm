
tests/assets/jit/division.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000048 div_s32
0000000000000048 l     F .text	0000000000000038 div_u32
0000000000000080 l     F .text	0000000000000048 div_s64
00000000000000c8 l     F .text	0000000000000038 div_u64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e10700b9 e80340b9 e90740b9 89000035  ......@...@....5
 0020 010180d2 200080d2 04000014 080dc91a  .... ...........
 0030 00008052 e103082a ff430091 fd7bc1a8  ...R...*.C...{..
 0040 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0050 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0060 e90740b9 0809c91a 00008052 e103082a  ..@........R...*
 0070 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0080 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0090 e10700f9 e80340f9 e90740f9 890000b5  ......@...@.....
 00a0 010180d2 200080d2 04000014 080dc99a  .... ...........
 00b0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 00c0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00d0 ff4300d1 e00300f9 e10700f9 e80340f9  .C............@.
 00e0 e90740f9 0809c99a 000080d2 e10308aa  ..@.............
 00f0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <div_s32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007e1 	str	w1, [sp, #4]
  14:	b94003e8 	ldr	w8, [sp]
  18:	b94007e9 	ldr	w9, [sp, #4]
  1c:	35000089 	cbnz	w9, 2c <div_s32+0x2c>
  20:	d2800101 	mov	x1, #0x8                   	// #8
  24:	d2800020 	mov	x0, #0x1                   	// #1
  28:	14000004 	b	38 <div_s32+0x38>
  2c:	1ac90d08 	sdiv	w8, w8, w9
  30:	52800000 	mov	w0, #0x0                   	// #0
  34:	2a0803e1 	mov	w1, w8
  38:	910043ff 	add	sp, sp, #0x10
  3c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40:	d65f03c0 	ret
  44:	d503201f 	nop

0000000000000048 <div_u32>:
  48:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4c:	910003fd 	mov	x29, sp
  50:	d10043ff 	sub	sp, sp, #0x10
  54:	b90003e0 	str	w0, [sp]
  58:	b90007e1 	str	w1, [sp, #4]
  5c:	b94003e8 	ldr	w8, [sp]
  60:	b94007e9 	ldr	w9, [sp, #4]
  64:	1ac90908 	udiv	w8, w8, w9
  68:	52800000 	mov	w0, #0x0                   	// #0
  6c:	2a0803e1 	mov	w1, w8
  70:	910043ff 	add	sp, sp, #0x10
  74:	a8c17bfd 	ldp	x29, x30, [sp], #16
  78:	d65f03c0 	ret
  7c:	d503201f 	nop

0000000000000080 <div_s64>:
  80:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  84:	910003fd 	mov	x29, sp
  88:	d10043ff 	sub	sp, sp, #0x10
  8c:	f90003e0 	str	x0, [sp]
  90:	f90007e1 	str	x1, [sp, #8]
  94:	f94003e8 	ldr	x8, [sp]
  98:	f94007e9 	ldr	x9, [sp, #8]
  9c:	b5000089 	cbnz	x9, ac <div_s64+0x2c>
  a0:	d2800101 	mov	x1, #0x8                   	// #8
  a4:	d2800020 	mov	x0, #0x1                   	// #1
  a8:	14000004 	b	b8 <div_s64+0x38>
  ac:	9ac90d08 	sdiv	x8, x8, x9
  b0:	d2800000 	mov	x0, #0x0                   	// #0
  b4:	aa0803e1 	mov	x1, x8
  b8:	910043ff 	add	sp, sp, #0x10
  bc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c0:	d65f03c0 	ret
  c4:	d503201f 	nop

00000000000000c8 <div_u64>:
  c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  cc:	910003fd 	mov	x29, sp
  d0:	d10043ff 	sub	sp, sp, #0x10
  d4:	f90003e0 	str	x0, [sp]
  d8:	f90007e1 	str	x1, [sp, #8]
  dc:	f94003e8 	ldr	x8, [sp]
  e0:	f94007e9 	ldr	x9, [sp, #8]
  e4:	9ac90908 	udiv	x8, x8, x9
  e8:	d2800000 	mov	x0, #0x0                   	// #0
  ec:	aa0803e1 	mov	x1, x8
  f0:	910043ff 	add	sp, sp, #0x10
  f4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  f8:	d65f03c0 	ret
  fc:	d503201f 	nop
