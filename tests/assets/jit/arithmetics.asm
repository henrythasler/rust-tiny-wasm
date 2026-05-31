
tests/assets/jit/arithmetics.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 add
0000000000000038 l     F .text	0000000000000038 add64
0000000000000070 l     F .text	0000000000000038 sub
00000000000000a8 l     F .text	0000000000000038 sub64
00000000000000e0 l     F .text	0000000000000038 mul
0000000000000118 l     F .text	0000000000000038 mul64
0000000000000150 l     F .text	0000000000000030 square
0000000000000180 l     F .text	0000000000000030 square64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e10700b9 e80340b9 e90740b9 0801090b  ......@...@.....
 0020 00008052 e103082a ff430091 fd7bc1a8  ...R...*.C...{..
 0030 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0040 ff4300d1 e00300f9 e10700f9 e80340f9  .C............@.
 0050 e90740f9 0801098b 000080d2 e10308aa  ..@.............
 0060 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0070 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0080 e10700b9 e80340b9 e90740b9 0801094b  ......@...@....K
 0090 00008052 e103082a ff430091 fd7bc1a8  ...R...*.C...{..
 00a0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00b0 ff4300d1 e00300f9 e10700f9 e80340f9  .C............@.
 00c0 e90740f9 080109cb 000080d2 e10308aa  ..@.............
 00d0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00e0 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 00f0 e10700b9 e80340b9 e90740b9 087d091b  ......@...@..}..
 0100 00008052 e103082a ff430091 fd7bc1a8  ...R...*.C...{..
 0110 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0120 ff4300d1 e00300f9 e10700f9 e80340f9  .C............@.
 0130 e90740f9 087d099b 000080d2 e10308aa  ..@..}..........
 0140 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0150 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0160 e80340b9 e90340b9 087d091b 00008052  ..@...@..}.....R
 0170 e103082a ff430091 fd7bc1a8 c0035fd6  ...*.C...{...._.
 0180 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0190 e80340f9 e90340f9 087d099b 000080d2  ..@...@..}......
 01a0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

Disassembly of section .text:

0000000000000000 <add>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007e1 	str	w1, [sp, #4]
  14:	b94003e8 	ldr	w8, [sp]
  18:	b94007e9 	ldr	w9, [sp, #4]
  1c:	0b090108 	add	w8, w8, w9
  20:	52800000 	mov	w0, #0x0                   	// #0
  24:	2a0803e1 	mov	w1, w8
  28:	910043ff 	add	sp, sp, #0x10
  2c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  30:	d65f03c0 	ret
  34:	d503201f 	nop

0000000000000038 <add64>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	f90007e1 	str	x1, [sp, #8]
  4c:	f94003e8 	ldr	x8, [sp]
  50:	f94007e9 	ldr	x9, [sp, #8]
  54:	8b090108 	add	x8, x8, x9
  58:	d2800000 	mov	x0, #0x0                   	// #0
  5c:	aa0803e1 	mov	x1, x8
  60:	910043ff 	add	sp, sp, #0x10
  64:	a8c17bfd 	ldp	x29, x30, [sp], #16
  68:	d65f03c0 	ret
  6c:	d503201f 	nop

0000000000000070 <sub>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	b90003e0 	str	w0, [sp]
  80:	b90007e1 	str	w1, [sp, #4]
  84:	b94003e8 	ldr	w8, [sp]
  88:	b94007e9 	ldr	w9, [sp, #4]
  8c:	4b090108 	sub	w8, w8, w9
  90:	52800000 	mov	w0, #0x0                   	// #0
  94:	2a0803e1 	mov	w1, w8
  98:	910043ff 	add	sp, sp, #0x10
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop

00000000000000a8 <sub64>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10043ff 	sub	sp, sp, #0x10
  b4:	f90003e0 	str	x0, [sp]
  b8:	f90007e1 	str	x1, [sp, #8]
  bc:	f94003e8 	ldr	x8, [sp]
  c0:	f94007e9 	ldr	x9, [sp, #8]
  c4:	cb090108 	sub	x8, x8, x9
  c8:	d2800000 	mov	x0, #0x0                   	// #0
  cc:	aa0803e1 	mov	x1, x8
  d0:	910043ff 	add	sp, sp, #0x10
  d4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d8:	d65f03c0 	ret
  dc:	d503201f 	nop

00000000000000e0 <mul>:
  e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  e4:	910003fd 	mov	x29, sp
  e8:	d10043ff 	sub	sp, sp, #0x10
  ec:	b90003e0 	str	w0, [sp]
  f0:	b90007e1 	str	w1, [sp, #4]
  f4:	b94003e8 	ldr	w8, [sp]
  f8:	b94007e9 	ldr	w9, [sp, #4]
  fc:	1b097d08 	mul	w8, w8, w9
 100:	52800000 	mov	w0, #0x0                   	// #0
 104:	2a0803e1 	mov	w1, w8
 108:	910043ff 	add	sp, sp, #0x10
 10c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 110:	d65f03c0 	ret
 114:	d503201f 	nop

0000000000000118 <mul64>:
 118:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 11c:	910003fd 	mov	x29, sp
 120:	d10043ff 	sub	sp, sp, #0x10
 124:	f90003e0 	str	x0, [sp]
 128:	f90007e1 	str	x1, [sp, #8]
 12c:	f94003e8 	ldr	x8, [sp]
 130:	f94007e9 	ldr	x9, [sp, #8]
 134:	9b097d08 	mul	x8, x8, x9
 138:	d2800000 	mov	x0, #0x0                   	// #0
 13c:	aa0803e1 	mov	x1, x8
 140:	910043ff 	add	sp, sp, #0x10
 144:	a8c17bfd 	ldp	x29, x30, [sp], #16
 148:	d65f03c0 	ret
 14c:	d503201f 	nop

0000000000000150 <square>:
 150:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 154:	910003fd 	mov	x29, sp
 158:	d10043ff 	sub	sp, sp, #0x10
 15c:	b90003e0 	str	w0, [sp]
 160:	b94003e8 	ldr	w8, [sp]
 164:	b94003e9 	ldr	w9, [sp]
 168:	1b097d08 	mul	w8, w8, w9
 16c:	52800000 	mov	w0, #0x0                   	// #0
 170:	2a0803e1 	mov	w1, w8
 174:	910043ff 	add	sp, sp, #0x10
 178:	a8c17bfd 	ldp	x29, x30, [sp], #16
 17c:	d65f03c0 	ret

0000000000000180 <square64>:
 180:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 184:	910003fd 	mov	x29, sp
 188:	d10043ff 	sub	sp, sp, #0x10
 18c:	f90003e0 	str	x0, [sp]
 190:	f94003e8 	ldr	x8, [sp]
 194:	f94003e9 	ldr	x9, [sp]
 198:	9b097d08 	mul	x8, x8, x9
 19c:	d2800000 	mov	x0, #0x0                   	// #0
 1a0:	aa0803e1 	mov	x1, x8
 1a4:	910043ff 	add	sp, sp, #0x10
 1a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1ac:	d65f03c0 	ret
