; compile & extract JIT-code with: `aarch64-linux-gnu-as add.s -o add.o && aarch64-linux-gnu-objcopy -O binary -j .text add.o add.bin`
add:
    add     w0, w1, w0
    ret
