use crate::cheri::instr::print_instrs; // TODO: Remove circular dependence between instr.rs and this file
use crate::cheri::printer_state::*;
use crate::wasm;
use crate::CmdLineOpts;
use crate::Maybe;
use color_eyre::eyre::eyre;
// use crate::cheri::util::resulttype_in_out_vals;

// All function names are prefixed with a __ (two underscores)

// using when setting return types
pub fn return_type_or_void(mut v: Vec<String>) -> String {
    match v.len() {
        0 => "void".into(),
        1 => v.pop().unwrap(),
        _ => unimplemented!(), // C doesn't support returning tuples
    }
}

// Used when returning values
// pub fn return_value_or_none(mut v: Vec<String>) -> String {
//     match v.len() {
//         0 => "return;".into(),
//         1 => v.pop().unwrap(),
//         _ => unimplemented!(), // C doesn't support returning tuples
//     }
// }

// similar to print_inline_call in the Rust backend
// pub fn print_call(
//     m: &wasm::syntax::Module,
//     fn_idx: &wasm::syntax::FuncIdx,
//     stack_top_at_start_of_call: usize,
//     handle_stack_top_at_start_of_call: usize,
// ) -> Maybe<(wasm::syntax::FuncType, String)> {
//     // 1. Retrieve info about the function we are about to call
//     let callee: &wasm::syntax::Func = m
//         .funcs
//         .get(fn_idx.0 as usize)
//         .ok_or(eyre!("Invalid function {} being called", fn_idx.0))?;
//     let callee_typ = m.types.get(callee.typ.0 as usize).ok_or(eyre!(
//         "Invalid type index {} for callee function",
//         callee.typ.0
//     ))?;

//     let (num_val_args,num_handle_args) = resulttype_in_out_vals(&callee_typ.from);

//     // 2. Check arguments and determine the number of arguments
//     if stack_top_at_start_of_call < num_val_args  || handle_stack_top_at_start_of_call < num_handle_args {
//         return Err(eyre!(
//             "Trying to call function {} that requires {} arguments, \
//                     while only {} values are on stack",
//             fn_idx.0,
//             callee_typ.from.0.len(),
//             stack_top_at_start_of_call,
//         ));
//     }
//     let stack_base = stack_top_at_start_of_call - num_val_args;
//     let handle_stack_base = handle_stack_top_at_start_of_call - num_handle_args;

//     // 3. Build string of arguments

//     let mut val_idx = 0;
//     let mut handle_idx = 0;
//     let mut callee_args: Vec<String> = Vec::new();
//     for arg in callee_typ.from.0.iter(){
//         callee_args.push(
//             match arg {
//                 wasm::syntax::ValType::Handle => { let r = format!("c{}", handle_idx + handle_stack_base); handle_idx+= 1 ;r},
//                 t => { let r = format!("v{}.as_{}", val_idx + stack_base, t); val_idx += 1; r},
//         })
//     }
//     let callee_args = callee_args.join(", ");

//     // build the actual call
//     // println!("__func_{}() => {}", fn_idx.0, m.names.functions[fn_idx]);
//     let call = if callee_typ.from.0.len() == 0 {
//         // format!("__func_{}(ctx)", fn_idx.0)
//         format!("__rwasm_{}_{}(ctx)", m.names.functions[fn_idx], fn_idx.0)
//     } else {
//         format!("__rwasm_{}_{}(ctx, {})", m.names.functions[fn_idx], fn_idx.0, callee_args)
//     };

//     let call_code = match callee_typ.to.0.len() {
//         0 => format!("{};", call), // void function
//         1 => {
//             match callee_typ.to.0[0] {
//                 wasm::syntax::ValType::Handle => format!("c{} = {}", handle_stack_base, call),
//                 t => format!("v{} = from_{}({});", stack_base, t, call),
//         }
//     }, // put the return value on top of the stack
//         _ => unimplemented!(), // C does not support returning tuples
//     };

//     //let (num_val_args,num_handle_args) = resulttype_in_out_vals(&callee_typ.from);
//     //let (num_val_ret,num_handle_ret) = resulttype_in_out_vals(&callee_typ.to);
//     Ok((callee_typ.clone(), call_code))
// }

pub fn print_return(
    ps: &mut PrinterState,
    m: &wasm::syntax::Module,
    f: &wasm::syntax::Func,
    _opts: &CmdLineOpts,
    _fn_id: wasm::syntax::FuncIdx,
) -> Maybe<String> {
    let typ = m
        .types
        .get(f.typ.0 as usize)
        .ok_or(eyre!("Invalid type index {} for function", f.typ.0))?;
    let ret = if typ.to.0.len() > ps.total_stack_size().unwrap() {
        return Err(eyre!(
            "Insufficient values at end of stack. Expected {} got {}",
            typ.to.0.len(),
            ps.total_stack_size().unwrap()
        ));
    } else {
        // let (stack_ret,handle_stack_ret) = resulttype_in_out_vals(&typ.to);
        // let stack_base = ps.stack_size.unwrap() - stack_ret;
        // let handle_stack_base = ps.handle_stack_size.unwrap() - handle_stack_ret;

        // void
        if typ.to.0.len() == 0 {
            "return;".into()
        } else {
            assert!(typ.to.0.len() == 1);
            // assert!(stack_ret + handle_stack_ret == 1);
            // return handle or value from top of stack
            match typ.to.0[0] {
                wasm::syntax::ValType::Handle => format!("return {};", ps.pop_handle()),
                t => format!("return {}.as_{};", ps.pop_val(), t),
            }
        }
    };
    // TODO: implement return tracing?
    Ok(ret)
}

pub fn print_function_signature(
    m: &wasm::syntax::Module,
    name: String,
    id: wasm::syntax::FuncIdx,
) -> Maybe<String> {
    // 1. Retrieve function and its type
    let f = &m.funcs[id.0 as usize];
    let typ = m
        .types
        .get(f.typ.0 as usize)
        .ok_or(eyre!("Invalid type index {} for function", f.typ.0))?;

    let mut result = String::new();

    // 2. Add return type
    // First argument is always Vm Context
    let ret_ty = return_type_or_void(typ.to.0.iter().map(|t| format!("{}", t)).collect());
    if typ.from.0.len() == 0 {
        result += &format!("{} {}(WasmModule* ctx", ret_ty, name);
    } else {
        result += &format!("{} {}(WasmModule* ctx, ", ret_ty, name);
    }
    //return_type_or_void(typ.to.0.iter().map(|t| format!("{}", t)).collect())
    // 3. Add argument types
    result += &typ
        .from
        .0
        .iter()
        .enumerate()
        .map(|(i, t)| format!("{} arg_{}", t, i))
        .collect::<Vec<_>>()
        .join(", ");
    result += ")";

    Ok(result)
}

// print a C function ptr ty for this functype
pub fn print_fn_ptr_ty(typ: &wasm::syntax::FuncType) -> Maybe<String> {
    let mut result = String::new();
    // 2. Add return type
    // First argument is always Vm Context
    let ret_ty = return_type_or_void(typ.to.0.iter().map(|t| format!("{}", t)).collect());
    if typ.from.0.len() == 0 {
        result += &format!("{} (*)(WasmModule*", ret_ty);
    } else {
        result += &format!("{} (*)(WasmModule*, ", ret_ty);
    }
    //return_type_or_void(typ.to.0.iter().map(|t| format!("{}", t)).collect())
    // 3. Add argument types
    result += &typ
        .from
        .0
        .iter()
        .map(|t| format!("{}", t))
        .collect::<Vec<_>>()
        .join(", ");
    result += ")";

    Ok(result)
}

// create alias for exported functions
pub fn print_fn_ptr(
    m: &wasm::syntax::Module,
    name: String,
    id: wasm::syntax::FuncIdx,
) -> Maybe<String> {
    // 1. Retrieve function and its type
    let f = &m.funcs[id.0 as usize];
    let typ = m
        .types
        .get(f.typ.0 as usize)
        .ok_or(eyre!("Invalid type index {} for function", f.typ.0))?;

    let mut result = String::new();

    // 2. Add return type
    // First argument is always Vm Context
    let ret_ty = return_type_or_void(typ.to.0.iter().map(|t| format!("{}", t)).collect());
    if typ.from.0.len() == 0 {
        result += &format!("{} (*{})(WasmModule*", ret_ty, name);
    } else {
        result += &format!("{} (*{})(WasmModule*, ", ret_ty, name);
    }
    //return_type_or_void(typ.to.0.iter().map(|t| format!("{}", t)).collect())
    // 3. Add argument types
    result += &typ
        .from
        .0
        .iter()
        .map(|t| format!("{}", t))
        .collect::<Vec<_>>()
        .join(", ");
    result += ")";

    Ok(result)
}

fn print_local_function(
    m: &wasm::syntax::Module,
    id: wasm::syntax::FuncIdx,
    opts: &CmdLineOpts,
    typ: &wasm::syntax::types::FuncType,
    f: &wasm::syntax::Func,
    locals: &Vec<wasm::syntax::types::ValType>,
    body: &wasm::syntax::instructions::Expr,
    result: &mut String,
) -> Maybe<()> {
    // Locals
    *result += &typ
        .from
        .0
        .iter()
        .enumerate()
        .map(|(i, t)| format!("{} local_{} = arg_{};", t, i, i))
        .collect::<Vec<_>>()
        .join("\n");
    *result += "\n";
    *result += &locals
        .iter()
        .enumerate()
        .map(|(i, t)| {
            format!(
                "{} local_{} = {};",
                t,
                i + typ.from.0.len(),
                if let wasm::syntax::ValType::Handle = t {
                    // MSWasm-cheri passthrough design
                    "NULL".to_string()
                } else {
                    "0".into()
                }
            )
        })
        .collect::<Vec<_>>()
        .join("\n");
    *result += "\n";

    dbgprintln!(
        3,
        "Generated {} locals ({} args + {} explicit locals)",
        typ.from.0.len() + locals.len(),
        typ.from.0.len(),
        locals.len()
    );

    let mut ps = PrinterState::new();

    // Actual body
    let body = print_instrs(&mut ps, m, id, &body.0, opts)?;
    *result += &(0..ps.max_stack_size)
        .map(|i| format!("union TaggedVal v{};", i))
        .collect::<Vec<_>>()
        .join("\n");
    *result += &(0..ps.max_handle_stack_size)
        .map(|i| format!("Handle c{};", i))
        .collect::<Vec<_>>()
        .join("\n");
    *result += &body;
    *result += "\n";

    dbgprintln!(0, "Generated body");

    // And finally, the return
    if let Some(st_size) = ps.total_stack_size() {
        if typ.to.0.len() != st_size {
            return Err(eyre!(
                "Unaligned stack at end of function. Expected {} got {}",
                typ.to.0.len(),
                st_size
            ));
        } else {
            *result += &print_return(&mut ps, m, f, opts, id)?;
        }
    } else {
        *result += "// no implicit return\n";
    };
    Ok(())
}

fn print_imported_function(
    _m: &wasm::syntax::Module,
    _id: wasm::syntax::FuncIdx,
    opts: &CmdLineOpts,
    typ: &wasm::syntax::types::FuncType,
    module: &String,
    name: &String,
    result: &mut String,
) -> Maybe<()> {
    if opts.generate_wasi_executable {
        if module != "wasi_snapshot_preview1" {
            return Err(eyre!(
                "Unexpected imported module {} when generating WASI executable",
                module
            ));
        } else {
            let args = &typ
                .from
                .0
                .iter()
                .enumerate()
                .map(|(i, _t)| format!("arg_{}", i))
                .collect::<Vec<_>>()
                .join(", ");
            if name == "proc_exit" {
                // TODO: implement instruction/memory_op/ms_wasm_segment counting?

                // Turns out wasi_common requires us to
                // manually implement this one by explicitly
                // marking it unimplemented. We simply want
                // the whole process to exit at this point.
                *result += "exit(arg_0);";
            } else {
                // let wasi_module = if opts.ms_wasm {
                //     "ms_wasm_wasi"
                // } else {
                //     unimplemented!("Cheri backend only works when mswasm is enabled (for now)")
                //     // "wasi_common::wasi::wasi_snapshot_preview1"
                // };
                // TODO: what?
                // let guest_mem_wrap: String = if opts.ms_wasm {
                //     "&mut self.segments".into()
                // } else {
                //     unimplemented!("Cheri backend only works when mswasm is enabled (for now)")
                //     // format!(
                //     //     "&guest_mem_wrapper::GuestMemWrapper::from(&mut {})",
                //     //     self_mem
                //     // )
                // };
                // TODO: how to change this?
                let body = format!("return __cheri_{}(ctx, {});", name, args);
                // TODO: implement return tracing?
                *result += &body;
            }
        }
    } else {
        *result += &format!(
            "assert(false) /* Unimplemented imported function: {}.{} */",
            module, name
        );
    };
    Ok(())
}

pub fn print_function(
    m: &wasm::syntax::Module,
    id: wasm::syntax::FuncIdx,
    opts: &CmdLineOpts,
) -> Maybe<String> {
    dbgprintln!(1, "Now working on function {}", id.0);

    let f = &m.funcs[id.0 as usize];

    let typ = m
        .types
        .get(f.typ.0 as usize)
        .ok_or(eyre!("Invalid type index {} for function", f.typ.0))?;

    let mut result = String::new();

    // Argument and result types
    let signature = print_function_signature(
        m,
        format!("__rwasm_{}_{}", m.names.functions[&id], id.0),
        id,
    )?;
    result += &signature;

    dbgprintln!(
        1,
        "Generated function signature, using type index {}",
        f.typ.0
    );
    dbgprintln!(1, "\t{}", signature);

    // Body
    result += " {\n";
    // TODO: implement function tracing?
    match &f.internals {
        wasm::syntax::FuncInternals::LocalFunc { locals, body } => {
            print_local_function(m, id, opts, typ, f, locals, body, &mut result)?;
        }
        wasm::syntax::FuncInternals::ImportedFunc { module, name } => {
            print_imported_function(m, id, opts, typ, module, name, &mut result)?;
        }
    }
    result += "}\n\n";

    dbgprintln!(1, "Finished function {}", id.0);

    Ok(result)
}
