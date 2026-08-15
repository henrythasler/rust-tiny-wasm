
tests/assets/jit/valent-blocks.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 add_const


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 08028052 09038052 0801090b 49018052  ...R...R....I..R
 0020 0801090b 000080d2 e10308aa ff430091  .............C..
 0030 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <add_const>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	52800208 	mov	w8, #0x10                  	// #16
  14:	52800309 	mov	w9, #0x18                  	// #24
  18:	0b090108 	add	w8, w8, w9
  1c:	52800149 	mov	w9, #0xa                   	// #10
  20:	0b090108 	add	w8, w8, w9
  24:	d2800000 	mov	x0, #0x0                   	// #0
  28:	aa0803e1 	mov	x1, x8
  2c:	910043ff 	add	sp, sp, #0x10
  30:	a8c17bfd 	ldp	x29, x30, [sp], #16
  34:	d65f03c0 	ret
