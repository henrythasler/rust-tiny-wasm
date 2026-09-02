
tests/assets/jit/memory.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000050 load_i64
0000000000000050 l     F .text	0000000000000050 load_i32


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
