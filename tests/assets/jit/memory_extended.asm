
tests/assets/jit/memory_extended.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 memory
0000000000000038 l     F .text	0000000000000038 mem_bytes
0000000000000070 l     F .text	0000000000000118 test_i32
0000000000000188 l     F .text	0000000000000050 memtest


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 c9c89012 e9c6b372  ......@........r
 0020 0801094a 000080d2 e10308aa ff430091  ...J.........C..
 0030 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0040 ff4300d1 e00300f9 081c40f9 09008052  .C........@....R
 0050 2900a072 087d091b 000080d2 e10308aa  )..r.}..........
 0060 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0070 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0080 ff0b00b9 ff0f00b9 ff1300b9 ff1700b9  ................
 0090 e00340f9 e9ffff97 200700b5 e803012a  ..@..... ......*
 00a0 89008052 0801094b e80f00b9 e80b40b9  ...R...K......@.
 00b0 e90f40b9 1f01096b e8979f1a a8050035  ..@....k.......5
 00c0 e80b40b9 e103082a e00340f9 cdffff97  ..@....*..@.....
 00d0 600500b5 e803012a e81300b9 e80b40b9  `......*......@.
 00e0 e91340b9 0a1840f9 4a1100d1 1f010aeb  ..@...@.J.......
 00f0 89000054 410080d2 200080d2 20000014  ...TA... ... ...
 0100 0a1440f9 496928b8 e80b40b9 091840f9  ..@.Ii(...@...@.
 0110 291100d1 1f0109eb 89000054 410080d2  )..........TA...
 0120 200080d2 16000014 091440f9 286968b8   .........@.(ih.
 0130 e91340b9 1f01096b e8079f1a 08010034  ..@....k.......4
 0140 e80b40b9 49008052 0821c91a 29008052  ..@.I..R.!..)..R
 0150 0801092a e81700b9 06000014 e80b40b9  ...*..........@.
 0160 89008052 0801090b e80b00b9 d0ffff17  ...R............
 0170 e81740b9 000080d2 e10308aa ff830091  ..@.............
 0180 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0190 ff4300d1 e00300f9 e00340f9 b5ffff97  .C........@.....
 01a0 600100b5 e803012a 09008052 1f01096b  `......*...R...k
 01b0 e8079f1a 68000034 28008052 02000014  ....h..4(..R....
 01c0 08008052 000080d2 e10308aa ff430091  ...R.........C..
 01d0 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <memory>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9400be8 	ldr	w8, [sp, #8]
  18:	1290c8c9 	mov	w9, #0xffff79b9            	// #-34375
  1c:	72b3c6e9 	movk	w9, #0x9e37, lsl #16
  20:	4a090108 	eor	w8, w8, w9
  24:	d2800000 	mov	x0, #0x0                   	// #0
  28:	aa0803e1 	mov	x1, x8
  2c:	910043ff 	add	sp, sp, #0x10
  30:	a8c17bfd 	ldp	x29, x30, [sp], #16
  34:	d65f03c0 	ret

0000000000000038 <mem_bytes>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	f9401c08 	ldr	x8, [x0, #56]
  4c:	52800009 	mov	w9, #0x0                   	// #0
  50:	72a00029 	movk	w9, #0x1, lsl #16
  54:	1b097d08 	mul	w8, w8, w9
  58:	d2800000 	mov	x0, #0x0                   	// #0
  5c:	aa0803e1 	mov	x1, x8
  60:	910043ff 	add	sp, sp, #0x10
  64:	a8c17bfd 	ldp	x29, x30, [sp], #16
  68:	d65f03c0 	ret
  6c:	d503201f 	nop

0000000000000070 <test_i32>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10083ff 	sub	sp, sp, #0x20
  7c:	f90003e0 	str	x0, [sp]
  80:	b9000bff 	str	wzr, [sp, #8]
  84:	b9000fff 	str	wzr, [sp, #12]
  88:	b90013ff 	str	wzr, [sp, #16]
  8c:	b90017ff 	str	wzr, [sp, #20]
  90:	f94003e0 	ldr	x0, [sp]
  94:	97ffffe9 	bl	38 <mem_bytes>
  98:	b5000720 	cbnz	x0, 17c <test_i32+0x10c>
  9c:	2a0103e8 	mov	w8, w1
  a0:	52800089 	mov	w9, #0x4                   	// #4
  a4:	4b090108 	sub	w8, w8, w9
  a8:	b9000fe8 	str	w8, [sp, #12]
  ac:	b9400be8 	ldr	w8, [sp, #8]
  b0:	b9400fe9 	ldr	w9, [sp, #12]
  b4:	6b09011f 	cmp	w8, w9
  b8:	1a9f97e8 	cset	w8, hi	// hi = pmore
  bc:	350005a8 	cbnz	w8, 170 <test_i32+0x100>
  c0:	b9400be8 	ldr	w8, [sp, #8]
  c4:	2a0803e1 	mov	w1, w8
  c8:	f94003e0 	ldr	x0, [sp]
  cc:	97ffffcd 	bl	0 <memory>
  d0:	b5000560 	cbnz	x0, 17c <test_i32+0x10c>
  d4:	2a0103e8 	mov	w8, w1
  d8:	b90013e8 	str	w8, [sp, #16]
  dc:	b9400be8 	ldr	w8, [sp, #8]
  e0:	b94013e9 	ldr	w9, [sp, #16]
  e4:	f940180a 	ldr	x10, [x0, #48]
  e8:	d100114a 	sub	x10, x10, #0x4
  ec:	eb0a011f 	cmp	x8, x10
  f0:	54000089 	b.ls	100 <test_i32+0x90>  // b.plast
  f4:	d2800041 	mov	x1, #0x2                   	// #2
  f8:	d2800020 	mov	x0, #0x1                   	// #1
  fc:	14000020 	b	17c <test_i32+0x10c>
 100:	f940140a 	ldr	x10, [x0, #40]
 104:	b8286949 	str	w9, [x10, x8]
 108:	b9400be8 	ldr	w8, [sp, #8]
 10c:	f9401809 	ldr	x9, [x0, #48]
 110:	d1001129 	sub	x9, x9, #0x4
 114:	eb09011f 	cmp	x8, x9
 118:	54000089 	b.ls	128 <test_i32+0xb8>  // b.plast
 11c:	d2800041 	mov	x1, #0x2                   	// #2
 120:	d2800020 	mov	x0, #0x1                   	// #1
 124:	14000016 	b	17c <test_i32+0x10c>
 128:	f9401409 	ldr	x9, [x0, #40]
 12c:	b8686928 	ldr	w8, [x9, x8]
 130:	b94013e9 	ldr	w9, [sp, #16]
 134:	6b09011f 	cmp	w8, w9
 138:	1a9f07e8 	cset	w8, ne	// ne = any
 13c:	34000108 	cbz	w8, 15c <test_i32+0xec>
 140:	b9400be8 	ldr	w8, [sp, #8]
 144:	52800049 	mov	w9, #0x2                   	// #2
 148:	1ac92108 	lsl	w8, w8, w9
 14c:	52800029 	mov	w9, #0x1                   	// #1
 150:	2a090108 	orr	w8, w8, w9
 154:	b90017e8 	str	w8, [sp, #20]
 158:	14000006 	b	170 <test_i32+0x100>
 15c:	b9400be8 	ldr	w8, [sp, #8]
 160:	52800089 	mov	w9, #0x4                   	// #4
 164:	0b090108 	add	w8, w8, w9
 168:	b9000be8 	str	w8, [sp, #8]
 16c:	17ffffd0 	b	ac <test_i32+0x3c>
 170:	b94017e8 	ldr	w8, [sp, #20]
 174:	d2800000 	mov	x0, #0x0                   	// #0
 178:	aa0803e1 	mov	x1, x8
 17c:	910083ff 	add	sp, sp, #0x20
 180:	a8c17bfd 	ldp	x29, x30, [sp], #16
 184:	d65f03c0 	ret

0000000000000188 <memtest>:
 188:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 18c:	910003fd 	mov	x29, sp
 190:	d10043ff 	sub	sp, sp, #0x10
 194:	f90003e0 	str	x0, [sp]
 198:	f94003e0 	ldr	x0, [sp]
 19c:	97ffffb5 	bl	70 <test_i32>
 1a0:	b5000160 	cbnz	x0, 1cc <memtest+0x44>
 1a4:	2a0103e8 	mov	w8, w1
 1a8:	52800009 	mov	w9, #0x0                   	// #0
 1ac:	6b09011f 	cmp	w8, w9
 1b0:	1a9f07e8 	cset	w8, ne	// ne = any
 1b4:	34000068 	cbz	w8, 1c0 <memtest+0x38>
 1b8:	52800028 	mov	w8, #0x1                   	// #1
 1bc:	14000002 	b	1c4 <memtest+0x3c>
 1c0:	52800008 	mov	w8, #0x0                   	// #0
 1c4:	d2800000 	mov	x0, #0x0                   	// #0
 1c8:	aa0803e1 	mov	x1, x8
 1cc:	910043ff 	add	sp, sp, #0x10
 1d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1d4:	d65f03c0 	ret
