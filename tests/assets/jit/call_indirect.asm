
tests/assets/jit/call_indirect.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     O .text	0000000000000080 function_table
0000000000000020 l     F .text	0000000000000038 $func0
0000000000000058 l     F .text	0000000000000038 $func1
0000000000000090 l     F .text	0000000000000030 $func2
00000000000000c0 l     F .text	0000000000000018 $func3
00000000000000d8 l     F .text	0000000000000050 calculate


Contents of section .text:
 0000 00000000 00000000 20000000 58000000  ........ ...X...
 0010 90000000 c0000000 00000000 00000000  ................
 0020 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0030 e10700b9 e80340b9 e90740b9 0801090b  ......@...@.....
 0040 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0050 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0060 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0070 e90740b9 087d091b 000080d2 e10308aa  ..@..}..........
 0080 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0090 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 00a0 e80340b9 e90340b9 087d091b 000080d2  ..@...@..}......
 00b0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00c0 fd7bbfa9 fd030091 000080d2 e1031faa  .{..............
 00d0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00e0 ff4300d1 e00300b9 e10700b9 e20b00b9  .C..............
 00f0 e80740b9 e90b40b9 ea0340b9 5f1d0071  ..@...@...@._..q
 0100 8b000054 810080d2 200080d2 03000014  ...T.... .......
 0110 000080d2 e10309aa ff430091 fd7bc1a8  .........C...{..
 0120 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <function_table>:
	...
   8:	20 00 00 00 58 00 00 00 90 00 00 00 c0 00 00 00      ...X...........
	...

0000000000000020 <$func0>:
  20:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  24:	910003fd 	mov	x29, sp
  28:	d10043ff 	sub	sp, sp, #0x10
  2c:	b90003e0 	str	w0, [sp]
  30:	b90007e1 	str	w1, [sp, #4]
  34:	b94003e8 	ldr	w8, [sp]
  38:	b94007e9 	ldr	w9, [sp, #4]
  3c:	0b090108 	add	w8, w8, w9
  40:	d2800000 	mov	x0, #0x0                   	// #0
  44:	aa0803e1 	mov	x1, x8
  48:	910043ff 	add	sp, sp, #0x10
  4c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  50:	d65f03c0 	ret
  54:	d503201f 	nop

0000000000000058 <$func1>:
  58:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  5c:	910003fd 	mov	x29, sp
  60:	d10043ff 	sub	sp, sp, #0x10
  64:	b90003e0 	str	w0, [sp]
  68:	b90007e1 	str	w1, [sp, #4]
  6c:	b94003e8 	ldr	w8, [sp]
  70:	b94007e9 	ldr	w9, [sp, #4]
  74:	1b097d08 	mul	w8, w8, w9
  78:	d2800000 	mov	x0, #0x0                   	// #0
  7c:	aa0803e1 	mov	x1, x8
  80:	910043ff 	add	sp, sp, #0x10
  84:	a8c17bfd 	ldp	x29, x30, [sp], #16
  88:	d65f03c0 	ret
  8c:	d503201f 	nop

0000000000000090 <$func2>:
  90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  94:	910003fd 	mov	x29, sp
  98:	d10043ff 	sub	sp, sp, #0x10
  9c:	b90003e0 	str	w0, [sp]
  a0:	b94003e8 	ldr	w8, [sp]
  a4:	b94003e9 	ldr	w9, [sp]
  a8:	1b097d08 	mul	w8, w8, w9
  ac:	d2800000 	mov	x0, #0x0                   	// #0
  b0:	aa0803e1 	mov	x1, x8
  b4:	910043ff 	add	sp, sp, #0x10
  b8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  bc:	d65f03c0 	ret

00000000000000c0 <$func3>:
  c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  c4:	910003fd 	mov	x29, sp
  c8:	d2800000 	mov	x0, #0x0                   	// #0
  cc:	aa1f03e1 	mov	x1, xzr
  d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d4:	d65f03c0 	ret

00000000000000d8 <calculate>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	d10043ff 	sub	sp, sp, #0x10
  e4:	b90003e0 	str	w0, [sp]
  e8:	b90007e1 	str	w1, [sp, #4]
  ec:	b9000be2 	str	w2, [sp, #8]
  f0:	b94007e8 	ldr	w8, [sp, #4]
  f4:	b9400be9 	ldr	w9, [sp, #8]
  f8:	b94003ea 	ldr	w10, [sp]
  fc:	71001d5f 	cmp	w10, #0x7
 100:	5400008b 	b.lt	110 <calculate+0x38>  // b.tstop
 104:	d2800081 	mov	x1, #0x4                   	// #4
 108:	d2800020 	mov	x0, #0x1                   	// #1
 10c:	14000003 	b	118 <calculate+0x40>
 110:	d2800000 	mov	x0, #0x0                   	// #0
 114:	aa0903e1 	mov	x1, x9
 118:	910043ff 	add	sp, sp, #0x10
 11c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 120:	d65f03c0 	ret
 124:	d503201f 	nop
