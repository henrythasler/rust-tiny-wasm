
tests/assets/jit/locals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000040 store_i64
00000000000000a8 l     F .text	0000000000000048 store_i64_const
00000000000000f0 l     F .text	0000000000000048 tee_i64
0000000000000138 l     F .text	0000000000000130 many_locals


Contents of section .text:
 0000 010080d2 17000014 210080d2 15000014  ........!.......
 0010 410080d2 13000014 610080d2 11000014  A.......a.......
 0020 810080d2 0f000014 a10080d2 0d000014  ................
 0030 c10080d2 0b000014 e10080d2 09000014  ................
 0040 010180d2 07000014 210180d2 05000014  ........!.......
 0050 410180d2 03000014 610180d2 01000014  A.......a.......
 0060 200080d2 c0035fd6 fd7bbfa9 fd030091   ....._..{......
 0070 ff8300d1 e00300f9 ff0b00b9 ff0b00f9  ................
 0080 ff1b00b9 e80340f9 e80b00f9 e80b40f9  ......@.......@.
 0090 000080d2 e10308aa ff830091 fd7bc1a8  .............{..
 00a0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00b0 ff8300d1 ff0300b9 ff0700f9 ff1300b9  ................
 00c0 e8ff9fd2 e8ffbff2 e8ffdff2 e8ffeff2  ................
 00d0 e80700f9 e80740f9 000080d2 e10308aa  ......@.........
 00e0 ff830091 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 00f0 fd7bbfa9 fd030091 ff8300d1 ff0300b9  .{..............
 0100 ff0700f9 ff1300b9 e8ff9fd2 e8ffbff2  ................
 0110 e8ffdff2 e8ffeff2 e80700f9 09008052  ...............R
 0120 e90300b9 000080d2 e10308aa ff830091  ................
 0130 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0140 ffc301d1 e00300b9 ff0700b9 ff0b00b9  ................
 0150 ff0f00b9 ff1300b9 ff1700b9 ff1b00b9  ................
 0160 ff1f00b9 ff2300b9 ff2700b9 ff2b00b9  .....#...'...+..
 0170 ff2f00b9 ff3300b9 ff1f00f9 ff2300f9  ./...3.......#..
 0180 ff2700f9 ff5300b9 ff5700b9 ff5b00b9  .'...S...W...[..
 0190 ff5f00b9 ff6300b9 ff6700b9 ff6b00b9  ._...c...g...k..
 01a0 e80340b9 e80700b9 e80740b9 e80b00b9  ..@.......@.....
 01b0 e80b40b9 e80f00b9 e80f40b9 e81300b9  ..@.......@.....
 01c0 e81340b9 e81700b9 e81740b9 e81b00b9  ..@.......@.....
 01d0 e81b40b9 e81f00b9 e81f40b9 e82300b9  ..@.......@..#..
 01e0 e82340b9 e82700b9 e82740b9 e82b00b9  .#@..'...'@..+..
 01f0 e82b40b9 e82f00b9 e82f40b9 e83300b9  .+@../.../@..3..
 0200 280080d2 e81f00f9 480080d2 e82300f9  (.......H....#..
 0210 680080d2 e82700f9 e83340b9 e85300b9  h....'...3@..S..
 0220 e85340b9 e85700b9 e85740b9 e85b00b9  .S@..W...W@..[..
 0230 e85b40b9 e85f00b9 e85f40b9 e86300b9  .[@.._..._@..c..
 0240 e86340b9 e86700b9 e86740b9 e86b00b9  .c@..g...g@..k..
 0250 e86b40b9 00008052 e103082a ffc30191  .k@....R...*....
 0260 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <trap_handler>:
   0:	d2800001 	mov	x1, #0x0                   	// #0
   4:	14000017 	b	60 <trap_handler+0x60>
   8:	d2800021 	mov	x1, #0x1                   	// #1
   c:	14000015 	b	60 <trap_handler+0x60>
  10:	d2800041 	mov	x1, #0x2                   	// #2
  14:	14000013 	b	60 <trap_handler+0x60>
  18:	d2800061 	mov	x1, #0x3                   	// #3
  1c:	14000011 	b	60 <trap_handler+0x60>
  20:	d2800081 	mov	x1, #0x4                   	// #4
  24:	1400000f 	b	60 <trap_handler+0x60>
  28:	d28000a1 	mov	x1, #0x5                   	// #5
  2c:	1400000d 	b	60 <trap_handler+0x60>
  30:	d28000c1 	mov	x1, #0x6                   	// #6
  34:	1400000b 	b	60 <trap_handler+0x60>
  38:	d28000e1 	mov	x1, #0x7                   	// #7
  3c:	14000009 	b	60 <trap_handler+0x60>
  40:	d2800101 	mov	x1, #0x8                   	// #8
  44:	14000007 	b	60 <trap_handler+0x60>
  48:	d2800121 	mov	x1, #0x9                   	// #9
  4c:	14000005 	b	60 <trap_handler+0x60>
  50:	d2800141 	mov	x1, #0xa                   	// #10
  54:	14000003 	b	60 <trap_handler+0x60>
  58:	d2800161 	mov	x1, #0xb                   	// #11
  5c:	14000001 	b	60 <trap_handler+0x60>
  60:	d2800020 	mov	x0, #0x1                   	// #1
  64:	d65f03c0 	ret

0000000000000068 <store_i64>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10083ff 	sub	sp, sp, #0x20
  74:	f90003e0 	str	x0, [sp]
  78:	b9000bff 	str	wzr, [sp, #8]
  7c:	f9000bff 	str	xzr, [sp, #16]
  80:	b9001bff 	str	wzr, [sp, #24]
  84:	f94003e8 	ldr	x8, [sp]
  88:	f9000be8 	str	x8, [sp, #16]
  8c:	f9400be8 	ldr	x8, [sp, #16]
  90:	d2800000 	mov	x0, #0x0                   	// #0
  94:	aa0803e1 	mov	x1, x8
  98:	910083ff 	add	sp, sp, #0x20
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop

00000000000000a8 <store_i64_const>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10083ff 	sub	sp, sp, #0x20
  b4:	b90003ff 	str	wzr, [sp]
  b8:	f90007ff 	str	xzr, [sp, #8]
  bc:	b90013ff 	str	wzr, [sp, #16]
  c0:	d29fffe8 	mov	x8, #0xffff                	// #65535
  c4:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  c8:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  cc:	f2efffe8 	movk	x8, #0x7fff, lsl #48
  d0:	f90007e8 	str	x8, [sp, #8]
  d4:	f94007e8 	ldr	x8, [sp, #8]
  d8:	d2800000 	mov	x0, #0x0                   	// #0
  dc:	aa0803e1 	mov	x1, x8
  e0:	910083ff 	add	sp, sp, #0x20
  e4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  e8:	d65f03c0 	ret
  ec:	d503201f 	nop

00000000000000f0 <tee_i64>:
  f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  f4:	910003fd 	mov	x29, sp
  f8:	d10083ff 	sub	sp, sp, #0x20
  fc:	b90003ff 	str	wzr, [sp]
 100:	f90007ff 	str	xzr, [sp, #8]
 104:	b90013ff 	str	wzr, [sp, #16]
 108:	d29fffe8 	mov	x8, #0xffff                	// #65535
 10c:	f2bfffe8 	movk	x8, #0xffff, lsl #16
 110:	f2dfffe8 	movk	x8, #0xffff, lsl #32
 114:	f2efffe8 	movk	x8, #0x7fff, lsl #48
 118:	f90007e8 	str	x8, [sp, #8]
 11c:	52800009 	mov	w9, #0x0                   	// #0
 120:	b90003e9 	str	w9, [sp]
 124:	d2800000 	mov	x0, #0x0                   	// #0
 128:	aa0803e1 	mov	x1, x8
 12c:	910083ff 	add	sp, sp, #0x20
 130:	a8c17bfd 	ldp	x29, x30, [sp], #16
 134:	d65f03c0 	ret

0000000000000138 <many_locals>:
 138:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 13c:	910003fd 	mov	x29, sp
 140:	d101c3ff 	sub	sp, sp, #0x70
 144:	b90003e0 	str	w0, [sp]
 148:	b90007ff 	str	wzr, [sp, #4]
 14c:	b9000bff 	str	wzr, [sp, #8]
 150:	b9000fff 	str	wzr, [sp, #12]
 154:	b90013ff 	str	wzr, [sp, #16]
 158:	b90017ff 	str	wzr, [sp, #20]
 15c:	b9001bff 	str	wzr, [sp, #24]
 160:	b9001fff 	str	wzr, [sp, #28]
 164:	b90023ff 	str	wzr, [sp, #32]
 168:	b90027ff 	str	wzr, [sp, #36]
 16c:	b9002bff 	str	wzr, [sp, #40]
 170:	b9002fff 	str	wzr, [sp, #44]
 174:	b90033ff 	str	wzr, [sp, #48]
 178:	f9001fff 	str	xzr, [sp, #56]
 17c:	f90023ff 	str	xzr, [sp, #64]
 180:	f90027ff 	str	xzr, [sp, #72]
 184:	b90053ff 	str	wzr, [sp, #80]
 188:	b90057ff 	str	wzr, [sp, #84]
 18c:	b9005bff 	str	wzr, [sp, #88]
 190:	b9005fff 	str	wzr, [sp, #92]
 194:	b90063ff 	str	wzr, [sp, #96]
 198:	b90067ff 	str	wzr, [sp, #100]
 19c:	b9006bff 	str	wzr, [sp, #104]
 1a0:	b94003e8 	ldr	w8, [sp]
 1a4:	b90007e8 	str	w8, [sp, #4]
 1a8:	b94007e8 	ldr	w8, [sp, #4]
 1ac:	b9000be8 	str	w8, [sp, #8]
 1b0:	b9400be8 	ldr	w8, [sp, #8]
 1b4:	b9000fe8 	str	w8, [sp, #12]
 1b8:	b9400fe8 	ldr	w8, [sp, #12]
 1bc:	b90013e8 	str	w8, [sp, #16]
 1c0:	b94013e8 	ldr	w8, [sp, #16]
 1c4:	b90017e8 	str	w8, [sp, #20]
 1c8:	b94017e8 	ldr	w8, [sp, #20]
 1cc:	b9001be8 	str	w8, [sp, #24]
 1d0:	b9401be8 	ldr	w8, [sp, #24]
 1d4:	b9001fe8 	str	w8, [sp, #28]
 1d8:	b9401fe8 	ldr	w8, [sp, #28]
 1dc:	b90023e8 	str	w8, [sp, #32]
 1e0:	b94023e8 	ldr	w8, [sp, #32]
 1e4:	b90027e8 	str	w8, [sp, #36]
 1e8:	b94027e8 	ldr	w8, [sp, #36]
 1ec:	b9002be8 	str	w8, [sp, #40]
 1f0:	b9402be8 	ldr	w8, [sp, #40]
 1f4:	b9002fe8 	str	w8, [sp, #44]
 1f8:	b9402fe8 	ldr	w8, [sp, #44]
 1fc:	b90033e8 	str	w8, [sp, #48]
 200:	d2800028 	mov	x8, #0x1                   	// #1
 204:	f9001fe8 	str	x8, [sp, #56]
 208:	d2800048 	mov	x8, #0x2                   	// #2
 20c:	f90023e8 	str	x8, [sp, #64]
 210:	d2800068 	mov	x8, #0x3                   	// #3
 214:	f90027e8 	str	x8, [sp, #72]
 218:	b94033e8 	ldr	w8, [sp, #48]
 21c:	b90053e8 	str	w8, [sp, #80]
 220:	b94053e8 	ldr	w8, [sp, #80]
 224:	b90057e8 	str	w8, [sp, #84]
 228:	b94057e8 	ldr	w8, [sp, #84]
 22c:	b9005be8 	str	w8, [sp, #88]
 230:	b9405be8 	ldr	w8, [sp, #88]
 234:	b9005fe8 	str	w8, [sp, #92]
 238:	b9405fe8 	ldr	w8, [sp, #92]
 23c:	b90063e8 	str	w8, [sp, #96]
 240:	b94063e8 	ldr	w8, [sp, #96]
 244:	b90067e8 	str	w8, [sp, #100]
 248:	b94067e8 	ldr	w8, [sp, #100]
 24c:	b9006be8 	str	w8, [sp, #104]
 250:	b9406be8 	ldr	w8, [sp, #104]
 254:	52800000 	mov	w0, #0x0                   	// #0
 258:	2a0803e1 	mov	w1, w8
 25c:	9101c3ff 	add	sp, sp, #0x70
 260:	a8c17bfd 	ldp	x29, x30, [sp], #16
 264:	d65f03c0 	ret
