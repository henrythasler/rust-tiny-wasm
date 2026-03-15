# Build binary
build:
    cargo build --target aarch64-unknown-linux-gnu

# Run all tests
test:
    #!/bin/bash
    cargo llvm-cov clean --workspace
    cargo llvm-cov --target aarch64-unknown-linux-gnu --html --ignore-filename-regex '(webassembly|base128)'
    for file in ./tests/assets/jit/*.o; do \
        echo $file; \
        # aarch64-linux-gnu-objdump -D -b binary -m aarch64 $file > ${file%.o}.asm; \
        aarch64-linux-gnu-objdump -d -s -t $file > ${file%.o}.asm; \
        rm ${file}; \
    done    

# Run executable
run +arguments:
    qemu-aarch64 -L /usr/aarch64-linux-gnu/ target/aarch64-unknown-linux-gnu/debug/tiny-wasm {{arguments}}

# Lint and format check
lint:
    cargo fmt -- --check
    cargo clippy

wat2wasm:
    for file in ./tests/assets/*.wat; do \
        echo $file; \
        wat2wasm $file -o ${file%.wat}.wasm; \
    done
    