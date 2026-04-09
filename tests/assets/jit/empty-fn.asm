
./tests/assets/jit/empty-fn.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000020 foo
0000000000000020 l     F .text	0000000000000020 bar


Contents of section .text:
 0000 fd7bbfa9 fd030091 02000014 e0031faa  .{..............
 0010 e1031faa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0020 fd7bbfa9 fd030091 02000014 e0031faa  .{..............
 0030 e1031faa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..

Disassembly of section .text:

0000000000000000 <foo>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	14000002 	b	10 <foo+0x10>
   c:	aa1f03e0 	mov	x0, xzr
  10:	aa1f03e1 	mov	x1, xzr
  14:	a8c17bfd 	ldp	x29, x30, [sp], #16
  18:	d65f03c0 	ret
  1c:	d503201f 	nop

0000000000000020 <bar>:
  20:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  24:	910003fd 	mov	x29, sp
  28:	14000002 	b	30 <bar+0x10>
  2c:	aa1f03e0 	mov	x0, xzr
  30:	aa1f03e1 	mov	x1, xzr
  34:	a8c17bfd 	ldp	x29, x30, [sp], #16
  38:	d65f03c0 	ret
  3c:	d503201f 	nop
