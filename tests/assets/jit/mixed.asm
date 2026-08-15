
tests/assets/jit/mixed.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 conditional_return


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 68000035 a80a8052  ......@.h..5...R
 0020 02000014 48158052 000080d2 e10308aa  ....H..R........
 0030 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <conditional_return>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9400be8 	ldr	w8, [sp, #8]
  18:	35000068 	cbnz	w8, 24 <conditional_return+0x24>
  1c:	52800aa8 	mov	w8, #0x55                  	// #85
  20:	14000002 	b	28 <conditional_return+0x28>
  24:	52801548 	mov	w8, #0xaa                  	// #170
  28:	d2800000 	mov	x0, #0x0                   	// #0
  2c:	aa0803e1 	mov	x1, x8
  30:	910043ff 	add	sp, sp, #0x10
  34:	a8c17bfd 	ldp	x29, x30, [sp], #16
  38:	d65f03c0 	ret
  3c:	d503201f 	nop
