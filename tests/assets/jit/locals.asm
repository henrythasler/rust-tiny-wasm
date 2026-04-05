
./tests/assets/jit/locals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 store_i64
0000000000000040 l     F .text	0000000000000048 store_i64_const
0000000000000088 l     F .text	0000000000000130 many_locals


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
 0090 ffc301d1 e00300b9 ff0700b9 ff0b00b9  ................
 00a0 ff0f00b9 ff1300b9 ff1700b9 ff1b00b9  ................
 00b0 ff1f00b9 ff2300b9 ff2700b9 ff2b00b9  .....#...'...+..
 00c0 ff2f00b9 ff3300b9 ff1f00f9 ff2300f9  ./...3.......#..
 00d0 ff2700f9 ff5300b9 ff5700b9 ff5b00b9  .'...S...W...[..
 00e0 ff5f00b9 ff6300b9 ff6700b9 ff6b00b9  ._...c...g...k..
 00f0 e80340b9 e80700b9 e80740b9 e80b00b9  ..@.......@.....
 0100 e80b40b9 e80f00b9 e80f40b9 e81300b9  ..@.......@.....
 0110 e81340b9 e81700b9 e81740b9 e81b00b9  ..@.......@.....
 0120 e81b40b9 e81f00b9 e81f40b9 e82300b9  ..@.......@..#..
 0130 e82340b9 e82700b9 e82740b9 e82b00b9  .#@..'...'@..+..
 0140 e82b40b9 e82f00b9 e82f40b9 e83300b9  .+@../.../@..3..
 0150 280080d2 e81f00f9 480080d2 e82300f9  (.......H....#..
 0160 680080d2 e82700f9 e83340b9 e85300b9  h....'...3@..S..
 0170 e85340b9 e85700b9 e85740b9 e85b00b9  .S@..W...W@..[..
 0180 e85b40b9 e85f00b9 e85f40b9 e86300b9  .[@.._..._@..c..
 0190 e86340b9 e86700b9 e86740b9 e86b00b9  .c@..g...g@..k..
 01a0 e86b40b9 e003082a e1031f2a ffc30191  .k@....*...*....
 01b0 fd7bc1a8 c0035fd6                    .{...._.        

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

0000000000000088 <many_locals>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	d101c3ff 	sub	sp, sp, #0x70
  94:	b90003e0 	str	w0, [sp]
  98:	b90007ff 	str	wzr, [sp, #4]
  9c:	b9000bff 	str	wzr, [sp, #8]
  a0:	b9000fff 	str	wzr, [sp, #12]
  a4:	b90013ff 	str	wzr, [sp, #16]
  a8:	b90017ff 	str	wzr, [sp, #20]
  ac:	b9001bff 	str	wzr, [sp, #24]
  b0:	b9001fff 	str	wzr, [sp, #28]
  b4:	b90023ff 	str	wzr, [sp, #32]
  b8:	b90027ff 	str	wzr, [sp, #36]
  bc:	b9002bff 	str	wzr, [sp, #40]
  c0:	b9002fff 	str	wzr, [sp, #44]
  c4:	b90033ff 	str	wzr, [sp, #48]
  c8:	f9001fff 	str	xzr, [sp, #56]
  cc:	f90023ff 	str	xzr, [sp, #64]
  d0:	f90027ff 	str	xzr, [sp, #72]
  d4:	b90053ff 	str	wzr, [sp, #80]
  d8:	b90057ff 	str	wzr, [sp, #84]
  dc:	b9005bff 	str	wzr, [sp, #88]
  e0:	b9005fff 	str	wzr, [sp, #92]
  e4:	b90063ff 	str	wzr, [sp, #96]
  e8:	b90067ff 	str	wzr, [sp, #100]
  ec:	b9006bff 	str	wzr, [sp, #104]
  f0:	b94003e8 	ldr	w8, [sp]
  f4:	b90007e8 	str	w8, [sp, #4]
  f8:	b94007e8 	ldr	w8, [sp, #4]
  fc:	b9000be8 	str	w8, [sp, #8]
 100:	b9400be8 	ldr	w8, [sp, #8]
 104:	b9000fe8 	str	w8, [sp, #12]
 108:	b9400fe8 	ldr	w8, [sp, #12]
 10c:	b90013e8 	str	w8, [sp, #16]
 110:	b94013e8 	ldr	w8, [sp, #16]
 114:	b90017e8 	str	w8, [sp, #20]
 118:	b94017e8 	ldr	w8, [sp, #20]
 11c:	b9001be8 	str	w8, [sp, #24]
 120:	b9401be8 	ldr	w8, [sp, #24]
 124:	b9001fe8 	str	w8, [sp, #28]
 128:	b9401fe8 	ldr	w8, [sp, #28]
 12c:	b90023e8 	str	w8, [sp, #32]
 130:	b94023e8 	ldr	w8, [sp, #32]
 134:	b90027e8 	str	w8, [sp, #36]
 138:	b94027e8 	ldr	w8, [sp, #36]
 13c:	b9002be8 	str	w8, [sp, #40]
 140:	b9402be8 	ldr	w8, [sp, #40]
 144:	b9002fe8 	str	w8, [sp, #44]
 148:	b9402fe8 	ldr	w8, [sp, #44]
 14c:	b90033e8 	str	w8, [sp, #48]
 150:	d2800028 	mov	x8, #0x1                   	// #1
 154:	f9001fe8 	str	x8, [sp, #56]
 158:	d2800048 	mov	x8, #0x2                   	// #2
 15c:	f90023e8 	str	x8, [sp, #64]
 160:	d2800068 	mov	x8, #0x3                   	// #3
 164:	f90027e8 	str	x8, [sp, #72]
 168:	b94033e8 	ldr	w8, [sp, #48]
 16c:	b90053e8 	str	w8, [sp, #80]
 170:	b94053e8 	ldr	w8, [sp, #80]
 174:	b90057e8 	str	w8, [sp, #84]
 178:	b94057e8 	ldr	w8, [sp, #84]
 17c:	b9005be8 	str	w8, [sp, #88]
 180:	b9405be8 	ldr	w8, [sp, #88]
 184:	b9005fe8 	str	w8, [sp, #92]
 188:	b9405fe8 	ldr	w8, [sp, #92]
 18c:	b90063e8 	str	w8, [sp, #96]
 190:	b94063e8 	ldr	w8, [sp, #96]
 194:	b90067e8 	str	w8, [sp, #100]
 198:	b94067e8 	ldr	w8, [sp, #100]
 19c:	b9006be8 	str	w8, [sp, #104]
 1a0:	b9406be8 	ldr	w8, [sp, #104]
 1a4:	2a0803e0 	mov	w0, w8
 1a8:	2a1f03e1 	mov	w1, wzr
 1ac:	9101c3ff 	add	sp, sp, #0x70
 1b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b4:	d65f03c0 	ret
