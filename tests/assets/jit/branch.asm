
./tests/assets/jit/branch.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000050 simple_if
0000000000000050 l     F .text	0000000000000088 nested_if
00000000000000d8 l     F .text	0000000000000070 nested_else
0000000000000148 l     F .text	0000000000000060 simple_if_add1
00000000000001a8 l     F .text	0000000000000078 nested_else_add1


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 0020 c8000034 e8ff9fd2 e8ffbff2 e8ffdff2  ...4............
 0030 e8fffff2 02000014 280080d2 e00308aa  ........(.......
 0040 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0060 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 0070 68020034 e80340f9 c9fe9fd2 e9ffbff2  h..4..@.........
 0080 e9ffdff2 e9fffff2 1f0109eb e8a79f1a  ................
 0090 c8000034 88f39fd2 e8ffbff2 e8ffdff2  ...4............
 00a0 e8fffff2 05000014 c8fe9fd2 e8ffbff2  ................
 00b0 e8ffdff2 e8fffff2 02000014 280080d2  ............(...
 00c0 02000014 e00308aa e1031faa ff430091  .............C..
 00d0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00e0 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 00f0 1f0109eb e8a79f1a c8000034 e8ff9fd2  ...........4....
 0100 e8ffbff2 e8ffdff2 e8fffff2 09000014  ................
 0110 e80340f9 490180d2 1f0109eb e8a79f1a  ..@.I...........
 0120 68000034 480180d2 02000014 880c80d2  h..4H...........
 0130 02000014 e00308aa e1031faa ff430091  .............C..
 0140 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0150 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0160 1f0109eb e8a79f1a c8000034 e8ff9fd2  ...........4....
 0170 e8ffbff2 e8ffdff2 e8fffff2 02000014  ................
 0180 280080d2 290080d2 0801098b 02000014  (...)...........
 0190 e00308aa e1031faa ff430091 fd7bc1a8  .........C...{..
 01a0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 01b0 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 01c0 1f0109eb e8a79f1a c8000034 e8ff9fd2  ...........4....
 01d0 e8ffbff2 e8ffdff2 e8fffff2 09000014  ................
 01e0 e80340f9 490180d2 1f0109eb e8a79f1a  ..@.I...........
 01f0 68000034 480180d2 02000014 880c80d2  h..4H...........
 0200 290080d2 0801098b 02000014 e00308aa  )...............
 0210 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

Disassembly of section .text:

0000000000000000 <simple_if>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	f94003e8 	ldr	x8, [sp]
  14:	d2800009 	mov	x9, #0x0                   	// #0
  18:	eb09011f 	cmp	x8, x9
  1c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  20:	340000c8 	cbz	w8, 38 <simple_if+0x38>
  24:	d29fffe8 	mov	x8, #0xffff                	// #65535
  28:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  2c:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  30:	f2ffffe8 	movk	x8, #0xffff, lsl #48
  34:	14000002 	b	3c <simple_if+0x3c>
  38:	d2800028 	mov	x8, #0x1                   	// #1
  3c:	aa0803e0 	mov	x0, x8
  40:	aa1f03e1 	mov	x1, xzr
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <nested_if>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	f90003e0 	str	x0, [sp]
  60:	f94003e8 	ldr	x8, [sp]
  64:	d2800009 	mov	x9, #0x0                   	// #0
  68:	eb09011f 	cmp	x8, x9
  6c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  70:	34000268 	cbz	w8, bc <nested_if+0x6c>
  74:	f94003e8 	ldr	x8, [sp]
  78:	d29ffec9 	mov	x9, #0xfff6                	// #65526
  7c:	f2bfffe9 	movk	x9, #0xffff, lsl #16
  80:	f2dfffe9 	movk	x9, #0xffff, lsl #32
  84:	f2ffffe9 	movk	x9, #0xffff, lsl #48
  88:	eb09011f 	cmp	x8, x9
  8c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  90:	340000c8 	cbz	w8, a8 <nested_if+0x58>
  94:	d29ff388 	mov	x8, #0xff9c                	// #65436
  98:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  9c:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  a0:	f2ffffe8 	movk	x8, #0xffff, lsl #48
  a4:	14000005 	b	b8 <nested_if+0x68>
  a8:	d29ffec8 	mov	x8, #0xfff6                	// #65526
  ac:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  b0:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  b4:	f2ffffe8 	movk	x8, #0xffff, lsl #48
  b8:	14000002 	b	c0 <nested_if+0x70>
  bc:	d2800028 	mov	x8, #0x1                   	// #1
  c0:	14000002 	b	c8 <nested_if+0x78>
  c4:	aa0803e0 	mov	x0, x8
  c8:	aa1f03e1 	mov	x1, xzr
  cc:	910043ff 	add	sp, sp, #0x10
  d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d4:	d65f03c0 	ret

00000000000000d8 <nested_else>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	d10043ff 	sub	sp, sp, #0x10
  e4:	f90003e0 	str	x0, [sp]
  e8:	f94003e8 	ldr	x8, [sp]
  ec:	d2800009 	mov	x9, #0x0                   	// #0
  f0:	eb09011f 	cmp	x8, x9
  f4:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  f8:	340000c8 	cbz	w8, 110 <nested_else+0x38>
  fc:	d29fffe8 	mov	x8, #0xffff                	// #65535
 100:	f2bfffe8 	movk	x8, #0xffff, lsl #16
 104:	f2dfffe8 	movk	x8, #0xffff, lsl #32
 108:	f2ffffe8 	movk	x8, #0xffff, lsl #48
 10c:	14000009 	b	130 <nested_else+0x58>
 110:	f94003e8 	ldr	x8, [sp]
 114:	d2800149 	mov	x9, #0xa                   	// #10
 118:	eb09011f 	cmp	x8, x9
 11c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 120:	34000068 	cbz	w8, 12c <nested_else+0x54>
 124:	d2800148 	mov	x8, #0xa                   	// #10
 128:	14000002 	b	130 <nested_else+0x58>
 12c:	d2800c88 	mov	x8, #0x64                  	// #100
 130:	14000002 	b	138 <nested_else+0x60>
 134:	aa0803e0 	mov	x0, x8
 138:	aa1f03e1 	mov	x1, xzr
 13c:	910043ff 	add	sp, sp, #0x10
 140:	a8c17bfd 	ldp	x29, x30, [sp], #16
 144:	d65f03c0 	ret

0000000000000148 <simple_if_add1>:
 148:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 14c:	910003fd 	mov	x29, sp
 150:	d10043ff 	sub	sp, sp, #0x10
 154:	f90003e0 	str	x0, [sp]
 158:	f94003e8 	ldr	x8, [sp]
 15c:	d2800009 	mov	x9, #0x0                   	// #0
 160:	eb09011f 	cmp	x8, x9
 164:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 168:	340000c8 	cbz	w8, 180 <simple_if_add1+0x38>
 16c:	d29fffe8 	mov	x8, #0xffff                	// #65535
 170:	f2bfffe8 	movk	x8, #0xffff, lsl #16
 174:	f2dfffe8 	movk	x8, #0xffff, lsl #32
 178:	f2ffffe8 	movk	x8, #0xffff, lsl #48
 17c:	14000002 	b	184 <simple_if_add1+0x3c>
 180:	d2800028 	mov	x8, #0x1                   	// #1
 184:	d2800029 	mov	x9, #0x1                   	// #1
 188:	8b090108 	add	x8, x8, x9
 18c:	14000002 	b	194 <simple_if_add1+0x4c>
 190:	aa0803e0 	mov	x0, x8
 194:	aa1f03e1 	mov	x1, xzr
 198:	910043ff 	add	sp, sp, #0x10
 19c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1a0:	d65f03c0 	ret
 1a4:	d503201f 	nop

00000000000001a8 <nested_else_add1>:
 1a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1ac:	910003fd 	mov	x29, sp
 1b0:	d10043ff 	sub	sp, sp, #0x10
 1b4:	f90003e0 	str	x0, [sp]
 1b8:	f94003e8 	ldr	x8, [sp]
 1bc:	d2800009 	mov	x9, #0x0                   	// #0
 1c0:	eb09011f 	cmp	x8, x9
 1c4:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 1c8:	340000c8 	cbz	w8, 1e0 <nested_else_add1+0x38>
 1cc:	d29fffe8 	mov	x8, #0xffff                	// #65535
 1d0:	f2bfffe8 	movk	x8, #0xffff, lsl #16
 1d4:	f2dfffe8 	movk	x8, #0xffff, lsl #32
 1d8:	f2ffffe8 	movk	x8, #0xffff, lsl #48
 1dc:	14000009 	b	200 <nested_else_add1+0x58>
 1e0:	f94003e8 	ldr	x8, [sp]
 1e4:	d2800149 	mov	x9, #0xa                   	// #10
 1e8:	eb09011f 	cmp	x8, x9
 1ec:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 1f0:	34000068 	cbz	w8, 1fc <nested_else_add1+0x54>
 1f4:	d2800148 	mov	x8, #0xa                   	// #10
 1f8:	14000002 	b	200 <nested_else_add1+0x58>
 1fc:	d2800c88 	mov	x8, #0x64                  	// #100
 200:	d2800029 	mov	x9, #0x1                   	// #1
 204:	8b090108 	add	x8, x8, x9
 208:	14000002 	b	210 <nested_else_add1+0x68>
 20c:	aa0803e0 	mov	x0, x8
 210:	aa1f03e1 	mov	x1, xzr
 214:	910043ff 	add	sp, sp, #0x10
 218:	a8c17bfd 	ldp	x29, x30, [sp], #16
 21c:	d65f03c0 	ret
