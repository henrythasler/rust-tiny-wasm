
tests/assets/jit/constants.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000020 get_42
0000000000000088 l     F .text	0000000000000020 get_minus_1
00000000000000a8 l     F .text	0000000000000028 get_large_num
00000000000000d0 l     F .text	0000000000000028 get_i64_min


Contents of section .text:
 0000 010080d2 17000014 210080d2 15000014  ........!.......
 0010 410080d2 13000014 610080d2 11000014  A.......a.......
 0020 810080d2 0f000014 a10080d2 0d000014  ................
 0030 c10080d2 0b000014 e10080d2 09000014  ................
 0040 010180d2 07000014 210180d2 05000014  ........!.......
 0050 410180d2 03000014 610180d2 01000014  A.......a.......
 0060 200080d2 c0035fd6 fd7bbfa9 fd030091   ....._..{......
 0070 48058052 00008052 e103082a fd7bc1a8  H..R...R...*.{..
 0080 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0090 08008012 00008052 e103082a fd7bc1a8  .......R...*.{..
 00a0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00b0 887997d2 4815b2f2 08cfcaf2 8846e2f2  .y..H........F..
 00c0 000080d2 e10308aa fd7bc1a8 c0035fd6  .........{...._.
 00d0 fd7bbfa9 fd030091 e8ff9f92 0800a0f2  .{..............
 00e0 0800c0f2 0800f0f2 000080d2 e10308aa  ................
 00f0 fd7bc1a8 c0035fd6                    .{...._.        

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

0000000000000068 <get_42>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	52800548 	mov	w8, #0x2a                  	// #42
  74:	52800000 	mov	w0, #0x0                   	// #0
  78:	2a0803e1 	mov	w1, w8
  7c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  80:	d65f03c0 	ret
  84:	d503201f 	nop

0000000000000088 <get_minus_1>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	12800008 	mov	w8, #0xffffffff            	// #-1
  94:	52800000 	mov	w0, #0x0                   	// #0
  98:	2a0803e1 	mov	w1, w8
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop

00000000000000a8 <get_large_num>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d2977988 	mov	x8, #0xbbcc                	// #48076
  b4:	f2b21548 	movk	x8, #0x90aa, lsl #16
  b8:	f2cacf08 	movk	x8, #0x5678, lsl #32
  bc:	f2e24688 	movk	x8, #0x1234, lsl #48
  c0:	d2800000 	mov	x0, #0x0                   	// #0
  c4:	aa0803e1 	mov	x1, x8
  c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  cc:	d65f03c0 	ret

00000000000000d0 <get_i64_min>:
  d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  d4:	910003fd 	mov	x29, sp
  d8:	929fffe8 	mov	x8, #0xffffffffffff0000    	// #-65536
  dc:	f2a00008 	movk	x8, #0x0, lsl #16
  e0:	f2c00008 	movk	x8, #0x0, lsl #32
  e4:	f2f00008 	movk	x8, #0x8000, lsl #48
  e8:	d2800000 	mov	x0, #0x0                   	// #0
  ec:	aa0803e1 	mov	x1, x8
  f0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  f4:	d65f03c0 	ret
