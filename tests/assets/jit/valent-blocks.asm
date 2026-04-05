
./tests/assets/jit/valent-blocks.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000030 add_const


Contents of section .text:
 0000 fd7bbfa9 fd030091 08028052 09038052  .{.........R...R
 0010 0801090b 49018052 0801090b e003082a  ....I..R.......*
 0020 e1031f2a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..

Disassembly of section .text:

0000000000000000 <add_const>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	52800208 	mov	w8, #0x10                  	// #16
   c:	52800309 	mov	w9, #0x18                  	// #24
  10:	0b090108 	add	w8, w8, w9
  14:	52800149 	mov	w9, #0xa                   	// #10
  18:	0b090108 	add	w8, w8, w9
  1c:	2a0803e0 	mov	w0, w8
  20:	2a1f03e1 	mov	w1, wzr
  24:	a8c17bfd 	ldp	x29, x30, [sp], #16
  28:	d65f03c0 	ret
  2c:	d503201f 	nop
