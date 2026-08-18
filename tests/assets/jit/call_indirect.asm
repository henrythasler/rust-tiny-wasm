
tests/assets/jit/call_indirect.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000038 l     F .text	0000000000000038 $func0
0000000000000070 l     F .text	0000000000000038 $func1
00000000000000a8 l     F .text	0000000000000038 $func2
00000000000000e0 l     F .text	0000000000000028 $func3
0000000000000108 l     F .text	0000000000000088 calculate


Contents of section .text:
 0000 ffffffff ffffffff ffffffff ffffffff  ................
 0010 ffffffff ffffffff ffffffff ffffffff  ................
 0020 ffffffff ffffffff ffffffff ffffffff  ................
 0030 ffffffff ffffffff fd7bbfa9 fd030091  .........{......
 0040 ff4300d1 e00300f9 e10b00b9 e20f00b9  .C..............
 0050 e80b40b9 e90f40b9 0801090b 000080d2  ..@...@.........
 0060 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0070 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0080 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0090 087d091b 000080d2 e10308aa ff430091  .}...........C..
 00a0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00b0 ff4300d1 e00300f9 e10b00b9 e80b40b9  .C............@.
 00c0 e90b40b9 087d091b 000080d2 e10308aa  ..@..}..........
 00d0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00e0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00f0 000080d2 e1031faa ff430091 fd7bc1a8  .........C...{..
 0100 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0110 ff8300d1 e00300f9 e10b00b9 e20f00b9  ................
 0120 e31300b9 e80f40b9 e91340b9 ea0b40b9  ......@...@...@.
 0130 5f1d0071 8b000054 810080d2 200080d2  _..q...T.... ...
 0140 11000014 0b000090 6b010091 6b796af8  ........k...kyj.
 0150 7f0500b1 81000054 a10080d2 200080d2  .......T.... ...
 0160 09000014 6cfd60d3 9f010071 81000054  ....l.`....q...T
 0170 c10080d2 200080d2 03000014 000080d2  .... ...........
 0180 e10309aa ff830091 fd7bc1a8 c0035fd6  .........{...._.

Disassembly of section .text:

0000000000000000 <$func0-0x38>:
   0:	ffffffff 	.inst	0xffffffff ; undefined
   4:	ffffffff 	.inst	0xffffffff ; undefined
   8:	ffffffff 	.inst	0xffffffff ; undefined
   c:	ffffffff 	.inst	0xffffffff ; undefined
  10:	ffffffff 	.inst	0xffffffff ; undefined
  14:	ffffffff 	.inst	0xffffffff ; undefined
  18:	ffffffff 	.inst	0xffffffff ; undefined
  1c:	ffffffff 	.inst	0xffffffff ; undefined
  20:	ffffffff 	.inst	0xffffffff ; undefined
  24:	ffffffff 	.inst	0xffffffff ; undefined
  28:	ffffffff 	.inst	0xffffffff ; undefined
  2c:	ffffffff 	.inst	0xffffffff ; undefined
  30:	ffffffff 	.inst	0xffffffff ; undefined
  34:	ffffffff 	.inst	0xffffffff ; undefined

0000000000000038 <$func0>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	b9000be1 	str	w1, [sp, #8]
  4c:	b9000fe2 	str	w2, [sp, #12]
  50:	b9400be8 	ldr	w8, [sp, #8]
  54:	b9400fe9 	ldr	w9, [sp, #12]
  58:	0b090108 	add	w8, w8, w9
  5c:	d2800000 	mov	x0, #0x0                   	// #0
  60:	aa0803e1 	mov	x1, x8
  64:	910043ff 	add	sp, sp, #0x10
  68:	a8c17bfd 	ldp	x29, x30, [sp], #16
  6c:	d65f03c0 	ret

0000000000000070 <$func1>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	f90003e0 	str	x0, [sp]
  80:	b9000be1 	str	w1, [sp, #8]
  84:	b9000fe2 	str	w2, [sp, #12]
  88:	b9400be8 	ldr	w8, [sp, #8]
  8c:	b9400fe9 	ldr	w9, [sp, #12]
  90:	1b097d08 	mul	w8, w8, w9
  94:	d2800000 	mov	x0, #0x0                   	// #0
  98:	aa0803e1 	mov	x1, x8
  9c:	910043ff 	add	sp, sp, #0x10
  a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a4:	d65f03c0 	ret

00000000000000a8 <$func2>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10043ff 	sub	sp, sp, #0x10
  b4:	f90003e0 	str	x0, [sp]
  b8:	b9000be1 	str	w1, [sp, #8]
  bc:	b9400be8 	ldr	w8, [sp, #8]
  c0:	b9400be9 	ldr	w9, [sp, #8]
  c4:	1b097d08 	mul	w8, w8, w9
  c8:	d2800000 	mov	x0, #0x0                   	// #0
  cc:	aa0803e1 	mov	x1, x8
  d0:	910043ff 	add	sp, sp, #0x10
  d4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d8:	d65f03c0 	ret
  dc:	d503201f 	nop

00000000000000e0 <$func3>:
  e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  e4:	910003fd 	mov	x29, sp
  e8:	d10043ff 	sub	sp, sp, #0x10
  ec:	f90003e0 	str	x0, [sp]
  f0:	d2800000 	mov	x0, #0x0                   	// #0
  f4:	aa1f03e1 	mov	x1, xzr
  f8:	910043ff 	add	sp, sp, #0x10
  fc:	a8c17bfd 	ldp	x29, x30, [sp], #16
 100:	d65f03c0 	ret
 104:	d503201f 	nop

0000000000000108 <calculate>:
 108:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 10c:	910003fd 	mov	x29, sp
 110:	d10083ff 	sub	sp, sp, #0x20
 114:	f90003e0 	str	x0, [sp]
 118:	b9000be1 	str	w1, [sp, #8]
 11c:	b9000fe2 	str	w2, [sp, #12]
 120:	b90013e3 	str	w3, [sp, #16]
 124:	b9400fe8 	ldr	w8, [sp, #12]
 128:	b94013e9 	ldr	w9, [sp, #16]
 12c:	b9400bea 	ldr	w10, [sp, #8]
 130:	71001d5f 	cmp	w10, #0x7
 134:	5400008b 	b.lt	144 <calculate+0x3c>  // b.tstop
 138:	d2800081 	mov	x1, #0x4                   	// #4
 13c:	d2800020 	mov	x0, #0x1                   	// #1
 140:	14000011 	b	184 <calculate+0x7c>
 144:	9000000b 	adrp	x11, 0 <$func0-0x38>
 148:	9100016b 	add	x11, x11, #0x0
 14c:	f86a796b 	ldr	x11, [x11, x10, lsl #3]
 150:	b100057f 	cmn	x11, #0x1
 154:	54000081 	b.ne	164 <calculate+0x5c>  // b.any
 158:	d28000a1 	mov	x1, #0x5                   	// #5
 15c:	d2800020 	mov	x0, #0x1                   	// #1
 160:	14000009 	b	184 <calculate+0x7c>
 164:	d360fd6c 	lsr	x12, x11, #32
 168:	7100019f 	cmp	w12, #0x0
 16c:	54000081 	b.ne	17c <calculate+0x74>  // b.any
 170:	d28000c1 	mov	x1, #0x6                   	// #6
 174:	d2800020 	mov	x0, #0x1                   	// #1
 178:	14000003 	b	184 <calculate+0x7c>
 17c:	d2800000 	mov	x0, #0x0                   	// #0
 180:	aa0903e1 	mov	x1, x9
 184:	910083ff 	add	sp, sp, #0x20
 188:	a8c17bfd 	ldp	x29, x30, [sp], #16
 18c:	d65f03c0 	ret
