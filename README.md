[![Build Status](https://github.com/henrythasler/rust-tiny-wasm/actions/workflows/build-aarch64.yml/badge.svg)](https://github.com/henrythasler/rust-tiny-wasm/actions/workflows/build-aarch64.yml) [![Coverage Status](https://coveralls.io/repos/github/henrythasler/rust-tiny-wasm/badge.svg?branch=main)](https://coveralls.io/github/henrythasler/rust-tiny-wasm?branch=main)

# Rust-Tiny-Wasm

A [WebAssembly](https://webassembly.org/) Compiler and Runtime for ARM64 (aarch64) written in [Rust](https://rust-lang.org/) based on [Tiny-Wasm](https://github.com/henrythasler/wasm-playground).

My goal is to split this into small chapters with very specific goals and additional documentation and a detailled solution description along the way. It can eventually be a good learing experience for others that want to start working with Rust and WebAssembly compilers.

## Chapter 1 - Toolchain Setup

### Goals

- [x] Set up local Rust toolchain for your local native target (e.g. x86_64) and aarch64 targets.
- [x] Create a hello-world application and run for x86_64 target.
- [x] Install [QEMU](https://www.qemu.org/) if you use a x86_64 machine for local development.
- [x] Run the hello-world application for aarch64 target using `qemu-aarch64`.
- [x] Create and run a unit-test.
- [x] Set up a CI workflow (e.g. GitHub Action) to build and run the hello-world application natively for aarch64.
- [x] Execute the unit-tests in the CI environment.
- [x] Extend the CI setup with code coverage measurements.
- [x] Extend the CI setup with a code formatter and linter step.
- [x] Add a status/badge to the README.md that indicates the build/test result and coverage information.

### Detailed Description

- Use `rustup target list` or check [The rustc book - Platform Support](https://doc.rust-lang.org/nightly/rustc/platform-support.html) for a list of supported target platforms. Install additional targets with `rustup target add <target>`.
- The hello-world application should consist at least of a main function that prints a string obtained from a helper function to stdout. The helper function will be used for the unit-test.
- To execute ARM64 (aarch64) binaries on Ubuntu, you need to install `qemu-user and qemu-user-static` first.
- Refer to [The Rust Programming Language - Test Organization](https://doc.rust-lang.org/book/ch11-03-test-organization.html) on testing.
- `cargo fmt` and `cargo clippy` are the basic code quality tools to be used.

### Solution Documentation

- To set up the Rust toolchain and a hello-world application we can simply follow their [Getting Started](https://rust-lang.org/learn/get-started/) tutorial.
- The ARM64 (aarch64) target can be installed with `rustup target add aarch64-unknown-linux-gnu`.
- Build and run the application with `cargo run` on the native target.
- Run the ARM64 application with `qemu-aarch64 -L /usr/aarch64-linux-gnu/ target/aarch64-unknown-linux-gnu/debug/rust-tiny-wasm`
- To build on a native ARM64 target in the github CI, use `runs-on: ubuntu-24.04-arm`.

### References

- [Getting started with Rust](https://rust-lang.org/learn/get-started/)
- [A guide to cross-compilation in Rust by Greg Stoll](https://blog.logrocket.com/guide-cross-compilation-rust/)


## Chapter 2 - WebAssembly Bytecode Parser

- [ ] Parse a WebAssembly module (`.wasm` binary format) and print the length and content (opcodes) of the code section.
- [ ] Print the names of all exported functions.

### Detailed Description

- You can implement your own parser or use an off-the-shelf library.