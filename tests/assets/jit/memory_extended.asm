
tests/assets/jit/memory_extended.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 p32
0000000000000038 l     F .text	0000000000000048 p64
0000000000000080 l     F .text	0000000000000038 mem_bytes
00000000000000b8 l     F .text	0000000000000110 test_i32
00000000000001c8 l     F .text	0000000000000118 test_i64
00000000000002e0 l     F .text	0000000000000078 memtest


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 c9c89012 e9c6b372  ......@........r
 0020 0801094a 000080d2 e10308aa ff430091  ...J.........C..
 0030 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0040 ff4300d1 e00300f9 e10b00b9 e80b40b9  .C............@.
 0050 087d40d3 497d9092 49e9aff2 2937cff2  .}@.I}..I...)7..
 0060 e9c6f3f2 080109ca 000080d2 e10308aa  ................
 0070 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0080 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0090 081c40f9 09008052 2900a072 087d091b  ..@....R)..r.}..
 00a0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 00b0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00c0 ff8300d1 e00300f9 ff0b00b9 ff0f00b9  ................
 00d0 ff1300b9 ff1700b9 eaffff97 000700b5  ................
 00e0 e803012a e00340f9 89008052 0801094b  ...*..@....R...K
 00f0 e80f00b9 e80b40b9 e103082a c1ffff97  ......@....*....
 0100 e00500b5 e803012a e00340f9 e81300b9  .......*..@.....
 0110 e80b40b9 e91340b9 0a1840f9 4a1100d1  ..@...@...@.J...
 0120 1f010aeb 89000054 410080d2 200080d2  .......TA... ...
 0130 23000014 0a1440f9 496928b8 e80b40b9  #.....@.Ii(...@.
 0140 091840f9 291100d1 1f0109eb 89000054  ..@.)..........T
 0150 410080d2 200080d2 19000014 091440f9  A... .........@.
 0160 286968b8 e91340b9 1f01096b e8079f1a  (ih...@....k....
 0170 08010034 e80b40b9 49008052 0821c91a  ...4..@.I..R.!..
 0180 29008052 0801092a e81700b9 09000014  )..R...*........
 0190 e80b40b9 89008052 0801090b e80b00b9  ..@....R........
 01a0 e90f40b9 1f01096b e8a79f1a 48faff35  ..@....k....H..5
 01b0 e81740b9 000080d2 e10308aa ff830091  ..@.............
 01c0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 01d0 ff8300d1 e00300f9 ff0b00b9 ff0f00b9  ................
 01e0 ff0b00f9 ff1b00b9 a6ffff97 400700b5  ............@...
 01f0 e803012a e00340f9 09018052 0801094b  ...*..@....R...K
 0200 e80f00b9 e80b40b9 e90f40b9 1f01096b  ......@...@....k
 0210 e8979f1a a8050035 e80b40b9 e103082a  .......5..@....*
 0220 86ffff97 800500b5 e80301aa e00340f9  ..............@.
 0230 e80b00f9 e80b40b9 e90b40f9 0a1840f9  ......@...@...@.
 0240 4a2100d1 1f010aeb 89000054 410080d2  J!.........TA...
 0250 200080d2 20000014 0a1440f9 496928f8   ... .....@.Ii(.
 0260 e80b40b9 091840f9 292100d1 1f0109eb  ..@...@.)!......
 0270 89000054 410080d2 200080d2 16000014  ...TA... .......
 0280 091440f9 286968f8 e90b40f9 1f0109eb  ..@.(ih...@.....
 0290 e8079f1a 08010034 e80b40b9 49008052  .......4..@.I..R
 02a0 0821c91a 29008052 0801092a e81b00b9  .!..)..R...*....
 02b0 06000014 e80b40b9 09018052 0801090b  ......@....R....
 02c0 e80b00b9 d0ffff17 e81b40b9 000080d2  ..........@.....
 02d0 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 02e0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 02f0 72ffff97 c00200b5 e803012a e00340f9  r..........*..@.
 0300 09008052 1f01096b e8079f1a 68000034  ...R...k....h..4
 0310 28008052 0c000014 acffff97 800100b5  (..R............
 0320 e803012a e00340f9 09008052 1f01096b  ...*..@....R...k
 0330 e8079f1a 68000034 48008052 02000014  ....h..4H..R....
 0340 08008052 000080d2 e10308aa ff430091  ...R.........C..
 0350 fd7bc1a8 c0035fd6                    .{...._.        

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

0000000000000038 <p64>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	b9000be1 	str	w1, [sp, #8]
  4c:	b9400be8 	ldr	w8, [sp, #8]
  50:	d3407d08 	ubfx	x8, x8, #0, #32
  54:	92907d49 	mov	x9, #0xffffffffffff7c15    	// #-33771
  58:	f2afe949 	movk	x9, #0x7f4a, lsl #16
  5c:	f2cf3729 	movk	x9, #0x79b9, lsl #32
  60:	f2f3c6e9 	movk	x9, #0x9e37, lsl #48
  64:	ca090108 	eor	x8, x8, x9
  68:	d2800000 	mov	x0, #0x0                   	// #0
  6c:	aa0803e1 	mov	x1, x8
  70:	910043ff 	add	sp, sp, #0x10
  74:	a8c17bfd 	ldp	x29, x30, [sp], #16
  78:	d65f03c0 	ret
  7c:	d503201f 	nop

0000000000000080 <mem_bytes>:
  80:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  84:	910003fd 	mov	x29, sp
  88:	d10043ff 	sub	sp, sp, #0x10
  8c:	f90003e0 	str	x0, [sp]
  90:	f9401c08 	ldr	x8, [x0, #56]
  94:	52800009 	mov	w9, #0x0                   	// #0
  98:	72a00029 	movk	w9, #0x1, lsl #16
  9c:	1b097d08 	mul	w8, w8, w9
  a0:	d2800000 	mov	x0, #0x0                   	// #0
  a4:	aa0803e1 	mov	x1, x8
  a8:	910043ff 	add	sp, sp, #0x10
  ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b0:	d65f03c0 	ret
  b4:	d503201f 	nop

00000000000000b8 <test_i32>:
  b8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  bc:	910003fd 	mov	x29, sp
  c0:	d10083ff 	sub	sp, sp, #0x20
  c4:	f90003e0 	str	x0, [sp]
  c8:	b9000bff 	str	wzr, [sp, #8]
  cc:	b9000fff 	str	wzr, [sp, #12]
  d0:	b90013ff 	str	wzr, [sp, #16]
  d4:	b90017ff 	str	wzr, [sp, #20]
  d8:	97ffffea 	bl	80 <mem_bytes>
  dc:	b5000700 	cbnz	x0, 1bc <test_i32+0x104>
  e0:	2a0103e8 	mov	w8, w1
  e4:	f94003e0 	ldr	x0, [sp]
  e8:	52800089 	mov	w9, #0x4                   	// #4
  ec:	4b090108 	sub	w8, w8, w9
  f0:	b9000fe8 	str	w8, [sp, #12]
  f4:	b9400be8 	ldr	w8, [sp, #8]
  f8:	2a0803e1 	mov	w1, w8
  fc:	97ffffc1 	bl	0 <p32>
 100:	b50005e0 	cbnz	x0, 1bc <test_i32+0x104>
 104:	2a0103e8 	mov	w8, w1
 108:	f94003e0 	ldr	x0, [sp]
 10c:	b90013e8 	str	w8, [sp, #16]
 110:	b9400be8 	ldr	w8, [sp, #8]
 114:	b94013e9 	ldr	w9, [sp, #16]
 118:	f940180a 	ldr	x10, [x0, #48]
 11c:	d100114a 	sub	x10, x10, #0x4
 120:	eb0a011f 	cmp	x8, x10
 124:	54000089 	b.ls	134 <test_i32+0x7c>  // b.plast
 128:	d2800041 	mov	x1, #0x2                   	// #2
 12c:	d2800020 	mov	x0, #0x1                   	// #1
 130:	14000023 	b	1bc <test_i32+0x104>
 134:	f940140a 	ldr	x10, [x0, #40]
 138:	b8286949 	str	w9, [x10, x8]
 13c:	b9400be8 	ldr	w8, [sp, #8]
 140:	f9401809 	ldr	x9, [x0, #48]
 144:	d1001129 	sub	x9, x9, #0x4
 148:	eb09011f 	cmp	x8, x9
 14c:	54000089 	b.ls	15c <test_i32+0xa4>  // b.plast
 150:	d2800041 	mov	x1, #0x2                   	// #2
 154:	d2800020 	mov	x0, #0x1                   	// #1
 158:	14000019 	b	1bc <test_i32+0x104>
 15c:	f9401409 	ldr	x9, [x0, #40]
 160:	b8686928 	ldr	w8, [x9, x8]
 164:	b94013e9 	ldr	w9, [sp, #16]
 168:	6b09011f 	cmp	w8, w9
 16c:	1a9f07e8 	cset	w8, ne	// ne = any
 170:	34000108 	cbz	w8, 190 <test_i32+0xd8>
 174:	b9400be8 	ldr	w8, [sp, #8]
 178:	52800049 	mov	w9, #0x2                   	// #2
 17c:	1ac92108 	lsl	w8, w8, w9
 180:	52800029 	mov	w9, #0x1                   	// #1
 184:	2a090108 	orr	w8, w8, w9
 188:	b90017e8 	str	w8, [sp, #20]
 18c:	14000009 	b	1b0 <test_i32+0xf8>
 190:	b9400be8 	ldr	w8, [sp, #8]
 194:	52800089 	mov	w9, #0x4                   	// #4
 198:	0b090108 	add	w8, w8, w9
 19c:	b9000be8 	str	w8, [sp, #8]
 1a0:	b9400fe9 	ldr	w9, [sp, #12]
 1a4:	6b09011f 	cmp	w8, w9
 1a8:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 1ac:	35fffa48 	cbnz	w8, f4 <test_i32+0x3c>
 1b0:	b94017e8 	ldr	w8, [sp, #20]
 1b4:	d2800000 	mov	x0, #0x0                   	// #0
 1b8:	aa0803e1 	mov	x1, x8
 1bc:	910083ff 	add	sp, sp, #0x20
 1c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1c4:	d65f03c0 	ret

00000000000001c8 <test_i64>:
 1c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1cc:	910003fd 	mov	x29, sp
 1d0:	d10083ff 	sub	sp, sp, #0x20
 1d4:	f90003e0 	str	x0, [sp]
 1d8:	b9000bff 	str	wzr, [sp, #8]
 1dc:	b9000fff 	str	wzr, [sp, #12]
 1e0:	f9000bff 	str	xzr, [sp, #16]
 1e4:	b9001bff 	str	wzr, [sp, #24]
 1e8:	97ffffa6 	bl	80 <mem_bytes>
 1ec:	b5000740 	cbnz	x0, 2d4 <test_i64+0x10c>
 1f0:	2a0103e8 	mov	w8, w1
 1f4:	f94003e0 	ldr	x0, [sp]
 1f8:	52800109 	mov	w9, #0x8                   	// #8
 1fc:	4b090108 	sub	w8, w8, w9
 200:	b9000fe8 	str	w8, [sp, #12]
 204:	b9400be8 	ldr	w8, [sp, #8]
 208:	b9400fe9 	ldr	w9, [sp, #12]
 20c:	6b09011f 	cmp	w8, w9
 210:	1a9f97e8 	cset	w8, hi	// hi = pmore
 214:	350005a8 	cbnz	w8, 2c8 <test_i64+0x100>
 218:	b9400be8 	ldr	w8, [sp, #8]
 21c:	2a0803e1 	mov	w1, w8
 220:	97ffff86 	bl	38 <p64>
 224:	b5000580 	cbnz	x0, 2d4 <test_i64+0x10c>
 228:	aa0103e8 	mov	x8, x1
 22c:	f94003e0 	ldr	x0, [sp]
 230:	f9000be8 	str	x8, [sp, #16]
 234:	b9400be8 	ldr	w8, [sp, #8]
 238:	f9400be9 	ldr	x9, [sp, #16]
 23c:	f940180a 	ldr	x10, [x0, #48]
 240:	d100214a 	sub	x10, x10, #0x8
 244:	eb0a011f 	cmp	x8, x10
 248:	54000089 	b.ls	258 <test_i64+0x90>  // b.plast
 24c:	d2800041 	mov	x1, #0x2                   	// #2
 250:	d2800020 	mov	x0, #0x1                   	// #1
 254:	14000020 	b	2d4 <test_i64+0x10c>
 258:	f940140a 	ldr	x10, [x0, #40]
 25c:	f8286949 	str	x9, [x10, x8]
 260:	b9400be8 	ldr	w8, [sp, #8]
 264:	f9401809 	ldr	x9, [x0, #48]
 268:	d1002129 	sub	x9, x9, #0x8
 26c:	eb09011f 	cmp	x8, x9
 270:	54000089 	b.ls	280 <test_i64+0xb8>  // b.plast
 274:	d2800041 	mov	x1, #0x2                   	// #2
 278:	d2800020 	mov	x0, #0x1                   	// #1
 27c:	14000016 	b	2d4 <test_i64+0x10c>
 280:	f9401409 	ldr	x9, [x0, #40]
 284:	f8686928 	ldr	x8, [x9, x8]
 288:	f9400be9 	ldr	x9, [sp, #16]
 28c:	eb09011f 	cmp	x8, x9
 290:	1a9f07e8 	cset	w8, ne	// ne = any
 294:	34000108 	cbz	w8, 2b4 <test_i64+0xec>
 298:	b9400be8 	ldr	w8, [sp, #8]
 29c:	52800049 	mov	w9, #0x2                   	// #2
 2a0:	1ac92108 	lsl	w8, w8, w9
 2a4:	52800029 	mov	w9, #0x1                   	// #1
 2a8:	2a090108 	orr	w8, w8, w9
 2ac:	b9001be8 	str	w8, [sp, #24]
 2b0:	14000006 	b	2c8 <test_i64+0x100>
 2b4:	b9400be8 	ldr	w8, [sp, #8]
 2b8:	52800109 	mov	w9, #0x8                   	// #8
 2bc:	0b090108 	add	w8, w8, w9
 2c0:	b9000be8 	str	w8, [sp, #8]
 2c4:	17ffffd0 	b	204 <test_i64+0x3c>
 2c8:	b9401be8 	ldr	w8, [sp, #24]
 2cc:	d2800000 	mov	x0, #0x0                   	// #0
 2d0:	aa0803e1 	mov	x1, x8
 2d4:	910083ff 	add	sp, sp, #0x20
 2d8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2dc:	d65f03c0 	ret

00000000000002e0 <memtest>:
 2e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 2e4:	910003fd 	mov	x29, sp
 2e8:	d10043ff 	sub	sp, sp, #0x10
 2ec:	f90003e0 	str	x0, [sp]
 2f0:	97ffff72 	bl	b8 <test_i32>
 2f4:	b50002c0 	cbnz	x0, 34c <memtest+0x6c>
 2f8:	2a0103e8 	mov	w8, w1
 2fc:	f94003e0 	ldr	x0, [sp]
 300:	52800009 	mov	w9, #0x0                   	// #0
 304:	6b09011f 	cmp	w8, w9
 308:	1a9f07e8 	cset	w8, ne	// ne = any
 30c:	34000068 	cbz	w8, 318 <memtest+0x38>
 310:	52800028 	mov	w8, #0x1                   	// #1
 314:	1400000c 	b	344 <memtest+0x64>
 318:	97ffffac 	bl	1c8 <test_i64>
 31c:	b5000180 	cbnz	x0, 34c <memtest+0x6c>
 320:	2a0103e8 	mov	w8, w1
 324:	f94003e0 	ldr	x0, [sp]
 328:	52800009 	mov	w9, #0x0                   	// #0
 32c:	6b09011f 	cmp	w8, w9
 330:	1a9f07e8 	cset	w8, ne	// ne = any
 334:	34000068 	cbz	w8, 340 <memtest+0x60>
 338:	52800048 	mov	w8, #0x2                   	// #2
 33c:	14000002 	b	344 <memtest+0x64>
 340:	52800008 	mov	w8, #0x0                   	// #0
 344:	d2800000 	mov	x0, #0x0                   	// #0
 348:	aa0803e1 	mov	x1, x8
 34c:	910043ff 	add	sp, sp, #0x10
 350:	a8c17bfd 	ldp	x29, x30, [sp], #16
 354:	d65f03c0 	ret
