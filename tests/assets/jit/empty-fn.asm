
tests/assets/jit/empty-fn.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000020 foo
0000000000000088 l     F .text	0000000000000020 bar


Contents of section .text:
 0000 010080d2 17000014 210080d2 15000014  ........!.......
 0010 410080d2 13000014 610080d2 11000014  A.......a.......
 0020 810080d2 0f000014 a10080d2 0d000014  ................
 0030 c10080d2 0b000014 e10080d2 09000014  ................
 0040 010180d2 07000014 210180d2 05000014  ........!.......
 0050 410180d2 03000014 610180d2 01000014  A.......a.......
 0060 200080d2 c0035fd6 fd7bbfa9 fd030091   ....._..{......
 0070 01000014 000080d2 e1031faa fd7bc1a8  .............{..
 0080 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0090 01000014 000080d2 e1031faa fd7bc1a8  .............{..
 00a0 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <trap_handler>:
   0:	d2800001 	mov	x1, #0x0                   	// #0
   4:	14000017 	b	60 <trap_handler+0x60>
   8:	d2800021 	mov	x1, #0x1                   	// #1
   c:	14000015 	b	60 <trap_handler+0x60>
  10:	d2800041 	mov	x1, #0x2                   	// #2
  14:	14000013 	b	60 <trap_handler+0x60>
  18:	d2800061 	mov	x1, #0x3                   	// #3
  1c:	14000011 	b	60 <trap_handler+0x60>
  20:	d2800081 	mov	x1, #0x4                   	// #4
  24:	1400000f 	b	60 <trap_handler+0x60>
  28:	d28000a1 	mov	x1, #0x5                   	// #5
  2c:	1400000d 	b	60 <trap_handler+0x60>
  30:	d28000c1 	mov	x1, #0x6                   	// #6
  34:	1400000b 	b	60 <trap_handler+0x60>
  38:	d28000e1 	mov	x1, #0x7                   	// #7
  3c:	14000009 	b	60 <trap_handler+0x60>
  40:	d2800101 	mov	x1, #0x8                   	// #8
  44:	14000007 	b	60 <trap_handler+0x60>
  48:	d2800121 	mov	x1, #0x9                   	// #9
  4c:	14000005 	b	60 <trap_handler+0x60>
  50:	d2800141 	mov	x1, #0xa                   	// #10
  54:	14000003 	b	60 <trap_handler+0x60>
  58:	d2800161 	mov	x1, #0xb                   	// #11
  5c:	14000001 	b	60 <trap_handler+0x60>
  60:	d2800020 	mov	x0, #0x1                   	// #1
  64:	d65f03c0 	ret

0000000000000068 <foo>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	14000001 	b	74 <foo+0xc>
  74:	d2800000 	mov	x0, #0x0                   	// #0
  78:	aa1f03e1 	mov	x1, xzr
  7c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  80:	d65f03c0 	ret
  84:	d503201f 	nop

0000000000000088 <bar>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	14000001 	b	94 <bar+0xc>
  94:	d2800000 	mov	x0, #0x0                   	// #0
  98:	aa1f03e1 	mov	x1, xzr
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop
