#[no_mangle]
pub fn run(n: i32) -> i32 {
    println!("Hello, wasi!");
    n
}