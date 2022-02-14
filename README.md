# rWasm

A cross-platform high-performance provably-safe sandboxing
Wasm-to-native compiler.

As a sandboxing compiler, rWasm produces code whose execution (under
any possible input) cannot use any memory outside the space provided
to it at compile time, nor can it jump to arbitrary code outside of
the explicitly provided interface. Being provably-safe, rWasm comes
with an informal proof of the safety of its sandbox, which can be
found in our [paper](#publications). At a high-level, it obtains this
through the power of `unsafe`-free Rust!  However, note that this does
not guarantee that the code must execute correctly (although we try to
faithfully maintain the semantics of the input Wasm, with semantic
assurance provided by the
[wasm-semantics-fuzzer](https://github.com/secure-foundations/wasm-semantics-fuzzer)),
nor does it guarantee that the API boundary is even reasonable (rWasm
just guarantees that the compile-time requested boundary is
maintained).

## Usage

Requires Rust to build and use. Use [`rustup`](https://rustup.rs/) to
install Rust if necessary.

Most compilation with rWasm looks like `cargo run -- {input.wasm}
{output}` followed by `cd output && cargo run --release`.

Side note: `cargo run` performs both the compile and build step; if
you want to do it separately, run `cargo build --release` followed by
`cargo run --release` (which will then use the cached build).

As an example, `examples/hello-wasi.wasm` (a simple Wasm program that
prints "Hello World!" and exits) can be compiled and run using:
```sh
cargo run -- --wasi-executable examples/hello-wasi.wasm output
(cd output && cargo run --release)
```

For more options, including tracers, experimental
performance-modifying options, etc., run `cargo run -- --help` in the
current directory.

## Related Projects

+ [vWasm](https://github.com/secure-foundations/vWasm): a
  formally-verified provably-safe sandboxing compiler, built in F*
+ [wasm-semantics-fuzzer](https://github.com/secure-foundations/wasm-semantics-fuzzer):
  a tool for providing greater assurance in the semantic correctness
  of any Wasm implementation

## License

BSD 3-Clause License. See [LICENSE](./LICENSE).

## Publications

**Provably-Safe Multilingual Software Sandboxing using WebAssembly**.
Jay Bosamiya, Wen Shih Lim, and Bryan Parno. To Appear in Proceedings
of the USENIX Security Symposium, August, 2022.

```bibtex
@inproceedings{provably-safe-sandboxing-wasm,
  author    = {Bosamiya, Jay and Lim, Wen Shih and Parno, Bryan},
  booktitle = {To Appear in Proceedings of the USENIX Security Symposium},
  month     = {August},
  title     = {Provably-Safe Multilingual Software Sandboxing using {WebAssembly}},
  year      = {2022}
}
```
