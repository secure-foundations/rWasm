use clap::Parser;

pub static DEBUG_PRINT_LEVEL: std::sync::atomic::AtomicU8 = std::sync::atomic::AtomicU8::new(0);
macro_rules! dbgprintln {
    ($level:literal, $($body:tt)*) => {
        if dbg_print_level!() > $level {
            eprintln!("DEBUG[{}] {}", $level, format_args!($($body)*));
        }
    };
}
macro_rules! dbg_print_level {
    () => {
        crate::DEBUG_PRINT_LEVEL.load(std::sync::atomic::Ordering::Relaxed)
    };
}

mod parser;
mod printer;
mod wasm;

type Maybe<T> = color_eyre::eyre::Result<T>;
use color_eyre::eyre::eyre;

const PROGRAM_NAME: &'static str = env!("CARGO_PKG_NAME", "expected to be built with cargo");
const PROGRAM_VERSION: &'static str = env!("CARGO_PKG_VERSION", "expected to be built with cargo");
const PROGRAM_AUTHORS: &'static str = env!("CARGO_PKG_AUTHORS", "expected to be built with cargo");

/// A compiler from WebAssembly to safe Rust.
#[derive(Parser)]
#[clap(version = PROGRAM_VERSION, author = PROGRAM_AUTHORS)]
pub struct CmdLineOpts {
    /// Path to the input .wasm file
    input_path: std::path::PathBuf,
    /// Path to output directory
    #[clap(default_value = "./generated")]
    output_directory: std::path::PathBuf,
    /// Customize the name of the generated Rust crate
    #[clap(long)]
    crate_name: Option<String>,
    /// Prevent reformatting, for debug purposes
    #[clap(short, long)]
    prevent_reformat: bool,
    /// Enable debugging (can be used multiple times)
    #[clap(short, parse(from_occurrences))]
    debug: u8,
    /// Generate a WASI binary
    #[clap(short = 'w', long = "wasi-executable")]
    generate_wasi_executable: bool,
    /// Make the WASI-linked binary a library instead (implies -w)
    #[clap(long = "wasi-library")]
    generate_as_wasi_library: bool,
    /// Add function level tracing
    #[clap(long)]
    function_tracing: bool,
    /// Add function level return value tracing
    #[clap(long)]
    function_return_tracing: bool,
    /// Add instruction level tracing (Warning: ugly and slow)
    #[clap(long)]
    instruction_tracing: bool,
    /// Add memory load/store tracing (Warning: ugly and slow)
    #[clap(long)]
    memory_tracing: bool,
    /// Inlines indirect calls (Warning: experimental performance impact)
    #[clap(long)]
    inline_indirect_calls: bool,
    /// Split indirect call dispatch based upon WASM types (Warning: experimental performance impact)
    #[clap(long)]
    type_based_indirect_calls: bool,
    /// Use memory wrapping to perform sandboxing (Warning: experimental performance impact)
    #[clap(long)]
    memory_wrapping: bool,
    /// Fix memory size in multiples of 64KiB (Warning: experimental performance impact)
    #[clap(long)]
    fixed_mem_size: Option<u32>,
    /// Allow unsafe accesses to linear memory (Warning: unsafe,
    /// except in conjunction with memory-wrapping mode)
    #[clap(long)]
    unsafe_linear_memory: bool,
    /// Prevent using an extra QWORD usage for speeding up memory
    /// wrapping, for debug purposes
    #[clap(long)]
    prevent_extra_mem_for_wrapping: bool,
    /// Generate a `no_std` library, limiting usage to `core` and `alloc`
    #[clap(long)]
    no_std_library: bool,
    /// Generate statically allocated, heapless code (implies --no-std-library,
    /// requires --fixed-mem-size)
    /// (Warning: experimental performance impact)
    #[clap(long)]
    no_alloc: bool,
}

fn main() -> Maybe<()> {
    color_eyre::install()?;

    let mut opts = CmdLineOpts::parse();

    DEBUG_PRINT_LEVEL.store(opts.debug, std::sync::atomic::Ordering::Relaxed);

    if opts.prevent_extra_mem_for_wrapping && !opts.memory_wrapping {
        return Err(eyre!(
            "Must use --memory-wrapping when using --prevent-extra-mem-for-wrapping"
        ));
    }
    if opts.inline_indirect_calls && opts.type_based_indirect_calls {
        return Err(eyre!(
            "Cannot use --inline-indirect-calls and --type-based-indirect-calls at same time"
        ));
    }
    if opts.no_std_library && opts.generate_wasi_executable {
        return Err(eyre!("WASI executable with no_std library unsupported."));
    }
    if opts.generate_as_wasi_library {
        opts.generate_wasi_executable = true;
    }
    if opts.no_alloc {
        if opts.fixed_mem_size.is_none() {
            return Err(eyre!("Must use --fixed-mem-size when using --no-alloc"));
        }
        opts.no_std_library = true;
    }

    let inp = std::fs::read(&opts.input_path)?;
    println!("Finished reading");
    let module = parser::parse(&inp)?;
    println!("Finished parsing");
    printer::print_module(&module, &opts)?;

    println!("Finished");

    Ok(())
}
