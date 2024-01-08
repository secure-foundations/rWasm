use sandbox_generated::WasmModule;

fn main() {
    let mut module = WasmModule::new();
    println!("{}", module.run(12).unwrap_or(-1));
}
