
./tests/assets/jit/locals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 store_i64
0000000000000040 l     F .text	0000000000000048 store_i64_const
0000000000000088 l     F .text	0000000000000048 tee_i64
00000000000000d0 l     F .text	0000000000000130 many_locals


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0010 ff0b00b9 ff0b00f9 ff1b00b9 e80340f9  ..............@.
 0020 e80b00f9 e80b40f9 e00308aa e1031faa  ......@.........
 0030 ff830091 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0040 fd7bbfa9 fd030091 ff8300d1 ff0300b9  .{..............
 0050 ff0700f9 ff1300b9 e8ff9fd2 e8ffbff2  ................
 0060 e8ffdff2 e8ffeff2 e80700f9 e80740f9  ..............@.
 0070 e00308aa e1031faa ff830091 fd7bc1a8  .............{..
 0080 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0090 ff8300d1 ff0300b9 ff0700f9 ff1300b9  ................
 00a0 e8ff9fd2 e8ffbff2 e8ffdff2 e8ffeff2  ................
 00b0 e80700f9 09008052 e90300b9 e00308aa  .......R........
 00c0 e1031faa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 00d0 fd7bbfa9 fd030091 ffc301d1 e00300b9  .{..............
 00e0 ff0700b9 ff0b00b9 ff0f00b9 ff1300b9  ................
 00f0 ff1700b9 ff1b00b9 ff1f00b9 ff2300b9  .............#..
 0100 ff2700b9 ff2b00b9 ff2f00b9 ff3300b9  .'...+.../...3..
 0110 ff1f00f9 ff2300f9 ff2700f9 ff5300b9  .....#...'...S..
 0120 ff5700b9 ff5b00b9 ff5f00b9 ff6300b9  .W...[..._...c..
 0130 ff6700b9 ff6b00b9 e80340b9 e80700b9  .g...k....@.....
 0140 e80740b9 e80b00b9 e80b40b9 e80f00b9  ..@.......@.....
 0150 e80f40b9 e81300b9 e81340b9 e81700b9  ..@.......@.....
 0160 e81740b9 e81b00b9 e81b40b9 e81f00b9  ..@.......@.....
 0170 e81f40b9 e82300b9 e82340b9 e82700b9  ..@..#...#@..'..
 0180 e82740b9 e82b00b9 e82b40b9 e82f00b9  .'@..+...+@../..
 0190 e82f40b9 e83300b9 280080d2 e81f00f9  ./@..3..(.......
 01a0 480080d2 e82300f9 680080d2 e82700f9  H....#..h....'..
 01b0 e83340b9 e85300b9 e85340b9 e85700b9  .3@..S...S@..W..
 01c0 e85740b9 e85b00b9 e85b40b9 e85f00b9  .W@..[...[@.._..
 01d0 e85f40b9 e86300b9 e86340b9 e86700b9  ._@..c...c@..g..
 01e0 e86740b9 e86b00b9 e86b40b9 e003082a  .g@..k...k@....*
 01f0 e1031f2a ffc30191 fd7bc1a8 c0035fd6  ...*.....{...._.

Disassembly of section .text:

0000000000000000 <store_i64>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10083ff 	sub	sp, sp, #0x20
   c:	f90003e0 	str	x0, [sp]
  10:	b9000bff 	str	wzr, [sp, #8]
  14:	f9000bff 	str	xzr, [sp, #16]
  18:	b9001bff 	str	wzr, [sp, #24]
  1c:	f94003e8 	ldr	x8, [sp]
  20:	f9000be8 	str	x8, [sp, #16]
  24:	f9400be8 	ldr	x8, [sp, #16]
  28:	aa0803e0 	mov	x0, x8
  2c:	aa1f03e1 	mov	x1, xzr
  30:	910083ff 	add	sp, sp, #0x20
  34:	a8c17bfd 	ldp	x29, x30, [sp], #16
  38:	d65f03c0 	ret
  3c:	d503201f 	nop

0000000000000040 <store_i64_const>:
  40:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  44:	910003fd 	mov	x29, sp
  48:	d10083ff 	sub	sp, sp, #0x20
  4c:	b90003ff 	str	wzr, [sp]
  50:	f90007ff 	str	xzr, [sp, #8]
  54:	b90013ff 	str	wzr, [sp, #16]
  58:	d29fffe8 	mov	x8, #0xffff                	// #65535
  5c:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  60:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  64:	f2efffe8 	movk	x8, #0x7fff, lsl #48
  68:	f90007e8 	str	x8, [sp, #8]
  6c:	f94007e8 	ldr	x8, [sp, #8]
  70:	aa0803e0 	mov	x0, x8
  74:	aa1f03e1 	mov	x1, xzr
  78:	910083ff 	add	sp, sp, #0x20
  7c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  80:	d65f03c0 	ret
  84:	d503201f 	nop

0000000000000088 <tee_i64>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	d10083ff 	sub	sp, sp, #0x20
  94:	b90003ff 	str	wzr, [sp]
  98:	f90007ff 	str	xzr, [sp, #8]
  9c:	b90013ff 	str	wzr, [sp, #16]
  a0:	d29fffe8 	mov	x8, #0xffff                	// #65535
  a4:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  a8:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  ac:	f2efffe8 	movk	x8, #0x7fff, lsl #48
  b0:	f90007e8 	str	x8, [sp, #8]
  b4:	52800009 	mov	w9, #0x0                   	// #0
  b8:	b90003e9 	str	w9, [sp]
  bc:	aa0803e0 	mov	x0, x8
  c0:	aa1f03e1 	mov	x1, xzr
  c4:	910083ff 	add	sp, sp, #0x20
  c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  cc:	d65f03c0 	ret

00000000000000d0 <many_locals>:
  d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  d4:	910003fd 	mov	x29, sp
  d8:	d101c3ff 	sub	sp, sp, #0x70
  dc:	b90003e0 	str	w0, [sp]
  e0:	b90007ff 	str	wzr, [sp, #4]
  e4:	b9000bff 	str	wzr, [sp, #8]
  e8:	b9000fff 	str	wzr, [sp, #12]
  ec:	b90013ff 	str	wzr, [sp, #16]
  f0:	b90017ff 	str	wzr, [sp, #20]
  f4:	b9001bff 	str	wzr, [sp, #24]
  f8:	b9001fff 	str	wzr, [sp, #28]
  fc:	b90023ff 	str	wzr, [sp, #32]
 100:	b90027ff 	str	wzr, [sp, #36]
 104:	b9002bff 	str	wzr, [sp, #40]
 108:	b9002fff 	str	wzr, [sp, #44]
 10c:	b90033ff 	str	wzr, [sp, #48]
 110:	f9001fff 	str	xzr, [sp, #56]
 114:	f90023ff 	str	xzr, [sp, #64]
 118:	f90027ff 	str	xzr, [sp, #72]
 11c:	b90053ff 	str	wzr, [sp, #80]
 120:	b90057ff 	str	wzr, [sp, #84]
 124:	b9005bff 	str	wzr, [sp, #88]
 128:	b9005fff 	str	wzr, [sp, #92]
 12c:	b90063ff 	str	wzr, [sp, #96]
 130:	b90067ff 	str	wzr, [sp, #100]
 134:	b9006bff 	str	wzr, [sp, #104]
 138:	b94003e8 	ldr	w8, [sp]
 13c:	b90007e8 	str	w8, [sp, #4]
 140:	b94007e8 	ldr	w8, [sp, #4]
 144:	b9000be8 	str	w8, [sp, #8]
 148:	b9400be8 	ldr	w8, [sp, #8]
 14c:	b9000fe8 	str	w8, [sp, #12]
 150:	b9400fe8 	ldr	w8, [sp, #12]
 154:	b90013e8 	str	w8, [sp, #16]
 158:	b94013e8 	ldr	w8, [sp, #16]
 15c:	b90017e8 	str	w8, [sp, #20]
 160:	b94017e8 	ldr	w8, [sp, #20]
 164:	b9001be8 	str	w8, [sp, #24]
 168:	b9401be8 	ldr	w8, [sp, #24]
 16c:	b9001fe8 	str	w8, [sp, #28]
 170:	b9401fe8 	ldr	w8, [sp, #28]
 174:	b90023e8 	str	w8, [sp, #32]
 178:	b94023e8 	ldr	w8, [sp, #32]
 17c:	b90027e8 	str	w8, [sp, #36]
 180:	b94027e8 	ldr	w8, [sp, #36]
 184:	b9002be8 	str	w8, [sp, #40]
 188:	b9402be8 	ldr	w8, [sp, #40]
 18c:	b9002fe8 	str	w8, [sp, #44]
 190:	b9402fe8 	ldr	w8, [sp, #44]
 194:	b90033e8 	str	w8, [sp, #48]
 198:	d2800028 	mov	x8, #0x1                   	// #1
 19c:	f9001fe8 	str	x8, [sp, #56]
 1a0:	d2800048 	mov	x8, #0x2                   	// #2
 1a4:	f90023e8 	str	x8, [sp, #64]
 1a8:	d2800068 	mov	x8, #0x3                   	// #3
 1ac:	f90027e8 	str	x8, [sp, #72]
 1b0:	b94033e8 	ldr	w8, [sp, #48]
 1b4:	b90053e8 	str	w8, [sp, #80]
 1b8:	b94053e8 	ldr	w8, [sp, #80]
 1bc:	b90057e8 	str	w8, [sp, #84]
 1c0:	b94057e8 	ldr	w8, [sp, #84]
 1c4:	b9005be8 	str	w8, [sp, #88]
 1c8:	b9405be8 	ldr	w8, [sp, #88]
 1cc:	b9005fe8 	str	w8, [sp, #92]
 1d0:	b9405fe8 	ldr	w8, [sp, #92]
 1d4:	b90063e8 	str	w8, [sp, #96]
 1d8:	b94063e8 	ldr	w8, [sp, #96]
 1dc:	b90067e8 	str	w8, [sp, #100]
 1e0:	b94067e8 	ldr	w8, [sp, #100]
 1e4:	b9006be8 	str	w8, [sp, #104]
 1e8:	b9406be8 	ldr	w8, [sp, #104]
 1ec:	2a0803e0 	mov	w0, w8
 1f0:	2a1f03e1 	mov	w1, wzr
 1f4:	9101c3ff 	add	sp, sp, #0x70
 1f8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1fc:	d65f03c0 	ret
