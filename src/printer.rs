use crate::wasm;
use crate::CmdLineOpts;
use crate::Maybe;
use color_eyre::eyre::eyre;

fn mem_type(
    m: &wasm::syntax::Module,
    opts: &CmdLineOpts
) -> String {
    let ext_mem = mem_imported(m);
    let fixed_size = opts.fixed_mem_size.is_some();

    match (ext_mem, fixed_size) {
        (true, true) =>     format!("&'a mut [u8]"),
        (true, false) =>    format!("&'a mut Vec<u8>"),
        (false, true) =>    format!("[u8; {}]", get_memory_backing_size(m, opts).unwrap().0),
        (false, false) =>   format!("Vec<u8>"),
    }
}

fn mem_imported(
    m: &wasm::syntax::Module,
) -> bool {
    m.imports.iter().any(|i| {
        match &i.desc {
            wasm::syntax::ImportDesc::Mem(_) => true,
            _ => false,
        }
    })
}

fn print_iunop(
    bs: &wasm::syntax::BitSize,
    o: &wasm::syntax::instructions::intop::UnOp,
    src: &str,
) -> String {
    use wasm::syntax::instructions::intop::UnOp::*;
    match o {
        Clz => format!("({}.leading_zeros() as i{})", src, bs),
        Ctz => format!("({}.trailing_zeros() as i{})", src, bs),
        Popcnt => format!("({}.count_ones() as i{})", src, bs),
        ExtendS(ps) => format!("(({} as i{}) as i{})", src, ps, bs),
    }
}

fn print_funop(o: &wasm::syntax::instructions::floatop::UnOp, src: &str) -> String {
    // XXX: Check potential semantics issues around boundary conditions
    use wasm::syntax::instructions::floatop::UnOp::*;
    match o {
        Neg => format!("-{}", src),
        Abs => format!("{}.abs()", src),
        Ceil => format!("{}.ceil()", src),
        Floor => format!("{}.floor()", src),
        Trunc => format!("{}.trunc()", src),
        Nearest => format!("{}.round()", src),
        Sqrt => format!("{}.sqrt()", src),
    }
}

fn print_ibinop(
    bs: &wasm::syntax::BitSize,
    b: &wasm::syntax::instructions::intop::BinOp,
    src1: &str,
    src2: &str,
) -> String {
    use wasm::syntax::instructions::intop::BinOp::*;
    match b {
        Add => format!("{}.wrapping_add({})", src1, src2),
        Sub => format!("{}.wrapping_sub({})", src1, src2),
        Mul => format!("{}.wrapping_mul({})", src1, src2),
        DivS => {
            // We explicitly replace the undefined behavior with a
            // trap here
            format!("{}.checked_div({})?", src1, src2)
        }
        DivU => {
            // We explicitly replace the undefined behavior with a
            // trap here
            format!("({} as u{}).checked_div({} as u{})?", src1, bs, src2, bs)
        }
        RemS => {
            // We explicitly replace the undefined behavior with a
            // trap here
            format!("{}.checked_rem({})?", src1, src2)
        }
        RemU => {
            // We explicitly replace the undefined behavior with a
            // trap here
            format!("({} as u{}).checked_rem({} as u{})?", src1, bs, src2, bs)
        }
        And => format!("{} & {}", src1, src2),
        Or => format!("{} | {}", src1, src2),
        Xor => format!("{} ^ {}", src1, src2),
        Shl => format!("{} << ({} % {})", src1, src2, bs),
        ShrS => format!("{} >> ({} % {})", src1, src2, bs),
        ShrU => format!("({} as u{}) >> ({} % {})", src1, bs, src2, bs),
        Rotl => format!("{}.rotate_left({} as u32)", src1, src2),
        Rotr => format!("{}.rotate_right({} as u32)", src1, src2),
    }
}

fn print_fbinop(b: &wasm::syntax::instructions::floatop::BinOp, src1: &str, src2: &str) -> String {
    // XXX: Check potential semantics issues around boundary conditions
    use wasm::syntax::instructions::floatop::BinOp::*;
    match b {
        Add => format!("{} + {}", src1, src2),
        Sub => format!("{} - {}", src1, src2),
        Mul => format!("{} * {}", src1, src2),
        Div => format!("{} / {}", src1, src2),
        Min => format!("{}.min({})", src1, src2),
        Max => format!("{}.max({})", src1, src2),
        CopySign => format!("{}.copysign({})", src1, src2),
    }
}

fn print_irelop(
    bs: &wasm::syntax::BitSize,
    o: &wasm::syntax::instructions::intop::RelOp,
    src1: &str,
    src2: &str,
) -> String {
    use wasm::syntax::instructions::intop::RelOp::*;
    match o {
        Eq => format!("{} == {}", src1, src2),
        Ne => format!("{} != {}", src1, src2),
        LtS => format!("{} < {}", src1, src2),
        LtU => format!("({} as u{}) < ({} as u{})", src1, bs, src2, bs),
        GtS => format!("{} > {}", src1, src2),
        GtU => format!("({} as u{}) > ({} as u{})", src1, bs, src2, bs),
        LeS => format!("{} <= {}", src1, src2),
        LeU => format!("({} as u{}) <= ({} as u{})", src1, bs, src2, bs),
        GeS => format!("{} >= {}", src1, src2),
        GeU => format!("({} as u{}) >= ({} as u{})", src1, bs, src2, bs),
    }
}

fn print_frelop(o: &wasm::syntax::instructions::floatop::RelOp, src1: &str, src2: &str) -> String {
    // XXX: Check potential semantics issues around boundary conditions
    use wasm::syntax::instructions::floatop::RelOp::*;
    match o {
        Eq => format!("{} == {}", src1, src2),
        Ne => format!("{} != {}", src1, src2),
        Lt => format!("{} < {}", src1, src2),
        Gt => format!("{} > {}", src1, src2),
        Le => format!("{} <= {}", src1, src2),
        Ge => format!("{} >= {}", src1, src2),
    }
}

#[derive(Copy, Clone, Debug)]
enum LabelType {
    JumpToBlockStart,
    JumpToBlockEnd,
}

#[derive(Copy, Clone, Debug)]
struct Label {
    typ: LabelType,
    arity: usize,
    orig_stack_size: usize,
    name: usize,
}

impl std::fmt::Display for Label {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "'label_{}", self.name)
    }
}

// WARN: Whenever cloning, make sure to sync up label freshness
// sources correctly, so as to not end up reusing label names.
#[derive(Clone, Debug)]
struct PrinterState {
    stack_size: Option<usize>,
    max_stack_size: usize,
    label_freshness_source: usize,
    labels: Vec<Label>,
}

impl PrinterState {
    fn new() -> Self {
        PrinterState {
            stack_size: Some(0),
            max_stack_size: 0,
            label_freshness_source: 0,
            labels: vec![],
        }
    }

    fn push_label(&mut self, typ: LabelType, arity: usize) -> Label {
        let l = Label {
            typ,
            arity,
            orig_stack_size: self.stack_size.unwrap(),
            name: self.label_freshness_source,
        };
        self.label_freshness_source += 1;
        self.labels.push(l);
        l
    }

    fn pop_label(&mut self) {
        self.labels.pop();
    }
}

fn block_type_in_out_vals(
    m: &wasm::syntax::Module,
    bt: &wasm::syntax::BlockType,
) -> Maybe<(usize, usize)> {
    match bt {
        wasm::syntax::BlockType::TypeIdx(ti) => {
            let ty = m
                .types
                .get(ti.0 as usize)
                .ok_or(eyre!("Invalid type index {}", ti.0))?;
            Ok((ty.from.0.len(), ty.to.0.len()))
        }
        wasm::syntax::BlockType::ValType(None) => Ok((0, 0)),
        wasm::syntax::BlockType::ValType(Some(_v)) => Ok((0, 1)),
    }
}

fn local_typ(
    m: &wasm::syntax::Module,
    f: &wasm::syntax::Func,
    idx: usize,
) -> Maybe<wasm::syntax::ValType> {
    let fn_typ = m
        .types
        .get(f.typ.0 as usize)
        .ok_or(eyre!("Invalid type index {} for function", f.typ.0))?;
    let locals = match &f.internals {
        wasm::syntax::FuncInternals::LocalFunc { locals, .. } => locals,
        wasm::syntax::FuncInternals::ImportedFunc { .. } => {
            return Err(eyre!("Imported functions don't have locals"));
        }
    };
    let num_args = fn_typ.from.0.len();
    let num_locals = locals.len();
    let num_local_vars = num_args + num_locals;

    if idx < num_local_vars {
        if idx < num_args {
            Ok(fn_typ.from.0[idx])
        } else {
            Ok(locals[idx - num_args])
        }
    } else {
        Err(eyre!("Invalid local {}", idx))
    }
}

fn print_instr(
    ps: &mut PrinterState,
    m: &wasm::syntax::Module,
    fn_id: wasm::syntax::FuncIdx,
    i: &wasm::syntax::Instr,
    opts: &CmdLineOpts,
) -> Maybe<String> {
    let f = &m.funcs[fn_id.0 as usize];

    dbgprintln!(2, "Working on instruction {:?}", i);
    dbgprintln!(3, "\t{:?}", ps);

    macro_rules! stack_op {
        ($from:expr => $to:expr) => {{
            if ps.stack_size.unwrap() < $from {
                return Err(
                    eyre!("Insufficient stack depth. Is at {} but expected at least {}",
                            ps.stack_size.unwrap(), $from));
            }
            if $from < $to {
                ps.stack_size = Some(ps.stack_size.unwrap() + ($to - $from));
                ps.max_stack_size = std::cmp::max(ps.max_stack_size, ps.stack_size.unwrap());
            } else {
                ps.stack_size = Some(ps.stack_size.unwrap() - ($from - $to));
            }
        }};
        (_internal check1) => {{
            if ps.stack_size.unwrap() < 1 {
                return Err(eyre!("Insufficient stack depth"));
            }
        }};
        (_internal peek) => {{
            stack_op!(_internal check1);
            format_args!("v{}", ps.stack_size.unwrap() - 1)
        }};
        (_internal pop) => {{
            stack_op!(_internal check1);
            ps.stack_size = Some(ps.stack_size.unwrap() - 1);
            format_args!("v{}", ps.stack_size.unwrap())
        }};
        (_internal push) => {{
            ps.stack_size = Some(ps.stack_size.unwrap() + 1);
            ps.max_stack_size = std::cmp::max(ps.max_stack_size, ps.stack_size.unwrap());
            format_args!("v{}", ps.stack_size.unwrap() - 1)
        }};
        (i @ $b:expr ; $op:tt) => {{
            format!("{}.try_as_i{}()?", stack_op!(_internal $op), $b)
        }};
        (f @ $b:expr ; $op:tt) => {{
            format!("{}.try_as_f{}()?", stack_op!(_internal $op), $b)
        }};
        ($e:ty ; $op:tt) => {{
            format!("{}.try_as_{}()?", stack_op!(_internal $op), stringify!($e))
        }};
        ($e:expr ; $op:tt) => {{
            format!("{}.try_as_{}()?", stack_op!(_internal $op), $e)
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
            let dst = push!();
            Ok(format!("{} = TaggedVal::from({});", dst, c))
        }
        IUnOp(b, o) => {
            let src = pop!(i @ b);
            let dst = push!();
            Ok(format!(
                "{} = TaggedVal::from({});",
                dst,
                print_iunop(b, o, &src)
            ))
        }
        FUnOp(b, o) => {
            let src = pop!(f @ b);
            let dst = push!();
            Ok(format!(
                "{} = TaggedVal::from({});",
                dst,
                print_funop(o, &src)
            ))
        }
        IBinOp(b, o) => {
            let src2 = pop!(i @ b);
            let src1 = pop!(i @ b);
            let dst = push!();
            Ok(format!(
                "{} = TaggedVal::from({});",
                dst,
                print_ibinop(b, o, &src1, &src2)
            ))
        }
        FBinOp(b, o) => {
            let src2 = pop!(f @ b);
            let src1 = pop!(f @ b);
            let dst = push!();
            Ok(format!(
                "{} = TaggedVal::from({});",
                dst,
                print_fbinop(o, &src1, &src2)
            ))
        }
        ITestOp(b, o) => {
            let src = pop!(i @ b);
            let dst = push!();
            match o {
                wasm::syntax::intop::TestOp::Eqz => {
                    Ok(format!("{} = TaggedVal::from(({} == 0) as i32);", dst, src))
                }
            }
        }
        IRelOp(b, o) => {
            let src2 = pop!(i @ b);
            let src1 = pop!(i @ b);
            let dst = push!();
            Ok(format!(
                "{} = TaggedVal::from(({}) as i32);",
                dst,
                print_irelop(b, o, &src1, &src2)
            ))
        }
        FRelOp(b, o) => {
            let src2 = pop!(f @ b);
            let src1 = pop!(f @ b);
            let dst = push!();
            Ok(format!(
                "{} = TaggedVal::from(({}) as i32);",
                dst,
                print_frelop(o, &src1, &src2)
            ))
        }
        ICvtOp(b, o) => {
            use wasm::syntax::intop::CvtOp::*;
            use wasm::syntax::BitSize::*;
            let src = pop!();
            let dst = push!();
            let val = match o {
                WrapI64 => match b {
                    B32 => Ok(format!("{}.try_as_i64()? as i32", src)),
                    B64 => Err(eyre!("Invalid wrap instruction")),
                },
                TruncSF32 => Ok(format!(
                    "<_ as SafeFloatConv<i{}>>::try_to_int({}.try_as_f32()?.trunc())?",
                    b, src
                )),
                TruncUF32 => Ok(format!(
                    "<_ as SafeFloatConv<u{}>>::try_to_int({}.try_as_f32()?.trunc())?",
                    b, src
                )),
                TruncSF64 => Ok(format!(
                    "<_ as SafeFloatConv<i{}>>::try_to_int({}.try_as_f64()?.trunc())?",
                    b, src
                )),
                TruncUF64 => Ok(format!(
                    "<_ as SafeFloatConv<u{}>>::try_to_int({}.try_as_f64()?.trunc())?",
                    b, src
                )),
                ExtendSI32 => match b {
                    B32 => Err(eyre!("Invalid ExtendSI32 instruction")),
                    B64 => Ok(format!("({}.try_as_i32()? as i64)", src)),
                },
                ExtendUI32 => match b {
                    B32 => Err(eyre!("Invalid ExtendUI32 instruction")),
                    B64 => Ok(format!("({}.try_as_i32()? as u32 as u64 as i64)", src)),
                },
                TruncSatSF32 => Ok(format!("({}.try_as_f32()?.trunc() as i{})", src, b)),
                TruncSatUF32 => Ok(format!("({}.try_as_f32()?.trunc() as u{})", src, b)),
                TruncSatSF64 => Ok(format!("({}.try_as_f64()?.trunc() as i{})", src, b)),
                TruncSatUF64 => Ok(format!("({}.try_as_f64()?.trunc() as u{})", src, b)),
                ReinterpretFloat => Ok(format!("({}.try_as_f{}()?.to_bits())", src, b)),
            }?;
            Ok(format!("{} = TaggedVal::from({});", dst, val))
        }
        FCvtOp(b, o) => {
            use wasm::syntax::floatop::CvtOp::*;
            use wasm::syntax::BitSize::*;
            let src = pop!();
            let dst = push!();
            let val = match o {
                ConvertSI32 => Ok(format!("({}.try_as_i32()? as f{})", src, b)),
                ConvertUI32 => Ok(format!("({}.try_as_i32()? as u32 as f{})", src, b)),
                ConvertSI64 => Ok(format!("({}.try_as_i64()? as f{})", src, b)),
                ConvertUI64 => Ok(format!("({}.try_as_i64()? as u64 as f{})", src, b)),
                PromoteF32 => match b {
                    B32 => Err(eyre!("Invalid promotion")),
                    B64 => Ok(format!("({}.try_as_f32()? as f64)", src)),
                },
                DemoteF64 => match b {
                    B32 => Ok(format!("({}.try_as_f64()? as f32)", src)),
                    B64 => Err(eyre!("Invalid demotion")),
                },
                ReinterpretInt => Ok(format!(
                    "f{}::from_bits({}.try_as_i{}()? as u{})",
                    b, src, b, b
                )),
            }?;
            Ok(format!("{} = TaggedVal::from({});", dst, val))
        }
        Drop => {
            let _ = pop!();
            Ok("".into())
        }
        Select => {
            let c = pop!(i32);
            let v2 = pop!();
            let v1 = pop!();
            let dst = push!();
            Ok(format!(
                "if ValType::from({}) != ValType::from({}) {{
                     return None;
                 }}
                 if {} != 0 {{
                     {} = {};
                 }} else {{
                     {} = {};
                 }}",
                v1, v2, c, dst, v1, dst, v2,
            ))
        }
        LocalGet(l) => {
            let _ty = local_typ(m, f, l.0 as usize)?; // Confirm local existence
            Ok(format!("{} = TaggedVal::from(local_{});", push!(), l.0))
        }
        LocalSet(l) => {
            let ty = local_typ(m, f, l.0 as usize)?;
            Ok(format!("local_{} = {}.try_as_{}()?;", l.0, pop!(), ty))
        }
        LocalTee(l) => {
            let ty = local_typ(m, f, l.0 as usize)?;
            // NOTE: We eliminate the unnecessary indirection to
            // LocalSet here and instead just do it in one fell
            // swoop :)
            let v = peek!();
            Ok(format!("local_{} = {}.try_as_{}()?;", l.0, v, ty))
        }
        GlobalGet(g) => {
            if (g.0 as usize) < m.globals.len() {
                Ok(format!("{} = self.globals[{}];", push!(), g.0))
            } else {
                Err(eyre!("Invalid global {}", g.0))
            }
        }
        GlobalSet(g) => {
            if (g.0 as usize) < m.globals.len() {
                let g_t = &m.globals[g.0 as usize].typ;
                let src = pop!();
                if g_t.0 == wasm::syntax::Mut::Var {
                    Ok(format!(
                        "self.globals[{}] = TaggedVal::from({}.try_as_{}()?);",
                        g.0, src, g_t.1
                    ))
                } else {
                    Err(eyre!("Trying to mutate immutable global {}", g.0))
                }
            } else {
                Err(eyre!("Invalid global {}", g.0))
            }
        }
        MemLoad(mem) => {
            // Note: The spec explicitly states that the alignment
            // does not affect semantics, and exists only as a hint
            // for faster perf.
            let dynamic_offset = pop!(i32);
            let dst = push!();
            let ea = format!("({} + {})", dynamic_offset, mem.memarg.offset);
            let self_mem = if opts.fixed_mem_size.is_some() && !opts.no_alloc {
                "*self.memory"
            } else {
                "self.memory"
            };
            let mem_reader = match &mem.extend {
                None => format!("read_mem_{}({}.as_ref(), {} as usize)", mem.typ, self_mem, ea),
                Some((n, sx)) => {
                    if mem.typ == wasm::syntax::ValType::I32
                        || mem.typ == wasm::syntax::ValType::I64
                    {
                        format!(
                            "read_mem_{}{}({}.as_ref(), {} as usize).and_then(|x| Some(x as {}))",
                            sx, n, self_mem, ea, mem.typ
                        )
                    } else {
                        Err(eyre!("Invalid memory load"))?
                    }
                }
            };
            let mem_trace = if opts.memory_tracing {
                format!(
                    r#"eprintln!(
                           "[{}] memory<{{}}*64k={{:#x}}> load {}{} {{:#x}} -> {{:?}}",
                           self.memory.len() / 65536,
                           self.memory.len(),
                           {},
                           {},
                       );"#,
                    get_func_name(m, fn_id),
                    match &mem.extend {
                        None => "".into(),
                        Some((n, sx)) => format!("[SX {}{}]", sx, n),
                    },
                    mem.typ,
                    ea,
                    mem_reader,
                )
            } else {
                "".into()
            };
            Ok(format!(
                "{}{} = TaggedVal::from({}?);",
                mem_trace, dst, mem_reader
            ))
        }
        MemStore(mem) => {
            // Note: The spec explicitly states that the alignment
            // does not affect semantics, and exists only as a hint
            // for faster perf.
            let src = pop!(mem.typ);
            let dynamic_offset = pop!(i32);
            let ea = format!("({} + {})", dynamic_offset, mem.memarg.offset);
            let mem_trace = if opts.memory_tracing {
                format!(
                    r#"eprintln!(
                           "[{}] memory<{{}}*64k={{:#x}}> store {}{} {{:#x}} {{:#x}}",
                           self.memory.len() / 65536,
                           self.memory.len(),
                           {},
                           {},
                       );"#,
                    get_func_name(m, fn_id),
                    match &mem.bitwidth {
                        None => "".into(),
                        Some(n) => format!("[BW {}]", n),
                    },
                    mem.typ,
                    ea,
                    src,
                )
            } else {
                "".into()
            };
            let self_mem = if opts.fixed_mem_size.is_some() && !opts.no_alloc {
                "*self.memory"
            } else {
                "self.memory"
            };
            match &mem.bitwidth {
                None => Ok(format!(
                    "{}write_mem_{}({}.as_mut(), {} as usize, {})?;",
                    mem_trace, mem.typ, self_mem, ea, src
                )),
                Some(n) => {
                    if mem.typ == wasm::syntax::ValType::I32
                        || mem.typ == wasm::syntax::ValType::I64
                    {
                        Ok(format!(
                            "{}write_mem_u{}({}.as_mut(), {} as usize, {} as u{})?;",
                            mem_trace, n, self_mem, ea, src, n
                        ))
                    } else {
                        Err(eyre!("Invalid memory store"))?
                    }
                }
            }
        }
        MemSize => {
            // Note: The spec defines Page Size = 65536
            let inner_mem_size = if opts.fixed_mem_size.is_some() {
                "self.memory_size_to_vm"
            } else {
                "self.memory.len()"
            };
            let mem_trace = if opts.memory_tracing {
                format!(
                    r#"eprintln!(
                           "[{f}] memory<{{}}*64k={{:#x}}> size",
                           {s} / 65536,
                           {s},
                       );"#,
                    f = get_func_name(m, fn_id),
                    s = inner_mem_size,
                )
            } else {
                "".into()
            };
            Ok(format!(
                "{}{} = TaggedVal::from(({} / 65536) as i32);",
                mem_trace,
                push!(),
                inner_mem_size
            ))
        }
        MemGrow => {
            let n = pop!(i32);
            let res = push!();
            let inner_mem_size = if opts.fixed_mem_size.is_some() {
                "self.memory_size_to_vm"
            } else {
                "self.memory.len()"
            };
            let mem_trace = if opts.memory_tracing {
                format!(
                    r#"eprintln!(
                           "[{f}] memory<{{}}*64k={{:#x}}> grow {{}}",
                           {s} / 65536,
                           {s},
                           {n},
                       );"#,
                    f = get_func_name(m, fn_id),
                    n = n,
                    s = inner_mem_size,
                )
            } else {
                "".into()
            };
            let new_size = {
                let s = format!(
                    "{m}{modif} + (65536 * {n} as usize)",
                    m = inner_mem_size,
                    n = n,
                    modif = if opts.memory_wrapping && !opts.prevent_extra_mem_for_wrapping {
                        " - 8"
                    } else {
                        ""
                    }
                );
                let s = if opts.memory_wrapping && !opts.fixed_mem_size.is_some() {
                    format!("({}).checked_next_power_of_two()?", s)
                } else {
                    s
                };
                if opts.memory_wrapping && !opts.prevent_extra_mem_for_wrapping {
                    format!("{} + 8", s)
                } else {
                    s
                }
            };
            let grow_memory = if opts.fixed_mem_size.is_some() {
                format!(
                    "{{
                         let orig_size = (self.memory_size_to_vm / 65536);
                         self.memory_size_to_vm = {new_size};
                         {res} = TaggedVal::from(orig_size as i32);
                     }}",
                    res = res,
                    new_size = new_size,
                )
            } else {
                format!(
                    "{{
                         let orig_size = (self.memory.len() / 65536);
                         self.memory.resize_with({new_size},
                                                 Default::default);
                         {res} = TaggedVal::from(orig_size as i32);
                     }}",
                    res = res,
                    new_size = new_size,
                )
            };
            let failed_to_grow = format!("{} = TaggedVal::from(-1i32);", res);
            let max_mem_size = opts
                .fixed_mem_size
                .or(m.mems.get(0).and_then(|m| m.typ.0.max));
            if m.mems.len() == 0 {
                // XXX: Handle imported memory. The spec allows us to
                // always just return "error", so we do that for now.
                Ok(format!("{}{}", mem_trace, failed_to_grow))
            } else {
                assert_eq!(m.mems.len(), 1);
                if let Some(max_size) = max_mem_size {
                    Ok(format!(
                        "{}if ({} as u32) < {}u32 {{ {} }} else {{ {} }}",
                        mem_trace, n, max_size, grow_memory, failed_to_grow
                    ))
                } else {
                    Ok(format!("{}{}", mem_trace, grow_memory))
                }
            }
        }
        Nop => Ok("".into()),
        Unreachable => {
            ps.stack_size = None; // anything beyond an unreachable statement must be dead code
            Ok(
                r#"unreachable!("Reached a point explicitly marked unreachable in WASM module");"#
                    .into(),
            )
        }
        Block(bt, is) => {
            let orig_stack_size = ps.stack_size.unwrap();
            let blocktype = block_type_in_out_vals(m, bt)?;
            let lbl = ps.push_label(LabelType::JumpToBlockEnd, blocktype.1);
            let body = print_instrs(ps, m, fn_id, is, opts)?;
            ps.pop_label();
            if let Some(st_size) = ps.stack_size {
                if (orig_stack_size - blocktype.0) + blocktype.1 != st_size {
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
            }
            Ok(format!("{}: loop {{\n{}\nbreak;\n}}", lbl, body))
        }
        Loop(bt, is) => {
            let orig_stack_size = ps.stack_size.unwrap();
            let blocktype = block_type_in_out_vals(m, bt)?;
            let lbl = ps.push_label(LabelType::JumpToBlockStart, blocktype.0);
            let body = print_instrs(ps, m, fn_id, is, opts)?;
            ps.pop_label();
            if let Some(st_size) = ps.stack_size {
                if (orig_stack_size - blocktype.0) + blocktype.1 != st_size {
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
                ps.stack_size = Some((orig_stack_size - blocktype.0) + blocktype.1);
            }
            // Note: A `Loop` in WASM does not automatically cause it
            // to loop- it is simply a construct that allows you to
            // jump back to the start, rather than jump to the end,
            // like in `Block`. To actually make a `Loop` loop, one
            // must do a `Br`-style instruction targeted at the label
            // of the `Loop`.
            Ok(format!("{}: loop {{\n{}\nbreak;}}", lbl, body))
        }
        If(bt, is1, is2) => {
            let lbl = ps.push_label(LabelType::JumpToBlockEnd, block_type_in_out_vals(m, bt)?.1);
            let cond = pop!(i32);
            let mut ps1 = ps.clone();
            let body1 = print_instrs(&mut ps1, m, fn_id, is1, opts)?;
            ps.label_freshness_source = ps1.label_freshness_source;
            let body2 = print_instrs(ps, m, fn_id, is2, opts)?;
            // if either of the branches go into dead-code, then propagate the other branch
            if ps1.stack_size.is_none() {
                ps1.stack_size = ps.stack_size;
            } else if ps.stack_size.is_none() {
                ps.stack_size = ps1.stack_size;
            }
            // if the branches don't agree on stack layout, then something is wrong
            if ps1.stack_size == ps.stack_size {
                ps.max_stack_size = std::cmp::max(ps1.max_stack_size, ps.max_stack_size);
                ps.pop_label();
                Ok(format!(
                    "{}: loop {{ if {} != 0 {{ {} }} else {{ {} }}
                                 break;
                    }}",
                    lbl, cond, body1, body2
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
                if lbl.orig_stack_size + lbl.arity <= ps.stack_size.unwrap() {
                    let movement = (0..lbl.arity)
                        .map(|i| {
                            format!(
                                "v{} = v{};",
                                lbl.orig_stack_size + i,
                                ps.stack_size.unwrap() - lbl.arity + i
                            )
                        })
                        .collect::<Vec<_>>()
                        .join("\n");
                    let branch = match lbl.typ {
                        LabelType::JumpToBlockStart => "continue",
                        LabelType::JumpToBlockEnd => "break",
                    };
                    ps.stack_size = None;
                    Ok(format!("{{\n{}\n}}\n{} {};", movement, branch, lbl))
                } else {
                    Err(eyre!(
                        "Somehow, the branch tries to add stuff?! ({} + {} > {})",
                        lbl.orig_stack_size,
                        lbl.arity,
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
            let body = print_instr(ps, m, fn_id, &Br(*l), opts)?;
            ps.stack_size = orig_stack_size;
            Ok(format!("if {} != 0 {{\n{}\n}}", cond, body))
        }
        BrTable(lbls, lbl_default) => {
            let cond = pop!(i32);
            let orig_stack_size = ps.stack_size;
            let bodies = lbls
                .iter()
                .map(|l| {
                    ps.stack_size = orig_stack_size;
                    print_instr(ps, m, fn_id, &Br(*l), opts)
                })
                .collect::<Maybe<Vec<String>>>()?
                .iter()
                .enumerate()
                .map(|(i, b)| format!("{} => {{\n{}\n}},", i, b))
                .collect::<Vec<String>>()
                .join("\n");
            let body_default = format!("_ => {{\n{}\n}},", {
                ps.stack_size = orig_stack_size;
                print_instr(ps, m, fn_id, &Br(*lbl_default), opts)?
            });
            ps.stack_size = None;
            Ok(format!(
                "match {} {{\n{}\n{}\n}}",
                cond, bodies, body_default
            ))
        }
        Return => {
            let ret = print_return(ps, m, f, opts, fn_id)?;
            ps.stack_size = None;
            Ok(format!("return {};", ret))
        }
        Call(fn_idx) => {
            let ((stack_from, stack_to), code) =
                print_inline_call(m, fn_idx, ps.stack_size.unwrap())?;

            stack_op!(stack_from => stack_to);

            Ok(code)
        }
        CallIndirect(typ_idx) => {
            if opts.inline_indirect_calls {
                let ((stack_from, stack_to), code) =
                    print_inline_indirect_call(m, typ_idx, ps.stack_size.unwrap())?;

                stack_op!(stack_from => stack_to);

                Ok(code)
            } else if opts.type_based_indirect_calls {
                let typ_expected = m.types.get(typ_idx.0 as usize).ok_or(eyre!(
                    "Invalid type index {} for indirect callee function",
                    typ_idx.0
                ))?;
                let _table_typ: &wasm::syntax::TableType = &m
                    .tables
                    .get(0)
                    .ok_or(eyre!("Non existent table {} for indirect call", 0))?
                    .typ;
                // XXX: Do we need to check the table type?

                let call_target = pop!(i32);
                if ps.stack_size.unwrap() < typ_expected.from.0.len() {
                    return Err(eyre!(
                        "Trying to do an indirect call to type {} that requires {} arguments, \
                         while only {} values are on stack",
                        typ_idx.0,
                        typ_expected.from.0.len(),
                        ps.stack_size.unwrap()
                    ));
                }
                let stack_base = ps.stack_size.unwrap() - typ_expected.from.0.len();
                stack_op!(typ_expected.from.0.len() => typ_expected.to.0.len());

                let callee_args = typ_expected
                    .from
                    .0
                    .iter()
                    .enumerate()
                    .map(|(i, t)| format!("v{}.try_as_{}()?", i + stack_base, t))
                    .collect::<Vec<_>>()
                    .join(", ");

                // The `indirect_call_{typidx}` does the actual
                // indirection. This comes from the printing of the
                // `elem` part of the module.
                let call = format!(
                    "self.indirect_call_{}({} as usize, {})?",
                    typ_idx.0, call_target, callee_args
                );

                Ok(match typ_expected.to.0.len() {
                    0 => format!("{};", call),
                    1 => format!("v{} = TaggedVal::from({});", stack_base, call),
                    _ => format!(
                        "{{
                             let returned = {};
                             {}
                         }}",
                        call,
                        typ_expected
                            .to
                            .0
                            .iter()
                            .enumerate()
                            .map(|(i, _)| {
                                format!("v{} = TaggedVal::from(returned.{});", i + stack_base, i)
                            })
                            .collect::<Vec<_>>()
                            .join("\n")
                    ),
                })
            } else {
                let typ_expected = m.types.get(typ_idx.0 as usize).ok_or(eyre!(
                    "Invalid type index {} for indirect callee function",
                    typ_idx.0
                ))?;
                let _table_typ: &wasm::syntax::TableType = &m
                    .tables
                    .get(0)
                    .ok_or(eyre!("Non existent table {} for indirect call", 0))?
                    .typ;
                // XXX: Do we need to check the table type?

                let call_target = pop!(i32);
                let stack_base = ps.stack_size.unwrap() - typ_expected.from.0.len();
                stack_op!(typ_expected.from.0.len() => typ_expected.to.0.len());

                let args = typ_expected
                    .from
                    .0
                    .iter()
                    .enumerate()
                    .map(|(i, _t)| format!("v{}", stack_base + i))
                    .collect::<Vec<_>>()
                    .join(", ");
                let rets = typ_expected
                    .to
                    .0
                    .iter()
                    .enumerate()
                    .map(|(i, _t)| format!("v{} = rets[{}];", stack_base + i, i))
                    .collect::<Vec<_>>()
                    .join("\n");

                // The `indirect_call` function does the actual
                // indirection. This comes from the printing of the `elem`
                // part of the module.
                Ok(format!(
                    "{{
                    let rets = self.indirect_call({} as usize, &[{}])?;
                    if rets.len() != {} {{
                        return None;
                    }}{}
                 }}",
                    call_target,
                    args,
                    typ_expected.to.0.len(),
                    rets
                ))
            }
        }
    }
}

fn reduced_instr_representation(i: &wasm::syntax::Instr) -> String {
    use wasm::syntax::Instr::*;
    match i {
        Block(bt, is) => format!("Block({:?}, ..{} instr..)", bt, is.len()),
        Loop(bt, is) => format!("Loop({:?}, ..{} instr..)", bt, is.len()),
        If(bt, is1, is2) => format!(
            "If({:?}, ..{} instr.., ..{} instr..)",
            bt,
            is1.len(),
            is2.len()
        ),
        _ => format!("{:?}", i),
    }
}

fn print_instrs(
    ps: &mut PrinterState,
    m: &wasm::syntax::Module,
    fn_id: wasm::syntax::FuncIdx,
    instrs: &[wasm::syntax::Instr],
    opts: &CmdLineOpts,
) -> Maybe<String> {
    let func_name = get_func_name(m, fn_id);
    Ok(instrs
        .iter()
        .map(|i| {
            let ins = print_instr(ps, m, fn_id, i, opts)?;
            let ins = if opts.instruction_tracing {
                format!(
                    r#"eprintln!("[{}] {{}}", "{}"); {}"#,
                    func_name,
                    reduced_instr_representation(i),
                    ins
                )
            } else {
                ins
            };
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

fn wrap_unit_singular_tuple(mut v: Vec<String>) -> String {
    match v.len() {
        0 => "()".into(),
        1 => v.pop().unwrap(),
        _ => format!("({})", v.join(", ")),
    }
}

fn print_return(
    ps: &mut PrinterState,
    m: &wasm::syntax::Module,
    f: &wasm::syntax::Func,
    opts: &CmdLineOpts,
    fn_id: wasm::syntax::FuncIdx,
) -> Maybe<String> {
    let typ = m
        .types
        .get(f.typ.0 as usize)
        .ok_or(eyre!("Invalid type index {} for function", f.typ.0))?;
    let ret = if typ.to.0.len() > ps.stack_size.unwrap() {
        return Err(eyre!(
            "Insufficient values at end of stack. Expected {} got {}",
            typ.to.0.len(),
            ps.stack_size.unwrap()
        ));
    } else {
        let stack_base = ps.stack_size.unwrap() - typ.to.0.len();
        format!(
            "Some({})",
            wrap_unit_singular_tuple(
                typ.to
                    .0
                    .iter()
                    .enumerate()
                    .map(|(i, t)| format!("v{}.try_as_{}()?", i + stack_base, t))
                    .collect(),
            )
        )
    };
    if opts.function_return_tracing {
        Ok(format!(
            r#"{{
                  let ret = {ret};
                  eprintln!("[func_{fn_id}] {fn_name} returned {{:?}}", ret);
                  ret
               }}"#,
            fn_id = fn_id.0,
            fn_name = get_func_name(m, fn_id),
            ret = ret
        ))
    } else {
        Ok(ret)
    }
}

fn print_function_signature(m: &wasm::syntax::Module, f: &wasm::syntax::Func) -> Maybe<String> {
    let typ = m
        .types
        .get(f.typ.0 as usize)
        .ok_or(eyre!("Invalid type index {} for function", f.typ.0))?;

    let mut result = String::new();

    // Argument Type
    result += "(&mut self, ";
    result += &typ
        .from
        .0
        .iter()
        .enumerate()
        .map(|(i, t)| format!("arg_{}: {}", i, t))
        .collect::<Vec<_>>()
        .join(", ");
    result += ")";

    // Result Type
    result += &format!(
        " -> Option<{}>",
        wrap_unit_singular_tuple(typ.to.0.iter().map(|t| format!("{}", t)).collect())
    );

    Ok(result)
}

fn get_func_name(m: &wasm::syntax::Module, id: wasm::syntax::FuncIdx) -> String {
    m.names
        .functions
        .get(&id)
        .unwrap_or(&format!("func_{}", id.0))
        .into()
}

fn print_function(
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

    // Warning squashers
    //   - unused_mut: Some WASM code may not write to some variables at all
    //   - unused_variables: Some WASM code declare but not use some variables
    //   - unused_assignments: Some WASM code might write to but not read from some variables
    //   - unused_parens: Stylistic preference- makes code generation easier
    //   - unreachable_code: Explicitly unreachable code is allowed in WASM
    //   - unused_labels: Makes code generation easier
    result += "#[allow(\
               unused_mut, unused_variables, unused_assignments, \
               unused_parens, unreachable_code, unused_labels\
               )]\n";

    // Function name
    result += &format!("fn func_{}", id.0);

    // Argument and result types
    let signature = print_function_signature(m, f)?;
    result += &signature;

    dbgprintln!(
        1,
        "Generated function signature, using type index {}",
        f.typ.0
    );
    dbgprintln!(2, "\t{}", signature);

    // Body
    result += " {\n";
    if opts.function_tracing {
        let func_args_fmt_str = typ
            .from
            .0
            .iter()
            .enumerate()
            .map(|(_i, _t)| "{}")
            .collect::<Vec<_>>()
            .join(", ");
        let func_args = typ
            .from
            .0
            .iter()
            .enumerate()
            .map(|(i, _t)| format!("arg_{}", i))
            .collect::<Vec<_>>()
            .join(", ");
        let func_name: String = get_func_name(m, id);
        let additional_data = match &f.internals {
            wasm::syntax::FuncInternals::ImportedFunc { module, name } => {
                format!(" // IMPORTED {}.{}", module, name)
            }
            wasm::syntax::FuncInternals::LocalFunc { .. } => {
                let matching_exports = m
                    .exports
                    .iter()
                    .filter_map(|e| match e.desc {
                        wasm::syntax::ExportDesc::Func(fn_idx) => {
                            if fn_idx == id {
                                Some(e.name.clone())
                            } else {
                                None
                            }
                        }
                        _ => None,
                    })
                    .collect::<Vec<_>>();
                if matching_exports.is_empty() {
                    "".into()
                } else {
                    format!(" // EXPORTED {}", matching_exports.join(", "))
                }
            }
        };
        result += &format!(
            r#"eprintln!("[func_{}] {}({}){}", {});"#,
            id.0, func_name, func_args_fmt_str, additional_data, func_args
        );
    }
    match &f.internals {
        wasm::syntax::FuncInternals::LocalFunc { locals, body } => {
            // Locals
            result += &typ
                .from
                .0
                .iter()
                .enumerate()
                .map(|(i, t)| format!("let mut local_{} : {} = arg_{};", i, t, i))
                .collect::<Vec<_>>()
                .join("\n");
            result += &locals
                .iter()
                .enumerate()
                .map(|(i, t)| format!("let mut local_{} : {} = 0{};", i + typ.from.0.len(), t, t))
                .collect::<Vec<_>>()
                .join("\n");

            dbgprintln!(
                1,
                "Generated {} locals ({} args + {} explicit locals)",
                typ.from.0.len() + locals.len(),
                typ.from.0.len(),
                locals.len()
            );

            let mut ps = PrinterState::new();

            // Actual body
            let body = print_instrs(&mut ps, m, id, &body.0, opts)?;
            result += &(0..ps.max_stack_size)
                .map(|i| format!("let mut v{}: TaggedVal;", i))
                .collect::<Vec<_>>()
                .join("\n");
            result += &body;

            dbgprintln!(1, "Generated body");

            // And finally, the return
            if let Some(st_size) = ps.stack_size {
                if typ.to.0.len() != st_size {
                    return Err(eyre!(
                        "Unaligned stack at end of function. Expected {} got {}",
                        typ.to.0.len(),
                        st_size
                    ));
                } else {
                    result += &print_return(&mut ps, m, f, opts, id)?;
                }
            } else {
                result += "// no implicit return\n";
            }
        }
        wasm::syntax::FuncInternals::ImportedFunc { module, name } => {
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
                        // Turns out wasi_common requires us to
                        // manually implement this one by explicitly
                        // marking it unimplemented. We simply want
                        // the whole process to exit at this point.
                        result += "std::process::exit(arg_0)";
                    } else {
                        let self_mem = if opts.fixed_mem_size.is_some() && !opts.no_alloc {
                            "*self.memory"
                        } else {
                            "self.memory"
                        };
                        let body = format!(
                            "Some(wasi_common::wasi::wasi_snapshot_preview1::{}(\
                              &self.context, \
                              &guest_mem_wrapper::GuestMemWrapper::from(&mut {}), \
                              {}))",
                            name, self_mem, args
                        );
                        if opts.function_return_tracing {
                            result += &format!(
                                r#"{{
                                       let ret = {ret};
                                       eprintln!("[func_{fn_id}] {fn_name} returned {{:?}}", ret);
                                       ret
                                   }}"#,
                                fn_id = id.0,
                                fn_name = name,
                                ret = body
                            );
                        } else {
                            result += &body;
                        }
                    }
                }
            } else {
                result += &format!("unimplemented!() /* {}.{} */", module, name);
            }
        }
    }
    result += "}\n\n";

    dbgprintln!(1, "Finished function {}", id.0);

    Ok(result)
}

fn print_global_initializer(g: &wasm::syntax::Global) -> Maybe<String> {
    if g.init.0.len() != 1 {
        return Err(eyre!(
            "Currently unsupported expression for global initialization"
        ))?;
    }
    if let wasm::syntax::Instr::Const(c) = &g.init.0[0] {
        Ok(c.to_variant_string())
    } else {
        Err(eyre!(
            "Currently unsupported expression for global initialization"
        ))?
    }
}

fn print_elem(
    self_name: &str, 
    e: &wasm::syntax::Elem,
    opts: &CmdLineOpts,
) -> Maybe<String> {
    if e.table.0 != 0 {
        return Err(eyre!("Current version of WASM supports only 1 table"))?;
    }
    if e.offset.0.len() != 1 {
        return Err(eyre!("Currently unsupported expression for elem offset"))?;
    }
    if let wasm::syntax::Instr::Const(c) = &e.offset.0[0] {
        let offset = match c {
            wasm::syntax::Const::I32(c) => *c as usize,
            wasm::syntax::Const::I64(c) => *c as usize,
            _ => {
                return Err(eyre!("Invalid floating offset"))?;
            }
        };
        let setup = if !opts.no_alloc {
            format!(
                "if {}.indirect_call_table.len() < {} {{ {}.indirect_call_table.resize({}, None) }}",
                self_name,
                offset + e.init.len(),
                self_name,
                offset + e.init.len(),
            )
        } else {
            "".into()
        };
        let insertions = e
            .init
            .iter()
            .enumerate()
            .map(|(i, f)| {
                format!(
                    "{}.indirect_call_table[{}] = Some({});",
                    self_name,
                    offset + i,
                    f.0
                )
            })
            .collect::<Vec<_>>()
            .join("\n");
        Ok(format!("{}\n{}", setup, insertions))
    } else {
        Err(eyre!("Currently unsupported expression for elem offset"))?
    }
}

fn print_data(self_name: &str, d: &wasm::syntax::Data) -> Maybe<String> {
    if d.data.0 != 0 {
        return Err(eyre!("Current version of WASM supports only 1 memory"))?;
    }
    if d.offset.0.len() != 1 {
        return Err(eyre!("Currently unsupported expression for data offset"))?;
    }
    if let wasm::syntax::Instr::Const(c) = &d.offset.0[0] {
        let offset = match c {
            wasm::syntax::Const::I32(c) => *c as usize,
            wasm::syntax::Const::I64(c) => *c as usize,
            _ => {
                return Err(eyre!("Invalid floating offset"))?;
            }
        };
        let len = d.init.len();
        let bytes = d
            .init
            .iter()
            .map(|b| format!("{}", b))
            .collect::<Vec<_>>()
            .join(", ");
        Ok(format!(
            "{}.memory[{}..{}].copy_from_slice(&[{}]);",
            self_name,
            offset,
            offset + len,
            bytes
        ))
    } else {
        Err(eyre!("Currently unsupported expression for data offset"))?
    }
}

// Returns stack change (from, to) and the code to execute the call
fn print_inline_call(
    m: &wasm::syntax::Module,
    fn_idx: &wasm::syntax::FuncIdx,
    stack_top_at_start_of_call: usize,
) -> Maybe<((usize, usize), String)> {
    let callee: &wasm::syntax::Func = m
        .funcs
        .get(fn_idx.0 as usize)
        .ok_or(eyre!("Invalid function {} being called", fn_idx.0))?;
    let callee_typ = m.types.get(callee.typ.0 as usize).ok_or(eyre!(
        "Invalid type index {} for callee function",
        callee.typ.0
    ))?;

    if stack_top_at_start_of_call < callee_typ.from.0.len() {
        return Err(eyre!(
            "Trying to call function {} that requires {} arguments, \
                     while only {} values are on stack",
            fn_idx.0,
            callee_typ.from.0.len(),
            stack_top_at_start_of_call,
        ));
    }
    let stack_base = stack_top_at_start_of_call - callee_typ.from.0.len();

    let callee_args = callee_typ
        .from
        .0
        .iter()
        .enumerate()
        .map(|(i, t)| format!("v{}.try_as_{}()?", i + stack_base, t))
        .collect::<Vec<_>>()
        .join(", ");

    let call = format!("self.func_{}({})?", fn_idx.0, callee_args);

    let call_code = match callee_typ.to.0.len() {
        0 => format!("{};", call),
        1 => format!("v{} = TaggedVal::from({});", stack_base, call),
        _ => format!(
            "{{
                         let returned = {};
                         {}
                    }}",
            call,
            callee_typ
                .to
                .0
                .iter()
                .enumerate()
                .map(|(i, _)| { format!("v{} = TaggedVal::from(returned.{});", i + stack_base, i) })
                .collect::<Vec<_>>()
                .join("\n")
        ),
    };

    Ok(((callee_typ.from.0.len(), callee_typ.to.0.len()), call_code))
}

fn print_inline_indirect_call(
    m: &wasm::syntax::Module,
    typ_idx: &wasm::syntax::TypeIdx,
    stack_top_at_start_of_call: usize,
) -> Maybe<((usize, usize), String)> {
    let typ_expected = m.types.get(typ_idx.0 as usize).ok_or(eyre!(
        "Invalid type index {} for indirect callee function",
        typ_idx.0
    ))?;
    let _table_typ: &wasm::syntax::TableType = &m
        .tables
        .get(0)
        .ok_or(eyre!("Non existent table {} for indirect call", 0))?
        .typ;
    // XXX: Do we need to check the table type?

    let call_target = format!(
        "(*self.indirect_call_table.get(v{}.try_as_i32()? as usize)?)?",
        stack_top_at_start_of_call - 1
    );

    let targets = m
        .funcs
        .iter()
        .enumerate()
        .filter(|(_i, f)| f.typ == *typ_idx) // keep only those which have the expected type
        .map(|(i, _f)| {
            let ((from, to), code) = print_inline_call(
                m,
                &wasm::syntax::FuncIdx(i as u32),
                stack_top_at_start_of_call - 1, // -1 due to "call target" being taken from stack
            )?;

            assert_eq!(from, typ_expected.from.0.len());
            assert_eq!(to, typ_expected.to.0.len());

            Ok(format!("{} => {{ {} }}", i, code))
        })
        .collect::<Maybe<Vec<_>>>()?;

    let code = format!(
        "match {call_target} {{
             {target_branches} _ => {{ return None; }},
         }}",
        call_target = call_target,
        target_branches = targets.join(",\n"),
    );

    // +1 due to "call target" being taken from stack
    Ok((
        (typ_expected.from.0.len() + 1, typ_expected.to.0.len()),
        code,
    ))
}

fn print_indirect_call_dispatch(m: &wasm::syntax::Module, opts: &CmdLineOpts) -> Maybe<String> {
    let targets = m
        .funcs
        .iter()
        .enumerate()
        .map(|(i, f)| {
            let typ = m
                .types
                .get(f.typ.0 as usize)
                .ok_or(eyre!("Invalid type index {} for function", f.typ.0))?;
            let arg_setup = typ
                .from
                .0
                .iter()
                .enumerate()
                .map(|(i, t)| format!("let a{} = args[{}].try_as_{}()?;", i, i, t))
                .collect::<Vec<_>>()
                .join("\n");
            let args = typ
                .from
                .0
                .iter()
                .enumerate()
                .map(|(i, _t)| format!("a{}", i))
                .collect::<Vec<_>>()
                .join(", ");
            let num_rets = typ.to.0.len();
            let rets = match num_rets {
                0 => "".into(),
                1 => "TaggedVal::from(rets)".into(),
                _ => typ
                    .to
                    .0
                    .iter()
                    .enumerate()
                    .map(|(i, _t)| format!("TaggedVal::from(rets.{})", i))
                    .collect::<Vec<_>>()
                    .join(", "),
            };
            let store_rets = if typ.to.0.is_empty() {
                ""
            } else {
                "let rets = "
            };
            let ret = if !opts.no_alloc {
                format!("vec![{}]", rets)
            } else {
                format!("IndirectFuncRet::Ret{}([{}])", num_rets, rets)
            };
            Ok(format!(
                "{} => {{
                         if args.len() != {} {{
                             return None;
                         }}
                         {}
                         {}self.func_{}({})?;
                         Some({})
                     }}",
                i,
                typ.from.0.len(),
                arg_setup,
                store_rets,
                i,
                args,
                ret,
            ))
        })
        .collect::<Maybe<Vec<_>>>()?
        .join("\n");
    Ok(format!(
        "impl WasmModule{lifetime} {{
             #[allow(dead_code)]
             fn indirect_call(&mut self, idx: usize, args: &[TaggedVal]) ->
                     Option<{}> {{
                 let call_target = (*self.indirect_call_table.get(idx)?)?;
                 match call_target {{
                     {}
                     _ => None,
                 }}
             }}
        }}",
        {
            if !opts.no_alloc { "Vec<TaggedVal>"  }
            else              { "IndirectFuncRet" }
        },
        targets,
        lifetime = if !mem_imported(m) { "" } else { "<'_>" },
    ))
}

fn print_type_based_indirect_call_dispatch(m: &wasm::syntax::Module) -> Maybe<String> {
    let dispatchers = m
        .types
        .iter()
        .enumerate()
        .map(|(typ_idx, typ)| {
            let args = typ
                .from
                .0
                .iter()
                .enumerate()
                .map(|(i, _t)| format!("a{}", i))
                .collect::<Vec<_>>()
                .join(", ");

            let args_with_types = typ
                .from
                .0
                .iter()
                .enumerate()
                .map(|(i, t)| format!("a{}: {}", i, t))
                .collect::<Vec<_>>()
                .join(", ");
            let ret_type =
                wrap_unit_singular_tuple(typ.to.0.iter().map(|t| format!("{}", t)).collect());

            let funcs = m
                .funcs
                .iter()
                .enumerate()
                .filter(|(_func_idx, func)| func.typ.0 as usize == typ_idx)
                .map(|(func_idx, _func)| {
                    format!("{} => self.func_{}({}),", func_idx, func_idx, args)
                })
                .collect::<Vec<_>>()
                .join("\n");

            format!(
                "#[allow(dead_code)]
                 fn indirect_call_{ti}(&mut self, idx: usize, {awt}) -> Option<{rt}> {{
                     let call_target = (*self.indirect_call_table.get(idx)?)?;
                     match call_target {{
                         {fs}
                         _ => None,
                     }}
                 }}",
                ti = typ_idx,
                awt = args_with_types,
                rt = ret_type,
                fs = funcs,
            )
        })
        .collect::<Vec<_>>()
        .join("\n");

    let lifetime = if !mem_imported(m) { "" } else { "<'_>" };

    Ok(format!("impl WasmModule{lifetime} {{ {} }}", dispatchers))
}

fn is_snake_case(s: &str) -> bool {
    s.find(char::is_uppercase).is_none() && s.find("__").is_none()
}

#[rustfmt::skip]
const RUST_KEYWORDS: [&str; 54] = [
    "as", "break", "const", "continue", "crate", "else", "enum",
    "extern", "false", "fn", "for", "if", "impl", "in", "let", "loop",
    "match", "mod", "move", "mut", "pub", "ref", "return", "self",
    "Self", "static", "struct", "super", "trait", "true", "type",
    "unsafe", "use", "where", "while", "async", "await", "dyn",
    "abstract", "become", "box", "do", "final", "macro", "override",
    "priv", "typeof", "unsized", "virtual", "yield", "try",
    "macro_rules", "union", "dyn",
];

fn is_rust_keyword(x: &str) -> bool {
    RUST_KEYWORDS.iter().any(|&k| x == k)
}

fn print_export(
    m: &wasm::syntax::Module,
    e: &wasm::syntax::Export,
    opts: &CmdLineOpts,
) -> Maybe<String> {
    match e.desc {
        wasm::syntax::ExportDesc::Func(fn_idx) => {
            let non_snake_case_suppression = if is_snake_case(&e.name) {
                ""
            } else {
                "#[allow(non_snake_case)]"
            };
            let f = m
                .funcs
                .get(fn_idx.0 as usize)
                .ok_or(eyre!("Invalid function for export"))?;
            let name = if is_rust_keyword(&e.name) {
                println!("WARNING: Found function export with Rust keyword as name of function: `{name}`. \
                          Exporting as `r#{name}` instead.", name = e.name);
                format!("r#{}", e.name)
            } else {
                format!("{}", e.name)
            };
            Ok(format!(
                "impl WasmModule{lifetime} {{
                     {}pub fn {}{} {{
                         self.func_{}({})
                     }}
                 }}",
                non_snake_case_suppression,
                name,
                print_function_signature(m, f)?,
                fn_idx.0,
                (0..m
                    .types
                    .get(f.typ.0 as usize)
                    .ok_or(eyre!(
                        "Invalid type index {} for exported function",
                        f.typ.0
                    ))?
                    .from
                    .0
                    .len())
                    .map(|i| format!("arg_{}", i))
                    .collect::<Vec<_>>()
                    .join(", "),
                lifetime = if !mem_imported(m) { "" } else { "<'_>" },
            ))
        }
        wasm::syntax::ExportDesc::Table(_tbl_idx) => {
            Err(eyre!("Currently unsupported table export"))?
        }
        wasm::syntax::ExportDesc::Mem(mem_idx) => {
            assert_eq!(mem_idx.0, 0);
            let lifetime = if !mem_imported(m) { "" } else { "<'_>" };
            if opts.generate_as_wasi_library {
                Ok(format!("impl WasmModule{lifetime} {{
                    #[allow(dead_code)]
                    pub fn get_memory(&mut self) -> &mut [u8] {{
                        &mut self.memory
                    }}
                }}"))
            } else {
                Ok(format!("impl WasmModule{lifetime} {{
                    #[allow(dead_code)]
                    pub fn get_memory(&mut self) -> *mut u8 {{
                        self.memory.as_mut_ptr()
                    }}
                    pub fn get_memory_size(&self) -> usize {{
                        self.memory.len()
                    }}
                }}"))
            }
        }
        wasm::syntax::ExportDesc::Global(glb_idx) => {
            let non_snake_case_suppression = {
                if is_snake_case(&e.name) && !e.name.starts_with("_") {
                    ""
                } else {
                    "#[allow(non_snake_case)]"
                }
            };
            let wasm::syntax::GlobalType(mutable, typ) = m
                .globals
                .get(glb_idx.0 as usize)
                .ok_or(eyre!("Invalid global for export"))?
                .typ;
            let lifetime = if !mem_imported(m) { "" } else { "<'_>" };
            let getter = format!(
                "impl WasmModule{lifetime} {{
                     {}pub fn get_{}(&self) -> Option<{}> {{
                         self.globals[{}].try_as_{}()
                     }}
                 }}",
                non_snake_case_suppression, e.name, typ, glb_idx.0, typ
            );
            let setter = format!(
                "impl WasmModule{lifetime} {{
                     {}pub fn set_{}(&mut self, v: {}) {{
                         self.globals[{}] = TaggedVal::from(v);
                     }}
                 }}",
                non_snake_case_suppression, e.name, typ, glb_idx.0
            );
            match mutable {
                wasm::syntax::Mut::Const => Ok(getter),
                wasm::syntax::Mut::Var => Ok(format!("{}\n{}", getter, setter)),
            }
        }
    }
}

fn print_cargo_toml(opts: &CmdLineOpts) -> Maybe<()> {
    let cargo_toml_path = opts.output_directory.join("Cargo.toml");
    if cargo_toml_path.exists() {
        println!(
            "WARNING: Cargo.toml already exists at {}. \
             Not overwriting it.",
            cargo_toml_path.display()
        );
        return Ok(());
    }
    let package_name = match &opts.crate_name {
        Some(n) => n.clone(),
        None => "sandboxed-".to_owned() + opts
            .input_path
            .file_stem()
            .and_then(|n| n.to_str())
            .unwrap_or("wasmmodule".into())
        };
    let dependencies = if opts.generate_wasi_executable {
        "\
        wasi-common = \"0.20.0\"\n\
        wiggle = \"0.20.0\"\n\
        "
    } else {
        ""
    };
    Ok(std::fs::write(
        cargo_toml_path,
        format!(
            r#"
[package]
name = "{name}"
version = "{version}"
authors = ["generated-by-{generator}-{version}"]
edition = "2018"

[dependencies]
{dependencies}

[profile.release]
debug = true
            "#,
            name = package_name,
            version = crate::PROGRAM_VERSION,
            generator = crate::PROGRAM_NAME,
            dependencies = dependencies,
        ),
    )?)
}

// returns (mem_size, mem_size_to_vm)
fn get_memory_backing_size(
    m: &wasm::syntax::Module,
    opts: &CmdLineOpts,
) -> Maybe<(usize, Option<usize>)> {
    // since memory size is defined as a multiple of 64Ki blocks
    let block_size = 65536usize;
    let min_allowed_blocks = m.mems.get(0).and_then(|x| Some(x.typ.0.min));
    let max_allowed_blocks = m.mems.get(0).and_then(|x| x.typ.0.max);
    let num_blocks = max_allowed_blocks.or(min_allowed_blocks).unwrap_or(0) as usize;
    let (s, is) = if let Some(size) = opts.fixed_mem_size {
        if let Some(m) = min_allowed_blocks {
            if size < m {
                return Err(eyre!("Module requires at least {} blocks of memory", m));
            }
        } else if size != 0 {
            return Err(eyre!("Module does not use any memory"));
        }
        if let Some(m) = max_allowed_blocks {
            if size > m {
                return Err(eyre!("Module allows max of {} blocks of memory", m));
            }
        }
        (block_size * size as usize, Some(block_size * num_blocks))
    } else {
        (block_size * num_blocks, None)
    };
    let s = if opts.memory_wrapping {
        s.checked_next_power_of_two()
            .ok_or(eyre!("Overflow when trying to print main memory size"))?
    } else {
        s
    };
    let s = if opts.memory_wrapping && !opts.prevent_extra_mem_for_wrapping {
        s + 8
    } else {
        s
    };
    Ok((s, is))
}

fn print_generated_code_prefix(m: &wasm::syntax::Module, opts: &CmdLineOpts) -> Maybe<String> {
    let module_prefix = if opts.generate_wasi_executable {
        // NOTE: We cannot forbid unsafe because wasi-common requires
        // us to implement an unsafe trait. However, this unsafety is
        // restricted _strictly_ to that module. It would be nice if
        // we could somehow "package" this unsafety away though.
        "mod guest_mem_wrapper;"
    } else {
        "#![forbid(unsafe_code)]"
    };
    let no_std = if opts.no_std_library {
        "#![no_std]\n"
    } else {
        ""
    };
    // If we need to avoid alloc dependency, we need to generate
    // arrays for the return values of functions (can't use `Vec`).
    let static_function_return_def = if opts.no_alloc {
        // Find the maximum number of return values of all functions
        let max_rets = m
            .funcs
            .iter()
            .map(|f| {
                let ftyp = m.types.get(f.typ.0 as usize).ok_or(
                    eyre!("Invalid type index {} for function", f.typ.0),
                )?;
                Ok(ftyp.to.0.len())
            })
            .collect::<Maybe<Vec<_>>>()?
            .into_iter()
            .max().unwrap_or(0);
        let template = include_str!("../templates-for-generation/static_func_returns.rs");
        template.replace(
            "<<RETDEFS>>", 
            &(0..=max_rets)
                .map(|i| format!("Ret{}([TaggedVal; {}])", i, i))
                .collect::<Vec<_>>()
                .join(",\n")
        )
        .replace(
            "<<RETCOUNTS>>",
            &(0..=max_rets)
                .map(|i| format!("Ret{}(_) => {}", i, i))
                .collect::<Vec<_>>()
                .join(",\n")
        )
        .replace(
            "<<RETINDEXES>>",
            &(0..=max_rets)
                .map(|i| format!("Ret{}(v) => &v[i]", i))
                .collect::<Vec<_>>()
                .join(",\n")
        )
        .replace(
            "<<RETINDEXESMUT>>",
            &(0..=max_rets)
                .map(|i| format!("Ret{}(v) => &mut v[i]", i))
                .collect::<Vec<_>>()
                .join(",\n")
        )
    } else {
        // Otherwise, we can use `Vec` for the return values of functions
        "".into()
    };
    let wasm_module = format!(
        "#[allow(dead_code)]
         pub struct WasmModule{lifetime} {{
            {memory},
            {globals},
            {indirect_call_table},
            {wasi_context}
        }}",
        lifetime = {
            if !mem_imported(m) {
                ""
            } else {
                "<'a>"
            }
        },
        memory = format!("pub memory: {}", mem_type(m, opts)),
        globals = if opts.no_alloc {
            format!(
                "globals: [TaggedVal; {}]",
                m.globals.len()
            )
        } else {
            "globals: Vec<TaggedVal>".to_string()
        },
        indirect_call_table = if !opts.no_alloc {
            "indirect_call_table: Vec<Option<usize>>".into()
        } else {
            format!(
                "indirect_call_table: [Option<usize>; {}]",
                m.funcs.len()
            )
        },
        wasi_context = if opts.generate_wasi_executable {
            "context: wasi_common::WasiCtx,"
        } else {
            ""
        },
    );
    let memory_accessors = {
        let template = include_str!("../templates-for-generation/memory_accessors.rs");
        let range = if opts.memory_wrapping {
            if opts.prevent_extra_mem_for_wrapping {
                "addr & (memory.len() - 1)..\
                 (addr & (memory.len() - 1)) + std::mem::size_of::<$ty>()"
            } else {
                "addr & (memory.len() - 8 - 1)..\
                 (addr & (memory.len() - 8 - 1)) + std::mem::size_of::<$ty>()"
            }
        } else {
            "addr..\
             addr + std::mem::size_of::<$ty>()"
        };
        if opts.unsafe_linear_memory {
            template
                .replace(
                    "<<MEMORYGET>>",
                    &format!("unsafe {{ memory.get_unchecked({}) }}", range),
                )
                .replace(
                    "<<MEMORYGETMUT>>",
                    &format!("unsafe {{ memory.get_unchecked_mut({}) }}", range),
                )
        } else {
            template
                .replace("<<MEMORYGET>>", &format!("memory.get({})?", range))
                .replace("<<MEMORYGETMUT>>", &format!("memory.get_mut({})?", range))
        }
    };
    let memory_accessors = if opts.no_std_library {
        memory_accessors.replace("std::", "core::")
    } else {
        memory_accessors
    };

    Ok(format!(
        "{module_prefix}{no_std}\n\n\
         {imports}\n\n\
         {tagged_value_definitions}\n\n\
         {static_function_return_def}
         {wasm_module}\n\n\
         {memory_accessors}\n",
        module_prefix = module_prefix,
        no_std = no_std,
        imports = if opts.no_alloc {
            include_str!("../templates-for-generation/imports_no_alloc.rs")
        } else if opts.no_std_library {
            include_str!("../templates-for-generation/imports_no_std.rs")
        } else {
            include_str!("../templates-for-generation/imports.rs")
        },
        tagged_value_definitions =
            include_str!("../templates-for-generation/tagged_value_definitions.rs"),
        static_function_return_def = static_function_return_def,
        wasm_module = wasm_module,
        memory_accessors = memory_accessors,
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

    let mut generated: String = print_generated_code_prefix(m, opts)?;

    let extern_mem_arg = if mem_imported(m) {
        format!("mem_buf: {}", mem_type(m, opts))
    } else { 
        "".into() 
    };
    let memory_init = if mem_imported(m) {
        "memory: mem_buf".into()
    } else {
        let (mem_size, _) = get_memory_backing_size(m, opts)?;
        if opts.fixed_mem_size.is_some() {
            format!("memory: [0u8; {}]", mem_size)
        } else {
            format!("memory: vec![0u8; {}]", mem_size)
        }
    };

    let globals_init = if !opts.no_alloc {
        "globals: vec![]".into()
    } else {
        format!("globals: [TaggedVal::Undefined; {}]", globals.len())
    };

    let indirect_call_table_init = if !opts.no_alloc {
        "indirect_call_table: vec![]".into()
    } else {
        format!("indirect_call_table: [None; {}]", m.funcs.len())
    };

    let lifetime = if !mem_imported(m) { "" } else { "<'a>" };
    let lifetime_elided = if !mem_imported(m) { "" } else { "<'_>" };

    // Print the module initializer
    generated += "\n";
    generated += &format!(
        "impl{lifetime} WasmModule{lifetime} {{
             #[allow(unused_mut)]
             pub fn new({extern_mem_arg}) -> Self {{
                 let mut m = WasmModule {{
                     {memory_init},
                     {globals_init},
                     {indirect_call_table_init},
                     {context} \
                 }};
                 {globals_resize}
                 {printed_globals}
                 {printed_elems}
                 {printed_data}
                 m
             }}
         }}\n",
        context = if opts.generate_wasi_executable {
            r#"context: wasi_common::WasiCtx::new(std::env::args())
                  .expect("Unable to initialize WASI context"),"#
        } else {
            ""
        },
        memory_init = memory_init,
        globals_init = globals_init,
        globals_resize = {
            if !opts.no_alloc {
                format!(
                    "m.globals.resize_with({globals_size}, Default::default);",
                    globals_size = globals.len()
                )
            } else {
                "".into()
            }
        },
        printed_globals = globals
            .iter()
            .enumerate()
            .map(|(i, g)| Ok(format!(
                "m.globals[{}] = {};",
                i,
                print_global_initializer(g)?
            )))
            .collect::<Maybe<Vec<_>>>()?
            .join("\n"),
        printed_elems = elem
            .iter()
            .map(|e| print_elem("m", e, opts))
            .collect::<Maybe<Vec<_>>>()?
            .join("\n"),
        printed_data = data
            .iter()
            .map(|d| print_data("m", d))
            .collect::<Maybe<Vec<_>>>()?
            .join("\n"),
    );
    dbgprintln!(0, "Generated module initializer");

    // Print the functions
    generated += "\n";
    generated += &format!("impl WasmModule{lifetime_elided} {{\n");
    for (i, _f) in funcs.iter().enumerate() {
        generated += &print_function(&m, wasm::syntax::FuncIdx(i as u32), opts)?;
    }
    generated += "}\n";
    dbgprintln!(0, "Generated functions");

    // Print the CallIndirect dispatch
    generated += "\n";
    if opts.type_based_indirect_calls {
        generated += &print_type_based_indirect_call_dispatch(m)?;
    } else {
        generated += &print_indirect_call_dispatch(m, opts)?;
    }
    generated += "\n";
    dbgprintln!(0, "Generated CallIndirect redirector");

    // Print the exports
    generated += "\n";
    generated += &exports
        .iter()
        .map(|e| print_export(m, e, opts))
        .collect::<Maybe<Vec<_>>>()?
        .join("\n\n");
    generated += "\n";
    dbgprintln!(0, "Generated exports");

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
                    "pub fn init_module() -> WasmModule {{
                         let mut wasm_module = WasmModule::new();
                         wasm_module.{start_func_name}().unwrap();
                         wasm_module
                     }}",
                    start_func_name = start_func_name,
                );
                dbgprintln!(0, "Generated main WASI library init function");
            } else {
                generated += &format!(
                    "fn main() {{
                         let mut wasm_module = WasmModule::new();
                         wasm_module.{start_func_name}().unwrap();
                     }}",
                    start_func_name = start_func_name,
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

    std::fs::create_dir_all(&opts.output_directory)?;
    print_cargo_toml(opts)?;
    let src_dir = opts.output_directory.join("src");
    std::fs::create_dir_all(&src_dir)?;
    let generated_file_path = src_dir.join(
        if opts.generate_wasi_executable && !opts.generate_as_wasi_library {
            "main.rs"
        } else {
            "lib.rs"
        },
    );
    std::fs::write(&generated_file_path, generated)?;
    if opts.generate_wasi_executable {
        std::fs::write(
            src_dir.join("guest_mem_wrapper.rs"),
            include_str!("../templates-for-generation/guest_mem_wrapper.rs"),
        )?;
    }
    println!("Finished generating");

    if !opts.prevent_reformat {
        std::process::Command::new("rustfmt")
            .arg(&generated_file_path)
            .status()?;
        println!("Finished reformatting")
    }

    Ok(())
}
