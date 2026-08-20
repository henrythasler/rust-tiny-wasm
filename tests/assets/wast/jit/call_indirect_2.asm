
tests/assets/wast/jit/call_indirect_2.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 table
0000000000000038 l     F .text	0000000000000028 $func1
0000000000000060 l     F .text	00000000000000b0 call_indirect


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 29008052 0801090b  ......@.)..R....
 0020 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0030 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0040 ff4300d1 e00300f9 e10b00b9 000080d2  .C..............
 0050 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0060 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0070 e10b00b9 e20f00b9 e80f40b9 e90b40b9  ..........@...@.
 0080 0a1840b9 3f010a6b 83000054 810080d2  ..@.?..k...T....
 0090 200080d2 1b000014 0b0840f9 6b11098b   .........@.k...
 00a0 6a0140f9 6b0940b9 8a0000b5 a10080d2  j.@.k.@.........
 00b0 200080d2 13000014 7f010071 80000054   ..........q...T
 00c0 c10080d2 200080d2 0e000014 e103082a  .... ..........*
 00d0 e00340f9 ff4300d1 e80300f9 e90700f9  ..@..C..........
 00e0 40013fd6 e80340f9 e90740f9 ff430091  @.?...@...@..C..
 00f0 800000b5 ea03012a 000080d2 e1030aaa  .......*........
 0100 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <table>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9400be8 	ldr	w8, [sp, #8]
  18:	52800029 	mov	w9, #0x1                   	// #1
  1c:	0b090108 	add	w8, w8, w9
  20:	d2800000 	mov	x0, #0x0                   	// #0
  24:	aa0803e1 	mov	x1, x8
  28:	910043ff 	add	sp, sp, #0x10
  2c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  30:	d65f03c0 	ret
  34:	d503201f 	nop

0000000000000038 <$func1>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	b9000be1 	str	w1, [sp, #8]
  4c:	d2800000 	mov	x0, #0x0                   	// #0
  50:	aa1f03e1 	mov	x1, xzr
  54:	910043ff 	add	sp, sp, #0x10
  58:	a8c17bfd 	ldp	x29, x30, [sp], #16
  5c:	d65f03c0 	ret

0000000000000060 <call_indirect>:
  60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  64:	910003fd 	mov	x29, sp
  68:	d10043ff 	sub	sp, sp, #0x10
  6c:	f90003e0 	str	x0, [sp]
  70:	b9000be1 	str	w1, [sp, #8]
  74:	b9000fe2 	str	w2, [sp, #12]
  78:	b9400fe8 	ldr	w8, [sp, #12]
  7c:	b9400be9 	ldr	w9, [sp, #8]
  80:	b940180a 	ldr	w10, [x0, #24]
  84:	6b0a013f 	cmp	w9, w10
  88:	54000083 	b.cc	98 <call_indirect+0x38>  // b.lo, b.ul, b.last
  8c:	d2800081 	mov	x1, #0x4                   	// #4
  90:	d2800020 	mov	x0, #0x1                   	// #1
  94:	1400001b 	b	100 <call_indirect+0xa0>
  98:	f940080b 	ldr	x11, [x0, #16]
  9c:	8b09116b 	add	x11, x11, x9, lsl #4
  a0:	f940016a 	ldr	x10, [x11]
  a4:	b940096b 	ldr	w11, [x11, #8]
  a8:	b500008a 	cbnz	x10, b8 <call_indirect+0x58>
  ac:	d28000a1 	mov	x1, #0x5                   	// #5
  b0:	d2800020 	mov	x0, #0x1                   	// #1
  b4:	14000013 	b	100 <call_indirect+0xa0>
  b8:	7100017f 	cmp	w11, #0x0
  bc:	54000080 	b.eq	cc <call_indirect+0x6c>  // b.none
  c0:	d28000c1 	mov	x1, #0x6                   	// #6
  c4:	d2800020 	mov	x0, #0x1                   	// #1
  c8:	1400000e 	b	100 <call_indirect+0xa0>
  cc:	2a0803e1 	mov	w1, w8
  d0:	f94003e0 	ldr	x0, [sp]
  d4:	d10043ff 	sub	sp, sp, #0x10
  d8:	f90003e8 	str	x8, [sp]
  dc:	f90007e9 	str	x9, [sp, #8]
  e0:	d63f0140 	blr	x10
  e4:	f94003e8 	ldr	x8, [sp]
  e8:	f94007e9 	ldr	x9, [sp, #8]
  ec:	910043ff 	add	sp, sp, #0x10
  f0:	b5000080 	cbnz	x0, 100 <call_indirect+0xa0>
  f4:	2a0103ea 	mov	w10, w1
  f8:	d2800000 	mov	x0, #0x0                   	// #0
  fc:	aa0a03e1 	mov	x1, x10
 100:	910043ff 	add	sp, sp, #0x10
 104:	a8c17bfd 	ldp	x29, x30, [sp], #16
 108:	d65f03c0 	ret
 10c:	d503201f 	nop
