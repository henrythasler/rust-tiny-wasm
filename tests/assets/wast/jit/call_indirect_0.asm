
tests/assets/wast/jit/call_indirect_0.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 $func0
0000000000000028 l     F .text	0000000000000028 $func1
0000000000000050 l     F .text	0000000000000028 $func2
0000000000000078 l     F .text	0000000000000028 $func3
00000000000000a0 l     F .text	0000000000000028 $func4
00000000000000c8 l     F .text	00000000000000a0 callt
0000000000000168 l     F .text	00000000000000a0 callu


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 28008052 000080d2 e10308aa ff430091  (..R.........C..
 0020 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0030 ff4300d1 e00300f9 48008052 000080d2  .C......H..R....
 0040 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0060 68008052 000080d2 e10308aa ff430091  h..R.........C..
 0070 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0080 ff4300d1 e00300f9 88008052 000080d2  .C.........R....
 0090 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00a0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00b0 a8008052 000080d2 e10308aa ff430091  ...R.........C..
 00c0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00d0 ff4300d1 e00300f9 e10b00b9 e80b40b9  .C............@.
 00e0 091840b9 1f01096b 83000054 810080d2  ..@....k...T....
 00f0 200080d2 1a000014 0a0840f9 4a11088b   .........@.J...
 0100 490140f9 4a0940b9 890000b5 a10080d2  I.@.J.@.........
 0110 200080d2 12000014 5f010071 80000054   ......._..q...T
 0120 c10080d2 200080d2 0d000014 e00340f9  .... .........@.
 0130 ff4300d1 e80300f9 e90700f9 20013fd6  .C.......... .?.
 0140 e80340f9 e90740f9 ff430091 800000b5  ..@...@..C......
 0150 ea03012a 000080d2 e1030aaa ff430091  ...*.........C..
 0160 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0170 ff4300d1 e00300f9 e10b00b9 e80b40b9  .C............@.
 0180 091840b9 1f01096b 83000054 810080d2  ..@....k...T....
 0190 200080d2 1a000014 0a0840f9 4a11088b   .........@.J...
 01a0 490140f9 4a0940b9 890000b5 a10080d2  I.@.J.@.........
 01b0 200080d2 12000014 5f050071 80000054   ......._..q...T
 01c0 c10080d2 200080d2 0d000014 e00340f9  .... .........@.
 01d0 ff4300d1 e80300f9 e90700f9 20013fd6  .C.......... .?.
 01e0 e80340f9 e90740f9 ff430091 800000b5  ..@...@..C......
 01f0 ea03012a 000080d2 e1030aaa ff430091  ...*.........C..
 0200 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <$func0>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	52800028 	mov	w8, #0x1                   	// #1
  14:	d2800000 	mov	x0, #0x0                   	// #0
  18:	aa0803e1 	mov	x1, x8
  1c:	910043ff 	add	sp, sp, #0x10
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret

0000000000000028 <$func1>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d10043ff 	sub	sp, sp, #0x10
  34:	f90003e0 	str	x0, [sp]
  38:	52800048 	mov	w8, #0x2                   	// #2
  3c:	d2800000 	mov	x0, #0x0                   	// #0
  40:	aa0803e1 	mov	x1, x8
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <$func2>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	f90003e0 	str	x0, [sp]
  60:	52800068 	mov	w8, #0x3                   	// #3
  64:	d2800000 	mov	x0, #0x0                   	// #0
  68:	aa0803e1 	mov	x1, x8
  6c:	910043ff 	add	sp, sp, #0x10
  70:	a8c17bfd 	ldp	x29, x30, [sp], #16
  74:	d65f03c0 	ret

0000000000000078 <$func3>:
  78:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  7c:	910003fd 	mov	x29, sp
  80:	d10043ff 	sub	sp, sp, #0x10
  84:	f90003e0 	str	x0, [sp]
  88:	52800088 	mov	w8, #0x4                   	// #4
  8c:	d2800000 	mov	x0, #0x0                   	// #0
  90:	aa0803e1 	mov	x1, x8
  94:	910043ff 	add	sp, sp, #0x10
  98:	a8c17bfd 	ldp	x29, x30, [sp], #16
  9c:	d65f03c0 	ret

00000000000000a0 <$func4>:
  a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  a4:	910003fd 	mov	x29, sp
  a8:	d10043ff 	sub	sp, sp, #0x10
  ac:	f90003e0 	str	x0, [sp]
  b0:	528000a8 	mov	w8, #0x5                   	// #5
  b4:	d2800000 	mov	x0, #0x0                   	// #0
  b8:	aa0803e1 	mov	x1, x8
  bc:	910043ff 	add	sp, sp, #0x10
  c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c4:	d65f03c0 	ret

00000000000000c8 <callt>:
  c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  cc:	910003fd 	mov	x29, sp
  d0:	d10043ff 	sub	sp, sp, #0x10
  d4:	f90003e0 	str	x0, [sp]
  d8:	b9000be1 	str	w1, [sp, #8]
  dc:	b9400be8 	ldr	w8, [sp, #8]
  e0:	b9401809 	ldr	w9, [x0, #24]
  e4:	6b09011f 	cmp	w8, w9
  e8:	54000083 	b.cc	f8 <callt+0x30>  // b.lo, b.ul, b.last
  ec:	d2800081 	mov	x1, #0x4                   	// #4
  f0:	d2800020 	mov	x0, #0x1                   	// #1
  f4:	1400001a 	b	15c <callt+0x94>
  f8:	f940080a 	ldr	x10, [x0, #16]
  fc:	8b08114a 	add	x10, x10, x8, lsl #4
 100:	f9400149 	ldr	x9, [x10]
 104:	b940094a 	ldr	w10, [x10, #8]
 108:	b5000089 	cbnz	x9, 118 <callt+0x50>
 10c:	d28000a1 	mov	x1, #0x5                   	// #5
 110:	d2800020 	mov	x0, #0x1                   	// #1
 114:	14000012 	b	15c <callt+0x94>
 118:	7100015f 	cmp	w10, #0x0
 11c:	54000080 	b.eq	12c <callt+0x64>  // b.none
 120:	d28000c1 	mov	x1, #0x6                   	// #6
 124:	d2800020 	mov	x0, #0x1                   	// #1
 128:	1400000d 	b	15c <callt+0x94>
 12c:	f94003e0 	ldr	x0, [sp]
 130:	d10043ff 	sub	sp, sp, #0x10
 134:	f90003e8 	str	x8, [sp]
 138:	f90007e9 	str	x9, [sp, #8]
 13c:	d63f0120 	blr	x9
 140:	f94003e8 	ldr	x8, [sp]
 144:	f94007e9 	ldr	x9, [sp, #8]
 148:	910043ff 	add	sp, sp, #0x10
 14c:	b5000080 	cbnz	x0, 15c <callt+0x94>
 150:	2a0103ea 	mov	w10, w1
 154:	d2800000 	mov	x0, #0x0                   	// #0
 158:	aa0a03e1 	mov	x1, x10
 15c:	910043ff 	add	sp, sp, #0x10
 160:	a8c17bfd 	ldp	x29, x30, [sp], #16
 164:	d65f03c0 	ret

0000000000000168 <callu>:
 168:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 16c:	910003fd 	mov	x29, sp
 170:	d10043ff 	sub	sp, sp, #0x10
 174:	f90003e0 	str	x0, [sp]
 178:	b9000be1 	str	w1, [sp, #8]
 17c:	b9400be8 	ldr	w8, [sp, #8]
 180:	b9401809 	ldr	w9, [x0, #24]
 184:	6b09011f 	cmp	w8, w9
 188:	54000083 	b.cc	198 <callu+0x30>  // b.lo, b.ul, b.last
 18c:	d2800081 	mov	x1, #0x4                   	// #4
 190:	d2800020 	mov	x0, #0x1                   	// #1
 194:	1400001a 	b	1fc <callu+0x94>
 198:	f940080a 	ldr	x10, [x0, #16]
 19c:	8b08114a 	add	x10, x10, x8, lsl #4
 1a0:	f9400149 	ldr	x9, [x10]
 1a4:	b940094a 	ldr	w10, [x10, #8]
 1a8:	b5000089 	cbnz	x9, 1b8 <callu+0x50>
 1ac:	d28000a1 	mov	x1, #0x5                   	// #5
 1b0:	d2800020 	mov	x0, #0x1                   	// #1
 1b4:	14000012 	b	1fc <callu+0x94>
 1b8:	7100055f 	cmp	w10, #0x1
 1bc:	54000080 	b.eq	1cc <callu+0x64>  // b.none
 1c0:	d28000c1 	mov	x1, #0x6                   	// #6
 1c4:	d2800020 	mov	x0, #0x1                   	// #1
 1c8:	1400000d 	b	1fc <callu+0x94>
 1cc:	f94003e0 	ldr	x0, [sp]
 1d0:	d10043ff 	sub	sp, sp, #0x10
 1d4:	f90003e8 	str	x8, [sp]
 1d8:	f90007e9 	str	x9, [sp, #8]
 1dc:	d63f0120 	blr	x9
 1e0:	f94003e8 	ldr	x8, [sp]
 1e4:	f94007e9 	ldr	x9, [sp, #8]
 1e8:	910043ff 	add	sp, sp, #0x10
 1ec:	b5000080 	cbnz	x0, 1fc <callu+0x94>
 1f0:	2a0103ea 	mov	w10, w1
 1f4:	d2800000 	mov	x0, #0x0                   	// #0
 1f8:	aa0a03e1 	mov	x1, x10
 1fc:	910043ff 	add	sp, sp, #0x10
 200:	a8c17bfd 	ldp	x29, x30, [sp], #16
 204:	d65f03c0 	ret
