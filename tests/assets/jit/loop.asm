
tests/assets/jit/loop.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000058 loop_n
0000000000000058 l     F .text	0000000000000050 loop_n_tee
00000000000000a8 l     F .text	0000000000000068 loop_nm


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 ff0f00b9 e80f40b9 29008052  ..........@.)..R
 0020 0801090b e80f00b9 e80f40b9 e90b40b9  ..........@...@.
 0030 1f01096b e8a79f1a 08ffff35 e80f40b9  ...k.......5..@.
 0040 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0050 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0060 ff4300d1 e00300f9 e10b00b9 ff0f00b9  .C..............
 0070 e80f40b9 29008052 0801090b e80f00b9  ..@.)..R........
 0080 e90b40b9 1f01096b e8a79f1a 28ffff35  ..@....k....(..5
 0090 e80f40b9 000080d2 e10308aa ff430091  ..@..........C..
 00a0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00b0 ff8300d1 e00300f9 e10b00b9 e20f00b9  ................
 00c0 ff1300b9 e81340b9 29008052 0801090b  ......@.)..R....
 00d0 e81300b9 e80b40b9 29008052 0801090b  ......@.)..R....
 00e0 e80b00b9 e80b40b9 e90f40b9 1f01096b  ......@...@....k
 00f0 e8a79f1a 88feff35 e81340b9 000080d2  .......5..@.....
 0100 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.

Disassembly of section .text:

0000000000000000 <loop_n>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9000fff 	str	wzr, [sp, #12]
  18:	b9400fe8 	ldr	w8, [sp, #12]
  1c:	52800029 	mov	w9, #0x1                   	// #1
  20:	0b090108 	add	w8, w8, w9
  24:	b9000fe8 	str	w8, [sp, #12]
  28:	b9400fe8 	ldr	w8, [sp, #12]
  2c:	b9400be9 	ldr	w9, [sp, #8]
  30:	6b09011f 	cmp	w8, w9
  34:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  38:	35ffff08 	cbnz	w8, 18 <loop_n+0x18>
  3c:	b9400fe8 	ldr	w8, [sp, #12]
  40:	d2800000 	mov	x0, #0x0                   	// #0
  44:	aa0803e1 	mov	x1, x8
  48:	910043ff 	add	sp, sp, #0x10
  4c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  50:	d65f03c0 	ret
  54:	d503201f 	nop

0000000000000058 <loop_n_tee>:
  58:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  5c:	910003fd 	mov	x29, sp
  60:	d10043ff 	sub	sp, sp, #0x10
  64:	f90003e0 	str	x0, [sp]
  68:	b9000be1 	str	w1, [sp, #8]
  6c:	b9000fff 	str	wzr, [sp, #12]
  70:	b9400fe8 	ldr	w8, [sp, #12]
  74:	52800029 	mov	w9, #0x1                   	// #1
  78:	0b090108 	add	w8, w8, w9
  7c:	b9000fe8 	str	w8, [sp, #12]
  80:	b9400be9 	ldr	w9, [sp, #8]
  84:	6b09011f 	cmp	w8, w9
  88:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  8c:	35ffff28 	cbnz	w8, 70 <loop_n_tee+0x18>
  90:	b9400fe8 	ldr	w8, [sp, #12]
  94:	d2800000 	mov	x0, #0x0                   	// #0
  98:	aa0803e1 	mov	x1, x8
  9c:	910043ff 	add	sp, sp, #0x10
  a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a4:	d65f03c0 	ret

00000000000000a8 <loop_nm>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10083ff 	sub	sp, sp, #0x20
  b4:	f90003e0 	str	x0, [sp]
  b8:	b9000be1 	str	w1, [sp, #8]
  bc:	b9000fe2 	str	w2, [sp, #12]
  c0:	b90013ff 	str	wzr, [sp, #16]
  c4:	b94013e8 	ldr	w8, [sp, #16]
  c8:	52800029 	mov	w9, #0x1                   	// #1
  cc:	0b090108 	add	w8, w8, w9
  d0:	b90013e8 	str	w8, [sp, #16]
  d4:	b9400be8 	ldr	w8, [sp, #8]
  d8:	52800029 	mov	w9, #0x1                   	// #1
  dc:	0b090108 	add	w8, w8, w9
  e0:	b9000be8 	str	w8, [sp, #8]
  e4:	b9400be8 	ldr	w8, [sp, #8]
  e8:	b9400fe9 	ldr	w9, [sp, #12]
  ec:	6b09011f 	cmp	w8, w9
  f0:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  f4:	35fffe88 	cbnz	w8, c4 <loop_nm+0x1c>
  f8:	b94013e8 	ldr	w8, [sp, #16]
  fc:	d2800000 	mov	x0, #0x0                   	// #0
 100:	aa0803e1 	mov	x1, x8
 104:	910083ff 	add	sp, sp, #0x20
 108:	a8c17bfd 	ldp	x29, x30, [sp], #16
 10c:	d65f03c0 	ret
