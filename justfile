# Build binary
build:
    cargo build --target aarch64-unknown-linux-gnu

# Run all tests
test:
    cargo llvm-cov --target aarch64-unknown-linux-gnu --html

# Run executable
run +arguments:
    qemu-aarch64 -L /usr/aarch64-linux-gnu/ target/aarch64-unknown-linux-gnu/debug/tiny-wasm {{arguments}}

# Lint and format check
lint:
    cargo fmt -- --check
    cargo clippy -- -D warnings

wat2wasm:
    wat2wasm tests/assets/empty-fn.wat -o tests/assets/empty-fn.wasm