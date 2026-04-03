
./tests/assets/jit/empty-fn.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000018 foo
0000000000000018 l     F .text	0000000000000018 bar


Contents of section .text:
 0000 fd7bbfa9 fd030091 e0031faa e1031faa  .{..............
 0010 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0020 e0031faa e1031faa fd7bc1a8 c0035fd6  .........{...._.

Disassembly of section .text:

0000000000000000 <foo>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	aa1f03e0 	mov	x0, xzr
   c:	aa1f03e1 	mov	x1, xzr
  10:	a8c17bfd 	ldp	x29, x30, [sp], #16
  14:	d65f03c0 	ret

0000000000000018 <bar>:
  18:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  1c:	910003fd 	mov	x29, sp
  20:	aa1f03e0 	mov	x0, xzr
  24:	aa1f03e1 	mov	x1, xzr
  28:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2c:	d65f03c0 	ret
