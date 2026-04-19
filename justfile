# Build binary
build:
    cargo build --target aarch64-unknown-linux-gnu

# Run all tests
test:
    #!/bin/bash
    cargo test objdump
    for file in ./tests/assets/jit/*.o; do \
        echo $file; \
        # aarch64-linux-gnu-objdump -D -b binary -m aarch64 $file > ${file%.o}.asm; \
        aarch64-linux-gnu-objdump -d -s -t $file > ${file%.o}.asm; \
        rm ${file}; \
    done
    cargo llvm-cov clean --workspace
    # see https://docs.rs/crate/cargo-llvm-cov/latest and https://doc.rust-lang.org/cargo/commands/cargo-test.html
    RUST_BACKTRACE=0 cargo llvm-cov test --target aarch64-unknown-linux-gnu --html --ignore-filename-regex '(build\.rs|main\.rs)' --lib --test '*test'
    # RUSTFLAGS="-C instrument-coverage -C link-dead-code" RUST_BACKTRACE=0 cargo llvm-cov --target aarch64-unknown-linux-gnu --html --show-instantiations --ignore-filename-regex '(build\.rs|main\.rs)' --lib --test '*test'

# Run executable
run +arguments:
    qemu-aarch64 -L /usr/aarch64-linux-gnu/ target/aarch64-unknown-linux-gnu/debug/tiny-wasm {{arguments}}

# Run executable and 
debug +arguments:
    QEMU_DEBUG=1 qemu-aarch64 -L /usr/aarch64-linux-gnu/ -g 1234 target/aarch64-unknown-linux-gnu/debug/tiny-wasm {{arguments}}

gdb:
    gdb-multiarch -q --nh -ex 'set architecture aarch64' -ex 'file target/aarch64-unknown-linux-gnu/debug/tiny-wasm' -ex 'target remote localhost:1234' -ex 'layout split' -ex 'layout regs'

# Lint and format check
lint:
    cargo fmt -- --check
    cargo clippy

wat2wasm:
    for file in ./tests/assets/*.wat; do \
        echo $file; \
        wat2wasm $file -o ${file%.wat}.wasm; \
    done

rs2wasm:
    for file in ./tests/assets/rs/*.rs; do \
        echo $file; \
        rustc --target wasm32v1-none -Cpanic=abort -o ${file%.rs}.wasm $file; \
        wasm-opt -Oz --strip-debug --strip-producers -o ${file%.rs}.wasm ${file%.rs}.wasm; \
    done

valentblock:
    VALENT_BLOCK=1 cargo test --target aarch64-unknown-linux-gnu --test objdump --test valent_blocks_test
    for file in ./tests/assets/jit/*.o; do \
        echo $file; \
        aarch64-linux-gnu-objdump -d -s -t $file > ${file%.o}.asm; \
        rm ${file}; \
    done   