
./tests/assets/jit/branch.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000048 simple_if
0000000000000048 l     F .text	0000000000000070 nested_if
00000000000000b8 l     F .text	0000000000000060 nested_else
0000000000000118 l     F .text	0000000000000048 simple_if_add1
0000000000000160 l     F .text	0000000000000060 nested_else_add1


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e80340f9 090080d2 1f0109eb e8079f1a  ..@.............
 0020 e9ff9fd2 e9ffbff2 e9ffdff2 e9fffff2  ................
 0030 2a0080d2 e0030aaa e1031faa ff430091  *............C..
 0040 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0050 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0060 1f0109eb e8079f1a e90340f9 cafe9fd2  ..........@.....
 0070 eaffbff2 eaffdff2 eafffff2 3f010aeb  ............?...
 0080 e9079f1a 8af39fd2 eaffbff2 eaffdff2  ................
 0090 eafffff2 cbfe9fd2 ebffbff2 ebffdff2  ................
 00a0 ebfffff2 e0030baa e1031faa ff430091  .............C..
 00b0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00c0 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 00d0 1f0109eb e8079f1a e9ff9fd2 e9ffbff2  ................
 00e0 e9ffdff2 e9fffff2 ea0340f9 4b0180d2  ..........@.K...
 00f0 5f010beb ea079f1a 4b0180d2 8c0c80d2  _.......K.......
 0100 e0030caa e1031faa ff430091 fd7bc1a8  .........C...{..
 0110 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0120 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0130 1f0109eb e8079f1a e9ff9fd2 e9ffbff2  ................
 0140 e9ffdff2 e9fffff2 2a0080d2 e0030aaa  ........*.......
 0150 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0160 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0170 e80340f9 090080d2 1f0109eb e8079f1a  ..@.............
 0180 e9ff9fd2 e9ffbff2 e9ffdff2 e9fffff2  ................
 0190 ea0340f9 4b0180d2 5f010beb ea079f1a  ..@.K..._.......
 01a0 4b0180d2 8c0c80d2 e0030caa e1031faa  K...............
 01b0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <simple_if>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	f94003e8 	ldr	x8, [sp]
  14:	d2800009 	mov	x9, #0x0                   	// #0
  18:	eb09011f 	cmp	x8, x9
  1c:	1a9f07e8 	cset	w8, ne	// ne = any
  20:	d29fffe9 	mov	x9, #0xffff                	// #65535
  24:	f2bfffe9 	movk	x9, #0xffff, lsl #16
  28:	f2dfffe9 	movk	x9, #0xffff, lsl #32
  2c:	f2ffffe9 	movk	x9, #0xffff, lsl #48
  30:	d280002a 	mov	x10, #0x1                   	// #1
  34:	aa0a03e0 	mov	x0, x10
  38:	aa1f03e1 	mov	x1, xzr
  3c:	910043ff 	add	sp, sp, #0x10
  40:	a8c17bfd 	ldp	x29, x30, [sp], #16
  44:	d65f03c0 	ret

0000000000000048 <nested_if>:
  48:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4c:	910003fd 	mov	x29, sp
  50:	d10043ff 	sub	sp, sp, #0x10
  54:	f90003e0 	str	x0, [sp]
  58:	f94003e8 	ldr	x8, [sp]
  5c:	d2800009 	mov	x9, #0x0                   	// #0
  60:	eb09011f 	cmp	x8, x9
  64:	1a9f07e8 	cset	w8, ne	// ne = any
  68:	f94003e9 	ldr	x9, [sp]
  6c:	d29ffeca 	mov	x10, #0xfff6                	// #65526
  70:	f2bfffea 	movk	x10, #0xffff, lsl #16
  74:	f2dfffea 	movk	x10, #0xffff, lsl #32
  78:	f2ffffea 	movk	x10, #0xffff, lsl #48
  7c:	eb0a013f 	cmp	x9, x10
  80:	1a9f07e9 	cset	w9, ne	// ne = any
  84:	d29ff38a 	mov	x10, #0xff9c                	// #65436
  88:	f2bfffea 	movk	x10, #0xffff, lsl #16
  8c:	f2dfffea 	movk	x10, #0xffff, lsl #32
  90:	f2ffffea 	movk	x10, #0xffff, lsl #48
  94:	d29ffecb 	mov	x11, #0xfff6                	// #65526
  98:	f2bfffeb 	movk	x11, #0xffff, lsl #16
  9c:	f2dfffeb 	movk	x11, #0xffff, lsl #32
  a0:	f2ffffeb 	movk	x11, #0xffff, lsl #48
  a4:	aa0b03e0 	mov	x0, x11
  a8:	aa1f03e1 	mov	x1, xzr
  ac:	910043ff 	add	sp, sp, #0x10
  b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b4:	d65f03c0 	ret

00000000000000b8 <nested_else>:
  b8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  bc:	910003fd 	mov	x29, sp
  c0:	d10043ff 	sub	sp, sp, #0x10
  c4:	f90003e0 	str	x0, [sp]
  c8:	f94003e8 	ldr	x8, [sp]
  cc:	d2800009 	mov	x9, #0x0                   	// #0
  d0:	eb09011f 	cmp	x8, x9
  d4:	1a9f07e8 	cset	w8, ne	// ne = any
  d8:	d29fffe9 	mov	x9, #0xffff                	// #65535
  dc:	f2bfffe9 	movk	x9, #0xffff, lsl #16
  e0:	f2dfffe9 	movk	x9, #0xffff, lsl #32
  e4:	f2ffffe9 	movk	x9, #0xffff, lsl #48
  e8:	f94003ea 	ldr	x10, [sp]
  ec:	d280014b 	mov	x11, #0xa                   	// #10
  f0:	eb0b015f 	cmp	x10, x11
  f4:	1a9f07ea 	cset	w10, ne	// ne = any
  f8:	d280014b 	mov	x11, #0xa                   	// #10
  fc:	d2800c8c 	mov	x12, #0x64                  	// #100
 100:	aa0c03e0 	mov	x0, x12
 104:	aa1f03e1 	mov	x1, xzr
 108:	910043ff 	add	sp, sp, #0x10
 10c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 110:	d65f03c0 	ret
 114:	d503201f 	nop

0000000000000118 <simple_if_add1>:
 118:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 11c:	910003fd 	mov	x29, sp
 120:	d10043ff 	sub	sp, sp, #0x10
 124:	f90003e0 	str	x0, [sp]
 128:	f94003e8 	ldr	x8, [sp]
 12c:	d2800009 	mov	x9, #0x0                   	// #0
 130:	eb09011f 	cmp	x8, x9
 134:	1a9f07e8 	cset	w8, ne	// ne = any
 138:	d29fffe9 	mov	x9, #0xffff                	// #65535
 13c:	f2bfffe9 	movk	x9, #0xffff, lsl #16
 140:	f2dfffe9 	movk	x9, #0xffff, lsl #32
 144:	f2ffffe9 	movk	x9, #0xffff, lsl #48
 148:	d280002a 	mov	x10, #0x1                   	// #1
 14c:	aa0a03e0 	mov	x0, x10
 150:	aa1f03e1 	mov	x1, xzr
 154:	910043ff 	add	sp, sp, #0x10
 158:	a8c17bfd 	ldp	x29, x30, [sp], #16
 15c:	d65f03c0 	ret

0000000000000160 <nested_else_add1>:
 160:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 164:	910003fd 	mov	x29, sp
 168:	d10043ff 	sub	sp, sp, #0x10
 16c:	f90003e0 	str	x0, [sp]
 170:	f94003e8 	ldr	x8, [sp]
 174:	d2800009 	mov	x9, #0x0                   	// #0
 178:	eb09011f 	cmp	x8, x9
 17c:	1a9f07e8 	cset	w8, ne	// ne = any
 180:	d29fffe9 	mov	x9, #0xffff                	// #65535
 184:	f2bfffe9 	movk	x9, #0xffff, lsl #16
 188:	f2dfffe9 	movk	x9, #0xffff, lsl #32
 18c:	f2ffffe9 	movk	x9, #0xffff, lsl #48
 190:	f94003ea 	ldr	x10, [sp]
 194:	d280014b 	mov	x11, #0xa                   	// #10
 198:	eb0b015f 	cmp	x10, x11
 19c:	1a9f07ea 	cset	w10, ne	// ne = any
 1a0:	d280014b 	mov	x11, #0xa                   	// #10
 1a4:	d2800c8c 	mov	x12, #0x64                  	// #100
 1a8:	aa0c03e0 	mov	x0, x12
 1ac:	aa1f03e1 	mov	x1, xzr
 1b0:	910043ff 	add	sp, sp, #0x10
 1b4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b8:	d65f03c0 	ret
 1bc:	d503201f 	nop
