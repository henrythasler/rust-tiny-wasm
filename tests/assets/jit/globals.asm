
tests/assets/jit/globals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 get_int32
0000000000000028 l     F .text	0000000000000030 get_special
0000000000000058 l     F .text	0000000000000028 get_int64
0000000000000080 l     F .text	0000000000000030 get_float32
00000000000000b0 l     F .text	0000000000000038 get_float64
00000000000000e8 l     F .text	0000000000000040 store_int32
0000000000000128 l     F .text	0000000000000040 store_int64
0000000000000168 l     F .text	0000000000000040 store_float32
00000000000001a8 l     F .text	0000000000000040 store_float64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 28008012 000080d2 e10308aa ff430091  (............C..
 0020 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0030 ff4300d1 e00300f9 081840f9 084140b9  .C........@..A@.
 0040 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0050 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0060 ff4300d1 e00300f9 88008092 000080d2  .C..............
 0070 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0080 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0090 68fb8152 2809a872 0801271e 000080d2  h..R(..r..'.....
 00a0 0101261e ff430091 fd7bc1a8 c0035fd6  ..&..C...{...._.
 00b0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00c0 28ed8ad2 8862b1f2 48e1d7f2 a800e8f2  (....b..H.......
 00d0 0801679e 000080d2 0101669e ff430091  ..g.......f..C..
 00e0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00f0 ff4300d1 e00300f9 e10b00b9 e80b40b9  .C............@.
 0100 091840f9 282100b9 091840f9 292140b9  ..@.(!....@.)!@.
 0110 000080d2 e10309aa ff430091 fd7bc1a8  .........C...{..
 0120 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0130 ff4300d1 e00300f9 e10700f9 e80740f9  .C............@.
 0140 091840f9 281500f9 091840f9 291540f9  ..@.(.....@.).@.
 0150 000080d2 e10309aa ff430091 fd7bc1a8  .........C...{..
 0160 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0170 ff4300d1 e00300f9 e00b00bd e80b40bd  .C............@.
 0180 081840f9 083100bd 081840f9 093140bd  ..@..1....@..1@.
 0190 000080d2 2101261e ff430091 fd7bc1a8  ....!.&..C...{..
 01a0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 01b0 ff4300d1 e00300f9 e00700fd e80740fd  .C............@.
 01c0 081840f9 081d00fd 081840f9 091d40fd  ..@.......@...@.
 01d0 000080d2 2101669e ff430091 fd7bc1a8  ....!.f..C...{..
 01e0 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <get_int32>:
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

0000000000000028 <get_special>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d10043ff 	sub	sp, sp, #0x10
  34:	f90003e0 	str	x0, [sp]
  38:	f9401808 	ldr	x8, [x0, #48]
  3c:	b9404108 	ldr	w8, [x8, #64]
  40:	d2800000 	mov	x0, #0x0                   	// #0
  44:	aa0803e1 	mov	x1, x8
  48:	910043ff 	add	sp, sp, #0x10
  4c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  50:	d65f03c0 	ret
  54:	d503201f 	nop

0000000000000058 <get_int64>:
  58:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  5c:	910003fd 	mov	x29, sp
  60:	d10043ff 	sub	sp, sp, #0x10
  64:	f90003e0 	str	x0, [sp]
  68:	92800088 	mov	x8, #0xfffffffffffffffb    	// #-5
  6c:	d2800000 	mov	x0, #0x0                   	// #0
  70:	aa0803e1 	mov	x1, x8
  74:	910043ff 	add	sp, sp, #0x10
  78:	a8c17bfd 	ldp	x29, x30, [sp], #16
  7c:	d65f03c0 	ret

0000000000000080 <get_float32>:
  80:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  84:	910003fd 	mov	x29, sp
  88:	d10043ff 	sub	sp, sp, #0x10
  8c:	f90003e0 	str	x0, [sp]
  90:	5281fb68 	mov	w8, #0xfdb                 	// #4059
  94:	72a80928 	movk	w8, #0x4049, lsl #16
  98:	1e270108 	fmov	s8, w8
  9c:	d2800000 	mov	x0, #0x0                   	// #0
  a0:	1e260101 	fmov	w1, s8
  a4:	910043ff 	add	sp, sp, #0x10
  a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ac:	d65f03c0 	ret

00000000000000b0 <get_float64>:
  b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  b4:	910003fd 	mov	x29, sp
  b8:	d10043ff 	sub	sp, sp, #0x10
  bc:	f90003e0 	str	x0, [sp]
  c0:	d28aed28 	mov	x8, #0x5769                	// #22377
  c4:	f2b16288 	movk	x8, #0x8b14, lsl #16
  c8:	f2d7e148 	movk	x8, #0xbf0a, lsl #32
  cc:	f2e800a8 	movk	x8, #0x4005, lsl #48
  d0:	9e670108 	fmov	d8, x8
  d4:	d2800000 	mov	x0, #0x0                   	// #0
  d8:	9e660101 	fmov	x1, d8
  dc:	910043ff 	add	sp, sp, #0x10
  e0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  e4:	d65f03c0 	ret

00000000000000e8 <store_int32>:
  e8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ec:	910003fd 	mov	x29, sp
  f0:	d10043ff 	sub	sp, sp, #0x10
  f4:	f90003e0 	str	x0, [sp]
  f8:	b9000be1 	str	w1, [sp, #8]
  fc:	b9400be8 	ldr	w8, [sp, #8]
 100:	f9401809 	ldr	x9, [x0, #48]
 104:	b9002128 	str	w8, [x9, #32]
 108:	f9401809 	ldr	x9, [x0, #48]
 10c:	b9402129 	ldr	w9, [x9, #32]
 110:	d2800000 	mov	x0, #0x0                   	// #0
 114:	aa0903e1 	mov	x1, x9
 118:	910043ff 	add	sp, sp, #0x10
 11c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 120:	d65f03c0 	ret
 124:	d503201f 	nop

0000000000000128 <store_int64>:
 128:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 12c:	910003fd 	mov	x29, sp
 130:	d10043ff 	sub	sp, sp, #0x10
 134:	f90003e0 	str	x0, [sp]
 138:	f90007e1 	str	x1, [sp, #8]
 13c:	f94007e8 	ldr	x8, [sp, #8]
 140:	f9401809 	ldr	x9, [x0, #48]
 144:	f9001528 	str	x8, [x9, #40]
 148:	f9401809 	ldr	x9, [x0, #48]
 14c:	f9401529 	ldr	x9, [x9, #40]
 150:	d2800000 	mov	x0, #0x0                   	// #0
 154:	aa0903e1 	mov	x1, x9
 158:	910043ff 	add	sp, sp, #0x10
 15c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 160:	d65f03c0 	ret
 164:	d503201f 	nop

0000000000000168 <store_float32>:
 168:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 16c:	910003fd 	mov	x29, sp
 170:	d10043ff 	sub	sp, sp, #0x10
 174:	f90003e0 	str	x0, [sp]
 178:	bd000be0 	str	s0, [sp, #8]
 17c:	bd400be8 	ldr	s8, [sp, #8]
 180:	f9401808 	ldr	x8, [x0, #48]
 184:	bd003108 	str	s8, [x8, #48]
 188:	f9401808 	ldr	x8, [x0, #48]
 18c:	bd403109 	ldr	s9, [x8, #48]
 190:	d2800000 	mov	x0, #0x0                   	// #0
 194:	1e260121 	fmov	w1, s9
 198:	910043ff 	add	sp, sp, #0x10
 19c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1a0:	d65f03c0 	ret
 1a4:	d503201f 	nop

00000000000001a8 <store_float64>:
 1a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1ac:	910003fd 	mov	x29, sp
 1b0:	d10043ff 	sub	sp, sp, #0x10
 1b4:	f90003e0 	str	x0, [sp]
 1b8:	fd0007e0 	str	d0, [sp, #8]
 1bc:	fd4007e8 	ldr	d8, [sp, #8]
 1c0:	f9401808 	ldr	x8, [x0, #48]
 1c4:	fd001d08 	str	d8, [x8, #56]
 1c8:	f9401808 	ldr	x8, [x0, #48]
 1cc:	fd401d09 	ldr	d9, [x8, #56]
 1d0:	d2800000 	mov	x0, #0x0                   	// #0
 1d4:	9e660121 	fmov	x1, d9
 1d8:	910043ff 	add	sp, sp, #0x10
 1dc:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1e0:	d65f03c0 	ret
 1e4:	d503201f 	nop
