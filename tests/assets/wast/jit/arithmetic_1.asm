
tests/assets/wast/jit/arithmetic_1.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 add
0000000000000038 l     F .text	0000000000000038 sub
0000000000000070 l     F .text	0000000000000038 mul


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10700f9 e80340f9 e90740f9 0801098b  ......@...@.....
 0020 e00308aa e1031faa ff430091 fd7bc1a8  .........C...{..
 0030 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0040 ff4300d1 e00300f9 e10700f9 e80340f9  .C............@.
 0050 e90740f9 080109cb e00308aa e1031faa  ..@.............
 0060 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0070 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0080 e10700f9 e80340f9 e90740f9 087d099b  ......@...@..}..
 0090 e00308aa e1031faa ff430091 fd7bc1a8  .........C...{..
 00a0 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <add>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	f90007e1 	str	x1, [sp, #8]
  14:	f94003e8 	ldr	x8, [sp]
  18:	f94007e9 	ldr	x9, [sp, #8]
  1c:	8b090108 	add	x8, x8, x9
  20:	aa0803e0 	mov	x0, x8
  24:	aa1f03e1 	mov	x1, xzr
  28:	910043ff 	add	sp, sp, #0x10
  2c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  30:	d65f03c0 	ret
  34:	d503201f 	nop

0000000000000038 <sub>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	f90007e1 	str	x1, [sp, #8]
  4c:	f94003e8 	ldr	x8, [sp]
  50:	f94007e9 	ldr	x9, [sp, #8]
  54:	cb090108 	sub	x8, x8, x9
  58:	aa0803e0 	mov	x0, x8
  5c:	aa1f03e1 	mov	x1, xzr
  60:	910043ff 	add	sp, sp, #0x10
  64:	a8c17bfd 	ldp	x29, x30, [sp], #16
  68:	d65f03c0 	ret
  6c:	d503201f 	nop

0000000000000070 <mul>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	f90003e0 	str	x0, [sp]
  80:	f90007e1 	str	x1, [sp, #8]
  84:	f94003e8 	ldr	x8, [sp]
  88:	f94007e9 	ldr	x9, [sp, #8]
  8c:	9b097d08 	mul	x8, x8, x9
  90:	aa0803e0 	mov	x0, x8
  94:	aa1f03e1 	mov	x1, xzr
  98:	910043ff 	add	sp, sp, #0x10
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop
