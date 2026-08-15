
tests/assets/wast/jit/arithmetic_1.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 add
0000000000000038 l     F .text	0000000000000038 sub
0000000000000070 l     F .text	0000000000000038 mul


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0010 e10700f9 e20b00f9 e80740f9 e90b40f9  ..........@...@.
 0020 0801098b 000080d2 e10308aa ff830091  ................
 0030 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0040 ff8300d1 e00300f9 e10700f9 e20b00f9  ................
 0050 e80740f9 e90b40f9 080109cb 000080d2  ..@...@.........
 0060 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 0070 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0080 e10700f9 e20b00f9 e80740f9 e90b40f9  ..........@...@.
 0090 087d099b 000080d2 e10308aa ff830091  .}..............
 00a0 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <add>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10083ff 	sub	sp, sp, #0x20
   c:	f90003e0 	str	x0, [sp]
  10:	f90007e1 	str	x1, [sp, #8]
  14:	f9000be2 	str	x2, [sp, #16]
  18:	f94007e8 	ldr	x8, [sp, #8]
  1c:	f9400be9 	ldr	x9, [sp, #16]
  20:	8b090108 	add	x8, x8, x9
  24:	d2800000 	mov	x0, #0x0                   	// #0
  28:	aa0803e1 	mov	x1, x8
  2c:	910083ff 	add	sp, sp, #0x20
  30:	a8c17bfd 	ldp	x29, x30, [sp], #16
  34:	d65f03c0 	ret

0000000000000038 <sub>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10083ff 	sub	sp, sp, #0x20
  44:	f90003e0 	str	x0, [sp]
  48:	f90007e1 	str	x1, [sp, #8]
  4c:	f9000be2 	str	x2, [sp, #16]
  50:	f94007e8 	ldr	x8, [sp, #8]
  54:	f9400be9 	ldr	x9, [sp, #16]
  58:	cb090108 	sub	x8, x8, x9
  5c:	d2800000 	mov	x0, #0x0                   	// #0
  60:	aa0803e1 	mov	x1, x8
  64:	910083ff 	add	sp, sp, #0x20
  68:	a8c17bfd 	ldp	x29, x30, [sp], #16
  6c:	d65f03c0 	ret

0000000000000070 <mul>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10083ff 	sub	sp, sp, #0x20
  7c:	f90003e0 	str	x0, [sp]
  80:	f90007e1 	str	x1, [sp, #8]
  84:	f9000be2 	str	x2, [sp, #16]
  88:	f94007e8 	ldr	x8, [sp, #8]
  8c:	f9400be9 	ldr	x9, [sp, #16]
  90:	9b097d08 	mul	x8, x8, x9
  94:	d2800000 	mov	x0, #0x0                   	// #0
  98:	aa0803e1 	mov	x1, x8
  9c:	910083ff 	add	sp, sp, #0x20
  a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a4:	d65f03c0 	ret
