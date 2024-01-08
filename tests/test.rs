use std::path::Path;
use std::process::Command;
use wasmtime::{
    Engine,
    Module,
    Store,
    Instance,
};

fn print_output(output: &std::process::Output) {
    let stderr = String::from_utf8(output.stderr.clone()).unwrap();
    let stdout = String::from_utf8(output.stdout.clone()).unwrap();
    println!("\nSTDERR:\n\n{}", stderr);
    println!("\nSTDOUT:\n\n{}", stdout);
}

/// Compiles a wasm module with rWasm using the given arguments, then runs it
/// using a small wrapper crate, and compares the result with the result of
/// running the original wasm module with wasmtime.
/// The module must export a `run` function of type `i32 -> i32`.
fn run_test(path: &Path, args: &[String]) {

    // remove ./generated
    let _ = Command::new("rm")
        .arg("-r")
        .arg("./generated")
        .output()
        .expect("Failed to remove ./generated");

    // transpile with rWasm
    let output = Command::new("cargo")
        .arg("run")
        .arg("--")
        .arg(path)
        .arg("./generated") // TODO why does it not work without this?
        .arg("--crate-name")
        .arg("sandbox-generated")
        .args(args)
        .output()
        .expect("Failed to transpile");
    print_output(&output);
    assert!(output.status.success());

    // run the wasm module
    let output = Command::new("cargo")
        .arg("run")
        .current_dir(Path::new("tests/generated-wrapper"))
        .output()
        .expect("Failed to build generated Rust crate");
    print_output(&output);
    assert!(output.status.success());

    // extract the result
    let res1 = String::from_utf8(output.stdout.clone())
        .unwrap()
        .trim()
        .parse::<i32>()
        .unwrap();

    // run the original wasm module with wasmtime
    let engine = Engine::default();
    let mut store = Store::new(&engine, ());
    let module = Module::from_file(store.engine(), path).unwrap();
    let instance = Instance::new(&mut store, &module, &[]).unwrap();
    let run = instance.get_typed_func::<i32, i32>(&mut store, "run").unwrap();
    let res2 = run.call(&mut store, 12).unwrap();

    assert_eq!(res1, res2);
}

#[test]
fn fibonacci() {
    let p = Path::new("tests/wasm/fib.wasm");
    run_test(&p, &[]);
    run_test(&p, &[
        "--fixed-mem-size".to_string(),
        "16".to_string(),
    ]);
    run_test(&p, &[
        "--fixed-mem-size".to_string(),
        "32".to_string(),
        "--no-alloc".to_string(),
    ]);
}

// #[test]
// fn hello_wasi() {
//     let p = Path::new("tests/wasm/hello_wasi.wasm");
//     run_test(&p, &[
//         "--wasi-executable".to_string(),
//         "--wasi-library".to_string(),
//     ]);
// }