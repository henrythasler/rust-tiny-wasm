
tests/assets/wast/jit/call_indirect_1.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 $func0
0000000000000028 l     F .text	0000000000000028 $func1
0000000000000050 l     F .text	00000000000000a0 callt


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 28008052 000080d2 e10308aa ff430091  (..R.........C..
 0020 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0030 ff4300d1 e00300f9 48008052 000080d2  .C......H..R....
 0040 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0060 e10b00b9 e80b40b9 091840b9 1f01096b  ......@...@....k
 0070 83000054 810080d2 200080d2 1a000014  ...T.... .......
 0080 0a0840f9 4a11088b 490140f9 4a0940b9  ..@.J...I.@.J.@.
 0090 890000b5 a10080d2 200080d2 12000014  ........ .......
 00a0 5f010071 80000054 c10080d2 200080d2  _..q...T.... ...
 00b0 0d000014 e00340f9 ff4300d1 e80300f9  ......@..C......
 00c0 e90700f9 20013fd6 e80340f9 e90740f9  .... .?...@...@.
 00d0 ff430091 800000b5 ea03012a 000080d2  .C.........*....
 00e0 e1030aaa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

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

0000000000000050 <callt>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	f90003e0 	str	x0, [sp]
  60:	b9000be1 	str	w1, [sp, #8]
  64:	b9400be8 	ldr	w8, [sp, #8]
  68:	b9401809 	ldr	w9, [x0, #24]
  6c:	6b09011f 	cmp	w8, w9
  70:	54000083 	b.cc	80 <callt+0x30>  // b.lo, b.ul, b.last
  74:	d2800081 	mov	x1, #0x4                   	// #4
  78:	d2800020 	mov	x0, #0x1                   	// #1
  7c:	1400001a 	b	e4 <callt+0x94>
  80:	f940080a 	ldr	x10, [x0, #16]
  84:	8b08114a 	add	x10, x10, x8, lsl #4
  88:	f9400149 	ldr	x9, [x10]
  8c:	b940094a 	ldr	w10, [x10, #8]
  90:	b5000089 	cbnz	x9, a0 <callt+0x50>
  94:	d28000a1 	mov	x1, #0x5                   	// #5
  98:	d2800020 	mov	x0, #0x1                   	// #1
  9c:	14000012 	b	e4 <callt+0x94>
  a0:	7100015f 	cmp	w10, #0x0
  a4:	54000080 	b.eq	b4 <callt+0x64>  // b.none
  a8:	d28000c1 	mov	x1, #0x6                   	// #6
  ac:	d2800020 	mov	x0, #0x1                   	// #1
  b0:	1400000d 	b	e4 <callt+0x94>
  b4:	f94003e0 	ldr	x0, [sp]
  b8:	d10043ff 	sub	sp, sp, #0x10
  bc:	f90003e8 	str	x8, [sp]
  c0:	f90007e9 	str	x9, [sp, #8]
  c4:	d63f0120 	blr	x9
  c8:	f94003e8 	ldr	x8, [sp]
  cc:	f94007e9 	ldr	x9, [sp, #8]
  d0:	910043ff 	add	sp, sp, #0x10
  d4:	b5000080 	cbnz	x0, e4 <callt+0x94>
  d8:	2a0103ea 	mov	w10, w1
  dc:	d2800000 	mov	x0, #0x0                   	// #0
  e0:	aa0a03e1 	mov	x1, x10
  e4:	910043ff 	add	sp, sp, #0x10
  e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ec:	d65f03c0 	ret
