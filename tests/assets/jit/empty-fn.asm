
./tests/assets/jit/empty-fn.o:     file format binary


Disassembly of section .data:

0000000000000000 <.data>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	14000001 	b	0xc
   c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  10:	d65f03c0 	ret
  14:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  18:	910003fd 	mov	x29, sp
  1c:	14000001 	b	0x20
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret
