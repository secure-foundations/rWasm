use crate::cheri;
use cheri::expr::*;
use cheri::function::*;
use cheri::printer_state::*;
use cheri::util::*;

use crate::wasm;
use crate::CmdLineOpts;
use crate::Maybe;
use color_eyre::eyre::eyre;

fn print_instr(
    ps: &mut PrinterState,
    m: &wasm::syntax::Module,
    fn_id: wasm::syntax::FuncIdx,
    i: &wasm::syntax::Instr,
    opts: &CmdLineOpts,
) -> Maybe<String> {
    let f = &m.funcs[fn_id.0 as usize];

    dbgprintln!(1, "Working on instruction {:?}", i);
    dbgprintln!(1, "\t{:?}", ps);

    macro_rules! stack_op {
        // ($from:expr => $to:expr, $handle_from:expr => $handle_to:expr) => {{
        //     if ps.stack_size.unwrap() < $from || ps.handle_stack_size.unwrap() < $handle_from {
        //         return Err(
        //             eyre!("Insufficient stack depth. Is at {} but expected at least {}",
        //                     ps.stack_size.unwrap() + ps.handle_stack_size.unwrap(), $from));
        //     }
        //     if $from < $to {
        //         ps.stack_size = Some(ps.stack_size.unwrap() + ($to - $from));
        //         ps.max_stack_size = std::cmp::max(ps.max_stack_size, ps.stack_size.unwrap());
        //     } else {
        //         ps.stack_size = Some(ps.stack_size.unwrap() - ($from - $to));
        //         //ps.sync_stack.truncate(ps.stack_size.unwrap() )
        //     }
        //     if $handle_from < $handle_to {
        //         ps.handle_stack_size = Some(ps.handle_stack_size.unwrap() + ($handle_to - $handle_from));
        //         ps.max_handle_stack_size = std::cmp::max(ps.max_handle_stack_size, ps.handle_stack_size.unwrap());
        //     } else {
        //         ps.handle_stack_size = Some(ps.handle_stack_size.unwrap() - ($handle_from - $handle_to));
        //     }
        //     // update sync stack
        //     if $from + $handle_from < $to + $handle_to {
        //         assert!(false); // TODO: wire through type properly
        //     } else {
        //         ps.sync_stack.truncate(ps.sync_stack.len() + $to + $handle_to - $from - $handle_from);
        //     }
        // }};
        // (_internal check1) => {{
        //     if ps.stack_size.unwrap() < 1 {
        //         return Err(eyre!("Insufficient stack depth"));
        //     }
        // }};
        // (_internal handle_check1) => {{
        //     if ps.handle_stack_size.unwrap() < 1 {
        //         return Err(eyre!("Insufficient handle stack depth"));
        //     }
        // }};
        (_internal peek) => {{
            ps.peek_val()
        }};
        (_internal pop) => {{
            ps.pop_val()

        }};
        (_internal push) => {{
            ps.push_val()
        }};
        (_internal peek_handle) => {{
            ps.peek_handle()
        }};
        (_internal pop_handle) => {{
            ps.pop_handle()
        }};
        (_internal push_handle) => {{
            ps.push_handle()
        }};
        (i @ $b:expr ; $op:tt) => {{
            format!("{}.as_i{}", stack_op!(_internal $op), $b)
        }};
        (f @ $b:expr ; $op:tt) => {{
            format!("{}.as_f{}", stack_op!(_internal $op), $b)
        }};
        ($e:ty ; $op:tt) => {{
            format!("{}.as_{}",  stack_op!(_internal $op), stringify!($e))
        }};
        ($e:expr ; $op:tt) => {{
            format!("{}.as_{}", stack_op!(_internal $op), $e)
        }};
        ($op:tt) => {{
            format!("{}", stack_op!(_internal $op))
        }};
    }

    macro_rules! pop {
        () => {
            stack_op!(pop)
        };
        ($x:ident @ $b:tt) => {
            stack_op!($x @ $b ; pop)
        };
        ($b:ty) => {
            stack_op!($b ; pop)
        };
        ($b:expr) => {
            stack_op!($b ; pop)
        };
    }

    macro_rules! peek {
        () => {
            stack_op!(peek)
        };
        ($x:ident @ $b:tt) => {
            stack_op!($x @ $b ; peek)
        };
        ($b:ty) => {
            stack_op!($b ; peek)
        };
        ($b:expr) => {
            stack_op!($b ; peek)
        };
    }

    macro_rules! push {
        () => {
            stack_op!(push)
        };
    }
    macro_rules! peek_handle {
        () => {
            stack_op!(peek_handle)
        };
    }
    macro_rules! pop_handle {
        () => {
            stack_op!(pop_handle)
        };
    }

    macro_rules! push_handle {
        () => {
            stack_op!(push_handle)
        };
    }

    macro_rules! pop_any {
        () => {
            ps.pop_any()
        };
    }

    macro_rules! push_any {
        ($t:expr) => {
            ps.push_any($t)
        };
    }

    if ps.stack_size.is_none() {
        match i {
            Unreachable => (),
            _ => {
                dbgprintln!(0, "Found dead code");
                dbgprintln!(1, "  {:?}", i);
                return Ok(format!(r#"unreachable!("Found dead code {:?}");"#, i));
            }
        }
    }

    use wasm::syntax::Instr::*;
    match i {
        Const(c) => {
            use wasm::syntax::Const;
            let dst = push!();
            let cast_func = match c {
                Const::I32(_) => "from_i32",
                Const::I64(_) => "from_i64",
                Const::F32(_) => "from_f32",
                Const::F64(_) => "from_f64",
            };
            Ok(format!("{} = {}({});", dst, cast_func, c.to_c_string()))
        }
        IUnOp(b, o) => {
            let src = pop!(i @ b);
            let dst = push!();
            Ok(format!(
                "{} = from_i{}({});",
                dst,
                b,
                print_iunop(b, o, &src)
            ))
        }
        FUnOp(b, o) => {
            let src = pop!(f @ b);
            let dst = push!();
            Ok(format!("{} = from_f{}({});", dst, b, print_funop(o, &src)))
        }
        IBinOp(b, o) => {
            let src2 = pop!(i @ b);
            let src1 = pop!(i @ b);
            let dst = push!();
            Ok(format!(
                "{} = from_i{}({});",
                dst,
                b,
                print_ibinop(b, o, &src1, &src2)
            ))
        }
        FBinOp(b, o) => {
            let src2 = pop!(f @ b);
            let src1 = pop!(f @ b);
            let dst = push!();
            Ok(format!(
                "{} = from_f{}({});",
                dst,
                b,
                print_fbinop(o, &src1, &src2)
            ))
        }
        ITestOp(b, o) => {
            let src = pop!(i @ b);
            let dst = push!();
            match o {
                wasm::syntax::intop::TestOp::Eqz => {
                    Ok(format!("{} = from_i32(({} == 0));", dst, src))
                }
            }
        }
        IRelOp(b, o) => {
            let src2 = pop!(i @ b);
            let src1 = pop!(i @ b);
            let dst = push!();
            Ok(format!(
                "{} = from_i32((i32){});",
                dst,
                print_irelop(b, o, &src1, &src2)
            ))
        }
        FRelOp(b, o) => {
            let src2 = pop!(f @ b);
            let src1 = pop!(f @ b);
            let dst = push!();
            Ok(format!(
                "{} = from_i32((i32)({}));",
                dst,
                print_frelop(o, &src1, &src2)
            ))
        }
        ICvtOp(b, o) => {
            use wasm::syntax::intop::CvtOp::*;
            use wasm::syntax::BitSize::*;
            let src = pop!();
            let dst = push!();
            // All the TRUNC reinterpret functions and are defined in the prologue
            let val = match o {
                WrapI64 => match b {
                    B32 => Ok(format!("from_i32((i32){}.as_i64)", src)),
                    B64 => Err(eyre!("Invalid wrap instruction")),
                },
                TruncSF32 => Ok(format!("from_i{}(I{}_TRUNC_S_F32({}.as_f32))", b, b, src)),
                TruncUF32 => Ok(format!("from_i{}(I{}_TRUNC_U_F32({}.as_f32))", b, b, src)),
                TruncSF64 => Ok(format!("from_i{}(I{}_TRUNC_S_F64({}.as_f64))", b, b, src)),
                TruncUF64 => Ok(format!("from_i{}(I{}_TRUNC_U_F64({}.as_f64))", b, b, src)),
                ExtendSI32 => match b {
                    B32 => Err(eyre!("Invalid ExtendSI32 instruction")),
                    B64 => Ok(format!("from_i64((i64){}.as_i32)", src)),
                },
                ExtendUI32 => match b {
                    B32 => Err(eyre!("Invalid ExtendUI32 instruction")),
                    B64 => Ok(format!("(from_i64((i64)(u64){}.as_u32))", src)),
                },
                TruncSatSF32 => Ok(format!(
                    "from_i{}(I{}_TRUNC_SAT_S_F32({}.as_f32))",
                    b, b, src
                )),
                TruncSatUF32 => Ok(format!(
                    "from_i{}(I{}_TRUNC_SAT_U_F32({}.as_f32))",
                    b, b, src
                )),
                TruncSatSF64 => Ok(format!(
                    "from_i{}(I{}_TRUNC_SAT_S_F64({}.as_f64))",
                    b, b, src
                )),
                TruncSatUF64 => Ok(format!(
                    "from_i{}(I{}_TRUNC_SAT_U_F64({}.as_f64))",
                    b, b, src
                )),
                ReinterpretFloat => Ok(format!(
                    "from_i{}(i{}_reinterpret_f{}({}.as_f{}))",
                    b, b, b, src, b
                )),
            }?;
            Ok(format!("{} = {};", dst, val))
        }
        FCvtOp(b, o) => {
            use wasm::syntax::floatop::CvtOp::*;
            use wasm::syntax::BitSize::*;
            let src = pop!();
            let dst = push!();

            let val = match o {
                ConvertSI32 => Ok(format!("from_f{}((f{}){}.as_i32)", b, b, src)),
                ConvertUI32 => Ok(format!("from_f{}((f{})(u32){}.as_i32)", b, b, src)),
                ConvertSI64 => Ok(format!("from_f{}((f{}){}.as_i64 )", b, b, src)),
                ConvertUI64 => Ok(format!("from_f{}((f{})(u64){}.as_i64)", b, b, src)),
                PromoteF32 => match b {
                    B32 => Err(eyre!("Invalid promotion")),
                    B64 => Ok(format!("from_f64((f64){}.as_f32)", src)),
                },
                DemoteF64 => match b {
                    B32 => Ok(format!("from_f32((f32){}.as_f64)", src)),
                    B64 => Err(eyre!("Invalid demotion")),
                },
                ReinterpretInt => Ok(format!(
                    "from_f{}(f{}_reinterpret_i{}({}.as_i{}))",
                    b, b, b, src, b
                )),
            }?;
            Ok(format!("{} = {};", dst, val))
        }
        Drop => {
            let _ = pop_any!();
            Ok("".into())
        }
        Select => {
            // assert!(false);
            let c = pop!(i32);
            let t = ps.sync_stack.last().unwrap().clone(); // will be type of return
            let v2 = pop_any!();
            let v1 = pop_any!();
            let dst = match t {
                HandleOrVal::Handle => push_handle!(),
                HandleOrVal::Val => push!(),
            };
            //let dst = push!();
            Ok(format!("{} = (({} != 0) ? {} : {});", dst, c, v1, v2,))
        }
        LocalGet(l) => {
            let ty = local_typ(m, f, l.0 as usize)?; // Confirm local existence
            if ty == wasm::syntax::ValType::Handle {
                Ok(format!("{} = local_{};", push_handle!(), l.0))
            } else {
                Ok(format!("{} = from_{}(local_{});", push!(), ty, l.0))
            }
        }
        LocalSet(l) => {
            let ty = local_typ(m, f, l.0 as usize)?;
            if ty == wasm::syntax::ValType::Handle {
                Ok(format!("local_{} = {};", l.0, pop_handle!()))
            } else {
                Ok(format!("local_{} = {}.as_{};", l.0, pop!(), ty))
            }
        }
        LocalTee(l) => {
            let ty = local_typ(m, f, l.0 as usize)?;
            // NOTE: We eliminate the unnecessary indirection to
            // LocalSet here and instead just do it in one fell
            // swoop :)
            if ty == wasm::syntax::ValType::Handle {
                Ok(format!("local_{} = {};", l.0, peek_handle!()))
            } else {
                Ok(format!("local_{} = {}.as_{};", l.0, peek!(), ty))
            }
        }
        GlobalGet(g) => {
            let g_t = &m.globals[g.0 as usize].typ;
            if (g.0 as usize) < m.globals.len() {
                let container = match g_t.1 {
                    wasm::syntax::ValType::Handle => "global_handles",
                    _ => "globals",
                };
                Ok(format!(
                    "{} = ctx->{}[{}];",
                    push_any!(g_t.1),
                    container,
                    g.0
                ))
            } else {
                Err(eyre!("Invalid global {}", g.0))
            }
        }
        GlobalSet(g) => {
            if (g.0 as usize) < m.globals.len() {
                let g_t = &m.globals[g.0 as usize].typ;
                let src = pop_any!();
                if g_t.0 == wasm::syntax::Mut::Var {
                    match g_t.1 {
                        wasm::syntax::ValType::Handle => {
                            Ok(format!("ctx->global_handles[{}] = {};", g.0, src))
                        }
                        _ => Ok(format!(
                            "ctx->globals[{}] = from_{}({}.as_{});",
                            g.0, g_t.1, src, g_t.1
                        )),
                    }
                } else {
                    Err(eyre!("Trying to mutate immutable global {}", g.0))
                }
            } else {
                Err(eyre!("Invalid global {}", g.0))
            }
        }
        MemLoad(mem) => {
            // MSWasm-cheri passthrough design
            // Note: The spec explicitly states that the alignment
            // does not affect semantics, and exists only as a hint
            // for faster perf.
            let dynamic_offset = pop_handle!();
            let dst = push!();
            let ea = format!("{} + {}", dynamic_offset, mem.memarg.offset);
            //let self_mem = "ctx.memory".into(); // ptr to linear memory

            let mem_reader = match &mem.extend {
                None => format!("from_{}({}_load({}));", mem.typ, mem.typ, ea),
                Some((n, sx)) => format!("from_{}({}_load{}_{}({}));", mem.typ, mem.typ, n, sx, ea),
            };
            Ok(format!("{} = {}", dst, mem_reader))
        }
        MemStore(mem) => {
            // MSWasm-cheri passthrough design
            // Note: The spec explicitly states that the alignment
            // does not affect semantics, and exists only as a hint
            // for faster perf.
            let src = pop!(mem.typ);
            let dynamic_offset = pop_handle!();
            let ea = format!("{} + {}", dynamic_offset, mem.memarg.offset);

            match &mem.bitwidth {
                None => Ok(format!("{}_store({}, {});", mem.typ, ea, src)),
                Some(n) => Ok(format!("{}_store{}({}, {});", mem.typ, n, ea, src)),
            }
        }
        MemSize => {
            // Note: The spec defines Page Size = 65536
            let inner_mem_size = if opts.fixed_mem_size.is_some() {
                "self.memory_size_to_vm"
            } else {
                "self.memory.len()"
            };
            // TODO: implement mem tracing?
            Ok(format!(
                "{} = from_i32((i32)({} / 65536)));",
                //mem_trace,
                push!(),
                inner_mem_size
            ))
        }
        MemGrow => {
            unimplemented!()

            // let n = pop!(i32);
            // let res = push!();
            // let inner_mem_size = if opts.fixed_mem_size.is_some() {
            //     "self.memory_size_to_vm"
            // } else {
            //     "self.memory.len()"
            // };
            // TODO: implement mem tracing?
            // let new_size = {
            //     let s = format!(
            //         "{m}{modif} + (65536 * {n} as usize)",
            //         m = inner_mem_size,
            //         n = n,
            //         modif = if opts.memory_wrapping && !opts.prevent_extra_mem_for_wrapping {
            //             " - 8"
            //         } else {
            //             ""
            //         }
            //     );
            //     let s = if opts.memory_wrapping && !opts.fixed_mem_size.is_some() {
            //         format!("({}).checked_next_power_of_two()?", s)
            //     } else {
            //         s
            //     };
            //     if opts.memory_wrapping && !opts.prevent_extra_mem_for_wrapping {
            //         format!("{} + 8", s)
            //     } else {
            //         s
            //     }
            // };
            // let grow_memory = if opts.fixed_mem_size.is_some() {
            //     format!(
            //         "{{
            //              let orig_size = (self.memory_size_to_vm / 65536);
            //              self.memory_size_to_vm = {new_size};
            //              {res} = TaggedVal::from(orig_size as i32);
            //          }}",
            //         res = res,
            //         new_size = new_size,
            //     )
            // } else {
            //     format!(
            //         "{{
            //              let orig_size = (self.memory.len() / 65536);
            //              self.memory.resize_with({new_size},
            //                                      Default::default);
            //              {res} = TaggedVal::from(orig_size as i32);
            //          }}",
            //         res = res,
            //         new_size = new_size,
            //     )
            // };
            // let failed_to_grow = format!("{} = TaggedVal::from(-1i32);", res);
            // let max_mem_size = opts
            //     .fixed_mem_size
            //     .or(m.mems.get(0).and_then(|m| m.typ.0.max));
            // if m.mems.len() == 0 {
            //     // XXX: Handle imported memory. The spec allows us to
            //     // always just return "error", so we do that for now.
            //     Ok(format!("{}{}", mem_trace, failed_to_grow))
            // } else {
            //     assert_eq!(m.mems.len(), 1);
            //     if let Some(max_size) = max_mem_size {
            //         Ok(format!(
            //             "{}if ({} as u32) < {}u32 {{ {} }} else {{ {} }}",
            //             mem_trace, n, max_size, grow_memory, failed_to_grow
            //         ))
            //     } else {
            //         Ok(format!("{}{}", mem_trace, grow_memory))
            //     }
            // }
        }
        Nop => Ok("".into()),
        Unreachable => {
            ps.stack_size = None; // anything beyond an unreachable statement must be dead code
            ps.handle_stack_size = None;
            Ok("UNREACHABLE;".into()) // Defined in generated module prologue
        }
        Block(bt, is) => {
            let orig_stack_size = ps.stack_size.unwrap();
            let orig_handle_stack_size = ps.handle_stack_size.unwrap();
            let blocktype = block_type_in_out_vals(m, bt)?;
            let lbl = ps.push_label(LabelType::JumpToBlockEnd, blocktype.1, blocktype.3);
            let body = print_instrs(ps, m, fn_id, is, opts)?;
            ps.pop_label();
            if let Some(st_size) = ps.total_stack_size() {
                if (orig_stack_size + orig_handle_stack_size - blocktype.0 - blocktype.2)
                    + blocktype.1
                    + blocktype.3
                    != st_size
                {
                    return Err(eyre!(
                        "Block {:?} does not manipulate stack correctly. \
                         Expected efffect {}, produced effect {}.",
                        is,
                        (blocktype.1 as i64) - (blocktype.0 as i64),
                        (st_size as i64) - (orig_stack_size as i64),
                    ));
                }
            } else {
                // If the block's internals end in dead-code, then
                // stuff after the block also is dead-code. However,
                // some wasm binaries actually do end up having dead
                // code that we need to handle, so we end up acting
                // like it isn't dead anymore.

                ps.stack_size = Some((orig_stack_size - blocktype.0) + blocktype.1);
                ps.handle_stack_size = Some((orig_stack_size - blocktype.2) + blocktype.3);
            }
            Ok(format!("{{\n {} }}\n{}:;", body, lbl))
        }
        Loop(bt, is) => {
            let orig_stack_size = ps.stack_size.unwrap();
            let orig_handle_stack_size = ps.handle_stack_size.unwrap();
            let blocktype = block_type_in_out_vals(m, bt)?;
            let lbl = ps.push_label(LabelType::JumpToBlockStart, blocktype.0, blocktype.2);
            let body = print_instrs(ps, m, fn_id, is, opts)?;
            ps.pop_label();
            if let Some(st_size) = ps.total_stack_size() {
                if (orig_stack_size + orig_handle_stack_size - blocktype.0 - blocktype.2)
                    + blocktype.1
                    + blocktype.3
                    != st_size
                {
                    return Err(eyre!(
                        "Loop {:?} does not manipulate stack correctly. \
                         Expected efffect {}, produced effect {}.",
                        is,
                        (blocktype.1 as i64) - (blocktype.0 as i64),
                        (st_size as i64) - (orig_stack_size as i64),
                    ));
                }
            } else {
                // A loop ending in dead-code may not actually be dead, due to `continue`s
                // TODO: update sync stack?
                let new_stack_size = (orig_stack_size - blocktype.0) + blocktype.1;
                let new_handle_stack_size = (orig_stack_size - blocktype.2) + blocktype.3;
                ps.stack_size = Some(new_stack_size);
                ps.handle_stack_size = Some(new_handle_stack_size);
            }
            // // Note: A `Loop` in WASM does not automatically cause it
            // // to loop- it is simply a construct that allows you to
            // // jump back to the start, rather than jump to the end,
            // // like in `Block`. To actually make a `Loop` loop, one
            // // must do a `Br`-style instruction targeted at the label
            // // of the `Loop`.
            Ok(format!("{}:  {{\n{}\n;}};", lbl, body))
        }
        If(bt, is1, is2) => {
            let blocktype = block_type_in_out_vals(m, bt)?;
            let lbl = ps.push_label(LabelType::JumpToBlockEnd, blocktype.1, blocktype.3);
            let cond = pop!(i32);
            let mut ps1 = ps.clone();
            let body1 = print_instrs(&mut ps1, m, fn_id, is1, opts)?;
            ps.label_freshness_source = ps1.label_freshness_source;
            let body2 = print_instrs(ps, m, fn_id, is2, opts)?;
            // if either of the branches go into dead-code, then propagate the other branch
            if ps1.total_stack_size().is_none() {
                ps1.stack_size = ps.stack_size;
                ps1.handle_stack_size = ps.handle_stack_size;
                ps1.sync_stack = ps.sync_stack.clone();
            } else if ps.total_stack_size().is_none() {
                ps.stack_size = ps1.stack_size;
                ps.handle_stack_size = ps1.handle_stack_size;
                ps.sync_stack = ps1.sync_stack.clone();
            }

            // if the branches don't agree on stack layout, then something is wrong
            if ps1.total_stack_size() == ps.total_stack_size() {
                ps.max_stack_size = std::cmp::max(ps1.max_stack_size, ps.max_stack_size);
                ps.max_handle_stack_size =
                    std::cmp::max(ps1.max_handle_stack_size, ps.max_handle_stack_size);
                ps.pop_label();
                Ok(format!(
                    "{{ 
                        if ({} != 0) {{ {} }} else {{ {} }}
                    }}\n{}:;",
                    cond, body1, body2, lbl
                ))
            } else {
                Err(eyre!(
                    "Different sides of IfElse branch don't match stack behavior. \
                     Got {:?} and {:?}",
                    ps1.stack_size,
                    ps.stack_size
                ))
            }
        }
        Br(l) => {
            if (l.0 as usize) < ps.labels.len() {
                let lbl = ps.labels[(ps.labels.len() - 1) - l.0 as usize];
                if lbl.orig_stack_size
                    + lbl.val_arity
                    + lbl.orig_handle_stack_size
                    + lbl.handle_arity
                    <= ps.total_stack_size().unwrap()
                {
                    let mut movement = Vec::new();
                    if lbl.orig_stack_size + lbl.val_arity <= ps.stack_size.unwrap() {
                        for i in 0..lbl.val_arity {
                            movement.push(format!(
                                "v{} = v{};",
                                lbl.orig_stack_size + i,
                                ps.stack_size.unwrap() - lbl.val_arity + i
                            ))
                        }
                    }

                    if lbl.orig_handle_stack_size + lbl.handle_arity
                        <= ps.handle_stack_size.unwrap()
                    {
                        for i in 0..lbl.handle_arity {
                            movement.push(format!(
                                "c{} = c{};",
                                lbl.orig_handle_stack_size + i,
                                ps.handle_stack_size.unwrap() - lbl.handle_arity + i
                            ))
                        }
                    }

                    let branch = "goto";
                    ps.stack_size = None;
                    ps.handle_stack_size = None;
                    Ok(format!(
                        "{{\n{}\n}}\n{} {};",
                        movement.join("\n"),
                        branch,
                        lbl
                    ))
                } else {
                    Err(eyre!(
                        "Somehow, the branch tries to add stuff?! ({} + {} > {})",
                        lbl.orig_stack_size,
                        lbl.val_arity,
                        ps.stack_size.unwrap()
                    ))
                }
            } else {
                Err(eyre!("Br to invalid label {}", l.0))
            }
        }
        BrIf(l) => {
            let cond = pop!(i32);
            let orig_stack_size = ps.stack_size;
            let orig_handle_stack_size = ps.handle_stack_size;
            let body = print_instr(ps, m, fn_id, &Br(*l), opts)?;
            //dbgprintln!("{:?} {:?} {:?} {:?}", orig_stack_size, ps.stack_size, orig_handle_stack_size, ps.handle_stack_size);
            if ps.stack_size.is_none() {
                ps.stack_size = orig_stack_size;
            }
            if ps.handle_stack_size.is_none() {
                ps.handle_stack_size = orig_handle_stack_size;
            }
            assert!(
                orig_stack_size == ps.stack_size && orig_handle_stack_size == ps.handle_stack_size
            );
            //assert!()
            //ps.stack_size = orig_stack_size;
            //ps.handle_stack_size = orig_handle_stack_size;
            //ps.sync_stack.truncate(ps.stack_size.unwrap() + ps.handle_stack_size.unwrap());
            Ok(format!("if ({} != 0) {{\n{}\n}}", cond, body))
        }
        BrTable(lbls, lbl_default) => {
            let cond = pop!(i32);
            let orig_stack_size = ps.stack_size;
            let orig_handle_stack_size = ps.handle_stack_size;
            let bodies = lbls
                .iter()
                .map(|l| {
                    ps.stack_size = orig_stack_size;
                    ps.handle_stack_size = orig_handle_stack_size;
                    print_instr(ps, m, fn_id, &Br(*l), opts)
                })
                .collect::<Maybe<Vec<String>>>()?
                .iter()
                .enumerate()
                .map(|(i, b)| format!("case {} : {{\n{}\nbreak;\n}};", i, b))
                .collect::<Vec<String>>()
                .join("\n");
            let body_default = format!("default : {{\n{}\nbreak;\n}};", {
                ps.stack_size = orig_stack_size;
                ps.handle_stack_size = orig_handle_stack_size;
                assert!(
                    ps.sync_stack.len() <= ps.stack_size.unwrap() + ps.handle_stack_size.unwrap()
                );
                ps.sync_stack
                    .truncate(ps.stack_size.unwrap() + ps.handle_stack_size.unwrap());
                print_instr(ps, m, fn_id, &Br(*lbl_default), opts)?
            });
            ps.stack_size = None;
            ps.handle_stack_size = None;
            Ok(format!(
                "switch({}) {{\n{}\n{}\n}}",
                cond, bodies, body_default
            ))
        }
        Return => {
            let ret = print_return(ps, m, f, opts, fn_id)?;
            ps.stack_size = None;
            ps.handle_stack_size = None;
            Ok(ret)
            //Ok(format!("return {};", ret))
        }
        Call(fn_idx) => {
            let callee: &wasm::syntax::Func = m
                .funcs
                .get(fn_idx.0 as usize)
                .ok_or(eyre!("Invalid function {} being called", fn_idx.0))?;
            let callee_typ = m.types.get(callee.typ.0 as usize).ok_or(eyre!(
                "Invalid type index {} for callee function",
                callee.typ.0
            ))?;

            dbgprintln!(1, "Translating call of type: {:?}", callee_typ);

            let (num_val_args, num_handle_args) = resulttype_in_out_vals(&callee_typ.from);
            //let (num_val_ret,num_handle_ret) = resulttype_in_out_vals(&typ_expected.to);
            let stack_base = ps.stack_size.unwrap() - num_val_args;
            let handle_stack_base = ps.handle_stack_size.unwrap() - num_handle_args;

            // 3. Pop arguments off stack and format them for call
            let mut callee_args: Vec<String> = Vec::new();
            let mut val_idx = 0;
            let mut handle_idx = 0;
            for arg in callee_typ.from.0.iter() {
                callee_args.push(match arg {
                    wasm::syntax::ValType::Handle => {
                        let r = handle_stack_base + handle_idx;
                        handle_idx += 1;
                        format!("c{}", r)
                    }
                    t => {
                        let r = stack_base + val_idx;
                        val_idx += 1;
                        format!("v{}.as_{}", r, t)
                    }
                })
            }
            ps.handle_stack_size = Some(handle_stack_base);
            ps.stack_size = Some(stack_base);
            ps.sync_stack.truncate(handle_stack_base + stack_base);

            let callee_args = callee_args.join(", ");

            // build the actual call
            let call = if callee_typ.from.0.len() == 0 {
                format!("__rwasm_{}_{}(ctx)", m.names.functions[fn_idx], fn_idx.0)
            } else {
                format!(
                    "__rwasm_{}_{}(ctx, {})",
                    m.names.functions[fn_idx], fn_idx.0, callee_args
                )
            };

            let call_code = match callee_typ.to.0.len() {
                0 => format!("{};", call), // void function
                1 => match callee_typ.to.0[0] {
                    wasm::syntax::ValType::Handle => format!("{} = {};", push_handle!(), call),
                    t => format!("{} = from_{}({});", push!(), t, call),
                }, // put the return value on top of the stack
                _ => unimplemented!(),     // C does not support returning tuples
            };

            Ok(call_code)
        }
        CallIndirect(typ_idx) => {
            // Note: as of right now, mswasm-cheri implementation only supports the default indirect call style
            // 1. Retrieve type of indirect call index
            let typ_expected = m.types.get(typ_idx.0 as usize).ok_or(eyre!(
                "Invalid type index {} for indirect callee function",
                typ_idx.0
            ))?;

            // 2. Get function index (index into table)
            let call_target = pop!(i32);
            let (num_val_args, num_handle_args) = resulttype_in_out_vals(&typ_expected.from);
            let (num_val_ret, num_handle_ret) = resulttype_in_out_vals(&typ_expected.to);
            let stack_base = ps.stack_size.unwrap() - num_val_args;
            let handle_stack_base = ps.handle_stack_size.unwrap() - num_handle_args;

            // let stack_base = ps.stack_size.unwrap() - typ_expected.from.0.len();
            // stack_op!(num_val_args => num_val_ret, num_handle_args => num_handle_ret); // What?

            let mut args: Vec<String> = Vec::new();
            let mut val_idx = 0;
            let mut handle_idx = 0;
            for arg in typ_expected.from.0.iter() {
                args.push(match arg {
                    wasm::syntax::ValType::Handle => {
                        let r = handle_stack_base + handle_idx;
                        handle_idx += 1;
                        format!("c{}", r)
                    }
                    t => {
                        let r = stack_base + val_idx;
                        val_idx += 1;
                        format!("v{}.as_{}", r, t)
                    }
                })
            }
            ps.handle_stack_size = Some(handle_stack_base);
            ps.stack_size = Some(stack_base);
            ps.sync_stack.truncate(handle_stack_base + stack_base);

            let args = args.join(", ");

            // 3. Pop arguments off stack and format them for call
            // let mut args: Vec<String> = Vec::new();
            // for arg in typ_expected.from.0.iter(){
            //     args.push(
            //         match arg {
            //             wasm::syntax::ValType::Handle => pop_handle!(),
            //             t => format!("{}.as_{}", pop!(), t),
            //     })
            // }
            // let args = args.join(", ");

            let fn_ptr_ty = print_fn_ptr_ty(typ_expected)?;

            let call_code =
                match (num_val_ret, num_handle_ret) {
                    (0, 0) => format!(
                        "CALL_INDIRECT(ctx->indirect_call_table, {}, {}, {}, {});",
                        fn_ptr_ty, typ_idx.0, call_target, args
                    ),
                    (0, 1) => format!(
                        "{} = CALL_INDIRECT(ctx->indirect_call_table, {}, {}, {}, {});",
                        push_handle!(),
                        fn_ptr_ty,
                        typ_idx.0,
                        call_target,
                        args
                    ),
                    (1, 0) => {
                        format!(
                        "{} = from_{}(CALL_INDIRECT(ctx->indirect_call_table, {}, {}, {}, {}));",
                        push!(), typ_expected.to.0[0], fn_ptr_ty, typ_idx.0, call_target, args
                    )
                    }
                    _ => unimplemented!(),
                };
            Ok(call_code)
        }
        MSWasm(op) => {
            // This assertion should always pass because the parser takes care of it
            assert!(opts.ms_wasm, "Opcode {:?} requires MS-Wasm mode.", op);
            use wasm::syntax::mswasmop::Op;
            match op {
                Op::HandleNull => {
                    let dst = push_handle!();
                    // MSWasm-cheri passthrough design
                    Ok(format!("{} = NULL;", dst))
                }
                Op::NewSegment => {
                    let src = pop!(i32);
                    let dst = push_handle!();
                    // MSWasm-cheri passthrough design
                    // TODO: implement wasm segment counting?
                    Ok(format!("{} = rwasm_alloc({});", dst, src))
                }
                Op::FreeSegment => {
                    let src = pop_handle!();
                    // MSWasm-cheri passthrough design
                    Ok(format!("free({});", src))
                }
                Op::HandleAdd => {
                    let amt = pop!(i32);
                    let src = pop_handle!();
                    let dst = push_handle!();
                    // MSWasm-cheri passthrough design
                    Ok(format!("{} = {} + {};", dst, src, amt))
                }
                Op::HandleSub => {
                    let amt = pop!(i32);
                    let src = pop_handle!();
                    let dst = push_handle!();
                    // MSWasm-cheri passthrough design
                    Ok(format!("{} = {} - {};", dst, src, amt))
                }
                Op::HandleLoad { memarg } => {
                    let src = pop_handle!();
                    let dst = push_handle!();
                    // MSWasm-cheri passthrough design
                    // TODO: redesign MEMCHECK in prologue?

                    Ok(format!(
                        "{} = handle_load({} + {});",
                        dst, src, memarg.offset,
                    ))
                }
                Op::HandleStore { memarg } => {
                    let val = pop_handle!();
                    let dst = pop_handle!();
                    // MSWasm-cheri passthrough design
                    Ok(format!(
                        "handle_store({} + {}, {});",
                        dst, memarg.offset, val,
                    ))
                }
                Op::HandleGetOffset => {
                    let handle = pop_handle!();
                    let dst = push!();
                    Ok(format!("{} = from_u32(cheri_offset_get({}));", dst, handle))
                }
                Op::HandleEq => {
                    let h2 = pop_handle!();
                    let h1 = pop_handle!();
                    let dst = push!();
                    // MSWasm-cheri passthrough design
                    Ok(format!("{} = from_u32({} == {});", dst, h1, h2,))
                }
                Op::HandleLt => {
                    let h2 = pop_handle!();
                    let h1 = pop_handle!();
                    let dst = push!();
                    // MSWasm-cheri passthrough design
                    Ok(format!("{} = from_u32({} < {});", dst, h1, h2,))
                }
            }
        }
    }
}

pub fn print_instrs(
    ps: &mut PrinterState,
    m: &wasm::syntax::Module,
    fn_id: wasm::syntax::FuncIdx,
    instrs: &[wasm::syntax::Instr],
    opts: &CmdLineOpts,
) -> Maybe<String> {
    let _func_name = get_func_name(m, fn_id);
    Ok(instrs
        .iter()
        .map(|i| {
            let ins = print_instr(ps, m, fn_id, i, opts)?;
            // TODO: implement instruction tracing?
            // TODO: implement instruction counting?
            let ins = if dbg_print_level!() > 4 {
                format!("/* {:?} */\n{}", i, ins)
            } else {
                ins
            };
            Ok(ins)
        })
        .collect::<Maybe<Vec<_>>>()?
        .join("\n"))
}
