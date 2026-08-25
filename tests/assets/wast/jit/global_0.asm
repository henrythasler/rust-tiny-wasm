
tests/assets/wast/jit/global_0.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 get-a
0000000000000028 l     F .text	0000000000000028 get-b
0000000000000050 l     F .text	0000000000000030 get-x
0000000000000080 l     F .text	0000000000000030 get-y
00000000000000b0 l     F .text	0000000000000038 set-x
00000000000000e8 l     F .text	0000000000000038 set-y
0000000000000120 l     F .text	0000000000000040 as-if-then
0000000000000160 l     F .text	0000000000000040 as-if-else


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 28008012 000080d2 e10308aa ff430091  (............C..
 0020 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0030 ff4300d1 e00300f9 88008092 000080d2  .C..............
 0040 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0060 081840f9 081140b9 000080d2 e10308aa  ..@...@.........
 0070 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0080 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0090 081840f9 080d40f9 000080d2 e10308aa  ..@...@.........
 00a0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00b0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00c0 e10b00b9 e80b40b9 091840f9 281100b9  ......@...@.(...
 00d0 000080d2 e1031faa ff430091 fd7bc1a8  .........C...{..
 00e0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00f0 ff4300d1 e00300f9 e10700f9 e80740f9  .C............@.
 0100 091840f9 280d00f9 000080d2 e1031faa  ..@.(...........
 0110 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0120 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0130 28008052 88000034 081840f9 081140b9  (..R...4..@...@.
 0140 02000014 48008052 000080d2 e10308aa  ....H..R........
 0150 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0160 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0170 08008052 68000034 48008052 03000014  ...Rh..4H..R....
 0180 081840f9 081140b9 000080d2 e10308aa  ..@...@.........
 0190 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <get-a>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	12800028 	mov	w8, #0xfffffffe            	// #-2
  14:	d2800000 	mov	x0, #0x0                   	// #0
  18:	aa0803e1 	mov	x1, x8
  1c:	910043ff 	add	sp, sp, #0x10
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret

0000000000000028 <get-b>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d10043ff 	sub	sp, sp, #0x10
  34:	f90003e0 	str	x0, [sp]
  38:	92800088 	mov	x8, #0xfffffffffffffffb    	// #-5
  3c:	d2800000 	mov	x0, #0x0                   	// #0
  40:	aa0803e1 	mov	x1, x8
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <get-x>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	f90003e0 	str	x0, [sp]
  60:	f9401808 	ldr	x8, [x0, #48]
  64:	b9401108 	ldr	w8, [x8, #16]
  68:	d2800000 	mov	x0, #0x0                   	// #0
  6c:	aa0803e1 	mov	x1, x8
  70:	910043ff 	add	sp, sp, #0x10
  74:	a8c17bfd 	ldp	x29, x30, [sp], #16
  78:	d65f03c0 	ret
  7c:	d503201f 	nop

0000000000000080 <get-y>:
  80:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  84:	910003fd 	mov	x29, sp
  88:	d10043ff 	sub	sp, sp, #0x10
  8c:	f90003e0 	str	x0, [sp]
  90:	f9401808 	ldr	x8, [x0, #48]
  94:	f9400d08 	ldr	x8, [x8, #24]
  98:	d2800000 	mov	x0, #0x0                   	// #0
  9c:	aa0803e1 	mov	x1, x8
  a0:	910043ff 	add	sp, sp, #0x10
  a4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a8:	d65f03c0 	ret
  ac:	d503201f 	nop

00000000000000b0 <set-x>:
  b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  b4:	910003fd 	mov	x29, sp
  b8:	d10043ff 	sub	sp, sp, #0x10
  bc:	f90003e0 	str	x0, [sp]
  c0:	b9000be1 	str	w1, [sp, #8]
  c4:	b9400be8 	ldr	w8, [sp, #8]
  c8:	f9401809 	ldr	x9, [x0, #48]
  cc:	b9001128 	str	w8, [x9, #16]
  d0:	d2800000 	mov	x0, #0x0                   	// #0
  d4:	aa1f03e1 	mov	x1, xzr
  d8:	910043ff 	add	sp, sp, #0x10
  dc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  e0:	d65f03c0 	ret
  e4:	d503201f 	nop

00000000000000e8 <set-y>:
  e8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ec:	910003fd 	mov	x29, sp
  f0:	d10043ff 	sub	sp, sp, #0x10
  f4:	f90003e0 	str	x0, [sp]
  f8:	f90007e1 	str	x1, [sp, #8]
  fc:	f94007e8 	ldr	x8, [sp, #8]
 100:	f9401809 	ldr	x9, [x0, #48]
 104:	f9000d28 	str	x8, [x9, #24]
 108:	d2800000 	mov	x0, #0x0                   	// #0
 10c:	aa1f03e1 	mov	x1, xzr
 110:	910043ff 	add	sp, sp, #0x10
 114:	a8c17bfd 	ldp	x29, x30, [sp], #16
 118:	d65f03c0 	ret
 11c:	d503201f 	nop

0000000000000120 <as-if-then>:
 120:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 124:	910003fd 	mov	x29, sp
 128:	d10043ff 	sub	sp, sp, #0x10
 12c:	f90003e0 	str	x0, [sp]
 130:	52800028 	mov	w8, #0x1                   	// #1
 134:	34000088 	cbz	w8, 144 <as-if-then+0x24>
 138:	f9401808 	ldr	x8, [x0, #48]
 13c:	b9401108 	ldr	w8, [x8, #16]
 140:	14000002 	b	148 <as-if-then+0x28>
 144:	52800048 	mov	w8, #0x2                   	// #2
 148:	d2800000 	mov	x0, #0x0                   	// #0
 14c:	aa0803e1 	mov	x1, x8
 150:	910043ff 	add	sp, sp, #0x10
 154:	a8c17bfd 	ldp	x29, x30, [sp], #16
 158:	d65f03c0 	ret
 15c:	d503201f 	nop

0000000000000160 <as-if-else>:
 160:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 164:	910003fd 	mov	x29, sp
 168:	d10043ff 	sub	sp, sp, #0x10
 16c:	f90003e0 	str	x0, [sp]
 170:	52800008 	mov	w8, #0x0                   	// #0
 174:	34000068 	cbz	w8, 180 <as-if-else+0x20>
 178:	52800048 	mov	w8, #0x2                   	// #2
 17c:	14000003 	b	188 <as-if-else+0x28>
 180:	f9401808 	ldr	x8, [x0, #48]
 184:	b9401108 	ldr	w8, [x8, #16]
 188:	d2800000 	mov	x0, #0x0                   	// #0
 18c:	aa0803e1 	mov	x1, x8
 190:	910043ff 	add	sp, sp, #0x10
 194:	a8c17bfd 	ldp	x29, x30, [sp], #16
 198:	d65f03c0 	ret
 19c:	d503201f 	nop
