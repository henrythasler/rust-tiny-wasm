
tests/assets/jit/skeleton.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 _start


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 01000014 000080d2 e1031faa ff430091  .............C..
 0020 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <_start>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	14000001 	b	14 <_start+0x14>
  14:	d2800000 	mov	x0, #0x0                   	// #0
  18:	aa1f03e1 	mov	x1, xzr
  1c:	910043ff 	add	sp, sp, #0x10
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret
