
./tests/assets/jit/parameters.o:     file format binary


Disassembly of section .data:

0000000000000000 <.data>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	52800548 	mov	w8, #0x2a                  	// #42
   c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  10:	d65f03c0 	ret
  14:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  18:	910003fd 	mov	x29, sp
  1c:	d2808a08 	mov	x8, #0x450                 	// #1104
  20:	f2ae3f68 	movk	x8, #0x71fb, lsl #16
  24:	f2c023e8 	movk	x8, #0x11f, lsl #32
  28:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2c:	d65f03c0 	ret
