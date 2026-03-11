[![Build Status](https://github.com/henrythasler/rust-tiny-wasm/actions/workflows/build-aarch64.yml/badge.svg)](https://github.com/henrythasler/rust-tiny-wasm/actions/workflows/build-aarch64.yml) [![Coverage Status](https://coveralls.io/repos/github/henrythasler/rust-tiny-wasm/badge.svg?branch=main)](https://coveralls.io/github/henrythasler/rust-tiny-wasm?branch=main)

# Rust-Tiny-Wasm

A [WebAssembly](https://webassembly.org/) Compiler and Runtime for ARM64 (aarch64) written in [Rust](https://rust-lang.org/) based on [Tiny-Wasm](https://github.com/henrythasler/wasm-playground).

My goal is to split this into small chapters with very specific goals, additional documentation and a detailled solution description along the way. It can eventually be a good learing experience for others that want to start working with Rust and WebAssembly compilers.

## About Gen-AI Tools

Here are some guidelines about how to use Gen-AI tools in the context of this tutorial. It's you who wants to learn something new after all.

1. Gen-AI makes mistakes. It will sell you false statements wrapped in fancy (technical) language. Keep in mind that the compiler is always correct :-).
2. Have Gen-AI explain concepts and architecture. Ask for detailled explanations and why something is "the recommended" solution.
3. Ask for options how to solve a specific problem to make an informed decision about which option to use or ask again if you are not fully satisfied.
4. Use code snippets or generated code sparsely. Make sure you understand the generated code and could explain most of it to a peer programmer.

## Chapter 1 - Toolchain Setup

The very first chapter is about installing and setting up the Rust toolchain locally and in the CI.

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
- [Effortless Cross-Compilation for Rust: Building for Any Platform by Yen Wang](https://medium.com/rust-rock/effortless-cross-compilation-for-rust-building-for-any-platform-6cce81558123)


## Chapter 2 - WebAssembly Bytecode Parser

### Goals

- [x] Parse a WebAssembly module (`.wasm` binary format) and print the length and content (opcodes) of the code section.
- [x] Print the names of all exported functions.

### Detailed Description

- You can implement your own parser or use an off-the-shelf library.

## Chapter 3 - Code Execution

In this chapter we will investigate how we can run JIT code in Rust. To simplify this step, the JIT code is already available and we can focus on creating a runtime to call it. Note that the JIT code is for ARM64 so it needs to be run on an ARM64 machine or emulator:

```rust
let jit_code: Vec<u32> = vec![0x0b000020, 0xd65f03c0];
```

The function it implements is:

```cpp
int add(int num1, int num2){
    return num1 + num2;
}
```

or written in arm assembly:

```assembly
add:
    add w0, w1, w0
    ret
```

### Goals

- [x] Extend the main.rs with argument parsing capabilities for two numbers (addends).
- [x] Create a basic runtime that copies the JIT code into an executable memory region on the heap.
- [x] Ensure that the instruction cache on ARM64 is cleared before executing the JIT code.
- [x] Call the JIT code from the main function using the parsed arguments and print the result (sum).
- [x] Write some unit- and integration-tests. Ensure the test coverage for your own code is above 85%.

### Detailled Description

- Unit-Tests calling JIT-code for ARM64 also need to be run on an ARM64 machine or emulator.
- Make sure to structure [the project](https://doc.rust-lang.org/book/ch07-05-separating-modules-into-different-files.html) and [it's tests](https://doc.rust-lang.org/book/ch11-03-test-organization.html) according to the official guidelines.
- Do not forget to [add comments](https://doc.rust-lang.org/book/ch03-04-comments.html).
- Maybe also try [Documentation testing](https://doc.rust-lang.org/rust-by-example/testing/doc_testing.html).

### References

- [Just Programmer's Manual](https://just.systems/man/en/)
- [clap Command Line Argument Parser for Rust](https://github.com/clap-rs/clap)

## Chapter 4 - AArch64 Instruction Set Architecture

Picking up our simple example from the previous chapter:

```assembly
add:
    add w0, w1, w0
    ret
```

This time, we will start with an empty vector `let mut jit_code: Vec<u32> = Vec::new();` and emit the JIT-code using a very simple assembler.

### Goals

- [x] Make yourself familiar with the [AArch64 Instruction Set Architecture](https://developer.arm.com/documentation/102374/0103?lang=en) in general.
- [x] Learn how the `add` and `ret` instructions are [encoded](https://developer.arm.com/documentation/ddi0602/2025-09/Base-Instructions/ADD--shifted-register---Add-optionally-shifted-register-?lang=en).
- [x] Implement a basic assembler that encodes these two instructions.
- [x] Encode `add w0, w1, w0` and `ret` into the `jit_code` vector.
- [x] Call the JIT code generated with this new method from the main function using the parsed arguments and print the result (sum).
- [x] Ensure the code coverage is 100% for the assembler module and it's submodules.
- [ ] Ensure all assembler-related functions are properly documented.

## Chapter 5 - The First Assembler

In this chapter, we will compile and run our first WebAssembly function.

### Detailled Description

WebAssembly modules usually provide a predefined entry-function called `_start`. 

### Goals

- [x] Make yoursef familiar with the [Binary Format](https://www.w3.org/TR/wasm-core-1/#binary-format) of a WebAssembly module.
- [x] Inspect the binary structure of the module `tests/assets/skeleton.wasm` using [WebAssembly Code Explorer ](https://wasdk.github.io/wasmcodeexplorer/) or a similar tool.
- [x] Load and parse the Webassembly module `tests/assets/skeleton.wasm` using a command line parameter.
- [x] Compile the exported `_start` function to JIT code for ARM64.
- [x] Ensure the function has a proper [prologue and epilogue](https://mariokartwii.com/arm64/ch25.html).
- [x] Run the JIT code using your existing runtime.
- [x] Complete the chapter by adding unit-tests and documentation
- [ ] Optional: Implement and use a control stack structure and related instructions to track entering and leaving a function.

### Detailled Description

Strictly following the WebAssembly specification, even this empty function would require branch-instructions and address backpatching. It is up to you to already implement this or simplify the compiler and wait for later chapters that explicitly explain and require these techniques.