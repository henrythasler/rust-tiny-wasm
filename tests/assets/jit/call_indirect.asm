
tests/assets/jit/call_indirect.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 $func0
0000000000000038 l     F .text	0000000000000038 $func1
0000000000000070 l     F .text	0000000000000038 $func2
00000000000000a8 l     F .text	0000000000000028 $func3
00000000000000d0 l     F .text	0000000000000058 calculate


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
 0100 8b000054 810080d2 200080d2 03000014  ...T.... .......
 0110 000080d2 e10309aa ff830091 fd7bc1a8  .............{..
 0120 c0035fd6 1f2003d5                    .._.. ..        

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
 10c:	14000003 	b	118 <calculate+0x48>
 110:	d2800000 	mov	x0, #0x0                   	// #0
 114:	aa0903e1 	mov	x1, x9
 118:	910083ff 	add	sp, sp, #0x20
 11c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 120:	d65f03c0 	ret
 124:	d503201f 	nop
