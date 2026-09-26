
tests/assets/jit/relop.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 i32_lts
0000000000000040 l     F .text	0000000000000040 i32_leu
0000000000000080 l     F .text	0000000000000040 i32_gtu
00000000000000c0 l     F .text	0000000000000040 i32_ne


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0020 1f01096b e8a79f1a 000080d2 e10308aa  ...k............
 0030 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0040 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0050 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0060 1f01096b e8879f1a 000080d2 e10308aa  ...k............
 0070 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0080 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0090 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 00a0 1f01096b e8979f1a 000080d2 e10308aa  ...k............
 00b0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00c0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00d0 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 00e0 1f01096b e8079f1a 000080d2 e10308aa  ...k............
 00f0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <i32_lts>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9000fe2 	str	w2, [sp, #12]
  18:	b9400be8 	ldr	w8, [sp, #8]
  1c:	b9400fe9 	ldr	w9, [sp, #12]
  20:	6b09011f 	cmp	w8, w9
  24:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  28:	d2800000 	mov	x0, #0x0                   	// #0
  2c:	aa0803e1 	mov	x1, x8
  30:	910043ff 	add	sp, sp, #0x10
  34:	a8c17bfd 	ldp	x29, x30, [sp], #16
  38:	d65f03c0 	ret
  3c:	d503201f 	nop

0000000000000040 <i32_leu>:
  40:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  44:	910003fd 	mov	x29, sp
  48:	d10043ff 	sub	sp, sp, #0x10
  4c:	f90003e0 	str	x0, [sp]
  50:	b9000be1 	str	w1, [sp, #8]
  54:	b9000fe2 	str	w2, [sp, #12]
  58:	b9400be8 	ldr	w8, [sp, #8]
  5c:	b9400fe9 	ldr	w9, [sp, #12]
  60:	6b09011f 	cmp	w8, w9
  64:	1a9f87e8 	cset	w8, ls	// ls = plast
  68:	d2800000 	mov	x0, #0x0                   	// #0
  6c:	aa0803e1 	mov	x1, x8
  70:	910043ff 	add	sp, sp, #0x10
  74:	a8c17bfd 	ldp	x29, x30, [sp], #16
  78:	d65f03c0 	ret
  7c:	d503201f 	nop

0000000000000080 <i32_gtu>:
  80:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  84:	910003fd 	mov	x29, sp
  88:	d10043ff 	sub	sp, sp, #0x10
  8c:	f90003e0 	str	x0, [sp]
  90:	b9000be1 	str	w1, [sp, #8]
  94:	b9000fe2 	str	w2, [sp, #12]
  98:	b9400be8 	ldr	w8, [sp, #8]
  9c:	b9400fe9 	ldr	w9, [sp, #12]
  a0:	6b09011f 	cmp	w8, w9
  a4:	1a9f97e8 	cset	w8, hi	// hi = pmore
  a8:	d2800000 	mov	x0, #0x0                   	// #0
  ac:	aa0803e1 	mov	x1, x8
  b0:	910043ff 	add	sp, sp, #0x10
  b4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b8:	d65f03c0 	ret
  bc:	d503201f 	nop

00000000000000c0 <i32_ne>:
  c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  c4:	910003fd 	mov	x29, sp
  c8:	d10043ff 	sub	sp, sp, #0x10
  cc:	f90003e0 	str	x0, [sp]
  d0:	b9000be1 	str	w1, [sp, #8]
  d4:	b9000fe2 	str	w2, [sp, #12]
  d8:	b9400be8 	ldr	w8, [sp, #8]
  dc:	b9400fe9 	ldr	w9, [sp, #12]
  e0:	6b09011f 	cmp	w8, w9
  e4:	1a9f07e8 	cset	w8, ne	// ne = any
  e8:	d2800000 	mov	x0, #0x0                   	// #0
  ec:	aa0803e1 	mov	x1, x8
  f0:	910043ff 	add	sp, sp, #0x10
  f4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  f8:	d65f03c0 	ret
  fc:	d503201f 	nop
