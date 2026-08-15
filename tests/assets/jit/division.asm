
tests/assets/jit/division.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 div_s32
0000000000000068 l     F .text	0000000000000048 div_u32
00000000000000b0 l     F .text	0000000000000068 div_s64
0000000000000118 l     F .text	0000000000000048 div_u64
0000000000000160 l     F .text	0000000000000060 div_by_zero


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0020 89000035 010180d2 200080d2 0c000014  ...5.... .......
 0030 3f050031 e1000054 0a00b052 1f010a6b  ?..1...T...R...k
 0040 81000054 e10080d2 200080d2 04000014  ...T.... .......
 0050 080dc91a 000080d2 e10308aa ff430091  .............C..
 0060 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0070 ff4300d1 e00300f9 e10b00b9 e20f00b9  .C..............
 0080 e80b40b9 e90f40b9 89000035 010180d2  ..@...@....5....
 0090 200080d2 04000014 0809c91a 000080d2   ...............
 00a0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00b0 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 00c0 e10700f9 e20b00f9 e80740f9 e90b40f9  ..........@...@.
 00d0 890000b5 010180d2 200080d2 0c000014  ........ .......
 00e0 3f0500b1 e1000054 0a00f0d2 1f010aeb  ?......T........
 00f0 81000054 e10080d2 200080d2 04000014  ...T.... .......
 0100 080dc99a 000080d2 e10308aa ff830091  ................
 0110 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0120 ff8300d1 e00300f9 e10700f9 e20b00f9  ................
 0130 e80740f9 e90b40f9 890000b5 010180d2  ..@...@.........
 0140 200080d2 04000014 0809c99a 000080d2   ...............
 0150 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 0160 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0170 28008052 09008052 89000035 010180d2  (..R...R...5....
 0180 200080d2 0c000014 3f050031 e1000054   .......?..1...T
 0190 0a00b052 1f010a6b 81000054 e10080d2  ...R...k...T....
 01a0 200080d2 04000014 080dc91a 000080d2   ...............
 01b0 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

Disassembly of section .text:

0000000000000000 <div_s32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9000fe2 	str	w2, [sp, #12]
  18:	b9400be8 	ldr	w8, [sp, #8]
  1c:	b9400fe9 	ldr	w9, [sp, #12]
  20:	35000089 	cbnz	w9, 30 <div_s32+0x30>
  24:	d2800101 	mov	x1, #0x8                   	// #8
  28:	d2800020 	mov	x0, #0x1                   	// #1
  2c:	1400000c 	b	5c <div_s32+0x5c>
  30:	3100053f 	cmn	w9, #0x1
  34:	540000e1 	b.ne	50 <div_s32+0x50>  // b.any
  38:	52b0000a 	mov	w10, #0x80000000            	// #-2147483648
  3c:	6b0a011f 	cmp	w8, w10
  40:	54000081 	b.ne	50 <div_s32+0x50>  // b.any
  44:	d28000e1 	mov	x1, #0x7                   	// #7
  48:	d2800020 	mov	x0, #0x1                   	// #1
  4c:	14000004 	b	5c <div_s32+0x5c>
  50:	1ac90d08 	sdiv	w8, w8, w9
  54:	d2800000 	mov	x0, #0x0                   	// #0
  58:	aa0803e1 	mov	x1, x8
  5c:	910043ff 	add	sp, sp, #0x10
  60:	a8c17bfd 	ldp	x29, x30, [sp], #16
  64:	d65f03c0 	ret

0000000000000068 <div_u32>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	f90003e0 	str	x0, [sp]
  78:	b9000be1 	str	w1, [sp, #8]
  7c:	b9000fe2 	str	w2, [sp, #12]
  80:	b9400be8 	ldr	w8, [sp, #8]
  84:	b9400fe9 	ldr	w9, [sp, #12]
  88:	35000089 	cbnz	w9, 98 <div_u32+0x30>
  8c:	d2800101 	mov	x1, #0x8                   	// #8
  90:	d2800020 	mov	x0, #0x1                   	// #1
  94:	14000004 	b	a4 <div_u32+0x3c>
  98:	1ac90908 	udiv	w8, w8, w9
  9c:	d2800000 	mov	x0, #0x0                   	// #0
  a0:	aa0803e1 	mov	x1, x8
  a4:	910043ff 	add	sp, sp, #0x10
  a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ac:	d65f03c0 	ret

00000000000000b0 <div_s64>:
  b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  b4:	910003fd 	mov	x29, sp
  b8:	d10083ff 	sub	sp, sp, #0x20
  bc:	f90003e0 	str	x0, [sp]
  c0:	f90007e1 	str	x1, [sp, #8]
  c4:	f9000be2 	str	x2, [sp, #16]
  c8:	f94007e8 	ldr	x8, [sp, #8]
  cc:	f9400be9 	ldr	x9, [sp, #16]
  d0:	b5000089 	cbnz	x9, e0 <div_s64+0x30>
  d4:	d2800101 	mov	x1, #0x8                   	// #8
  d8:	d2800020 	mov	x0, #0x1                   	// #1
  dc:	1400000c 	b	10c <div_s64+0x5c>
  e0:	b100053f 	cmn	x9, #0x1
  e4:	540000e1 	b.ne	100 <div_s64+0x50>  // b.any
  e8:	d2f0000a 	mov	x10, #0x8000000000000000    	// #-9223372036854775808
  ec:	eb0a011f 	cmp	x8, x10
  f0:	54000081 	b.ne	100 <div_s64+0x50>  // b.any
  f4:	d28000e1 	mov	x1, #0x7                   	// #7
  f8:	d2800020 	mov	x0, #0x1                   	// #1
  fc:	14000004 	b	10c <div_s64+0x5c>
 100:	9ac90d08 	sdiv	x8, x8, x9
 104:	d2800000 	mov	x0, #0x0                   	// #0
 108:	aa0803e1 	mov	x1, x8
 10c:	910083ff 	add	sp, sp, #0x20
 110:	a8c17bfd 	ldp	x29, x30, [sp], #16
 114:	d65f03c0 	ret

0000000000000118 <div_u64>:
 118:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 11c:	910003fd 	mov	x29, sp
 120:	d10083ff 	sub	sp, sp, #0x20
 124:	f90003e0 	str	x0, [sp]
 128:	f90007e1 	str	x1, [sp, #8]
 12c:	f9000be2 	str	x2, [sp, #16]
 130:	f94007e8 	ldr	x8, [sp, #8]
 134:	f9400be9 	ldr	x9, [sp, #16]
 138:	b5000089 	cbnz	x9, 148 <div_u64+0x30>
 13c:	d2800101 	mov	x1, #0x8                   	// #8
 140:	d2800020 	mov	x0, #0x1                   	// #1
 144:	14000004 	b	154 <div_u64+0x3c>
 148:	9ac90908 	udiv	x8, x8, x9
 14c:	d2800000 	mov	x0, #0x0                   	// #0
 150:	aa0803e1 	mov	x1, x8
 154:	910083ff 	add	sp, sp, #0x20
 158:	a8c17bfd 	ldp	x29, x30, [sp], #16
 15c:	d65f03c0 	ret

0000000000000160 <div_by_zero>:
 160:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 164:	910003fd 	mov	x29, sp
 168:	d10043ff 	sub	sp, sp, #0x10
 16c:	f90003e0 	str	x0, [sp]
 170:	52800028 	mov	w8, #0x1                   	// #1
 174:	52800009 	mov	w9, #0x0                   	// #0
 178:	35000089 	cbnz	w9, 188 <div_by_zero+0x28>
 17c:	d2800101 	mov	x1, #0x8                   	// #8
 180:	d2800020 	mov	x0, #0x1                   	// #1
 184:	1400000c 	b	1b4 <div_by_zero+0x54>
 188:	3100053f 	cmn	w9, #0x1
 18c:	540000e1 	b.ne	1a8 <div_by_zero+0x48>  // b.any
 190:	52b0000a 	mov	w10, #0x80000000            	// #-2147483648
 194:	6b0a011f 	cmp	w8, w10
 198:	54000081 	b.ne	1a8 <div_by_zero+0x48>  // b.any
 19c:	d28000e1 	mov	x1, #0x7                   	// #7
 1a0:	d2800020 	mov	x0, #0x1                   	// #1
 1a4:	14000004 	b	1b4 <div_by_zero+0x54>
 1a8:	1ac90d08 	sdiv	w8, w8, w9
 1ac:	d2800000 	mov	x0, #0x0                   	// #0
 1b0:	aa1f03e1 	mov	x1, xzr
 1b4:	910043ff 	add	sp, sp, #0x10
 1b8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1bc:	d65f03c0 	ret
