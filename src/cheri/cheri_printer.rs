use crate::cheri::function::*;
use crate::printer::get_memory_backing_size;
use crate::wasm;
use crate::CmdLineOpts;
use crate::Maybe;
use color_eyre::eyre::eyre;

fn print_global_initializer(g: &wasm::syntax::Global) -> Maybe<String> {
    if g.init.0.len() != 1 {
        return Err(eyre!(
            "Currently unsupported expression for global initialization (bad-len): {:?}",
            g.init.0
        ))?;
    }
    match &g.init.0[0] {
        wasm::syntax::Instr::Const(c) => {
            let cast_func = match c {
                wasm::syntax::Const::I32(_) => "from_i32",
                wasm::syntax::Const::I64(_) => "from_i64",
                wasm::syntax::Const::F32(_) => "from_f32",
                wasm::syntax::Const::F64(_) => "from_f64",
            };
            Ok(format!("{}({})", cast_func, c.to_c_string()))
        }
        wasm::syntax::Instr::MSWasm(wasm::syntax::mswasmop::Op::HandleNull) => {
            // MSWasm-cheri passthrough design
            Ok("NULL".to_string())
        }
        _ => Err(eyre!(
            "Currently unsupported expression for global initialization (non-const): {:?}",
            g.init.0[0]
        ))?,
    }
}

fn get_elem_offset(e: &wasm::syntax::Elem) -> Maybe<usize> {
    if e.offset.0.len() != 1 {
        return Err(eyre!("Currently unsupported expression for elem offset"))?;
    }
    if let wasm::syntax::Instr::Const(c) = &e.offset.0[0] {
        match c {
            wasm::syntax::Const::I32(c) => Ok(*c as usize),
            wasm::syntax::Const::I64(c) => Ok(*c as usize),
            _ => Err(eyre!("Invalid floating offset")),
        }
    } else {
        Err(eyre!("Currently unsupported expression for elem offset"))
    }
}

fn print_elem(
    ctx_name: &str,
    m: &wasm::syntax::Module,
    e: &wasm::syntax::Elem,
    num_elems: usize,
) -> Maybe<String> {
    if e.table.0 != 0 {
        return Err(eyre!("Current version of WASM supports only 1 table"))?;
    }
    if e.offset.0.len() != 1 {
        return Err(eyre!("Currently unsupported expression for elem offset"))?;
    }
    let offset = get_elem_offset(e)?;
    if e.offset.0.len() != 1 {
        return Err(eyre!("Currently unsupported expression for elem offset"))?;
    }

    if offset + e.init.len() > num_elems {
        return Err(eyre!("OOB element initializer"))?;
    }

    let insertions = e
        .init
        .iter()
        .enumerate()
        .map(|(i, f)| {
            format!(
                "{}->indirect_call_table[{}] = &__rwasm_{}_{};",
                ctx_name,
                offset + i,
                m.names.functions[f],
                f.0,
            )
        })
        .collect::<Vec<_>>()
        .join("\n");
    Ok(format!("{}", insertions))
}

fn print_elems(
    _ctx_name: &str,
    m: &wasm::syntax::Module,
    elem: &[wasm::syntax::Elem],
) -> Maybe<String> {
    // Figure out how big the table needs to be
    let max_elem = elem
        .iter()
        .map(|e| e.init.len() + get_elem_offset(e).unwrap())
        .max();

    let call_table_alloc = match max_elem {
        Some(max_e) => format!("calloc({}, sizeof(Handle))", max_e + 1),
        None => "calloc(1, sizeof(Handle))".to_string(),
    };

    let elem_inits = match max_elem {
        Some(max_e) => elem
            .iter()
            .map(|e| print_elem("ctx", m, e, max_e))
            .collect::<Maybe<Vec<_>>>()?
            .join("\n"),
        None => String::new(), // no elements
    };

    Ok(format!(
        "ctx->indirect_call_table = {};\n{}",
        call_table_alloc, elem_inits
    ))
}

fn get_data_offset(d: &wasm::syntax::Data) -> Maybe<usize> {
    if d.offset.0.len() != 1 {
        return Err(eyre!("Currently unsupported expression for data offset"))?;
    }
    if let wasm::syntax::Instr::Const(c) = &d.offset.0[0] {
        match c {
            wasm::syntax::Const::I32(c) => Ok(*c as usize),
            wasm::syntax::Const::I64(c) => Ok(*c as usize),
            _ => Err(eyre!("Invalid floating offset")),
        }
    } else {
        Err(eyre!("Currently unsupported expression for daat offset"))
    }
}

fn print_data(_self_name: &str, d: &wasm::syntax::Data, opts: &CmdLineOpts) -> Maybe<String> {
    if d.data.0 != 0 {
        return Err(eyre!("Current version of WASM supports only 1 memory"))?;
    }

    if d.mswasm_init_handles.len() > 0 && !opts.ms_wasm {
        unreachable!(
            "Requesting handle initialization in non MSWasm mode. \
             Should never happen, due to the parser performing the option check"
        )
    }

    let offset = get_data_offset(d)?;

    let _len = d.init.len();

    let bytes = d
        .init
        .iter()
        .map(|b| format!("{}", b))
        .collect::<Vec<_>>()
        .join(", ");

    let mswasm_extra_initialization = {
        d.mswasm_init_handles
            .iter()
            .map(|i| {
                let hoffset = i.offset as usize;
                let hsize = i.size as usize;
                let newseg = if hsize == 0 {
                    // MSWasm-cheri passthrough design
                    "NULL".into()
                } else {
                    format!("rwasm_alloc({})", hsize)
                };

                let storehandle =
                    format!("handle_store(init_handle + {}, newseg);", offset + hoffset);

                Ok(format!("{{ Handle newseg = {}; {} }}", newseg, storehandle,))
            })
            .collect::<Maybe<Vec<_>>>()?
            .join("\n")
    };

    // MSWasm-cheri passthrough design
    Ok(format!(
        "memcpy(init_handle + {}, (u8[]){{ {} }}, {});{}",
        offset,
        bytes,
        d.init.len(),
        mswasm_extra_initialization,
    ))
}

fn print_export(
    m: &wasm::syntax::Module,
    e: &wasm::syntax::Export,
    _opts: &CmdLineOpts,
) -> Maybe<String> {
    match e.desc {
        wasm::syntax::ExportDesc::Func(fn_idx) => {
            let _f = m
                .funcs
                .get(fn_idx.0 as usize)
                .ok_or(eyre!("Invalid function for export"))?;

            //void (*p)() = fn;//function pointer

            Ok(format!(
                "{} = {};",
                print_fn_ptr(m, format!("__{}", &e.name), fn_idx)?,
                format!("__rwasm_{}_{}", m.names.functions[&fn_idx], fn_idx.0),
                //fn_idx.0
            ))

            // Ok(format!(
            //     "impl WasmModule {{
            //          {}pub fn {}{} {{
            //              self.func_{}({})
            //          }}
            //      }}",
            //     non_snake_case_suppression,
            //     name,
            //     print_function_signature(m, f)?,
            //     fn_idx.0,
            //     (0..m
            //         .types
            //         .get(f.typ.0 as usize)
            //         .ok_or(eyre!(
            //             "Invalid type index {} for exported function",
            //             f.typ.0
            //         ))?
            //         .from
            //         .0
            //         .len())
            //         .map(|i| format!("arg_{}", i))
            //         .collect::<Vec<_>>()
            //         .join(", "),
            // ))
        }
        wasm::syntax::ExportDesc::Table(_tbl_idx) => {
            Err(eyre!("Currently unsupported table export"))?
        }
        wasm::syntax::ExportDesc::Mem(mem_idx) => {
            assert_eq!(mem_idx.0, 0);
            Ok("Handle get_memory(WasmModule* ctx){
                    assert(false); // Memory export currently unimplemented for MS Wasm
                }"
            .to_string())
        }
        wasm::syntax::ExportDesc::Global(glb_idx) => {
            // TODO: should probably instead expose getters and setters
            // and hide setters if the global is not mutable
            let wasm::syntax::GlobalType(_mutable, typ) = m
                .globals
                .get(glb_idx.0 as usize)
                .ok_or(eyre!("Invalid global for export"))?
                .typ;
            Ok(format!("extern {} {};", typ, e.name))
        }
    }
}

fn print_generated_header_prefix(_m: &wasm::syntax::Module, opts: &CmdLineOpts) -> Maybe<String> {
    let wasm_module = format!(
        "typedef struct WasmModule {{
            Handle* indirect_call_table;
            void* mem;
            union TaggedVal* globals;
            Handle* global_handles;
            {counting_extensions}{wasi_context}
         }} WasmModule;",
        wasi_context = if opts.generate_wasi_executable {
            "WasiCtx* wasi_ctx;" // TODO: Figure out how to link cheri-C code against WASI
        } else {
            ""
        },
        counting_extensions = {
            let mut s = String::new();
            if opts.instruction_counting {
                s += "uint64_t instruction_count;";
            }
            if opts.memory_op_counting {
                s += "uint64_t load_count;";
                s += "uint64_t store_count;";
            }
            if opts.ms_wasm_segment_counting {
                s += "uint64_t segment_new_count;";
                s += "uint64_t segment_free_count;";
            }
            s
        },
    );
    // TODO: emit as header library inside an "include" directory rather than as one huge file
    // seperate out data/declarations and code
    // seperate out unchanging runtime code like (like wasi and rlbox support) into a "rt" directory
    let header_prologue = include_str!("../../templates-for-generation/cheri/prologue.h");
    let rlbox_support = include_str!("../../templates-for-generation/cheri/rlbox_support.h");
    let cheri_wasi = include_str!("../../templates-for-generation/cheri/cheri_wasi.h");

    Ok(format!(
        "{}\n\n{}\n\n{}\n\n{}\n\n",
        header_prologue, wasm_module, rlbox_support, cheri_wasi
    ))
}

pub fn print_module(m: &wasm::syntax::Module, opts: &CmdLineOpts) -> Maybe<()> {
    let wasm::syntax::Module {
        types: _, // Not used for printing
        funcs,
        tables: _, // Not used for printing
        mems: _,   // Handled internally by auxiliary functions
        globals,
        elem,
        data,
        start: _,   // TODO: Use this to create a start function
        imports: _, // TODO: Will we be supporting this?
        exports,
        names: _, // Not used for printing
    } = m;

    let mut generated: String =
        include_str!("../../templates-for-generation/cheri/prologue.c").to_string();
    let mut generated_header = print_generated_header_prefix(m, opts)?;
    // generated_header += include_str!("../../templates-for-generation/cheri/prologue.h");

    let (mem_size, _) = get_memory_backing_size(m, opts)?;

    // Print the module initializer
    generated += "\n";
    generated += &format!(
        "
        WasmModule* new_wasm_module(i32 argc, Handle argv) {{
            WasmModule* ctx = rwasm_alloc(sizeof(WasmModule));
            ctx->indirect_call_table = NULL;
            ctx->mem = NULL;
            ctx->globals = calloc({num_globals}, sizeof(TaggedVal));
            ctx->global_handles = calloc({num_globals}, sizeof(Handle));
            {counting_extensions}{context}
            {printed_globals}
            {printed_elems}
            {printed_data_prefix}{printed_data}
            return ctx;
         }}\n",
        context = if opts.generate_wasi_executable {
            "ctx->wasi_ctx = new_wasi_ctx(argc, argv);"
        } else {
            ""
        },
        counting_extensions = {
            let mut s = String::new();
            if opts.instruction_counting {
                s += "ctx->instruction_count = 0;";
            }
            if opts.memory_op_counting {
                s += "ctx->load_count = 0;\nctx->store_count = 0;";
            }
            if opts.ms_wasm_segment_counting {
                s += "ctx->segment_new_count = 0;\nctx->segment_free_count= 0;";
            }
            s
        },
        num_globals = globals.len(),
        //globals_size = globals.len(),
        printed_globals = globals
            .iter()
            .enumerate()
            .map(|(i, g)| {
                let container = match g.typ.1 {
                    wasm::syntax::ValType::Handle => "global_handles",
                    _ => "globals",
                };

                Ok(format!(
                    "ctx->{}[{}] = {};",
                    container,
                    i,
                    print_global_initializer(g)?
                ))
            })
            .collect::<Maybe<Vec<_>>>()?
            .join("\n"),
        printed_elems = print_elems("ctx", &m, elem)?,
        printed_data_prefix = if opts.ms_wasm {
            format!(
                "Handle init_handle = rwasm_alloc({});ctx->mem = init_handle;\n{}\n{}\n",
                mem_size,
                if globals.len() >= 2 {
                    "ctx->global_handles[1] = init_handle; /* WORKAROUND for mswasm-llvm and data segment initialization */"
                } else {
                    ""
                },
                if opts.ms_wasm_segment_counting {
                    "ctx->segment_new_count += 1;"
                } else {
                    ""
                },
            )
        } else {
            "".into()
        },
        printed_data = data
            .iter()
            .map(|d| print_data("ctx", d, opts))
            .collect::<Maybe<Vec<_>>>()?
            .join("\n"),
    );
    dbgprintln!(0, "Generated module initializer");

    generated += "\n";
    generated += "
    // TODO: implement a full destructor once we use a partitioned allocator design
    void destroy_wasm_module(WasmModule* ctx) {{
        free(ctx->indirect_call_table);
        free(ctx->mem);
        free(ctx);
    }}
    ";

    dbgprintln!(0, "Generated module destructor");

    // Print the functions
    generated += "\n";
    // generated += "impl WasmModule {\n";
    for (i, _f) in funcs.iter().enumerate() {
        generated += &print_function(&m, wasm::syntax::FuncIdx(i as u32), opts)?;
    }
    //generated += "}\n";
    dbgprintln!(0, "Generated functions");

    // emit function signatures
    for (i, _f) in funcs.iter().enumerate() {
        let fn_idx = wasm::syntax::FuncIdx(i as u32);
        generated_header += &format!(
            "{};\n",
            print_function_signature(
                &m,
                format!("__rwasm_{}_{}", m.names.functions[&fn_idx], fn_idx.0),
                fn_idx
            )?
        );
    }

    // // Print the CallIndirect dispatch
    // generated += "\n";
    // if opts.type_based_indirect_calls {
    //     generated += &print_type_based_indirect_call_dispatch(m)?;
    // } else {
    //     generated += &print_indirect_call_dispatch(m)?;
    // }
    // generated += "\n";
    // dbgprintln!(0, "Generated CallIndirect redirector");

    generated += "\n";
    // Print the exports to the header
    generated_header += &exports
        .iter()
        .map(|e| print_export(m, e, opts))
        .collect::<Maybe<Vec<_>>>()?
        .join("\n\n");
    generated_header += "\n";
    dbgprintln!(0, "Generated exports");

    // generated += &format!("

    // if opts.instruction_counting || opts.memory_op_counting || opts.ms_wasm_segment_counting {
    //     generated += "\n";
    //     generated += "
    //       impl WasmModule {
    //          #[allow(dead_code)]
    //          fn counting_extension_report(&self) {";
    //     if opts.instruction_counting {
    //         generated += r#"eprintln!("Instructions executed: {}", self.instruction_count);"#;
    //     }
    //     if opts.memory_op_counting {
    //         generated += r#"eprintln!("Memory loads executed: {}", self.load_count);"#;
    //         generated += r#"eprintln!("Memory stores executed: {}", self.store_count);"#;
    //     }
    //     if opts.instruction_counting && opts.memory_op_counting {
    //         generated += r#"eprintln!("Memory operations were {} of all instructions executed",
    //                           (self.load_count as f64 + self.store_count as f64) /
    //                              (self.instruction_count as f64)
    //                         );"#;
    //     }
    //     if opts.ms_wasm_segment_counting {
    //         generated += r#"eprintln!("New segments allocated: {}", self.segment_new_count);"#;
    //         generated += r#"eprintln!("Segments free'd: {}", self.segment_free_count);"#;
    //     }
    //     generated += "
    //          }
    //       }";
    //     generated += "\n";
    // }

    // Generate the `main` function if we are generating a WASI executable
    if opts.generate_wasi_executable {
        let exported_start_functions: Vec<_> = exports
            .iter()
            .filter(|e| {
                if e.name == "_start" || e.name == "_main" {
                    match e.desc {
                        wasm::syntax::ExportDesc::Func(_) => true,
                        _ => false,
                    }
                } else {
                    false
                }
            })
            .collect();
        if exported_start_functions.len() == 1 {
            let start_func_name = &exported_start_functions[0].name;
            if start_func_name != "_start" {
                println!(
                    "WARNING: Non-standard start function name found: `{}`. \
                     Expected `_start` (see https://github.com/WebAssembly/WASI/blob/master/\
                     design/application-abi.md#current-unstable-abi).",
                    start_func_name
                );
            }

            if opts.generate_as_wasi_library {
                generated += &format!(
                    "WasmModule* init_module(i32 argc, Handle argv) {{
                         WasmModule* ctx = new_wasm_module(argc, argv);
                         __{}(ctx);
                         return ctx;
                     }}",
                    start_func_name,
                );
                dbgprintln!(0, "Generated main WASI library init function");
            } else {
                generated += &format!(
                    "int main(i32 argc, char** argv) {{
                        WasmModule* ctx = new_wasm_module(argc, argv);
                        __{}(ctx);
                        return 0;
                     }}",
                    start_func_name,
                );
                dbgprintln!(0, "Generated main function for WASI executable");
            }
        } else {
            return Err(eyre!(
                "Expected _start function to be exported (see {}). Found {} such functions.",
                "https://github.com/WebAssembly/WASI/blob/master/\
                 design/application-abi.md#current-unstable-abi",
                exported_start_functions.len()
            ));
        }
    }

    // let generated = if opts.panic_early_rather_than_trap {
    //     generated
    //         .replace(")?", ").unwrap()")
    //         .replace("ok().unwrap()", "unwrap()")
    // } else {
    //     generated
    // };

    // std::fs::create_dir_all(&opts.output_directory)?;
    // print_cargo_toml(opts)?;
    // let src_dir = opts.output_directory.join("src");
    // std::fs::create_dir_all(&src_dir)?;
    let generated_file_path = format!("{}.c", opts.output_directory.to_str().unwrap());
    let generated_header_path = format!("{}.h", opts.output_directory.to_str().unwrap());
    // include header in the generated C file
    generated = format!(
        "#include \"{}.h\"\n",
        opts.output_directory.file_name().unwrap().to_string_lossy()
    ) + &generated;

    // add suffix to generated header
    generated_header += &format!(
        "    
    #ifdef __cplusplus
    }}
    #endif

    #endif /* WASM_RT_H_ */"
    );

    std::fs::write(&generated_file_path, generated)?;
    // TODO: Actually generate the header:
    // 1. boilerplate
    // 2. exports
    std::fs::write(&generated_header_path, generated_header)?;

    // if opts.generate_wasi_executable {
    //     std::fs::write(
    //         src_dir.join("guest_mem_wrapper.rs"),
    //         include_str!("../templates-for-generation/guest_mem_wrapper.rs"),
    //     )?;
    // }
    println!("Finished generating");
    if !opts.prevent_reformat {
        std::process::Command::new("clang-format")
            .arg("-i") // format in-place
            .arg(&generated_file_path) // format C file
            .arg(&generated_header_path) // format header
            .status()?;
        println!("Finished reformatting")
    }

    Ok(())
}
