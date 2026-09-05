
tests/assets/jit/memory.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000050 load_i64
0000000000000050 l     F .text	0000000000000050 load_i32
00000000000000a0 l     F .text	0000000000000050 load_i32_8u
00000000000000f0 l     F .text	0000000000000050 load_i32_8s
0000000000000140 l     F .text	0000000000000058 load_i32_8u_offset


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 091440f9 292100d1  ......@...@.)!..
 0020 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 0030 05000014 091040f9 286968f8 000080d2  ......@.(ih.....
 0040 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0060 e10b00b9 e80b40b9 091440f9 291100d1  ......@...@.)...
 0070 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 0080 05000014 091040f9 286968b8 000080d2  ......@.(ih.....
 0090 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00a0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00b0 e10b00b9 e80b40b9 091440f9 290500d1  ......@...@.)...
 00c0 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 00d0 05000014 091040f9 28796838 000080d2  ......@.(yh8....
 00e0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00f0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0100 e10b00b9 e80b40b9 091440f9 290500d1  ......@...@.)...
 0110 1f0109eb 89000054 410080d2 200080d2  .......TA... ...
 0120 05000014 091040f9 2879e838 000080d2  ......@.(y.8....
 0130 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0140 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0150 e10b00b9 e80b40b9 08010c91 091440f9  ......@.......@.
 0160 290500d1 1f0109eb 89000054 410080d2  )..........TA...
 0170 200080d2 05000014 091040f9 28796838   .........@.(yh8
 0180 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0190 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <load_i64>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9400be8 	ldr	w8, [sp, #8]
  18:	f9401409 	ldr	x9, [x0, #40]
  1c:	d1002129 	sub	x9, x9, #0x8
  20:	eb09011f 	cmp	x8, x9
  24:	54000089 	b.ls	34 <load_i64+0x34>  // b.plast
  28:	d2800041 	mov	x1, #0x2                   	// #2
  2c:	d2800020 	mov	x0, #0x1                   	// #1
  30:	14000005 	b	44 <load_i64+0x44>
  34:	f9401009 	ldr	x9, [x0, #32]
  38:	f8686928 	ldr	x8, [x9, x8]
  3c:	d2800000 	mov	x0, #0x0                   	// #0
  40:	aa0803e1 	mov	x1, x8
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <load_i32>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	f90003e0 	str	x0, [sp]
  60:	b9000be1 	str	w1, [sp, #8]
  64:	b9400be8 	ldr	w8, [sp, #8]
  68:	f9401409 	ldr	x9, [x0, #40]
  6c:	d1001129 	sub	x9, x9, #0x4
  70:	eb09011f 	cmp	x8, x9
  74:	54000089 	b.ls	84 <load_i32+0x34>  // b.plast
  78:	d2800041 	mov	x1, #0x2                   	// #2
  7c:	d2800020 	mov	x0, #0x1                   	// #1
  80:	14000005 	b	94 <load_i32+0x44>
  84:	f9401009 	ldr	x9, [x0, #32]
  88:	b8686928 	ldr	w8, [x9, x8]
  8c:	d2800000 	mov	x0, #0x0                   	// #0
  90:	aa0803e1 	mov	x1, x8
  94:	910043ff 	add	sp, sp, #0x10
  98:	a8c17bfd 	ldp	x29, x30, [sp], #16
  9c:	d65f03c0 	ret

00000000000000a0 <load_i32_8u>:
  a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  a4:	910003fd 	mov	x29, sp
  a8:	d10043ff 	sub	sp, sp, #0x10
  ac:	f90003e0 	str	x0, [sp]
  b0:	b9000be1 	str	w1, [sp, #8]
  b4:	b9400be8 	ldr	w8, [sp, #8]
  b8:	f9401409 	ldr	x9, [x0, #40]
  bc:	d1000529 	sub	x9, x9, #0x1
  c0:	eb09011f 	cmp	x8, x9
  c4:	54000089 	b.ls	d4 <load_i32_8u+0x34>  // b.plast
  c8:	d2800041 	mov	x1, #0x2                   	// #2
  cc:	d2800020 	mov	x0, #0x1                   	// #1
  d0:	14000005 	b	e4 <load_i32_8u+0x44>
  d4:	f9401009 	ldr	x9, [x0, #32]
  d8:	38687928 	ldrb	w8, [x9, x8, lsl #0]
  dc:	d2800000 	mov	x0, #0x0                   	// #0
  e0:	aa0803e1 	mov	x1, x8
  e4:	910043ff 	add	sp, sp, #0x10
  e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ec:	d65f03c0 	ret

00000000000000f0 <load_i32_8s>:
  f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  f4:	910003fd 	mov	x29, sp
  f8:	d10043ff 	sub	sp, sp, #0x10
  fc:	f90003e0 	str	x0, [sp]
 100:	b9000be1 	str	w1, [sp, #8]
 104:	b9400be8 	ldr	w8, [sp, #8]
 108:	f9401409 	ldr	x9, [x0, #40]
 10c:	d1000529 	sub	x9, x9, #0x1
 110:	eb09011f 	cmp	x8, x9
 114:	54000089 	b.ls	124 <load_i32_8s+0x34>  // b.plast
 118:	d2800041 	mov	x1, #0x2                   	// #2
 11c:	d2800020 	mov	x0, #0x1                   	// #1
 120:	14000005 	b	134 <load_i32_8s+0x44>
 124:	f9401009 	ldr	x9, [x0, #32]
 128:	38e87928 	ldrsb	w8, [x9, x8, lsl #0]
 12c:	d2800000 	mov	x0, #0x0                   	// #0
 130:	aa0803e1 	mov	x1, x8
 134:	910043ff 	add	sp, sp, #0x10
 138:	a8c17bfd 	ldp	x29, x30, [sp], #16
 13c:	d65f03c0 	ret

0000000000000140 <load_i32_8u_offset>:
 140:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 144:	910003fd 	mov	x29, sp
 148:	d10043ff 	sub	sp, sp, #0x10
 14c:	f90003e0 	str	x0, [sp]
 150:	b9000be1 	str	w1, [sp, #8]
 154:	b9400be8 	ldr	w8, [sp, #8]
 158:	910c0108 	add	x8, x8, #0x300
 15c:	f9401409 	ldr	x9, [x0, #40]
 160:	d1000529 	sub	x9, x9, #0x1
 164:	eb09011f 	cmp	x8, x9
 168:	54000089 	b.ls	178 <load_i32_8u_offset+0x38>  // b.plast
 16c:	d2800041 	mov	x1, #0x2                   	// #2
 170:	d2800020 	mov	x0, #0x1                   	// #1
 174:	14000005 	b	188 <load_i32_8u_offset+0x48>
 178:	f9401009 	ldr	x9, [x0, #32]
 17c:	38687928 	ldrb	w8, [x9, x8, lsl #0]
 180:	d2800000 	mov	x0, #0x0                   	// #0
 184:	aa0803e1 	mov	x1, x8
 188:	910043ff 	add	sp, sp, #0x10
 18c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 190:	d65f03c0 	ret
 194:	d503201f 	nop
