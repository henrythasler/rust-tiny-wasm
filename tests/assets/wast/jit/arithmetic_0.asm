
tests/assets/wast/jit/arithmetic_0.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 add
0000000000000038 l     F .text	0000000000000038 sub
0000000000000070 l     F .text	0000000000000038 mul


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0020 0801090b 000080d2 e10308aa ff430091  .............C..
 0030 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0040 ff4300d1 e00300f9 e10b00b9 e20f00b9  .C..............
 0050 e80b40b9 e90f40b9 0801094b 000080d2  ..@...@....K....
 0060 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0070 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0080 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0090 087d091b 000080d2 e10308aa ff430091  .}...........C..
 00a0 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <add>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9000fe2 	str	w2, [sp, #12]
  18:	b9400be8 	ldr	w8, [sp, #8]
  1c:	b9400fe9 	ldr	w9, [sp, #12]
  20:	0b090108 	add	w8, w8, w9
  24:	d2800000 	mov	x0, #0x0                   	// #0
  28:	aa0803e1 	mov	x1, x8
  2c:	910043ff 	add	sp, sp, #0x10
  30:	a8c17bfd 	ldp	x29, x30, [sp], #16
  34:	d65f03c0 	ret

0000000000000038 <sub>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	b9000be1 	str	w1, [sp, #8]
  4c:	b9000fe2 	str	w2, [sp, #12]
  50:	b9400be8 	ldr	w8, [sp, #8]
  54:	b9400fe9 	ldr	w9, [sp, #12]
  58:	4b090108 	sub	w8, w8, w9
  5c:	d2800000 	mov	x0, #0x0                   	// #0
  60:	aa0803e1 	mov	x1, x8
  64:	910043ff 	add	sp, sp, #0x10
  68:	a8c17bfd 	ldp	x29, x30, [sp], #16
  6c:	d65f03c0 	ret

0000000000000070 <mul>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	f90003e0 	str	x0, [sp]
  80:	b9000be1 	str	w1, [sp, #8]
  84:	b9000fe2 	str	w2, [sp, #12]
  88:	b9400be8 	ldr	w8, [sp, #8]
  8c:	b9400fe9 	ldr	w9, [sp, #12]
  90:	1b097d08 	mul	w8, w8, w9
  94:	d2800000 	mov	x0, #0x0                   	// #0
  98:	aa0803e1 	mov	x1, x8
  9c:	910043ff 	add	sp, sp, #0x10
  a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a4:	d65f03c0 	ret
