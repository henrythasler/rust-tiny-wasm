
./tests/assets/jit/locals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 store_i64
0000000000000040 l     F .text	0000000000000048 store_i64_const
0000000000000088 l     F .text	0000000000000130 many_locals


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff8300d1 e01300f9  .{..............
 0010 ff1b00b9 ff0b00f9 ff0f00b9 e81340f9  ..............@.
 0020 e80b00f9 e80b40f9 e00308aa e1031faa  ......@.........
 0030 ff830091 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0040 fd7bbfa9 fd030091 ff4300d1 ff1300b9  .{.......C......
 0050 ff0700f9 ff0700b9 e8ff9fd2 e8ffbff2  ................
 0060 e8ffdff2 e8ffeff2 e80700f9 e80740f9  ..............@.
 0070 e00308aa e1031faa ff430091 fd7bc1a8  .........C...{..
 0080 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0090 ffc301d1 e07300b9 ff6f00b9 ff6b00b9  .....s...o...k..
 00a0 ff6700b9 ff6300b9 ff5f00b9 ff5b00b9  .g...c..._...[..
 00b0 ff5700b9 ff5300b9 ff4f00b9 ff4b00b9  .W...S...O...K..
 00c0 ff4700b9 ff4300b9 ff1f00f9 ff1b00f9  .G...C..........
 00d0 ff1700f9 ff2700b9 ff2300b9 ff1f00b9  .....'...#......
 00e0 ff1b00b9 ff1700b9 ff1300b9 ff0f00b9  ................
 00f0 e87340b9 e86f00b9 e86f40b9 e86b00b9  .s@..o...o@..k..
 0100 e86b40b9 e86700b9 e86740b9 e86300b9  .k@..g...g@..c..
 0110 e86340b9 e85f00b9 e85f40b9 e85b00b9  .c@.._..._@..[..
 0120 e85b40b9 e85700b9 e85740b9 e85300b9  .[@..W...W@..S..
 0130 e85340b9 e84f00b9 e84f40b9 e84b00b9  .S@..O...O@..K..
 0140 e84b40b9 e84700b9 e84740b9 e84300b9  .K@..G...G@..C..
 0150 280080d2 e81f00f9 480080d2 e81b00f9  (.......H.......
 0160 680080d2 e81700f9 e84340b9 e82700b9  h........C@..'..
 0170 e82740b9 e82300b9 e82340b9 e81f00b9  .'@..#...#@.....
 0180 e81f40b9 e81b00b9 e81b40b9 e81700b9  ..@.......@.....
 0190 e81740b9 e81300b9 e81340b9 e80f00b9  ..@.......@.....
 01a0 e80f40b9 e003082a e1031f2a ffc30191  ..@....*...*....
 01b0 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <store_i64>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10083ff 	sub	sp, sp, #0x20
   c:	f90013e0 	str	x0, [sp, #32]
  10:	b9001bff 	str	wzr, [sp, #24]
  14:	f9000bff 	str	xzr, [sp, #16]
  18:	b9000fff 	str	wzr, [sp, #12]
  1c:	f94013e8 	ldr	x8, [sp, #32]
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
  4c:	b90013ff 	str	wzr, [sp, #16]
  50:	f90007ff 	str	xzr, [sp, #8]
  54:	b90007ff 	str	wzr, [sp, #4]
  58:	d29fffe8 	mov	x8, #0xffff                	// #65535
  5c:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  60:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  64:	f2efffe8 	movk	x8, #0x7fff, lsl #48
  68:	f90007e8 	str	x8, [sp, #8]
  6c:	f94007e8 	ldr	x8, [sp, #8]
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
  94:	b90073e0 	str	w0, [sp, #112]
  98:	b9006fff 	str	wzr, [sp, #108]
  9c:	b9006bff 	str	wzr, [sp, #104]
  a0:	b90067ff 	str	wzr, [sp, #100]
  a4:	b90063ff 	str	wzr, [sp, #96]
  a8:	b9005fff 	str	wzr, [sp, #92]
  ac:	b9005bff 	str	wzr, [sp, #88]
  b0:	b90057ff 	str	wzr, [sp, #84]
  b4:	b90053ff 	str	wzr, [sp, #80]
  b8:	b9004fff 	str	wzr, [sp, #76]
  bc:	b9004bff 	str	wzr, [sp, #72]
  c0:	b90047ff 	str	wzr, [sp, #68]
  c4:	b90043ff 	str	wzr, [sp, #64]
  c8:	f9001fff 	str	xzr, [sp, #56]
  cc:	f9001bff 	str	xzr, [sp, #48]
  d0:	f90017ff 	str	xzr, [sp, #40]
  d4:	b90027ff 	str	wzr, [sp, #36]
  d8:	b90023ff 	str	wzr, [sp, #32]
  dc:	b9001fff 	str	wzr, [sp, #28]
  e0:	b9001bff 	str	wzr, [sp, #24]
  e4:	b90017ff 	str	wzr, [sp, #20]
  e8:	b90013ff 	str	wzr, [sp, #16]
  ec:	b9000fff 	str	wzr, [sp, #12]
  f0:	b94073e8 	ldr	w8, [sp, #112]
  f4:	b9006fe8 	str	w8, [sp, #108]
  f8:	b9406fe8 	ldr	w8, [sp, #108]
  fc:	b9006be8 	str	w8, [sp, #104]
 100:	b9406be8 	ldr	w8, [sp, #104]
 104:	b90067e8 	str	w8, [sp, #100]
 108:	b94067e8 	ldr	w8, [sp, #100]
 10c:	b90063e8 	str	w8, [sp, #96]
 110:	b94063e8 	ldr	w8, [sp, #96]
 114:	b9005fe8 	str	w8, [sp, #92]
 118:	b9405fe8 	ldr	w8, [sp, #92]
 11c:	b9005be8 	str	w8, [sp, #88]
 120:	b9405be8 	ldr	w8, [sp, #88]
 124:	b90057e8 	str	w8, [sp, #84]
 128:	b94057e8 	ldr	w8, [sp, #84]
 12c:	b90053e8 	str	w8, [sp, #80]
 130:	b94053e8 	ldr	w8, [sp, #80]
 134:	b9004fe8 	str	w8, [sp, #76]
 138:	b9404fe8 	ldr	w8, [sp, #76]
 13c:	b9004be8 	str	w8, [sp, #72]
 140:	b9404be8 	ldr	w8, [sp, #72]
 144:	b90047e8 	str	w8, [sp, #68]
 148:	b94047e8 	ldr	w8, [sp, #68]
 14c:	b90043e8 	str	w8, [sp, #64]
 150:	d2800028 	mov	x8, #0x1                   	// #1
 154:	f9001fe8 	str	x8, [sp, #56]
 158:	d2800048 	mov	x8, #0x2                   	// #2
 15c:	f9001be8 	str	x8, [sp, #48]
 160:	d2800068 	mov	x8, #0x3                   	// #3
 164:	f90017e8 	str	x8, [sp, #40]
 168:	b94043e8 	ldr	w8, [sp, #64]
 16c:	b90027e8 	str	w8, [sp, #36]
 170:	b94027e8 	ldr	w8, [sp, #36]
 174:	b90023e8 	str	w8, [sp, #32]
 178:	b94023e8 	ldr	w8, [sp, #32]
 17c:	b9001fe8 	str	w8, [sp, #28]
 180:	b9401fe8 	ldr	w8, [sp, #28]
 184:	b9001be8 	str	w8, [sp, #24]
 188:	b9401be8 	ldr	w8, [sp, #24]
 18c:	b90017e8 	str	w8, [sp, #20]
 190:	b94017e8 	ldr	w8, [sp, #20]
 194:	b90013e8 	str	w8, [sp, #16]
 198:	b94013e8 	ldr	w8, [sp, #16]
 19c:	b9000fe8 	str	w8, [sp, #12]
 1a0:	b9400fe8 	ldr	w8, [sp, #12]
 1a4:	2a0803e0 	mov	w0, w8
 1a8:	2a1f03e1 	mov	w1, wzr
 1ac:	9101c3ff 	add	sp, sp, #0x70
 1b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b4:	d65f03c0 	ret
