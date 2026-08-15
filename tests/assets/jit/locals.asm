
tests/assets/jit/locals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 store_i64
0000000000000040 l     F .text	0000000000000048 store_i64_const
0000000000000088 l     F .text	0000000000000050 tee_i64
00000000000000d8 l     F .text	0000000000000138 many_locals


Contents of section .text:
 0000 fd7bbfa9 fd030091 ffc300d1 e00300f9  .{..............
 0010 e10700f9 ff1300b9 ff0f00f9 ff2300b9  .............#..
 0020 e80740f9 e80f00f9 e80f40f9 000080d2  ..@.......@.....
 0030 e10308aa ffc30091 fd7bc1a8 c0035fd6  .........{...._.
 0040 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0050 ff0b00b9 ff0b00f9 ff1b00b9 e8ff9fd2  ................
 0060 e8ffbff2 e8ffdff2 e8ffeff2 e80b00f9  ................
 0070 e80b40f9 000080d2 e10308aa ff830091  ..@.............
 0080 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0090 ff8300d1 e00300f9 ff0b00b9 ff0b00f9  ................
 00a0 ff1b00b9 e8ff9fd2 e8ffbff2 e8ffdff2  ................
 00b0 e8ffeff2 e80b00f9 09008052 e90b00b9  ...........R....
 00c0 000080d2 e10308aa ff830091 fd7bc1a8  .............{..
 00d0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00e0 ff0302d1 e00300f9 e10b00b9 ff0f00b9  ................
 00f0 ff1300b9 ff1700b9 ff1b00b9 ff1f00b9  ................
 0100 ff2300b9 ff2700b9 ff2b00b9 ff2f00b9  .#...'...+.../..
 0110 ff3300b9 ff3700b9 ff3b00b9 ff2300f9  .3...7...;...#..
 0120 ff2700f9 ff2b00f9 ff5b00b9 ff5f00b9  .'...+...[..._..
 0130 ff6300b9 ff6700b9 ff6b00b9 ff6f00b9  .c...g...k...o..
 0140 ff7300b9 e80b40b9 e80f00b9 e80f40b9  .s....@.......@.
 0150 e81300b9 e81340b9 e81700b9 e81740b9  ......@.......@.
 0160 e81b00b9 e81b40b9 e81f00b9 e81f40b9  ......@.......@.
 0170 e82300b9 e82340b9 e82700b9 e82740b9  .#...#@..'...'@.
 0180 e82b00b9 e82b40b9 e82f00b9 e82f40b9  .+...+@../.../@.
 0190 e83300b9 e83340b9 e83700b9 e83740b9  .3...3@..7...7@.
 01a0 e83b00b9 280080d2 e82300f9 480080d2  .;..(....#..H...
 01b0 e82700f9 680080d2 e82b00f9 e83b40b9  .'..h....+...;@.
 01c0 e85b00b9 e85b40b9 e85f00b9 e85f40b9  .[...[@.._..._@.
 01d0 e86300b9 e86340b9 e86700b9 e86740b9  .c...c@..g...g@.
 01e0 e86b00b9 e86b40b9 e86f00b9 e86f40b9  .k...k@..o...o@.
 01f0 e87300b9 e87340b9 000080d2 e10308aa  .s...s@.........
 0200 ff030291 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..

Disassembly of section .text:

0000000000000000 <store_i64>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d100c3ff 	sub	sp, sp, #0x30
   c:	f90003e0 	str	x0, [sp]
  10:	f90007e1 	str	x1, [sp, #8]
  14:	b90013ff 	str	wzr, [sp, #16]
  18:	f9000fff 	str	xzr, [sp, #24]
  1c:	b90023ff 	str	wzr, [sp, #32]
  20:	f94007e8 	ldr	x8, [sp, #8]
  24:	f9000fe8 	str	x8, [sp, #24]
  28:	f9400fe8 	ldr	x8, [sp, #24]
  2c:	d2800000 	mov	x0, #0x0                   	// #0
  30:	aa0803e1 	mov	x1, x8
  34:	9100c3ff 	add	sp, sp, #0x30
  38:	a8c17bfd 	ldp	x29, x30, [sp], #16
  3c:	d65f03c0 	ret

0000000000000040 <store_i64_const>:
  40:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  44:	910003fd 	mov	x29, sp
  48:	d10083ff 	sub	sp, sp, #0x20
  4c:	f90003e0 	str	x0, [sp]
  50:	b9000bff 	str	wzr, [sp, #8]
  54:	f9000bff 	str	xzr, [sp, #16]
  58:	b9001bff 	str	wzr, [sp, #24]
  5c:	d29fffe8 	mov	x8, #0xffff                	// #65535
  60:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  64:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  68:	f2efffe8 	movk	x8, #0x7fff, lsl #48
  6c:	f9000be8 	str	x8, [sp, #16]
  70:	f9400be8 	ldr	x8, [sp, #16]
  74:	d2800000 	mov	x0, #0x0                   	// #0
  78:	aa0803e1 	mov	x1, x8
  7c:	910083ff 	add	sp, sp, #0x20
  80:	a8c17bfd 	ldp	x29, x30, [sp], #16
  84:	d65f03c0 	ret

0000000000000088 <tee_i64>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	d10083ff 	sub	sp, sp, #0x20
  94:	f90003e0 	str	x0, [sp]
  98:	b9000bff 	str	wzr, [sp, #8]
  9c:	f9000bff 	str	xzr, [sp, #16]
  a0:	b9001bff 	str	wzr, [sp, #24]
  a4:	d29fffe8 	mov	x8, #0xffff                	// #65535
  a8:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  ac:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  b0:	f2efffe8 	movk	x8, #0x7fff, lsl #48
  b4:	f9000be8 	str	x8, [sp, #16]
  b8:	52800009 	mov	w9, #0x0                   	// #0
  bc:	b9000be9 	str	w9, [sp, #8]
  c0:	d2800000 	mov	x0, #0x0                   	// #0
  c4:	aa0803e1 	mov	x1, x8
  c8:	910083ff 	add	sp, sp, #0x20
  cc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d0:	d65f03c0 	ret
  d4:	d503201f 	nop

00000000000000d8 <many_locals>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	d10203ff 	sub	sp, sp, #0x80
  e4:	f90003e0 	str	x0, [sp]
  e8:	b9000be1 	str	w1, [sp, #8]
  ec:	b9000fff 	str	wzr, [sp, #12]
  f0:	b90013ff 	str	wzr, [sp, #16]
  f4:	b90017ff 	str	wzr, [sp, #20]
  f8:	b9001bff 	str	wzr, [sp, #24]
  fc:	b9001fff 	str	wzr, [sp, #28]
 100:	b90023ff 	str	wzr, [sp, #32]
 104:	b90027ff 	str	wzr, [sp, #36]
 108:	b9002bff 	str	wzr, [sp, #40]
 10c:	b9002fff 	str	wzr, [sp, #44]
 110:	b90033ff 	str	wzr, [sp, #48]
 114:	b90037ff 	str	wzr, [sp, #52]
 118:	b9003bff 	str	wzr, [sp, #56]
 11c:	f90023ff 	str	xzr, [sp, #64]
 120:	f90027ff 	str	xzr, [sp, #72]
 124:	f9002bff 	str	xzr, [sp, #80]
 128:	b9005bff 	str	wzr, [sp, #88]
 12c:	b9005fff 	str	wzr, [sp, #92]
 130:	b90063ff 	str	wzr, [sp, #96]
 134:	b90067ff 	str	wzr, [sp, #100]
 138:	b9006bff 	str	wzr, [sp, #104]
 13c:	b9006fff 	str	wzr, [sp, #108]
 140:	b90073ff 	str	wzr, [sp, #112]
 144:	b9400be8 	ldr	w8, [sp, #8]
 148:	b9000fe8 	str	w8, [sp, #12]
 14c:	b9400fe8 	ldr	w8, [sp, #12]
 150:	b90013e8 	str	w8, [sp, #16]
 154:	b94013e8 	ldr	w8, [sp, #16]
 158:	b90017e8 	str	w8, [sp, #20]
 15c:	b94017e8 	ldr	w8, [sp, #20]
 160:	b9001be8 	str	w8, [sp, #24]
 164:	b9401be8 	ldr	w8, [sp, #24]
 168:	b9001fe8 	str	w8, [sp, #28]
 16c:	b9401fe8 	ldr	w8, [sp, #28]
 170:	b90023e8 	str	w8, [sp, #32]
 174:	b94023e8 	ldr	w8, [sp, #32]
 178:	b90027e8 	str	w8, [sp, #36]
 17c:	b94027e8 	ldr	w8, [sp, #36]
 180:	b9002be8 	str	w8, [sp, #40]
 184:	b9402be8 	ldr	w8, [sp, #40]
 188:	b9002fe8 	str	w8, [sp, #44]
 18c:	b9402fe8 	ldr	w8, [sp, #44]
 190:	b90033e8 	str	w8, [sp, #48]
 194:	b94033e8 	ldr	w8, [sp, #48]
 198:	b90037e8 	str	w8, [sp, #52]
 19c:	b94037e8 	ldr	w8, [sp, #52]
 1a0:	b9003be8 	str	w8, [sp, #56]
 1a4:	d2800028 	mov	x8, #0x1                   	// #1
 1a8:	f90023e8 	str	x8, [sp, #64]
 1ac:	d2800048 	mov	x8, #0x2                   	// #2
 1b0:	f90027e8 	str	x8, [sp, #72]
 1b4:	d2800068 	mov	x8, #0x3                   	// #3
 1b8:	f9002be8 	str	x8, [sp, #80]
 1bc:	b9403be8 	ldr	w8, [sp, #56]
 1c0:	b9005be8 	str	w8, [sp, #88]
 1c4:	b9405be8 	ldr	w8, [sp, #88]
 1c8:	b9005fe8 	str	w8, [sp, #92]
 1cc:	b9405fe8 	ldr	w8, [sp, #92]
 1d0:	b90063e8 	str	w8, [sp, #96]
 1d4:	b94063e8 	ldr	w8, [sp, #96]
 1d8:	b90067e8 	str	w8, [sp, #100]
 1dc:	b94067e8 	ldr	w8, [sp, #100]
 1e0:	b9006be8 	str	w8, [sp, #104]
 1e4:	b9406be8 	ldr	w8, [sp, #104]
 1e8:	b9006fe8 	str	w8, [sp, #108]
 1ec:	b9406fe8 	ldr	w8, [sp, #108]
 1f0:	b90073e8 	str	w8, [sp, #112]
 1f4:	b94073e8 	ldr	w8, [sp, #112]
 1f8:	d2800000 	mov	x0, #0x0                   	// #0
 1fc:	aa0803e1 	mov	x1, x8
 200:	910203ff 	add	sp, sp, #0x80
 204:	a8c17bfd 	ldp	x29, x30, [sp], #16
 208:	d65f03c0 	ret
 20c:	d503201f 	nop
