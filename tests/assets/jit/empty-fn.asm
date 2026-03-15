
./tests/assets/jit/empty-fn.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000018 foo
0000000000000018 l     F .text	0000000000000018 bar


Contents of section .text:
 0000 fd7bbfa9 fd030091 01000014 fd7bc1a8  .{...........{..
 0010 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0020 01000014 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..

Disassembly of section .text:

0000000000000000 <foo>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	14000001 	b	c <foo+0xc>
   c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  10:	d65f03c0 	ret
  14:	d503201f 	nop

0000000000000018 <bar>:
  18:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  1c:	910003fd 	mov	x29, sp
  20:	14000001 	b	24 <bar+0xc>
  24:	a8c17bfd 	ldp	x29, x30, [sp], #16
  28:	d65f03c0 	ret
  2c:	d503201f 	nop
