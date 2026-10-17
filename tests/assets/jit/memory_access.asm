
tests/assets/jit/memory_access.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000058 load_i64
0000000000000058 l     F .text	0000000000000058 load_i32
00000000000000b0 l     F .text	0000000000000050 load_i32_16u
0000000000000100 l     F .text	0000000000000050 load_i32_16s
0000000000000150 l     F .text	0000000000000050 load_i32_8u
00000000000001a0 l     F .text	0000000000000050 load_i32_8s
00000000000001f0 l     F .text	0000000000000058 load_i32_8u_offset
0000000000000248 l     F .text	0000000000000080 store_i64
00000000000002c8 l     F .text	0000000000000080 store_i32
0000000000000348 l     F .text	0000000000000080 store_i32_16u
00000000000003c8 l     F .text	0000000000000080 store_i32_8u


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 091840f9 292100d1  ......@...@.)!..
 0020 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 0030 07000014 091440f9 286968f8 090080d2  ......@.(ih.....
 0040 080109aa 000080d2 e10308aa ff430091  .............C..
 0050 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0060 ff4300d1 e00300f9 e10b00b9 e80b40b9  .C............@.
 0070 091840f9 291100d1 1f0109eb 89000054  ..@.)..........T
 0080 410080d2 200080d2 07000014 091440f9  A... .........@.
 0090 286968b8 09008052 0801092a 000080d2  (ih....R...*....
 00a0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00b0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00c0 e10b00b9 e80b40b9 091840f9 290900d1  ......@...@.)...
 00d0 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 00e0 05000014 091440f9 28696878 000080d2  ......@.(ihx....
 00f0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0100 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0110 e10b00b9 e80b40b9 091840f9 290900d1  ......@...@.)...
 0120 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 0130 05000014 091440f9 2869e878 000080d2  ......@.(i.x....
 0140 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0150 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0160 e10b00b9 e80b40b9 091840f9 290500d1  ......@...@.)...
 0170 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 0180 05000014 091440f9 28796838 000080d2  ......@.(yh8....
 0190 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 01a0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 01b0 e10b00b9 e80b40b9 091840f9 290500d1  ......@...@.)...
 01c0 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 01d0 05000014 091440f9 2879e838 000080d2  ......@.(y.8....
 01e0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 01f0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0200 e10b00b9 e80b40b9 08010c91 091840f9  ......@.......@.
 0210 290500d1 1f0109eb 89000054 410080d2  )..........TA...
 0220 200080d2 05000014 091440f9 28796838   .........@.(yh8
 0230 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0240 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0250 ff8300d1 e00300f9 e10b00b9 e20b00f9  ................
 0260 e80b40b9 e90b40f9 0a1840f9 4a2100d1  ..@...@...@.J!..
 0270 1f010aeb 89000054 410080d2 200080d2  .......TA... ...
 0280 0f000014 0a1440f9 496928f8 e80b40b9  ......@.Ii(...@.
 0290 091840f9 292100d1 1f0109eb 89000054  ..@.)!.........T
 02a0 410080d2 200080d2 05000014 091440f9  A... .........@.
 02b0 286968f8 000080d2 e10308aa ff830091  (ih.............
 02c0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 02d0 ff4300d1 e00300f9 e10b00b9 e20f00b9  .C..............
 02e0 e80b40b9 e90f40b9 0a1840f9 4a1100d1  ..@...@...@.J...
 02f0 1f010aeb 89000054 410080d2 200080d2  .......TA... ...
 0300 0f000014 0a1440f9 496928b8 e80b40b9  ......@.Ii(...@.
 0310 091840f9 291100d1 1f0109eb 89000054  ..@.)..........T
 0320 410080d2 200080d2 05000014 091440f9  A... .........@.
 0330 286968b8 000080d2 e10308aa ff430091  (ih..........C..
 0340 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0350 ff4300d1 e00300f9 e10b00b9 e20f00b9  .C..............
 0360 e80b40b9 e90f40b9 0a1840f9 4a0900d1  ..@...@...@.J...
 0370 1f010aeb 89000054 410080d2 200080d2  .......TA... ...
 0380 0f000014 0a1440f9 49692878 e80b40b9  ......@.Ii(x..@.
 0390 091840f9 290900d1 1f0109eb 89000054  ..@.)..........T
 03a0 410080d2 200080d2 05000014 091440f9  A... .........@.
 03b0 28696878 000080d2 e10308aa ff430091  (ihx.........C..
 03c0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 03d0 ff4300d1 e00300f9 e10b00b9 e20f00b9  .C..............
 03e0 e80b40b9 e90f40b9 0a1840f9 4a0500d1  ..@...@...@.J...
 03f0 1f010aeb 89000054 410080d2 200080d2  .......TA... ...
 0400 0f000014 0a1440f9 49792838 e80b40b9  ......@.Iy(8..@.
 0410 091840f9 290500d1 1f0109eb 89000054  ..@.)..........T
 0420 410080d2 200080d2 05000014 091440f9  A... .........@.
 0430 28796838 000080d2 e10308aa ff430091  (yh8.........C..
 0440 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <load_i64>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9400be8 	ldr	w8, [sp, #8]
  18:	f9401809 	ldr	x9, [x0, #48]
  1c:	d1002129 	sub	x9, x9, #0x8
  20:	eb09011f 	cmp	x8, x9
  24:	54000089 	b.ls	34 <load_i64+0x34>  // b.plast
  28:	d2800041 	mov	x1, #0x2                   	// #2
  2c:	d2800020 	mov	x0, #0x1                   	// #1
  30:	14000007 	b	4c <load_i64+0x4c>
  34:	f9401409 	ldr	x9, [x0, #40]
  38:	f8686928 	ldr	x8, [x9, x8]
  3c:	d2800009 	mov	x9, #0x0                   	// #0
  40:	aa090108 	orr	x8, x8, x9
  44:	d2800000 	mov	x0, #0x0                   	// #0
  48:	aa0803e1 	mov	x1, x8
  4c:	910043ff 	add	sp, sp, #0x10
  50:	a8c17bfd 	ldp	x29, x30, [sp], #16
  54:	d65f03c0 	ret

0000000000000058 <load_i32>:
  58:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  5c:	910003fd 	mov	x29, sp
  60:	d10043ff 	sub	sp, sp, #0x10
  64:	f90003e0 	str	x0, [sp]
  68:	b9000be1 	str	w1, [sp, #8]
  6c:	b9400be8 	ldr	w8, [sp, #8]
  70:	f9401809 	ldr	x9, [x0, #48]
  74:	d1001129 	sub	x9, x9, #0x4
  78:	eb09011f 	cmp	x8, x9
  7c:	54000089 	b.ls	8c <load_i32+0x34>  // b.plast
  80:	d2800041 	mov	x1, #0x2                   	// #2
  84:	d2800020 	mov	x0, #0x1                   	// #1
  88:	14000007 	b	a4 <load_i32+0x4c>
  8c:	f9401409 	ldr	x9, [x0, #40]
  90:	b8686928 	ldr	w8, [x9, x8]
  94:	52800009 	mov	w9, #0x0                   	// #0
  98:	2a090108 	orr	w8, w8, w9
  9c:	d2800000 	mov	x0, #0x0                   	// #0
  a0:	aa0803e1 	mov	x1, x8
  a4:	910043ff 	add	sp, sp, #0x10
  a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ac:	d65f03c0 	ret

00000000000000b0 <load_i32_16u>:
  b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  b4:	910003fd 	mov	x29, sp
  b8:	d10043ff 	sub	sp, sp, #0x10
  bc:	f90003e0 	str	x0, [sp]
  c0:	b9000be1 	str	w1, [sp, #8]
  c4:	b9400be8 	ldr	w8, [sp, #8]
  c8:	f9401809 	ldr	x9, [x0, #48]
  cc:	d1000929 	sub	x9, x9, #0x2
  d0:	eb09011f 	cmp	x8, x9
  d4:	54000089 	b.ls	e4 <load_i32_16u+0x34>  // b.plast
  d8:	d2800041 	mov	x1, #0x2                   	// #2
  dc:	d2800020 	mov	x0, #0x1                   	// #1
  e0:	14000005 	b	f4 <load_i32_16u+0x44>
  e4:	f9401409 	ldr	x9, [x0, #40]
  e8:	78686928 	ldrh	w8, [x9, x8]
  ec:	d2800000 	mov	x0, #0x0                   	// #0
  f0:	aa0803e1 	mov	x1, x8
  f4:	910043ff 	add	sp, sp, #0x10
  f8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  fc:	d65f03c0 	ret

0000000000000100 <load_i32_16s>:
 100:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 104:	910003fd 	mov	x29, sp
 108:	d10043ff 	sub	sp, sp, #0x10
 10c:	f90003e0 	str	x0, [sp]
 110:	b9000be1 	str	w1, [sp, #8]
 114:	b9400be8 	ldr	w8, [sp, #8]
 118:	f9401809 	ldr	x9, [x0, #48]
 11c:	d1000929 	sub	x9, x9, #0x2
 120:	eb09011f 	cmp	x8, x9
 124:	54000089 	b.ls	134 <load_i32_16s+0x34>  // b.plast
 128:	d2800041 	mov	x1, #0x2                   	// #2
 12c:	d2800020 	mov	x0, #0x1                   	// #1
 130:	14000005 	b	144 <load_i32_16s+0x44>
 134:	f9401409 	ldr	x9, [x0, #40]
 138:	78e86928 	ldrsh	w8, [x9, x8]
 13c:	d2800000 	mov	x0, #0x0                   	// #0
 140:	aa0803e1 	mov	x1, x8
 144:	910043ff 	add	sp, sp, #0x10
 148:	a8c17bfd 	ldp	x29, x30, [sp], #16
 14c:	d65f03c0 	ret

0000000000000150 <load_i32_8u>:
 150:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 154:	910003fd 	mov	x29, sp
 158:	d10043ff 	sub	sp, sp, #0x10
 15c:	f90003e0 	str	x0, [sp]
 160:	b9000be1 	str	w1, [sp, #8]
 164:	b9400be8 	ldr	w8, [sp, #8]
 168:	f9401809 	ldr	x9, [x0, #48]
 16c:	d1000529 	sub	x9, x9, #0x1
 170:	eb09011f 	cmp	x8, x9
 174:	54000089 	b.ls	184 <load_i32_8u+0x34>  // b.plast
 178:	d2800041 	mov	x1, #0x2                   	// #2
 17c:	d2800020 	mov	x0, #0x1                   	// #1
 180:	14000005 	b	194 <load_i32_8u+0x44>
 184:	f9401409 	ldr	x9, [x0, #40]
 188:	38687928 	ldrb	w8, [x9, x8, lsl #0]
 18c:	d2800000 	mov	x0, #0x0                   	// #0
 190:	aa0803e1 	mov	x1, x8
 194:	910043ff 	add	sp, sp, #0x10
 198:	a8c17bfd 	ldp	x29, x30, [sp], #16
 19c:	d65f03c0 	ret

00000000000001a0 <load_i32_8s>:
 1a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1a4:	910003fd 	mov	x29, sp
 1a8:	d10043ff 	sub	sp, sp, #0x10
 1ac:	f90003e0 	str	x0, [sp]
 1b0:	b9000be1 	str	w1, [sp, #8]
 1b4:	b9400be8 	ldr	w8, [sp, #8]
 1b8:	f9401809 	ldr	x9, [x0, #48]
 1bc:	d1000529 	sub	x9, x9, #0x1
 1c0:	eb09011f 	cmp	x8, x9
 1c4:	54000089 	b.ls	1d4 <load_i32_8s+0x34>  // b.plast
 1c8:	d2800041 	mov	x1, #0x2                   	// #2
 1cc:	d2800020 	mov	x0, #0x1                   	// #1
 1d0:	14000005 	b	1e4 <load_i32_8s+0x44>
 1d4:	f9401409 	ldr	x9, [x0, #40]
 1d8:	38e87928 	ldrsb	w8, [x9, x8, lsl #0]
 1dc:	d2800000 	mov	x0, #0x0                   	// #0
 1e0:	aa0803e1 	mov	x1, x8
 1e4:	910043ff 	add	sp, sp, #0x10
 1e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1ec:	d65f03c0 	ret

00000000000001f0 <load_i32_8u_offset>:
 1f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1f4:	910003fd 	mov	x29, sp
 1f8:	d10043ff 	sub	sp, sp, #0x10
 1fc:	f90003e0 	str	x0, [sp]
 200:	b9000be1 	str	w1, [sp, #8]
 204:	b9400be8 	ldr	w8, [sp, #8]
 208:	910c0108 	add	x8, x8, #0x300
 20c:	f9401809 	ldr	x9, [x0, #48]
 210:	d1000529 	sub	x9, x9, #0x1
 214:	eb09011f 	cmp	x8, x9
 218:	54000089 	b.ls	228 <load_i32_8u_offset+0x38>  // b.plast
 21c:	d2800041 	mov	x1, #0x2                   	// #2
 220:	d2800020 	mov	x0, #0x1                   	// #1
 224:	14000005 	b	238 <load_i32_8u_offset+0x48>
 228:	f9401409 	ldr	x9, [x0, #40]
 22c:	38687928 	ldrb	w8, [x9, x8, lsl #0]
 230:	d2800000 	mov	x0, #0x0                   	// #0
 234:	aa0803e1 	mov	x1, x8
 238:	910043ff 	add	sp, sp, #0x10
 23c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 240:	d65f03c0 	ret
 244:	d503201f 	nop

0000000000000248 <store_i64>:
 248:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 24c:	910003fd 	mov	x29, sp
 250:	d10083ff 	sub	sp, sp, #0x20
 254:	f90003e0 	str	x0, [sp]
 258:	b9000be1 	str	w1, [sp, #8]
 25c:	f9000be2 	str	x2, [sp, #16]
 260:	b9400be8 	ldr	w8, [sp, #8]
 264:	f9400be9 	ldr	x9, [sp, #16]
 268:	f940180a 	ldr	x10, [x0, #48]
 26c:	d100214a 	sub	x10, x10, #0x8
 270:	eb0a011f 	cmp	x8, x10
 274:	54000089 	b.ls	284 <store_i64+0x3c>  // b.plast
 278:	d2800041 	mov	x1, #0x2                   	// #2
 27c:	d2800020 	mov	x0, #0x1                   	// #1
 280:	1400000f 	b	2bc <store_i64+0x74>
 284:	f940140a 	ldr	x10, [x0, #40]
 288:	f8286949 	str	x9, [x10, x8]
 28c:	b9400be8 	ldr	w8, [sp, #8]
 290:	f9401809 	ldr	x9, [x0, #48]
 294:	d1002129 	sub	x9, x9, #0x8
 298:	eb09011f 	cmp	x8, x9
 29c:	54000089 	b.ls	2ac <store_i64+0x64>  // b.plast
 2a0:	d2800041 	mov	x1, #0x2                   	// #2
 2a4:	d2800020 	mov	x0, #0x1                   	// #1
 2a8:	14000005 	b	2bc <store_i64+0x74>
 2ac:	f9401409 	ldr	x9, [x0, #40]
 2b0:	f8686928 	ldr	x8, [x9, x8]
 2b4:	d2800000 	mov	x0, #0x0                   	// #0
 2b8:	aa0803e1 	mov	x1, x8
 2bc:	910083ff 	add	sp, sp, #0x20
 2c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2c4:	d65f03c0 	ret

00000000000002c8 <store_i32>:
 2c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 2cc:	910003fd 	mov	x29, sp
 2d0:	d10043ff 	sub	sp, sp, #0x10
 2d4:	f90003e0 	str	x0, [sp]
 2d8:	b9000be1 	str	w1, [sp, #8]
 2dc:	b9000fe2 	str	w2, [sp, #12]
 2e0:	b9400be8 	ldr	w8, [sp, #8]
 2e4:	b9400fe9 	ldr	w9, [sp, #12]
 2e8:	f940180a 	ldr	x10, [x0, #48]
 2ec:	d100114a 	sub	x10, x10, #0x4
 2f0:	eb0a011f 	cmp	x8, x10
 2f4:	54000089 	b.ls	304 <store_i32+0x3c>  // b.plast
 2f8:	d2800041 	mov	x1, #0x2                   	// #2
 2fc:	d2800020 	mov	x0, #0x1                   	// #1
 300:	1400000f 	b	33c <store_i32+0x74>
 304:	f940140a 	ldr	x10, [x0, #40]
 308:	b8286949 	str	w9, [x10, x8]
 30c:	b9400be8 	ldr	w8, [sp, #8]
 310:	f9401809 	ldr	x9, [x0, #48]
 314:	d1001129 	sub	x9, x9, #0x4
 318:	eb09011f 	cmp	x8, x9
 31c:	54000089 	b.ls	32c <store_i32+0x64>  // b.plast
 320:	d2800041 	mov	x1, #0x2                   	// #2
 324:	d2800020 	mov	x0, #0x1                   	// #1
 328:	14000005 	b	33c <store_i32+0x74>
 32c:	f9401409 	ldr	x9, [x0, #40]
 330:	b8686928 	ldr	w8, [x9, x8]
 334:	d2800000 	mov	x0, #0x0                   	// #0
 338:	aa0803e1 	mov	x1, x8
 33c:	910043ff 	add	sp, sp, #0x10
 340:	a8c17bfd 	ldp	x29, x30, [sp], #16
 344:	d65f03c0 	ret

0000000000000348 <store_i32_16u>:
 348:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 34c:	910003fd 	mov	x29, sp
 350:	d10043ff 	sub	sp, sp, #0x10
 354:	f90003e0 	str	x0, [sp]
 358:	b9000be1 	str	w1, [sp, #8]
 35c:	b9000fe2 	str	w2, [sp, #12]
 360:	b9400be8 	ldr	w8, [sp, #8]
 364:	b9400fe9 	ldr	w9, [sp, #12]
 368:	f940180a 	ldr	x10, [x0, #48]
 36c:	d100094a 	sub	x10, x10, #0x2
 370:	eb0a011f 	cmp	x8, x10
 374:	54000089 	b.ls	384 <store_i32_16u+0x3c>  // b.plast
 378:	d2800041 	mov	x1, #0x2                   	// #2
 37c:	d2800020 	mov	x0, #0x1                   	// #1
 380:	1400000f 	b	3bc <store_i32_16u+0x74>
 384:	f940140a 	ldr	x10, [x0, #40]
 388:	78286949 	strh	w9, [x10, x8]
 38c:	b9400be8 	ldr	w8, [sp, #8]
 390:	f9401809 	ldr	x9, [x0, #48]
 394:	d1000929 	sub	x9, x9, #0x2
 398:	eb09011f 	cmp	x8, x9
 39c:	54000089 	b.ls	3ac <store_i32_16u+0x64>  // b.plast
 3a0:	d2800041 	mov	x1, #0x2                   	// #2
 3a4:	d2800020 	mov	x0, #0x1                   	// #1
 3a8:	14000005 	b	3bc <store_i32_16u+0x74>
 3ac:	f9401409 	ldr	x9, [x0, #40]
 3b0:	78686928 	ldrh	w8, [x9, x8]
 3b4:	d2800000 	mov	x0, #0x0                   	// #0
 3b8:	aa0803e1 	mov	x1, x8
 3bc:	910043ff 	add	sp, sp, #0x10
 3c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 3c4:	d65f03c0 	ret

00000000000003c8 <store_i32_8u>:
 3c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 3cc:	910003fd 	mov	x29, sp
 3d0:	d10043ff 	sub	sp, sp, #0x10
 3d4:	f90003e0 	str	x0, [sp]
 3d8:	b9000be1 	str	w1, [sp, #8]
 3dc:	b9000fe2 	str	w2, [sp, #12]
 3e0:	b9400be8 	ldr	w8, [sp, #8]
 3e4:	b9400fe9 	ldr	w9, [sp, #12]
 3e8:	f940180a 	ldr	x10, [x0, #48]
 3ec:	d100054a 	sub	x10, x10, #0x1
 3f0:	eb0a011f 	cmp	x8, x10
 3f4:	54000089 	b.ls	404 <store_i32_8u+0x3c>  // b.plast
 3f8:	d2800041 	mov	x1, #0x2                   	// #2
 3fc:	d2800020 	mov	x0, #0x1                   	// #1
 400:	1400000f 	b	43c <store_i32_8u+0x74>
 404:	f940140a 	ldr	x10, [x0, #40]
 408:	38287949 	strb	w9, [x10, x8, lsl #0]
 40c:	b9400be8 	ldr	w8, [sp, #8]
 410:	f9401809 	ldr	x9, [x0, #48]
 414:	d1000529 	sub	x9, x9, #0x1
 418:	eb09011f 	cmp	x8, x9
 41c:	54000089 	b.ls	42c <store_i32_8u+0x64>  // b.plast
 420:	d2800041 	mov	x1, #0x2                   	// #2
 424:	d2800020 	mov	x0, #0x1                   	// #1
 428:	14000005 	b	43c <store_i32_8u+0x74>
 42c:	f9401409 	ldr	x9, [x0, #40]
 430:	38687928 	ldrb	w8, [x9, x8, lsl #0]
 434:	d2800000 	mov	x0, #0x0                   	// #0
 438:	aa0803e1 	mov	x1, x8
 43c:	910043ff 	add	sp, sp, #0x10
 440:	a8c17bfd 	ldp	x29, x30, [sp], #16
 444:	d65f03c0 	ret
