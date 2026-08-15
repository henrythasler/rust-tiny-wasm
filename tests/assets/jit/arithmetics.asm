
tests/assets/jit/arithmetics.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 add
0000000000000038 l     F .text	0000000000000038 add64
0000000000000070 l     F .text	0000000000000038 sub
00000000000000a8 l     F .text	0000000000000038 sub64
00000000000000e0 l     F .text	0000000000000038 mul
0000000000000118 l     F .text	0000000000000038 mul64
0000000000000150 l     F .text	0000000000000038 square
0000000000000188 l     F .text	0000000000000038 square64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0020 0801090b 000080d2 e10308aa ff430091  .............C..
 0030 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0040 ff8300d1 e00300f9 e10700f9 e20b00f9  ................
 0050 e80740f9 e90b40f9 0801098b 000080d2  ..@...@.........
 0060 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 0070 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0080 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0090 0801094b 000080d2 e10308aa ff430091  ...K.........C..
 00a0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00b0 ff8300d1 e00300f9 e10700f9 e20b00f9  ................
 00c0 e80740f9 e90b40f9 080109cb 000080d2  ..@...@.........
 00d0 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 00e0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00f0 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0100 087d091b 000080d2 e10308aa ff430091  .}...........C..
 0110 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0120 ff8300d1 e00300f9 e10700f9 e20b00f9  ................
 0130 e80740f9 e90b40f9 087d099b 000080d2  ..@...@..}......
 0140 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 0150 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0160 e10b00b9 e80b40b9 e90b40b9 087d091b  ......@...@..}..
 0170 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0180 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0190 ff4300d1 e00300f9 e10700f9 e80740f9  .C............@.
 01a0 e90740f9 087d099b 000080d2 e10308aa  ..@..}..........
 01b0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <add>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9000fe2 	str	w2, [sp, #12]
  18:	b9400be8 	ldr	w8, [sp, #8]
  1c:	b9400fe9 	ldr	w9, [sp, #12]
  20:	0b090108 	add	w8, w8, w9
  24:	d2800000 	mov	x0, #0x0                   	// #0
  28:	aa0803e1 	mov	x1, x8
  2c:	910043ff 	add	sp, sp, #0x10
  30:	a8c17bfd 	ldp	x29, x30, [sp], #16
  34:	d65f03c0 	ret

0000000000000038 <add64>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10083ff 	sub	sp, sp, #0x20
  44:	f90003e0 	str	x0, [sp]
  48:	f90007e1 	str	x1, [sp, #8]
  4c:	f9000be2 	str	x2, [sp, #16]
  50:	f94007e8 	ldr	x8, [sp, #8]
  54:	f9400be9 	ldr	x9, [sp, #16]
  58:	8b090108 	add	x8, x8, x9
  5c:	d2800000 	mov	x0, #0x0                   	// #0
  60:	aa0803e1 	mov	x1, x8
  64:	910083ff 	add	sp, sp, #0x20
  68:	a8c17bfd 	ldp	x29, x30, [sp], #16
  6c:	d65f03c0 	ret

0000000000000070 <sub>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	f90003e0 	str	x0, [sp]
  80:	b9000be1 	str	w1, [sp, #8]
  84:	b9000fe2 	str	w2, [sp, #12]
  88:	b9400be8 	ldr	w8, [sp, #8]
  8c:	b9400fe9 	ldr	w9, [sp, #12]
  90:	4b090108 	sub	w8, w8, w9
  94:	d2800000 	mov	x0, #0x0                   	// #0
  98:	aa0803e1 	mov	x1, x8
  9c:	910043ff 	add	sp, sp, #0x10
  a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a4:	d65f03c0 	ret

00000000000000a8 <sub64>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10083ff 	sub	sp, sp, #0x20
  b4:	f90003e0 	str	x0, [sp]
  b8:	f90007e1 	str	x1, [sp, #8]
  bc:	f9000be2 	str	x2, [sp, #16]
  c0:	f94007e8 	ldr	x8, [sp, #8]
  c4:	f9400be9 	ldr	x9, [sp, #16]
  c8:	cb090108 	sub	x8, x8, x9
  cc:	d2800000 	mov	x0, #0x0                   	// #0
  d0:	aa0803e1 	mov	x1, x8
  d4:	910083ff 	add	sp, sp, #0x20
  d8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  dc:	d65f03c0 	ret

00000000000000e0 <mul>:
  e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  e4:	910003fd 	mov	x29, sp
  e8:	d10043ff 	sub	sp, sp, #0x10
  ec:	f90003e0 	str	x0, [sp]
  f0:	b9000be1 	str	w1, [sp, #8]
  f4:	b9000fe2 	str	w2, [sp, #12]
  f8:	b9400be8 	ldr	w8, [sp, #8]
  fc:	b9400fe9 	ldr	w9, [sp, #12]
 100:	1b097d08 	mul	w8, w8, w9
 104:	d2800000 	mov	x0, #0x0                   	// #0
 108:	aa0803e1 	mov	x1, x8
 10c:	910043ff 	add	sp, sp, #0x10
 110:	a8c17bfd 	ldp	x29, x30, [sp], #16
 114:	d65f03c0 	ret

0000000000000118 <mul64>:
 118:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 11c:	910003fd 	mov	x29, sp
 120:	d10083ff 	sub	sp, sp, #0x20
 124:	f90003e0 	str	x0, [sp]
 128:	f90007e1 	str	x1, [sp, #8]
 12c:	f9000be2 	str	x2, [sp, #16]
 130:	f94007e8 	ldr	x8, [sp, #8]
 134:	f9400be9 	ldr	x9, [sp, #16]
 138:	9b097d08 	mul	x8, x8, x9
 13c:	d2800000 	mov	x0, #0x0                   	// #0
 140:	aa0803e1 	mov	x1, x8
 144:	910083ff 	add	sp, sp, #0x20
 148:	a8c17bfd 	ldp	x29, x30, [sp], #16
 14c:	d65f03c0 	ret

0000000000000150 <square>:
 150:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 154:	910003fd 	mov	x29, sp
 158:	d10043ff 	sub	sp, sp, #0x10
 15c:	f90003e0 	str	x0, [sp]
 160:	b9000be1 	str	w1, [sp, #8]
 164:	b9400be8 	ldr	w8, [sp, #8]
 168:	b9400be9 	ldr	w9, [sp, #8]
 16c:	1b097d08 	mul	w8, w8, w9
 170:	d2800000 	mov	x0, #0x0                   	// #0
 174:	aa0803e1 	mov	x1, x8
 178:	910043ff 	add	sp, sp, #0x10
 17c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 180:	d65f03c0 	ret
 184:	d503201f 	nop

0000000000000188 <square64>:
 188:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 18c:	910003fd 	mov	x29, sp
 190:	d10043ff 	sub	sp, sp, #0x10
 194:	f90003e0 	str	x0, [sp]
 198:	f90007e1 	str	x1, [sp, #8]
 19c:	f94007e8 	ldr	x8, [sp, #8]
 1a0:	f94007e9 	ldr	x9, [sp, #8]
 1a4:	9b097d08 	mul	x8, x8, x9
 1a8:	d2800000 	mov	x0, #0x0                   	// #0
 1ac:	aa0803e1 	mov	x1, x8
 1b0:	910043ff 	add	sp, sp, #0x10
 1b4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b8:	d65f03c0 	ret
 1bc:	d503201f 	nop
