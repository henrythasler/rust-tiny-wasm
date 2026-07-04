
tests/assets/jit/call.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000020 basic
0000000000000020 l     F .text	0000000000000020 one
0000000000000040 l     F .text	0000000000000020 back
0000000000000060 l     F .text	0000000000000028 four


Contents of section .text:
 0000 fd7bbfa9 fd030091 06000094 e80300aa  .{..............
 0010 000080d2 e10308aa fd7bc1a8 c0035fd6  .........{...._.
 0020 fd7bbfa9 fd030091 280080d2 000080d2  .{......(.......
 0030 e10308aa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0040 fd7bbfa9 fd030091 f6ffff97 e80300aa  .{..............
 0050 000080d2 e10308aa fd7bc1a8 c0035fd6  .........{...._.
 0060 fd7bbfa9 fd030091 680080d2 edffff97  .{......h.......
 0070 e90300aa 0801098b 000080d2 e10308aa  ................
 0080 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <basic>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	94000006 	bl	20 <one>
   c:	aa0003e8 	mov	x8, x0
  10:	d2800000 	mov	x0, #0x0                   	// #0
  14:	aa0803e1 	mov	x1, x8
  18:	a8c17bfd 	ldp	x29, x30, [sp], #16
  1c:	d65f03c0 	ret

0000000000000020 <one>:
  20:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  24:	910003fd 	mov	x29, sp
  28:	d2800028 	mov	x8, #0x1                   	// #1
  2c:	d2800000 	mov	x0, #0x0                   	// #0
  30:	aa0803e1 	mov	x1, x8
  34:	a8c17bfd 	ldp	x29, x30, [sp], #16
  38:	d65f03c0 	ret
  3c:	d503201f 	nop

0000000000000040 <back>:
  40:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  44:	910003fd 	mov	x29, sp
  48:	97fffff6 	bl	20 <one>
  4c:	aa0003e8 	mov	x8, x0
  50:	d2800000 	mov	x0, #0x0                   	// #0
  54:	aa0803e1 	mov	x1, x8
  58:	a8c17bfd 	ldp	x29, x30, [sp], #16
  5c:	d65f03c0 	ret

0000000000000060 <four>:
  60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  64:	910003fd 	mov	x29, sp
  68:	d2800068 	mov	x8, #0x3                   	// #3
  6c:	97ffffed 	bl	20 <one>
  70:	aa0003e9 	mov	x9, x0
  74:	8b090108 	add	x8, x8, x9
  78:	d2800000 	mov	x0, #0x0                   	// #0
  7c:	aa0803e1 	mov	x1, x8
  80:	a8c17bfd 	ldp	x29, x30, [sp], #16
  84:	d65f03c0 	ret
