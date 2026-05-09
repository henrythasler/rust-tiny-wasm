
tests/assets/jit/mixed.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 conditional_return


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e80340b9 68000035 a80a8052 02000014  ..@.h..5...R....
 0020 48158052 e003082a e1031f2a ff430091  H..R...*...*.C..
 0030 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <conditional_return>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b94003e8 	ldr	w8, [sp]
  14:	35000068 	cbnz	w8, 20 <conditional_return+0x20>
  18:	52800aa8 	mov	w8, #0x55                  	// #85
  1c:	14000002 	b	24 <conditional_return+0x24>
  20:	52801548 	mov	w8, #0xaa                  	// #170
  24:	2a0803e0 	mov	w0, w8
  28:	2a1f03e1 	mov	w1, wzr
  2c:	910043ff 	add	sp, sp, #0x10
  30:	a8c17bfd 	ldp	x29, x30, [sp], #16
  34:	d65f03c0 	ret
