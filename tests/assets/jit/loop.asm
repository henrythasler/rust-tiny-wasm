
tests/assets/jit/loop.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000050 loop_n
0000000000000050 l     F .text	0000000000000050 loop_n_tee
00000000000000a0 l     F .text	0000000000000068 loop_nm


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 ff0700b9 e80740b9 29008052 0801090b  ......@.)..R....
 0020 e80700b9 e80740b9 e90340b9 1f01096b  ......@...@....k
 0030 e8a79f1a 08ffff35 e80740b9 000080d2  .......5..@.....
 0040 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0060 ff0700b9 e80740b9 29008052 0801090b  ......@.)..R....
 0070 e80700b9 e90340b9 1f01096b e8a79f1a  ......@....k....
 0080 28ffff35 e80740b9 000080d2 e10308aa  (..5..@.........
 0090 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00a0 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 00b0 e10700b9 ff0b00b9 e80b40b9 29008052  ..........@.)..R
 00c0 0801090b e80b00b9 e80340b9 29008052  ..........@.)..R
 00d0 0801090b e80300b9 e80340b9 e90740b9  ..........@...@.
 00e0 1f01096b e8a79f1a 88feff35 e80b40b9  ...k.......5..@.
 00f0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0100 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <loop_n>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007ff 	str	wzr, [sp, #4]
  14:	b94007e8 	ldr	w8, [sp, #4]
  18:	52800029 	mov	w9, #0x1                   	// #1
  1c:	0b090108 	add	w8, w8, w9
  20:	b90007e8 	str	w8, [sp, #4]
  24:	b94007e8 	ldr	w8, [sp, #4]
  28:	b94003e9 	ldr	w9, [sp]
  2c:	6b09011f 	cmp	w8, w9
  30:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  34:	35ffff08 	cbnz	w8, 14 <loop_n+0x14>
  38:	b94007e8 	ldr	w8, [sp, #4]
  3c:	d2800000 	mov	x0, #0x0                   	// #0
  40:	aa0803e1 	mov	x1, x8
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <loop_n_tee>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	b90003e0 	str	w0, [sp]
  60:	b90007ff 	str	wzr, [sp, #4]
  64:	b94007e8 	ldr	w8, [sp, #4]
  68:	52800029 	mov	w9, #0x1                   	// #1
  6c:	0b090108 	add	w8, w8, w9
  70:	b90007e8 	str	w8, [sp, #4]
  74:	b94003e9 	ldr	w9, [sp]
  78:	6b09011f 	cmp	w8, w9
  7c:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  80:	35ffff28 	cbnz	w8, 64 <loop_n_tee+0x14>
  84:	b94007e8 	ldr	w8, [sp, #4]
  88:	d2800000 	mov	x0, #0x0                   	// #0
  8c:	aa0803e1 	mov	x1, x8
  90:	910043ff 	add	sp, sp, #0x10
  94:	a8c17bfd 	ldp	x29, x30, [sp], #16
  98:	d65f03c0 	ret
  9c:	d503201f 	nop

00000000000000a0 <loop_nm>:
  a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  a4:	910003fd 	mov	x29, sp
  a8:	d10043ff 	sub	sp, sp, #0x10
  ac:	b90003e0 	str	w0, [sp]
  b0:	b90007e1 	str	w1, [sp, #4]
  b4:	b9000bff 	str	wzr, [sp, #8]
  b8:	b9400be8 	ldr	w8, [sp, #8]
  bc:	52800029 	mov	w9, #0x1                   	// #1
  c0:	0b090108 	add	w8, w8, w9
  c4:	b9000be8 	str	w8, [sp, #8]
  c8:	b94003e8 	ldr	w8, [sp]
  cc:	52800029 	mov	w9, #0x1                   	// #1
  d0:	0b090108 	add	w8, w8, w9
  d4:	b90003e8 	str	w8, [sp]
  d8:	b94003e8 	ldr	w8, [sp]
  dc:	b94007e9 	ldr	w9, [sp, #4]
  e0:	6b09011f 	cmp	w8, w9
  e4:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  e8:	35fffe88 	cbnz	w8, b8 <loop_nm+0x18>
  ec:	b9400be8 	ldr	w8, [sp, #8]
  f0:	d2800000 	mov	x0, #0x0                   	// #0
  f4:	aa0803e1 	mov	x1, x8
  f8:	910043ff 	add	sp, sp, #0x10
  fc:	a8c17bfd 	ldp	x29, x30, [sp], #16
 100:	d65f03c0 	ret
 104:	d503201f 	nop
