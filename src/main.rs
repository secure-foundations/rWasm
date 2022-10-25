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

mod cheri;
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
    /// Add instruction counting (Warning: experimental performance impact)
    #[clap(long)]
    instruction_counting: bool,
    /// Add memory operation counting (Warning: experimental performance impact)
    #[clap(long)]
    memory_op_counting: bool,
    /// Add MSWasm segment new/free counting (Warning: experimental performance impact)
    #[clap(long)]
    ms_wasm_segment_counting: bool,
    /// Restrict instruction tracing only to provided function names
    #[clap(long, name = "function")]
    restrict_instruction_tracing_to: Vec<String>,
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
    /// Switch over to MS-Wasm, rather than regular Wasm. This
    /// requires that the original file be compiled with MS-Wasm in
    /// the first place.
    #[clap(long)]
    ms_wasm: bool,
    /// Use a packed representation for MSWasm tags. (Warning: experimental performance impact)
    #[clap(long)]
    ms_wasm_packed_tags: bool,
    /// Disable storing MSWasm tags which distinguish between data and
    /// handles. This allows greater performance at the cost of
    /// allowing handle integrity violations. Use cautiously.
    #[clap(long)]
    ms_wasm_no_tags: bool,
    /// Use MS-Wasm baggy-bounds backend. Implies --ms-wasm (and potentially other relevant
    /// options). Warning: the safety guarantees provided by this backend are slightly different
    /// from the standard backend, and the difference is subtle. It _does_ introduce `unsafe` in a
    /// controlled fashion in the resulting codebase.
    #[clap(long)]
    ms_wasm_baggy_bounds: bool,
    /// Generate a `no_std` library, limiting usage to `core` and `alloc`
    #[clap(long)]
    no_std_library: bool,
    /// Rather than a trap being bubbled up to be handled at the
    /// exported function call, handle it immediately by
    /// panicing. Enabled by default if in WASI executable (not
    /// library) mode
    #[clap(long)]
    panic_early_rather_than_trap: bool,

    /// Rather than outputting Rust, output Cheri-C
    #[clap(long)]
    cheri: bool,
}

fn main() -> Maybe<()> {
    color_eyre::install()?;

    let mut opts = CmdLineOpts::parse();

    DEBUG_PRINT_LEVEL.store(opts.debug, std::sync::atomic::Ordering::Relaxed);

    if opts.restrict_instruction_tracing_to.len() > 0 && !opts.instruction_tracing {
        return Err(eyre!(
            "Must use --instruction-tracing when using --restrict-instruction-tracing-to"
        ));
    }
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
    if opts.ms_wasm_no_tags {
        opts.ms_wasm = true;
    }
    if opts.ms_wasm_baggy_bounds {
        opts.ms_wasm = true;
        opts.unsafe_linear_memory = true;
    }
    if opts.ms_wasm_packed_tags {
        opts.ms_wasm = true;
        if opts.ms_wasm_no_tags {
            return Err(eyre!("Cannot have packed no-tags"));
        }
    }
    if opts.ms_wasm_segment_counting {
        if !opts.ms_wasm {
            return Err(eyre!(
                "MSWasm segment counting IRM can only be used on MSWasm code"
            ));
        }
    }

    let inp = std::fs::read(&opts.input_path)?;
    println!("Finished reading");
    let module = parser::parse(
        parser::ParserOpts {
            ms_wasm: opts.ms_wasm,
        },
        &inp,
    )?;
    println!("Finished parsing");
    if opts.cheri {
        cheri::cheri_printer::print_module(&module, &opts)?;
    } else {
        printer::print_module(&module, &opts)?;
    }

    println!("Finished");

    Ok(())
}
