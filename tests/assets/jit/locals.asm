
./tests/assets/jit/locals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 store_i64
0000000000000040 l     F .text	0000000000000048 store_i64_const
0000000000000088 l     F .text	0000000000000130 many_locals


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff8300d1 e00700f9  .{..............
 0010 ff1300b9 ff0b00f9 ff1f00b9 e80740f9  ..............@.
 0020 e80b00f9 e80b40f9 e00308aa e1031faa  ......@.........
 0030 ff830091 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0040 fd7bbfa9 fd030091 ff4300d1 ff0300b9  .{.......C......
 0050 ff0300f9 ff0f00b9 e8ff9fd2 e8ffbff2  ................
 0060 e8ffdff2 e8ffeff2 e80300f9 e80340f9  ..............@.
 0070 e00308aa e1031faa ff430091 fd7bc1a8  .........C...{..
 0080 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0090 ffc301d1 e00b00b9 ff0f00b9 ff1300b9  ................
 00a0 ff1700b9 ff1b00b9 ff1f00b9 ff2300b9  .............#..
 00b0 ff2700b9 ff2b00b9 ff2f00b9 ff3300b9  .'...+.../...3..
 00c0 ff3700b9 ff3b00b9 ff1f00f9 ff2300f9  .7...;.......#..
 00d0 ff2700f9 ff5700b9 ff5b00b9 ff5f00b9  .'...W...[..._..
 00e0 ff6300b9 ff6700b9 ff6b00b9 ff6f00b9  .c...g...k...o..
 00f0 e80b40b9 e80f00b9 e80f40b9 e81300b9  ..@.......@.....
 0100 e81340b9 e81700b9 e81740b9 e81b00b9  ..@.......@.....
 0110 e81b40b9 e81f00b9 e81f40b9 e82300b9  ..@.......@..#..
 0120 e82340b9 e82700b9 e82740b9 e82b00b9  .#@..'...'@..+..
 0130 e82b40b9 e82f00b9 e82f40b9 e83300b9  .+@../.../@..3..
 0140 e83340b9 e83700b9 e83740b9 e83b00b9  .3@..7...7@..;..
 0150 280080d2 e81f00f9 480080d2 e82300f9  (.......H....#..
 0160 680080d2 e82700f9 e83b40b9 e85700b9  h....'...;@..W..
 0170 e85740b9 e85b00b9 e85b40b9 e85f00b9  .W@..[...[@.._..
 0180 e85f40b9 e86300b9 e86340b9 e86700b9  ._@..c...c@..g..
 0190 e86740b9 e86b00b9 e86b40b9 e86f00b9  .g@..k...k@..o..
 01a0 e86f40b9 e003082a e1031f2a ffc30191  .o@....*...*....
 01b0 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <store_i64>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10083ff 	sub	sp, sp, #0x20
   c:	f90007e0 	str	x0, [sp, #8]
  10:	b90013ff 	str	wzr, [sp, #16]
  14:	f9000bff 	str	xzr, [sp, #16]
  18:	b9001fff 	str	wzr, [sp, #28]
  1c:	f94007e8 	ldr	x8, [sp, #8]
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
  48:	d10043ff 	sub	sp, sp, #0x10
  4c:	b90003ff 	str	wzr, [sp]
  50:	f90003ff 	str	xzr, [sp]
  54:	b9000fff 	str	wzr, [sp, #12]
  58:	d29fffe8 	mov	x8, #0xffff                	// #65535
  5c:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  60:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  64:	f2efffe8 	movk	x8, #0x7fff, lsl #48
  68:	f90003e8 	str	x8, [sp]
  6c:	f94003e8 	ldr	x8, [sp]
  70:	aa0803e0 	mov	x0, x8
  74:	aa1f03e1 	mov	x1, xzr
  78:	910043ff 	add	sp, sp, #0x10
  7c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  80:	d65f03c0 	ret
  84:	d503201f 	nop

0000000000000088 <many_locals>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	d101c3ff 	sub	sp, sp, #0x70
  94:	b9000be0 	str	w0, [sp, #8]
  98:	b9000fff 	str	wzr, [sp, #12]
  9c:	b90013ff 	str	wzr, [sp, #16]
  a0:	b90017ff 	str	wzr, [sp, #20]
  a4:	b9001bff 	str	wzr, [sp, #24]
  a8:	b9001fff 	str	wzr, [sp, #28]
  ac:	b90023ff 	str	wzr, [sp, #32]
  b0:	b90027ff 	str	wzr, [sp, #36]
  b4:	b9002bff 	str	wzr, [sp, #40]
  b8:	b9002fff 	str	wzr, [sp, #44]
  bc:	b90033ff 	str	wzr, [sp, #48]
  c0:	b90037ff 	str	wzr, [sp, #52]
  c4:	b9003bff 	str	wzr, [sp, #56]
  c8:	f9001fff 	str	xzr, [sp, #56]
  cc:	f90023ff 	str	xzr, [sp, #64]
  d0:	f90027ff 	str	xzr, [sp, #72]
  d4:	b90057ff 	str	wzr, [sp, #84]
  d8:	b9005bff 	str	wzr, [sp, #88]
  dc:	b9005fff 	str	wzr, [sp, #92]
  e0:	b90063ff 	str	wzr, [sp, #96]
  e4:	b90067ff 	str	wzr, [sp, #100]
  e8:	b9006bff 	str	wzr, [sp, #104]
  ec:	b9006fff 	str	wzr, [sp, #108]
  f0:	b9400be8 	ldr	w8, [sp, #8]
  f4:	b9000fe8 	str	w8, [sp, #12]
  f8:	b9400fe8 	ldr	w8, [sp, #12]
  fc:	b90013e8 	str	w8, [sp, #16]
 100:	b94013e8 	ldr	w8, [sp, #16]
 104:	b90017e8 	str	w8, [sp, #20]
 108:	b94017e8 	ldr	w8, [sp, #20]
 10c:	b9001be8 	str	w8, [sp, #24]
 110:	b9401be8 	ldr	w8, [sp, #24]
 114:	b9001fe8 	str	w8, [sp, #28]
 118:	b9401fe8 	ldr	w8, [sp, #28]
 11c:	b90023e8 	str	w8, [sp, #32]
 120:	b94023e8 	ldr	w8, [sp, #32]
 124:	b90027e8 	str	w8, [sp, #36]
 128:	b94027e8 	ldr	w8, [sp, #36]
 12c:	b9002be8 	str	w8, [sp, #40]
 130:	b9402be8 	ldr	w8, [sp, #40]
 134:	b9002fe8 	str	w8, [sp, #44]
 138:	b9402fe8 	ldr	w8, [sp, #44]
 13c:	b90033e8 	str	w8, [sp, #48]
 140:	b94033e8 	ldr	w8, [sp, #48]
 144:	b90037e8 	str	w8, [sp, #52]
 148:	b94037e8 	ldr	w8, [sp, #52]
 14c:	b9003be8 	str	w8, [sp, #56]
 150:	d2800028 	mov	x8, #0x1                   	// #1
 154:	f9001fe8 	str	x8, [sp, #56]
 158:	d2800048 	mov	x8, #0x2                   	// #2
 15c:	f90023e8 	str	x8, [sp, #64]
 160:	d2800068 	mov	x8, #0x3                   	// #3
 164:	f90027e8 	str	x8, [sp, #72]
 168:	b9403be8 	ldr	w8, [sp, #56]
 16c:	b90057e8 	str	w8, [sp, #84]
 170:	b94057e8 	ldr	w8, [sp, #84]
 174:	b9005be8 	str	w8, [sp, #88]
 178:	b9405be8 	ldr	w8, [sp, #88]
 17c:	b9005fe8 	str	w8, [sp, #92]
 180:	b9405fe8 	ldr	w8, [sp, #92]
 184:	b90063e8 	str	w8, [sp, #96]
 188:	b94063e8 	ldr	w8, [sp, #96]
 18c:	b90067e8 	str	w8, [sp, #100]
 190:	b94067e8 	ldr	w8, [sp, #100]
 194:	b9006be8 	str	w8, [sp, #104]
 198:	b9406be8 	ldr	w8, [sp, #104]
 19c:	b9006fe8 	str	w8, [sp, #108]
 1a0:	b9406fe8 	ldr	w8, [sp, #108]
 1a4:	2a0803e0 	mov	w0, w8
 1a8:	2a1f03e1 	mov	w1, wzr
 1ac:	9101c3ff 	add	sp, sp, #0x70
 1b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b4:	d65f03c0 	ret
