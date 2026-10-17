
tests/assets/jit/memory_grow.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000058 load_i64
0000000000000058 l     F .text	0000000000000080 store_i64
00000000000000d8 l     F .text	0000000000000028 memory_size
0000000000000100 l     F .text	0000000000000038 memory_size_bytes
0000000000000138 l     F .text	0000000000000060 memory_grow
0000000000000198 l     F .text	0000000000000158 loop


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 091840f9 292100d1  ......@...@.)!..
 0020 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 0030 07000014 091440f9 286968f8 090080d2  ......@.(ih.....
 0040 080109aa 000080d2 e10308aa ff430091  .............C..
 0050 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0060 ff8300d1 e00300f9 e10b00b9 e20b00f9  ................
 0070 e80b40b9 e90b40f9 0a1840f9 4a2100d1  ..@...@...@.J!..
 0080 1f010aeb 89000054 410080d2 200080d2  .......TA... ...
 0090 0f000014 0a1440f9 496928f8 e80b40b9  ......@.Ii(...@.
 00a0 091840f9 292100d1 1f0109eb 89000054  ..@.)!.........T
 00b0 410080d2 200080d2 05000014 091440f9  A... .........@.
 00c0 286968f8 000080d2 e10308aa ff830091  (ih.............
 00d0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00e0 ff4300d1 e00300f9 081c40f9 000080d2  .C........@.....
 00f0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0100 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0110 081c40f9 09008052 2900a072 087d091b  ..@....R)..r.}..
 0120 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0130 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0140 ff4300d1 e00300f9 e10b00b9 e80b40b9  .C............@.
 0150 e103082a 092440f9 290140f9 ff4300d1  ...*.$@.).@..C..
 0160 e80300f9 e90700f9 20013fd6 e80340f9  ........ .?...@.
 0170 e90740f9 ff430091 e803002a e00340f9  ..@..C.....*..@.
 0180 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0190 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 01a0 ff4300d1 e00300f9 ff0b00b9 28008052  .C..........(..R
 01b0 e103082a 092440f9 290140f9 ff4300d1  ...*.$@.).@..C..
 01c0 e80300f9 e90700f9 20013fd6 e80340f9  ........ .?...@.
 01d0 e90740f9 ff430091 e803002a e00340f9  ..@..C.....*..@.
 01e0 092040f9 290140b9 0a028052 29010a4b  . @.).@....R)..K
 01f0 e90b00b9 e90b40b9 4a018052 29310091  ......@.J..R)1..
 0200 0b1840f9 6b1100d1 3f010beb 89000054  ..@.k...?......T
 0210 410080d2 200080d2 33000014 0b1440f9  A... ...3.....@.
 0220 6a6929b8 e90b40b9 29310091 0a1840f9  ji)...@.)1....@.
 0230 4a1100d1 3f010aeb 89000054 410080d2  J...?......TA...
 0240 200080d2 28000014 0a1440f9 496969b8   ...(.....@.Iii.
 0250 8a028052 3f010a6b e9a79f1a 2a008052  ...R?..k....*..R
 0260 29010a0a 3f010071 e9179f1a 49030035  )...?..q....I..5
 0270 e90b40b9 ea0b40b9 4a310091 0b1840f9  ..@...@.J1....@.
 0280 6b1100d1 5f010beb 89000054 410080d2  k..._......TA...
 0290 200080d2 14000014 0b1440f9 6a696ab8   .........@.jij.
 02a0 2b008052 4a010b0b 29310091 0b1840f9  +..RJ...)1....@.
 02b0 6b1100d1 3f010beb 89000054 410080d2  k...?......TA...
 02c0 200080d2 08000014 0b1440f9 6a6929b8   .........@.ji).
 02d0 d5ffff17 09008052 01000014 000080d2  .......R........
 02e0 e10309aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

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

0000000000000058 <store_i64>:
  58:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  5c:	910003fd 	mov	x29, sp
  60:	d10083ff 	sub	sp, sp, #0x20
  64:	f90003e0 	str	x0, [sp]
  68:	b9000be1 	str	w1, [sp, #8]
  6c:	f9000be2 	str	x2, [sp, #16]
  70:	b9400be8 	ldr	w8, [sp, #8]
  74:	f9400be9 	ldr	x9, [sp, #16]
  78:	f940180a 	ldr	x10, [x0, #48]
  7c:	d100214a 	sub	x10, x10, #0x8
  80:	eb0a011f 	cmp	x8, x10
  84:	54000089 	b.ls	94 <store_i64+0x3c>  // b.plast
  88:	d2800041 	mov	x1, #0x2                   	// #2
  8c:	d2800020 	mov	x0, #0x1                   	// #1
  90:	1400000f 	b	cc <store_i64+0x74>
  94:	f940140a 	ldr	x10, [x0, #40]
  98:	f8286949 	str	x9, [x10, x8]
  9c:	b9400be8 	ldr	w8, [sp, #8]
  a0:	f9401809 	ldr	x9, [x0, #48]
  a4:	d1002129 	sub	x9, x9, #0x8
  a8:	eb09011f 	cmp	x8, x9
  ac:	54000089 	b.ls	bc <store_i64+0x64>  // b.plast
  b0:	d2800041 	mov	x1, #0x2                   	// #2
  b4:	d2800020 	mov	x0, #0x1                   	// #1
  b8:	14000005 	b	cc <store_i64+0x74>
  bc:	f9401409 	ldr	x9, [x0, #40]
  c0:	f8686928 	ldr	x8, [x9, x8]
  c4:	d2800000 	mov	x0, #0x0                   	// #0
  c8:	aa0803e1 	mov	x1, x8
  cc:	910083ff 	add	sp, sp, #0x20
  d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d4:	d65f03c0 	ret

00000000000000d8 <memory_size>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	d10043ff 	sub	sp, sp, #0x10
  e4:	f90003e0 	str	x0, [sp]
  e8:	f9401c08 	ldr	x8, [x0, #56]
  ec:	d2800000 	mov	x0, #0x0                   	// #0
  f0:	aa0803e1 	mov	x1, x8
  f4:	910043ff 	add	sp, sp, #0x10
  f8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  fc:	d65f03c0 	ret

0000000000000100 <memory_size_bytes>:
 100:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 104:	910003fd 	mov	x29, sp
 108:	d10043ff 	sub	sp, sp, #0x10
 10c:	f90003e0 	str	x0, [sp]
 110:	f9401c08 	ldr	x8, [x0, #56]
 114:	52800009 	mov	w9, #0x0                   	// #0
 118:	72a00029 	movk	w9, #0x1, lsl #16
 11c:	1b097d08 	mul	w8, w8, w9
 120:	d2800000 	mov	x0, #0x0                   	// #0
 124:	aa0803e1 	mov	x1, x8
 128:	910043ff 	add	sp, sp, #0x10
 12c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 130:	d65f03c0 	ret
 134:	d503201f 	nop

0000000000000138 <memory_grow>:
 138:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 13c:	910003fd 	mov	x29, sp
 140:	d10043ff 	sub	sp, sp, #0x10
 144:	f90003e0 	str	x0, [sp]
 148:	b9000be1 	str	w1, [sp, #8]
 14c:	b9400be8 	ldr	w8, [sp, #8]
 150:	2a0803e1 	mov	w1, w8
 154:	f9402409 	ldr	x9, [x0, #72]
 158:	f9400129 	ldr	x9, [x9]
 15c:	d10043ff 	sub	sp, sp, #0x10
 160:	f90003e8 	str	x8, [sp]
 164:	f90007e9 	str	x9, [sp, #8]
 168:	d63f0120 	blr	x9
 16c:	f94003e8 	ldr	x8, [sp]
 170:	f94007e9 	ldr	x9, [sp, #8]
 174:	910043ff 	add	sp, sp, #0x10
 178:	2a0003e8 	mov	w8, w0
 17c:	f94003e0 	ldr	x0, [sp]
 180:	d2800000 	mov	x0, #0x0                   	// #0
 184:	aa0803e1 	mov	x1, x8
 188:	910043ff 	add	sp, sp, #0x10
 18c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 190:	d65f03c0 	ret
 194:	d503201f 	nop

0000000000000198 <loop>:
 198:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 19c:	910003fd 	mov	x29, sp
 1a0:	d10043ff 	sub	sp, sp, #0x10
 1a4:	f90003e0 	str	x0, [sp]
 1a8:	b9000bff 	str	wzr, [sp, #8]
 1ac:	52800028 	mov	w8, #0x1                   	// #1
 1b0:	2a0803e1 	mov	w1, w8
 1b4:	f9402409 	ldr	x9, [x0, #72]
 1b8:	f9400129 	ldr	x9, [x9]
 1bc:	d10043ff 	sub	sp, sp, #0x10
 1c0:	f90003e8 	str	x8, [sp]
 1c4:	f90007e9 	str	x9, [sp, #8]
 1c8:	d63f0120 	blr	x9
 1cc:	f94003e8 	ldr	x8, [sp]
 1d0:	f94007e9 	ldr	x9, [sp, #8]
 1d4:	910043ff 	add	sp, sp, #0x10
 1d8:	2a0003e8 	mov	w8, w0
 1dc:	f94003e0 	ldr	x0, [sp]
 1e0:	f9402009 	ldr	x9, [x0, #64]
 1e4:	b9400129 	ldr	w9, [x9]
 1e8:	5280020a 	mov	w10, #0x10                  	// #16
 1ec:	4b0a0129 	sub	w9, w9, w10
 1f0:	b9000be9 	str	w9, [sp, #8]
 1f4:	b9400be9 	ldr	w9, [sp, #8]
 1f8:	5280014a 	mov	w10, #0xa                   	// #10
 1fc:	91003129 	add	x9, x9, #0xc
 200:	f940180b 	ldr	x11, [x0, #48]
 204:	d100116b 	sub	x11, x11, #0x4
 208:	eb0b013f 	cmp	x9, x11
 20c:	54000089 	b.ls	21c <loop+0x84>  // b.plast
 210:	d2800041 	mov	x1, #0x2                   	// #2
 214:	d2800020 	mov	x0, #0x1                   	// #1
 218:	14000033 	b	2e4 <loop+0x14c>
 21c:	f940140b 	ldr	x11, [x0, #40]
 220:	b829696a 	str	w10, [x11, x9]
 224:	b9400be9 	ldr	w9, [sp, #8]
 228:	91003129 	add	x9, x9, #0xc
 22c:	f940180a 	ldr	x10, [x0, #48]
 230:	d100114a 	sub	x10, x10, #0x4
 234:	eb0a013f 	cmp	x9, x10
 238:	54000089 	b.ls	248 <loop+0xb0>  // b.plast
 23c:	d2800041 	mov	x1, #0x2                   	// #2
 240:	d2800020 	mov	x0, #0x1                   	// #1
 244:	14000028 	b	2e4 <loop+0x14c>
 248:	f940140a 	ldr	x10, [x0, #40]
 24c:	b8696949 	ldr	w9, [x10, x9]
 250:	5280028a 	mov	w10, #0x14                  	// #20
 254:	6b0a013f 	cmp	w9, w10
 258:	1a9fa7e9 	cset	w9, lt	// lt = tstop
 25c:	5280002a 	mov	w10, #0x1                   	// #1
 260:	0a0a0129 	and	w9, w9, w10
 264:	7100013f 	cmp	w9, #0x0
 268:	1a9f17e9 	cset	w9, eq	// eq = none
 26c:	35000349 	cbnz	w9, 2d4 <loop+0x13c>
 270:	b9400be9 	ldr	w9, [sp, #8]
 274:	b9400bea 	ldr	w10, [sp, #8]
 278:	9100314a 	add	x10, x10, #0xc
 27c:	f940180b 	ldr	x11, [x0, #48]
 280:	d100116b 	sub	x11, x11, #0x4
 284:	eb0b015f 	cmp	x10, x11
 288:	54000089 	b.ls	298 <loop+0x100>  // b.plast
 28c:	d2800041 	mov	x1, #0x2                   	// #2
 290:	d2800020 	mov	x0, #0x1                   	// #1
 294:	14000014 	b	2e4 <loop+0x14c>
 298:	f940140b 	ldr	x11, [x0, #40]
 29c:	b86a696a 	ldr	w10, [x11, x10]
 2a0:	5280002b 	mov	w11, #0x1                   	// #1
 2a4:	0b0b014a 	add	w10, w10, w11
 2a8:	91003129 	add	x9, x9, #0xc
 2ac:	f940180b 	ldr	x11, [x0, #48]
 2b0:	d100116b 	sub	x11, x11, #0x4
 2b4:	eb0b013f 	cmp	x9, x11
 2b8:	54000089 	b.ls	2c8 <loop+0x130>  // b.plast
 2bc:	d2800041 	mov	x1, #0x2                   	// #2
 2c0:	d2800020 	mov	x0, #0x1                   	// #1
 2c4:	14000008 	b	2e4 <loop+0x14c>
 2c8:	f940140b 	ldr	x11, [x0, #40]
 2cc:	b829696a 	str	w10, [x11, x9]
 2d0:	17ffffd5 	b	224 <loop+0x8c>
 2d4:	52800009 	mov	w9, #0x0                   	// #0
 2d8:	14000001 	b	2dc <loop+0x144>
 2dc:	d2800000 	mov	x0, #0x0                   	// #0
 2e0:	aa0903e1 	mov	x1, x9
 2e4:	910043ff 	add	sp, sp, #0x10
 2e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2ec:	d65f03c0 	ret
