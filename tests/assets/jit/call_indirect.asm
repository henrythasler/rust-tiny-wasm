
tests/assets/jit/call_indirect.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000038 l     F .text	0000000000000038 $func0
0000000000000070 l     F .text	0000000000000038 $func1
00000000000000a8 l     F .text	0000000000000030 $func2
00000000000000d8 l     F .text	0000000000000018 $func3
00000000000000f0 l     F .text	0000000000000088 calculate


Contents of section .text:
 0000 ffffffff ffffffff ffffffff ffffffff  ................
 0010 38000000 00000000 70000000 00000000  8.......p.......
 0020 a8000000 01000000 d8000000 02000000  ................
 0030 ffffffff ffffffff fd7bbfa9 fd030091  .........{......
 0040 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0050 e90740b9 0801090b 000080d2 e10308aa  ..@.............
 0060 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0070 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0080 e10700b9 e80340b9 e90740b9 087d091b  ......@...@..}..
 0090 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 00a0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00b0 ff4300d1 e00300b9 e80340b9 e90340b9  .C........@...@.
 00c0 087d091b 000080d2 e10308aa ff430091  .}...........C..
 00d0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00e0 000080d2 e1031faa fd7bc1a8 c0035fd6  .........{...._.
 00f0 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0100 e10700b9 e20b00b9 e80740b9 e90b40b9  ..........@...@.
 0110 ea0340b9 5f1d0071 8b000054 810080d2  ..@._..q...T....
 0120 200080d2 11000014 0b000090 6b010091   ...........k...
 0130 6b796af8 7f0500b1 81000054 a10080d2  kyj........T....
 0140 200080d2 09000014 6cfd60d3 9f010071   .......l.`....q
 0150 81000054 c10080d2 200080d2 03000014  ...T.... .......
 0160 000080d2 e10309aa ff430091 fd7bc1a8  .........C...{..
 0170 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <$func0-0x38>:
   0:	ffffffff 	.inst	0xffffffff ; undefined
   4:	ffffffff 	.inst	0xffffffff ; undefined
   8:	ffffffff 	.inst	0xffffffff ; undefined
   c:	ffffffff 	.inst	0xffffffff ; undefined
  10:	00000038 	udf	#56
  14:	00000000 	udf	#0
  18:	00000070 	udf	#112
  1c:	00000000 	udf	#0
  20:	000000a8 	udf	#168
  24:	00000001 	udf	#1
  28:	000000d8 	udf	#216
  2c:	00000002 	udf	#2
  30:	ffffffff 	.inst	0xffffffff ; undefined
  34:	ffffffff 	.inst	0xffffffff ; undefined

0000000000000038 <$func0>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	b90003e0 	str	w0, [sp]
  48:	b90007e1 	str	w1, [sp, #4]
  4c:	b94003e8 	ldr	w8, [sp]
  50:	b94007e9 	ldr	w9, [sp, #4]
  54:	0b090108 	add	w8, w8, w9
  58:	d2800000 	mov	x0, #0x0                   	// #0
  5c:	aa0803e1 	mov	x1, x8
  60:	910043ff 	add	sp, sp, #0x10
  64:	a8c17bfd 	ldp	x29, x30, [sp], #16
  68:	d65f03c0 	ret
  6c:	d503201f 	nop

0000000000000070 <$func1>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	b90003e0 	str	w0, [sp]
  80:	b90007e1 	str	w1, [sp, #4]
  84:	b94003e8 	ldr	w8, [sp]
  88:	b94007e9 	ldr	w9, [sp, #4]
  8c:	1b097d08 	mul	w8, w8, w9
  90:	d2800000 	mov	x0, #0x0                   	// #0
  94:	aa0803e1 	mov	x1, x8
  98:	910043ff 	add	sp, sp, #0x10
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop

00000000000000a8 <$func2>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10043ff 	sub	sp, sp, #0x10
  b4:	b90003e0 	str	w0, [sp]
  b8:	b94003e8 	ldr	w8, [sp]
  bc:	b94003e9 	ldr	w9, [sp]
  c0:	1b097d08 	mul	w8, w8, w9
  c4:	d2800000 	mov	x0, #0x0                   	// #0
  c8:	aa0803e1 	mov	x1, x8
  cc:	910043ff 	add	sp, sp, #0x10
  d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d4:	d65f03c0 	ret

00000000000000d8 <$func3>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	d2800000 	mov	x0, #0x0                   	// #0
  e4:	aa1f03e1 	mov	x1, xzr
  e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ec:	d65f03c0 	ret

00000000000000f0 <calculate>:
  f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  f4:	910003fd 	mov	x29, sp
  f8:	d10043ff 	sub	sp, sp, #0x10
  fc:	b90003e0 	str	w0, [sp]
 100:	b90007e1 	str	w1, [sp, #4]
 104:	b9000be2 	str	w2, [sp, #8]
 108:	b94007e8 	ldr	w8, [sp, #4]
 10c:	b9400be9 	ldr	w9, [sp, #8]
 110:	b94003ea 	ldr	w10, [sp]
 114:	71001d5f 	cmp	w10, #0x7
 118:	5400008b 	b.lt	128 <calculate+0x38>  // b.tstop
 11c:	d2800081 	mov	x1, #0x4                   	// #4
 120:	d2800020 	mov	x0, #0x1                   	// #1
 124:	14000011 	b	168 <calculate+0x78>
 128:	9000000b 	adrp	x11, 0 <$func0-0x38>
 12c:	9100016b 	add	x11, x11, #0x0
 130:	f86a796b 	ldr	x11, [x11, x10, lsl #3]
 134:	b100057f 	cmn	x11, #0x1
 138:	54000081 	b.ne	148 <calculate+0x58>  // b.any
 13c:	d28000a1 	mov	x1, #0x5                   	// #5
 140:	d2800020 	mov	x0, #0x1                   	// #1
 144:	14000009 	b	168 <calculate+0x78>
 148:	d360fd6c 	lsr	x12, x11, #32
 14c:	7100019f 	cmp	w12, #0x0
 150:	54000081 	b.ne	160 <calculate+0x70>  // b.any
 154:	d28000c1 	mov	x1, #0x6                   	// #6
 158:	d2800020 	mov	x0, #0x1                   	// #1
 15c:	14000003 	b	168 <calculate+0x78>
 160:	d2800000 	mov	x0, #0x0                   	// #0
 164:	aa0903e1 	mov	x1, x9
 168:	910043ff 	add	sp, sp, #0x10
 16c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 170:	d65f03c0 	ret
 174:	d503201f 	nop
