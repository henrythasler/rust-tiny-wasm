
tests/assets/jit/call_indirect.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 $func0
0000000000000038 l     F .text	0000000000000038 $func1
0000000000000070 l     F .text	0000000000000038 $func2
00000000000000a8 l     F .text	0000000000000028 $func3
00000000000000d0 l     F .text	00000000000000c0 calculate


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0020 0801090b 000080d2 e10308aa ff430091  .............C..
 0030 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0040 ff4300d1 e00300f9 e10b00b9 e20f00b9  .C..............
 0050 e80b40b9 e90f40b9 087d091b 000080d2  ..@...@..}......
 0060 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0070 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0080 e10b00b9 e80b40b9 e90b40b9 087d091b  ......@...@..}..
 0090 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 00a0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00b0 ff4300d1 e00300f9 000080d2 e1031faa  .C..............
 00c0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00d0 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 00e0 e10b00b9 e20f00b9 e31300b9 e80f40b9  ..............@.
 00f0 e91340b9 ea0b40b9 0b1840b9 5f010b6b  ..@...@...@._..k
 0100 8b000054 810080d2 200080d2 1d000014  ...T.... .......
 0110 0c0840f9 8c110a8b 8b0140f9 8c0940b9  ..@.......@...@.
 0120 9f050031 81000054 a10080d2 200080d2  ...1...T.... ...
 0130 14000014 9f010071 80000054 c10080d2  .......q...T....
 0140 200080d2 0f000014 e203092a e103082a   ..........*...*
 0150 e00340f9 ff4300d1 e80300f9 e90700f9  ..@..C..........
 0160 60013fd6 e80340f9 e90740f9 ff430091  `.?...@...@..C..
 0170 800000b5 ea03012a 000080d2 e1030aaa  .......*........
 0180 ff830091 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..

Disassembly of section .text:

0000000000000000 <$func0>:
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

0000000000000038 <$func1>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	b9000be1 	str	w1, [sp, #8]
  4c:	b9000fe2 	str	w2, [sp, #12]
  50:	b9400be8 	ldr	w8, [sp, #8]
  54:	b9400fe9 	ldr	w9, [sp, #12]
  58:	1b097d08 	mul	w8, w8, w9
  5c:	d2800000 	mov	x0, #0x0                   	// #0
  60:	aa0803e1 	mov	x1, x8
  64:	910043ff 	add	sp, sp, #0x10
  68:	a8c17bfd 	ldp	x29, x30, [sp], #16
  6c:	d65f03c0 	ret

0000000000000070 <$func2>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	f90003e0 	str	x0, [sp]
  80:	b9000be1 	str	w1, [sp, #8]
  84:	b9400be8 	ldr	w8, [sp, #8]
  88:	b9400be9 	ldr	w9, [sp, #8]
  8c:	1b097d08 	mul	w8, w8, w9
  90:	d2800000 	mov	x0, #0x0                   	// #0
  94:	aa0803e1 	mov	x1, x8
  98:	910043ff 	add	sp, sp, #0x10
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop

00000000000000a8 <$func3>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10043ff 	sub	sp, sp, #0x10
  b4:	f90003e0 	str	x0, [sp]
  b8:	d2800000 	mov	x0, #0x0                   	// #0
  bc:	aa1f03e1 	mov	x1, xzr
  c0:	910043ff 	add	sp, sp, #0x10
  c4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c8:	d65f03c0 	ret
  cc:	d503201f 	nop

00000000000000d0 <calculate>:
  d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  d4:	910003fd 	mov	x29, sp
  d8:	d10083ff 	sub	sp, sp, #0x20
  dc:	f90003e0 	str	x0, [sp]
  e0:	b9000be1 	str	w1, [sp, #8]
  e4:	b9000fe2 	str	w2, [sp, #12]
  e8:	b90013e3 	str	w3, [sp, #16]
  ec:	b9400fe8 	ldr	w8, [sp, #12]
  f0:	b94013e9 	ldr	w9, [sp, #16]
  f4:	b9400bea 	ldr	w10, [sp, #8]
  f8:	b940180b 	ldr	w11, [x0, #24]
  fc:	6b0b015f 	cmp	w10, w11
 100:	5400008b 	b.lt	110 <calculate+0x40>  // b.tstop
 104:	d2800081 	mov	x1, #0x4                   	// #4
 108:	d2800020 	mov	x0, #0x1                   	// #1
 10c:	1400001d 	b	180 <calculate+0xb0>
 110:	f940080c 	ldr	x12, [x0, #16]
 114:	8b0a118c 	add	x12, x12, x10, lsl #4
 118:	f940018b 	ldr	x11, [x12]
 11c:	b940098c 	ldr	w12, [x12, #8]
 120:	3100059f 	cmn	w12, #0x1
 124:	54000081 	b.ne	134 <calculate+0x64>  // b.any
 128:	d28000a1 	mov	x1, #0x5                   	// #5
 12c:	d2800020 	mov	x0, #0x1                   	// #1
 130:	14000014 	b	180 <calculate+0xb0>
 134:	7100019f 	cmp	w12, #0x0
 138:	54000080 	b.eq	148 <calculate+0x78>  // b.none
 13c:	d28000c1 	mov	x1, #0x6                   	// #6
 140:	d2800020 	mov	x0, #0x1                   	// #1
 144:	1400000f 	b	180 <calculate+0xb0>
 148:	2a0903e2 	mov	w2, w9
 14c:	2a0803e1 	mov	w1, w8
 150:	f94003e0 	ldr	x0, [sp]
 154:	d10043ff 	sub	sp, sp, #0x10
 158:	f90003e8 	str	x8, [sp]
 15c:	f90007e9 	str	x9, [sp, #8]
 160:	d63f0160 	blr	x11
 164:	f94003e8 	ldr	x8, [sp]
 168:	f94007e9 	ldr	x9, [sp, #8]
 16c:	910043ff 	add	sp, sp, #0x10
 170:	b5000080 	cbnz	x0, 180 <calculate+0xb0>
 174:	2a0103ea 	mov	w10, w1
 178:	d2800000 	mov	x0, #0x0                   	// #0
 17c:	aa0a03e1 	mov	x1, x10
 180:	910083ff 	add	sp, sp, #0x20
 184:	a8c17bfd 	ldp	x29, x30, [sp], #16
 188:	d65f03c0 	ret
 18c:	d503201f 	nop
