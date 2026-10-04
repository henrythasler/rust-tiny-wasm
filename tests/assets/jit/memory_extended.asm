
tests/assets/jit/memory_extended.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 p32
0000000000000038 l     F .text	0000000000000038 mem_bytes
0000000000000070 l     F .text	0000000000000110 test_i32
0000000000000180 l     F .text	0000000000000050 memtest


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
 0090 eaffff97 000700b5 e803012a e00340f9  ...........*..@.
 00a0 89008052 0801094b e80f00b9 e80b40b9  ...R...K......@.
 00b0 e103082a d3ffff97 e00500b5 e803012a  ...*...........*
 00c0 e00340f9 e81300b9 e80b40b9 e91340b9  ..@.......@...@.
 00d0 0a1840f9 4a1100d1 1f010aeb 89000054  ..@.J..........T
 00e0 410080d2 200080d2 23000014 0a1440f9  A... ...#.....@.
 00f0 496928b8 e80b40b9 091840f9 291100d1  Ii(...@...@.)...
 0100 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 0110 19000014 091440f9 286968b8 e91340b9  ......@.(ih...@.
 0120 1f01096b e8079f1a 08010034 e80b40b9  ...k.......4..@.
 0130 49008052 0821c91a 29008052 0801092a  I..R.!..)..R...*
 0140 e81700b9 09000014 e80b40b9 89008052  ..........@....R
 0150 0801090b e80b00b9 e90f40b9 1f01096b  ..........@....k
 0160 e8a79f1a 48faff35 e81740b9 000080d2  ....H..5..@.....
 0170 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 0180 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0190 b8ffff97 800100b5 e803012a e00340f9  ...........*..@.
 01a0 09008052 1f01096b e8079f1a 68000034  ...R...k....h..4
 01b0 28008052 02000014 08008052 000080d2  (..R.......R....
 01c0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

Disassembly of section .text:

0000000000000000 <p32>:
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
  90:	97ffffea 	bl	38 <mem_bytes>
  94:	b5000700 	cbnz	x0, 174 <test_i32+0x104>
  98:	2a0103e8 	mov	w8, w1
  9c:	f94003e0 	ldr	x0, [sp]
  a0:	52800089 	mov	w9, #0x4                   	// #4
  a4:	4b090108 	sub	w8, w8, w9
  a8:	b9000fe8 	str	w8, [sp, #12]
  ac:	b9400be8 	ldr	w8, [sp, #8]
  b0:	2a0803e1 	mov	w1, w8
  b4:	97ffffd3 	bl	0 <p32>
  b8:	b50005e0 	cbnz	x0, 174 <test_i32+0x104>
  bc:	2a0103e8 	mov	w8, w1
  c0:	f94003e0 	ldr	x0, [sp]
  c4:	b90013e8 	str	w8, [sp, #16]
  c8:	b9400be8 	ldr	w8, [sp, #8]
  cc:	b94013e9 	ldr	w9, [sp, #16]
  d0:	f940180a 	ldr	x10, [x0, #48]
  d4:	d100114a 	sub	x10, x10, #0x4
  d8:	eb0a011f 	cmp	x8, x10
  dc:	54000089 	b.ls	ec <test_i32+0x7c>  // b.plast
  e0:	d2800041 	mov	x1, #0x2                   	// #2
  e4:	d2800020 	mov	x0, #0x1                   	// #1
  e8:	14000023 	b	174 <test_i32+0x104>
  ec:	f940140a 	ldr	x10, [x0, #40]
  f0:	b8286949 	str	w9, [x10, x8]
  f4:	b9400be8 	ldr	w8, [sp, #8]
  f8:	f9401809 	ldr	x9, [x0, #48]
  fc:	d1001129 	sub	x9, x9, #0x4
 100:	eb09011f 	cmp	x8, x9
 104:	54000089 	b.ls	114 <test_i32+0xa4>  // b.plast
 108:	d2800041 	mov	x1, #0x2                   	// #2
 10c:	d2800020 	mov	x0, #0x1                   	// #1
 110:	14000019 	b	174 <test_i32+0x104>
 114:	f9401409 	ldr	x9, [x0, #40]
 118:	b8686928 	ldr	w8, [x9, x8]
 11c:	b94013e9 	ldr	w9, [sp, #16]
 120:	6b09011f 	cmp	w8, w9
 124:	1a9f07e8 	cset	w8, ne	// ne = any
 128:	34000108 	cbz	w8, 148 <test_i32+0xd8>
 12c:	b9400be8 	ldr	w8, [sp, #8]
 130:	52800049 	mov	w9, #0x2                   	// #2
 134:	1ac92108 	lsl	w8, w8, w9
 138:	52800029 	mov	w9, #0x1                   	// #1
 13c:	2a090108 	orr	w8, w8, w9
 140:	b90017e8 	str	w8, [sp, #20]
 144:	14000009 	b	168 <test_i32+0xf8>
 148:	b9400be8 	ldr	w8, [sp, #8]
 14c:	52800089 	mov	w9, #0x4                   	// #4
 150:	0b090108 	add	w8, w8, w9
 154:	b9000be8 	str	w8, [sp, #8]
 158:	b9400fe9 	ldr	w9, [sp, #12]
 15c:	6b09011f 	cmp	w8, w9
 160:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 164:	35fffa48 	cbnz	w8, ac <test_i32+0x3c>
 168:	b94017e8 	ldr	w8, [sp, #20]
 16c:	d2800000 	mov	x0, #0x0                   	// #0
 170:	aa0803e1 	mov	x1, x8
 174:	910083ff 	add	sp, sp, #0x20
 178:	a8c17bfd 	ldp	x29, x30, [sp], #16
 17c:	d65f03c0 	ret

0000000000000180 <memtest>:
 180:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 184:	910003fd 	mov	x29, sp
 188:	d10043ff 	sub	sp, sp, #0x10
 18c:	f90003e0 	str	x0, [sp]
 190:	97ffffb8 	bl	70 <test_i32>
 194:	b5000180 	cbnz	x0, 1c4 <memtest+0x44>
 198:	2a0103e8 	mov	w8, w1
 19c:	f94003e0 	ldr	x0, [sp]
 1a0:	52800009 	mov	w9, #0x0                   	// #0
 1a4:	6b09011f 	cmp	w8, w9
 1a8:	1a9f07e8 	cset	w8, ne	// ne = any
 1ac:	34000068 	cbz	w8, 1b8 <memtest+0x38>
 1b0:	52800028 	mov	w8, #0x1                   	// #1
 1b4:	14000002 	b	1bc <memtest+0x3c>
 1b8:	52800008 	mov	w8, #0x0                   	// #0
 1bc:	d2800000 	mov	x0, #0x0                   	// #0
 1c0:	aa0803e1 	mov	x1, x8
 1c4:	910043ff 	add	sp, sp, #0x10
 1c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1cc:	d65f03c0 	ret
