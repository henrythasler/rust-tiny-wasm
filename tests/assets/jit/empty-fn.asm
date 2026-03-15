
./tests/assets/jit/empty-fn.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 _start


Contents of section .text:
 0000 fd7bbfa9 fd030091 01000014 fd7bc1a8  .{...........{..
 0010 c0035fd6 fd7bbfa9 fd030091 01000014  .._..{..........
 0020 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <_start>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	14000001 	b	c <_start+0xc>
   c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  10:	d65f03c0 	ret
  14:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  18:	910003fd 	mov	x29, sp
  1c:	14000001 	b	20 <_start+0x20>
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret
