use crate::wasm::syntax::*;
use crate::Maybe;
use color_eyre::eyre::eyre;
use std::collections::HashMap;
use std::convert::TryInto;

type Parsed<'a, T> = crate::Maybe<(&'a [u8], T)>;

/*
    There are two ways to write a parser:
    a)
        - Write a function that takes a byte array and returns a `Parsed<T>`.
        - Use the `run_parser!` macro to run other parsers.
    b)
        - For simple parsers, use the `generate!` macro.
        - Define a function body that returns the parsed type, and the macro will
          generate a parser function.
        - Use the `run!` macro to run other parsers.
*/

macro_rules! run_parser {
    ($fn:ident ( $inp:ident ) ) => {
        run_parser!($fn($inp,))
    };
    ($fn:ident ( $inp:ident, $($arg:expr),* ) ) => {{
        let (inp1, v) = $fn( $inp, $($arg,)*)?;
        $inp = inp1;
        v
    }};
}

/*
    utils
*/

macro_rules! trace {
    ($($body:tt)*) => {
        dbgprintln!(3, $($body)*)
    };
}

macro_rules! err {
    ($($args:expr),*) => {{
        return Err(eyre!($($args,)*));
    }}
}

/// Little Endian Base 128 encoding of unsigned ints. Parses `bits` bits into a `u64`.
fn leb128_u(mut inp: &[u8], bits: usize) -> Parsed<u64> {
    let n = inp[0] as u64;
    inp = &inp[1..];

    assert!(bits <= 64);

    if n < (1 << 7) && (bits == 64 || n < (1 << bits)) {
        Ok((inp, n))
    } else if n >= (1 << 7) && bits > 7 {
        let (inp, m) = leb128_u(inp, bits - 7)?;
        Ok((inp, (m << 7) + n - (1 << 7)))
    } else {
        err!("As per WASM spec, this branch for leb128_u should be impossible")
    }
}

/// Little Endian Base 128 encoding of signed ints. Parses `bits` bits into a `i64`.
fn leb128_s(mut inp: &[u8], bits: usize) -> Parsed<i64> {
    let n = inp[0] as u64;
    inp = &inp[1..];

    assert!(bits <= 64);

    if n < (1 << 6) && n < (1u64 << (bits - 1)) {
        Ok((inp, n as i64))
    } else if (1 << 6) <= n && n < (1 << 7) && n + (1u64 << (bits - 1)) >= (1 << 7) {
        Ok((inp, (n as i64) - (1 << 7)))
    } else if n >= (1 << 7) && bits > 7 {
        let (inp, m) = leb128_s(inp, bits - 7)?;
        Ok((inp, (m << 7) + (n as i64 - (1 << 7))))
    } else {
        err!("As per WASM spec, this branch for leb128_s should be impossible")
    }
}

#[cfg(test)]
mod test_leb128 {
    #[test]
    fn leb128_u_spot_tests() -> crate::Maybe<()> {
        assert_eq!(super::leb128_u(&[0x00], 64)?.1, 0);
        assert_eq!(super::leb128_u(&[0x01], 32)?.1, 1);
        assert_eq!(super::leb128_u(&[0xc0, 0xc4, 0x07], 32)?.1, 123456);
        Ok(())
    }

    #[test]
    fn leb128_s_spot_tests() -> crate::Maybe<()> {
        assert_eq!(super::leb128_s(&[0x00], 64)?.1, 0);
        assert_eq!(super::leb128_s(&[0x0ff, 0x00], 32)?.1, 127);
        assert_eq!(super::leb128_s(&[0xc0, 0xbb, 0x78], 32)?.1, -123456);
        Ok(())
    }
}

/*
    parser generator
*/

/// This is a hack to allow for macros generating new macro definitions making use of
/// repetition arguments, see
/// https://github.com/rust-lang/rust/issues/35853#issuecomment-415993963
/// An alternative would be to use macro metavariables on nightly.
macro_rules! with_dollar_sign {
    ($($body:tt)*) => {
        macro_rules! __with_dollar_sign { $($body)* }
        __with_dollar_sign!($);
    }
}

/// Generate a parser function. Example:
/// ```ignore
/// generate! { double_peek (n:u32) -> &[u8] = run!(peek(2*n))}
/// ```
/// expands to
/// ```ignore
/// fn double_peek(mut inp: &[u8], n:u32) -> Parsed<&[u32]> {
///     let v = {
///         let (inp1, v) = peek(inp, 2*n)?;
///         inp = inp1;
///         v
///     };
///     Ok((inp, v))
/// }
/// ```
macro_rules! generate {
    ($id:ident -> $ty:ty = $body:expr) => {
        generate!{$id() -> $ty = $body}
    };

    ($id:ident($($fnarg:ident : $fntyp:ty),*) -> $ty:ty = $body: expr ) => {
        fn $id(mut inp: &[u8], $($fnarg : $fntyp,)*) -> Parsed<$ty> {

            with_dollar_sign! {
                ($d:tt) => {
                    /// Runs a parser.
                    #[allow(unused_macros)]
                    macro_rules! run {
                        ($fn:ident) => { run!($fn()) };
                        ($fn:ident ($d($arg:expr),* ) ) => {{
                            let (inp1, v) = $fn( inp, $d($arg,)*)?;
                            inp = inp1;
                            v
                        }};
                    }
                }
            }


            with_dollar_sign! {
                ($d:tt) => {
                    /// Similar to `run!`, but doesn't expect successful parsing.
                    /// Returns a `Result<Parsed<T>, E>` instead of `Parsed<T>`.
                    #[allow(unused_macros)]
                    macro_rules! try_run {
                        ($fn:ident) => { try_run!($fn()) };
                        ($fn:ident ($d($arg:expr),* ) ) => {{
                            match $fn( inp, $d($arg,)*) {
                                Ok((inp1, v)) => {
                                    inp = inp1;
                                    Ok(v)
                                },
                                Err(e) => Err(e),
                            }
                        }};
                    }
                }
            }

            let v = $body;
            Ok((inp, v))
        }
    };
}

/*
    Parsers
*/

fn peek(inp: &[u8], n: usize) -> Parsed<&[u8]> {
    let v = inp.get(..n).ok_or(eyre!("Insufficient data for parsing"))?;
    Ok((inp, v))
}

fn peek_at(inp: &[u8], pos: usize) -> Parsed<&u8> {
    let v = inp.get(pos).ok_or(eyre!("Insufficient data for parsing"))?;
    Ok((inp, v))
}

fn length(inp: &[u8]) -> Parsed<usize> {
    Ok((inp, inp.len()))
}

fn inp(inp: &[u8], n: usize) -> Parsed<&[u8]> {
    let v = inp.get(..n).ok_or(eyre!("Insufficient data for parsing"))?;
    Ok((&inp[n..], v))
}

fn inp_dump(inp: &[u8]) -> Parsed<()> {
    trace!("Remaining: {:#x?}", inp);
    Ok((inp, ()))
}

generate! {u32 -> u32 = run!(leb128_u(32)) as u32}
generate! {i32 -> i32 = run!(leb128_s(32)) as i32}
generate! {i64 -> i64 = run!(leb128_s(64)) as i64}
generate! {f32 -> f32 = f32::from_le_bytes(run!(inp(4)).try_into()?)}
generate! {f64 -> f64 = f64::from_le_bytes(run!(inp(8)).try_into()?)}

generate! {s33 -> i64 = run!(leb128_s(33))}

fn vec<T, F>(mut inp: &[u8], elem: F) -> Parsed<Vec<T>>
where
    F: Fn(&[u8]) -> Parsed<T>,
{
    let len = run_parser!(u32(inp));

    let l = (0..len)
        .map(|_| Ok(run_parser!(elem(inp))))
        .collect::<Maybe<Vec<T>>>()?;
    Ok((inp, l))
}

generate! {byte -> u8 = run!(inp(1))[0]}

generate! {name -> String = String::from_utf8(run!(vec(byte)))?}

generate! {valtype -> ValType = match run!(byte) {
    0x7f => ValType::I32,
    0x7e => ValType::I64,
    0x7d => ValType::F32,
    0x7c => ValType::F64,
    b => {
        err!("Invalid valtype {:#x}", b)
    }
}}

generate! { resulttype -> ResultType = ResultType(run!(vec(valtype))) }

generate! { expect_byte(x:u8) -> () = {
    let v = run!(byte);
    if v != x {
        err!("Invalid byte found. Expected: {:#x}. Found {:#x}.", x, v)
    }
}}

generate! { functype -> FuncType = {
    run!(expect_byte(0x60));
    let from = run!(resulttype);
    let to = run!(resulttype);
    FuncType {
        from,
        to
    }
}}

generate! { limits -> Limits = {
    match run!(byte) {
        0 => {
            let min = run!(u32);
            let max = None;
            Limits { min, max }
        }
        1 => {
            let min = run!(u32);
            let max = Some(run!(u32));
            Limits { min, max }
        }
        b => err!("Unexpected byte {:#x} for limits", b),
    }
}}

generate! { memtype -> MemType = MemType(run!(limits)) }

generate! { elemtype -> ElemType = { run!(expect_byte(0x70)); ElemType::FuncRef } }

generate! { tabletype -> TableType = {
    let e = run!(elemtype);
    let l = run!(limits);
    TableType(l, e)
}}

generate! { globaltype -> GlobalType = {
    let t = run!(valtype);
    let m = match run!(byte) {
        0 => Mut::Const,
        1 => Mut::Var,
        b => err!("Unexpected byte {:#x} for mut for global type", b),
    };
    GlobalType(m, t)
}}

generate! { blocktype -> BlockType = {
    let t1 = try_run!(expect_byte(0x40)).and_then(|()| Ok(BlockType::ValType(None)));
    let t2 = t1.or_else(|_| try_run!(valtype).and_then(|v| Ok(BlockType::ValType(Some(v)))));
    t2.or_else(|_| -> Maybe<_> { Ok(BlockType::TypeIdx(TypeIdx(run!(s33).try_into()?))) } )?
}}

fn vec_until_any<'a, 'b, T, F>(
    mut inp: &'a [u8],
    elem: F,
    until: &'b [u8],
) -> Parsed<'a, (Vec<T>, u8)>
where
    F: Fn(&[u8]) -> Parsed<T>,
{
    let mut v: u8 = inp[0];
    let mut res = vec![];

    while !until.contains(&v) {
        res.push(run_parser!(elem(inp)));
        v = inp[0];
    }
    inp = &inp[1..];
    Ok((inp, (res, v)))
}

fn vec_until<T, F>(inp: &[u8], elem: F, until: u8) -> Parsed<Vec<T>>
where
    F: Fn(&[u8]) -> Parsed<T>,
{
    let (inp, (res, _)) = vec_until_any(inp, elem, &[until])?;
    Ok((inp, res))
}

generate! { instr -> Instr = {
    match run!(byte) {
        // Control instructions
        0x00 => Instr::Unreachable,
        0x01 => Instr::Nop,
        0x02 => {
            let bt = run!(blocktype);
            let ins = run!(vec_until(instr, 0x0b));
            Instr::Block(bt, ins)
        }
        0x03 => {
            let bt = run!(blocktype);
            let ins = run!(vec_until(instr, 0x0b));
            Instr::Loop(bt, ins)
        }
        0x04 => {
            let bt = run!(blocktype);
            let (ins1, x) = run!(vec_until_any(instr, &[0x0b, 0x05]));
            match x {
                0x0b => Instr::If(bt, ins1, vec![]),
                0x05 => {
                    let ins2 = run!(vec_until(instr, 0x0b));
                    Instr::If(bt, ins1, ins2)
                }
                _ => unreachable!(),
            }
        }
        0x0c => Instr::Br(run!(labelidx)),
        0x0d => Instr::BrIf(run!(labelidx)),
        0x0e => {
            let ls = run!(vec(labelidx));
            let ln = run!(labelidx);
            Instr::BrTable(ls, ln)
        }
        0x0f => Instr::Return,
        0x10 => Instr::Call(run!(funcidx)),
        0x11 => {
            let x = run!(typeidx);
            run!(expect_byte(0x00));
            Instr::CallIndirect(x)
        },

        // Parametric instructions
        0x1a => Instr::Drop,
        0x1b => Instr::Select,

        // Variable instructions
        0x20 => Instr::LocalGet(run!(localidx)),
        0x21 => Instr::LocalSet(run!(localidx)),
        0x22 => Instr::LocalTee(run!(localidx)),
        0x23 => Instr::GlobalGet(run!(globalidx)),
        0x24 => Instr::GlobalSet(run!(globalidx)),

        // Memory instructions
        0x28 => Instr::MemLoad(MemLoad { typ: ValType::I32, extend: None, memarg: run!(memarg) }),
        0x29 => Instr::MemLoad(MemLoad { typ: ValType::I64, extend: None, memarg: run!(memarg) }),
        0x2a => Instr::MemLoad(MemLoad { typ: ValType::F32, extend: None, memarg: run!(memarg) }),
        0x2b => Instr::MemLoad(MemLoad { typ: ValType::F64, extend: None, memarg: run!(memarg) }),
        0x2c => Instr::MemLoad(MemLoad { typ: ValType::I32,
                                         extend: Some((8, SX::S)),
                                         memarg: run!(memarg) }),
        0x2d => Instr::MemLoad(MemLoad { typ: ValType::I32,
                                         extend: Some((8, SX::U)),
                                         memarg: run!(memarg) }),
        0x2e => Instr::MemLoad(MemLoad { typ: ValType::I32,
                                         extend: Some((16, SX::S)),
                                         memarg: run!(memarg) }),
        0x2f => Instr::MemLoad(MemLoad { typ: ValType::I32,
                                         extend: Some((16, SX::U)),
                                         memarg: run!(memarg) }),
        0x30 => Instr::MemLoad(MemLoad { typ: ValType::I64,
                                         extend: Some((8, SX::S)),
                                         memarg: run!(memarg) }),
        0x31 => Instr::MemLoad(MemLoad { typ: ValType::I64,
                                         extend: Some((8, SX::U)),
                                         memarg: run!(memarg) }),
        0x32 => Instr::MemLoad(MemLoad { typ: ValType::I64,
                                         extend: Some((16, SX::S)),
                                         memarg: run!(memarg) }),
        0x33 => Instr::MemLoad(MemLoad { typ: ValType::I64,
                                         extend: Some((16, SX::U)),
                                         memarg: run!(memarg) }),
        0x34 => Instr::MemLoad(MemLoad { typ: ValType::I64,
                                         extend: Some((32, SX::S)),
                                         memarg: run!(memarg) }),
        0x35 => Instr::MemLoad(MemLoad { typ: ValType::I64,
                                         extend: Some((32, SX::U)),
                                         memarg: run!(memarg) }),
        0x36 => Instr::MemStore(MemStore { typ: ValType::I32,
                                           bitwidth: None,
                                           memarg: run!(memarg) }),
        0x37 => Instr::MemStore(MemStore { typ: ValType::I64,
                                           bitwidth: None,
                                           memarg: run!(memarg) }),
        0x38 => Instr::MemStore(MemStore { typ: ValType::F32,
                                           bitwidth: None,
                                           memarg: run!(memarg) }),
        0x39 => Instr::MemStore(MemStore { typ: ValType::F64,
                                           bitwidth: None,
                                           memarg: run!(memarg) }),
        0x3a => Instr::MemStore(MemStore { typ: ValType::I32,
                                           bitwidth: Some(8),
                                           memarg: run!(memarg) }),
        0x3b => Instr::MemStore(MemStore { typ: ValType::I32,
                                           bitwidth: Some(16),
                                           memarg: run!(memarg) }),
        0x3c => Instr::MemStore(MemStore { typ: ValType::I64,
                                           bitwidth: Some(8),
                                           memarg: run!(memarg) }),
        0x3d => Instr::MemStore(MemStore { typ: ValType::I64,
                                           bitwidth: Some(16),
                                           memarg: run!(memarg) }),
        0x3e => Instr::MemStore(MemStore { typ: ValType::I64,
                                           bitwidth: Some(32),
                                           memarg: run!(memarg) }),
        0x3f => { run!(expect_byte(0x00)); Instr::MemSize }
        0x40 => { run!(expect_byte(0x00)); Instr::MemGrow }

        // Numeric instructions
        0x41 => Instr::Const(Const::I32(run!(i32))),
        0x42 => Instr::Const(Const::I64(run!(i64))),
        0x43 => Instr::Const(Const::F32(run!(f32))),
        0x44 => Instr::Const(Const::F64(run!(f64))),

        0x45 => Instr::ITestOp(BitSize::B32, intop::TestOp::Eqz),
        0x46 => Instr::IRelOp(BitSize::B32, intop::RelOp::Eq),
        0x47 => Instr::IRelOp(BitSize::B32, intop::RelOp::Ne),
        0x48 => Instr::IRelOp(BitSize::B32, intop::RelOp::LtS),
        0x49 => Instr::IRelOp(BitSize::B32, intop::RelOp::LtU),
        0x4a => Instr::IRelOp(BitSize::B32, intop::RelOp::GtS),
        0x4b => Instr::IRelOp(BitSize::B32, intop::RelOp::GtU),
        0x4c => Instr::IRelOp(BitSize::B32, intop::RelOp::LeS),
        0x4d => Instr::IRelOp(BitSize::B32, intop::RelOp::LeU),
        0x4e => Instr::IRelOp(BitSize::B32, intop::RelOp::GeS),
        0x4f => Instr::IRelOp(BitSize::B32, intop::RelOp::GeU),

        0x50 => Instr::ITestOp(BitSize::B64, intop::TestOp::Eqz),
        0x51 => Instr::IRelOp(BitSize::B64, intop::RelOp::Eq),
        0x52 => Instr::IRelOp(BitSize::B64, intop::RelOp::Ne),
        0x53 => Instr::IRelOp(BitSize::B64, intop::RelOp::LtS),
        0x54 => Instr::IRelOp(BitSize::B64, intop::RelOp::LtU),
        0x55 => Instr::IRelOp(BitSize::B64, intop::RelOp::GtS),
        0x56 => Instr::IRelOp(BitSize::B64, intop::RelOp::GtU),
        0x57 => Instr::IRelOp(BitSize::B64, intop::RelOp::LeS),
        0x58 => Instr::IRelOp(BitSize::B64, intop::RelOp::LeU),
        0x59 => Instr::IRelOp(BitSize::B64, intop::RelOp::GeS),
        0x5a => Instr::IRelOp(BitSize::B64, intop::RelOp::GeU),

        0x5b => Instr::FRelOp(BitSize::B32, floatop::RelOp::Eq),
        0x5c => Instr::FRelOp(BitSize::B32, floatop::RelOp::Ne),
        0x5d => Instr::FRelOp(BitSize::B32, floatop::RelOp::Lt),
        0x5e => Instr::FRelOp(BitSize::B32, floatop::RelOp::Gt),
        0x5f => Instr::FRelOp(BitSize::B32, floatop::RelOp::Le),
        0x60 => Instr::FRelOp(BitSize::B32, floatop::RelOp::Ge),

        0x61 => Instr::FRelOp(BitSize::B64, floatop::RelOp::Eq),
        0x62 => Instr::FRelOp(BitSize::B64, floatop::RelOp::Ne),
        0x63 => Instr::FRelOp(BitSize::B64, floatop::RelOp::Lt),
        0x64 => Instr::FRelOp(BitSize::B64, floatop::RelOp::Gt),
        0x65 => Instr::FRelOp(BitSize::B64, floatop::RelOp::Le),
        0x66 => Instr::FRelOp(BitSize::B64, floatop::RelOp::Ge),

        0x67 => Instr::IUnOp(BitSize::B32, intop::UnOp::Clz),
        0x68 => Instr::IUnOp(BitSize::B32, intop::UnOp::Ctz),
        0x69 => Instr::IUnOp(BitSize::B32, intop::UnOp::Popcnt),
        0x6a => Instr::IBinOp(BitSize::B32, intop::BinOp::Add),
        0x6b => Instr::IBinOp(BitSize::B32, intop::BinOp::Sub),
        0x6c => Instr::IBinOp(BitSize::B32, intop::BinOp::Mul),
        0x6d => Instr::IBinOp(BitSize::B32, intop::BinOp::DivS),
        0x6e => Instr::IBinOp(BitSize::B32, intop::BinOp::DivU),
        0x6f => Instr::IBinOp(BitSize::B32, intop::BinOp::RemS),
        0x70 => Instr::IBinOp(BitSize::B32, intop::BinOp::RemU),
        0x71 => Instr::IBinOp(BitSize::B32, intop::BinOp::And),
        0x72 => Instr::IBinOp(BitSize::B32, intop::BinOp::Or),
        0x73 => Instr::IBinOp(BitSize::B32, intop::BinOp::Xor),
        0x74 => Instr::IBinOp(BitSize::B32, intop::BinOp::Shl),
        0x75 => Instr::IBinOp(BitSize::B32, intop::BinOp::ShrS),
        0x76 => Instr::IBinOp(BitSize::B32, intop::BinOp::ShrU),
        0x77 => Instr::IBinOp(BitSize::B32, intop::BinOp::Rotl),
        0x78 => Instr::IBinOp(BitSize::B32, intop::BinOp::Rotr),

        0x79 => Instr::IUnOp(BitSize::B64, intop::UnOp::Clz),
        0x7a => Instr::IUnOp(BitSize::B64, intop::UnOp::Ctz),
        0x7b => Instr::IUnOp(BitSize::B64, intop::UnOp::Popcnt),
        0x7c => Instr::IBinOp(BitSize::B64, intop::BinOp::Add),
        0x7d => Instr::IBinOp(BitSize::B64, intop::BinOp::Sub),
        0x7e => Instr::IBinOp(BitSize::B64, intop::BinOp::Mul),
        0x7f => Instr::IBinOp(BitSize::B64, intop::BinOp::DivS),
        0x80 => Instr::IBinOp(BitSize::B64, intop::BinOp::DivU),
        0x81 => Instr::IBinOp(BitSize::B64, intop::BinOp::RemS),
        0x82 => Instr::IBinOp(BitSize::B64, intop::BinOp::RemU),
        0x83 => Instr::IBinOp(BitSize::B64, intop::BinOp::And),
        0x84 => Instr::IBinOp(BitSize::B64, intop::BinOp::Or),
        0x85 => Instr::IBinOp(BitSize::B64, intop::BinOp::Xor),
        0x86 => Instr::IBinOp(BitSize::B64, intop::BinOp::Shl),
        0x87 => Instr::IBinOp(BitSize::B64, intop::BinOp::ShrS),
        0x88 => Instr::IBinOp(BitSize::B64, intop::BinOp::ShrU),
        0x89 => Instr::IBinOp(BitSize::B64, intop::BinOp::Rotl),
        0x8a => Instr::IBinOp(BitSize::B64, intop::BinOp::Rotr),

        0x8b => Instr::FUnOp(BitSize::B32, floatop::UnOp::Abs),
        0x8c => Instr::FUnOp(BitSize::B32, floatop::UnOp::Neg),
        0x8d => Instr::FUnOp(BitSize::B32, floatop::UnOp::Ceil),
        0x8e => Instr::FUnOp(BitSize::B32, floatop::UnOp::Floor),
        0x8f => Instr::FUnOp(BitSize::B32, floatop::UnOp::Trunc),
        0x90 => Instr::FUnOp(BitSize::B32, floatop::UnOp::Nearest),
        0x91 => Instr::FUnOp(BitSize::B32, floatop::UnOp::Sqrt),
        0x92 => Instr::FBinOp(BitSize::B32, floatop::BinOp::Add),
        0x93 => Instr::FBinOp(BitSize::B32, floatop::BinOp::Sub),
        0x94 => Instr::FBinOp(BitSize::B32, floatop::BinOp::Mul),
        0x95 => Instr::FBinOp(BitSize::B32, floatop::BinOp::Div),
        0x96 => Instr::FBinOp(BitSize::B32, floatop::BinOp::Min),
        0x97 => Instr::FBinOp(BitSize::B32, floatop::BinOp::Max),
        0x98 => Instr::FBinOp(BitSize::B32, floatop::BinOp::CopySign),

        0x99 => Instr::FUnOp(BitSize::B64, floatop::UnOp::Abs),
        0x9a => Instr::FUnOp(BitSize::B64, floatop::UnOp::Neg),
        0x9b => Instr::FUnOp(BitSize::B64, floatop::UnOp::Ceil),
        0x9c => Instr::FUnOp(BitSize::B64, floatop::UnOp::Floor),
        0x9d => Instr::FUnOp(BitSize::B64, floatop::UnOp::Trunc),
        0x9e => Instr::FUnOp(BitSize::B64, floatop::UnOp::Nearest),
        0x9f => Instr::FUnOp(BitSize::B64, floatop::UnOp::Sqrt),
        0xa0 => Instr::FBinOp(BitSize::B64, floatop::BinOp::Add),
        0xa1 => Instr::FBinOp(BitSize::B64, floatop::BinOp::Sub),
        0xa2 => Instr::FBinOp(BitSize::B64, floatop::BinOp::Mul),
        0xa3 => Instr::FBinOp(BitSize::B64, floatop::BinOp::Div),
        0xa4 => Instr::FBinOp(BitSize::B64, floatop::BinOp::Min),
        0xa5 => Instr::FBinOp(BitSize::B64, floatop::BinOp::Max),
        0xa6 => Instr::FBinOp(BitSize::B64, floatop::BinOp::CopySign),

        0xa7 => Instr::ICvtOp(BitSize::B32, intop::CvtOp::WrapI64),
        0xa8 => Instr::ICvtOp(BitSize::B32, intop::CvtOp::TruncSF32),
        0xa9 => Instr::ICvtOp(BitSize::B32, intop::CvtOp::TruncUF32),
        0xaa => Instr::ICvtOp(BitSize::B32, intop::CvtOp::TruncSF64),
        0xab => Instr::ICvtOp(BitSize::B32, intop::CvtOp::TruncUF64),
        0xac => Instr::ICvtOp(BitSize::B64, intop::CvtOp::ExtendSI32),
        0xad => Instr::ICvtOp(BitSize::B64, intop::CvtOp::ExtendUI32),
        0xae => Instr::ICvtOp(BitSize::B64, intop::CvtOp::TruncSF32),
        0xaf => Instr::ICvtOp(BitSize::B64, intop::CvtOp::TruncUF32),
        0xb0 => Instr::ICvtOp(BitSize::B64, intop::CvtOp::TruncSF64),
        0xb1 => Instr::ICvtOp(BitSize::B64, intop::CvtOp::TruncUF64),
        0xb2 => Instr::FCvtOp(BitSize::B32, floatop::CvtOp::ConvertSI32),
        0xb3 => Instr::FCvtOp(BitSize::B32, floatop::CvtOp::ConvertUI32),
        0xb4 => Instr::FCvtOp(BitSize::B32, floatop::CvtOp::ConvertSI64),
        0xb5 => Instr::FCvtOp(BitSize::B32, floatop::CvtOp::ConvertUI64),
        0xb6 => Instr::FCvtOp(BitSize::B32, floatop::CvtOp::DemoteF64),
        0xb7 => Instr::FCvtOp(BitSize::B64, floatop::CvtOp::ConvertSI32),
        0xb8 => Instr::FCvtOp(BitSize::B64, floatop::CvtOp::ConvertUI32),
        0xb9 => Instr::FCvtOp(BitSize::B64, floatop::CvtOp::ConvertSI64),
        0xba => Instr::FCvtOp(BitSize::B64, floatop::CvtOp::ConvertUI64),
        0xbb => Instr::FCvtOp(BitSize::B64, floatop::CvtOp::PromoteF32),
        0xbc => Instr::ICvtOp(BitSize::B32, intop::CvtOp::ReinterpretFloat),
        0xbd => Instr::ICvtOp(BitSize::B64, intop::CvtOp::ReinterpretFloat),
        0xbe => Instr::FCvtOp(BitSize::B32, floatop::CvtOp::ReinterpretInt),
        0xbf => Instr::FCvtOp(BitSize::B64, floatop::CvtOp::ReinterpretInt),

        0xc0 => Instr::IUnOp(BitSize::B32, intop::UnOp::ExtendS(PackSize::Pack8)),
        0xc1 => Instr::IUnOp(BitSize::B32, intop::UnOp::ExtendS(PackSize::Pack16)),
        0xc2 => Instr::IUnOp(BitSize::B64, intop::UnOp::ExtendS(PackSize::Pack8)),
        0xc3 => Instr::IUnOp(BitSize::B64, intop::UnOp::ExtendS(PackSize::Pack16)),
        0xc4 => Instr::IUnOp(BitSize::B64, intop::UnOp::ExtendS(PackSize::Pack32)),

        0xfc => {
            match run!(byte) {
                0x00 => Instr::ICvtOp(BitSize::B32, intop::CvtOp::TruncSatSF32),
                0x01 => Instr::ICvtOp(BitSize::B32, intop::CvtOp::TruncSatUF32),
                0x02 => Instr::ICvtOp(BitSize::B32, intop::CvtOp::TruncSatSF64),
                0x03 => Instr::ICvtOp(BitSize::B32, intop::CvtOp::TruncSatUF64),
                0x04 => Instr::ICvtOp(BitSize::B64, intop::CvtOp::TruncSatSF32),
                0x05 => Instr::ICvtOp(BitSize::B64, intop::CvtOp::TruncSatUF32),
                0x06 => Instr::ICvtOp(BitSize::B64, intop::CvtOp::TruncSatSF64),
                0x07 => Instr::ICvtOp(BitSize::B64, intop::CvtOp::TruncSatUF64),
                b => err!("Invalid saturation trunctation {:#x}", b),
            }
        }

        b => err!("Invalid instruction {:#x}", b),
    }
}}

generate! { memarg -> MemArg = {
    let align = run!(u32);
    let offset = run!(u32);
    MemArg { align, offset }
}}

generate! { expr -> Expr = Expr(run!(vec_until(instr, 0x0b))) }

generate! { typeidx   -> TypeIdx   = TypeIdx(run!(u32))  }
generate! { funcidx   -> FuncIdx   = FuncIdx(run!(u32))  }
generate! { tableidx  -> TableIdx  = TableIdx(run!(u32)) }
generate! { memidx    -> MemIdx    = MemIdx(run!(u32))   }
generate! { globalidx -> GlobalIdx = GlobalIdx(run!(u32)) }
generate! { localidx  -> LocalIdx  = LocalIdx(run!(u32)) }
generate! { labelidx  -> LabelIdx  = LabelIdx(run!(u32)) }

macro_rules! section {
    ($n:literal, $name:ident -> Option<$ty:ty> = $body:expr) => {
        section! {$n @ None, $name -> Option<$ty> = $body}
    };
    ($n:literal, $name:ident -> Vec<$ty:ty> = $body:expr) => {
        section! {$n @ vec![], $name -> Vec<$ty> = $body}
    };
    ($n:literal @ $default:expr, $name:ident -> $ty:ty = $body:expr) => {
        fn $name(mut inp: &[u8]) -> Parsed<$ty> {
            generate! { aux -> $ty = $body }
            match expect_byte(inp, $n) {
                Ok((inp1, ())) => {
                    inp = inp1;
                }
                Err(e) => {
                    trace!("Skipping {}: {}", stringify!($name), e);
                    return Ok((inp, $default));
                }
            }
            let (inp1, size) = u32(inp)?;
            inp = inp1;
            let size = size as usize;
            if inp.len() < size {
                err!("Insufficient bytes for section {}", $n)
            }
            let mut inp_inner = &inp[..size];
            let v = run_parser!(aux(inp_inner));
            if inp_inner.len() != 0 {
                err!(
                    "Unexpected {} bytes remain for section {:#x}",
                    inp.len(),
                    $n
                )
            }
            Ok((&inp[size..], v))
        }
    };
}

generate! { customsec -> (String, &[u8]) = {
    run!(expect_byte(0));
    let size = run!(u32) as usize;
    let mut inp = run!(inp(size));
    let name = run_parser!(name(inp));
    (name, inp)
}}
generate! { customsecs -> Vec<(String, &[u8])> = {
    let mut ret = vec![];
    while run!(length) != 0 && run!(peek(1))[0] == 0 {
        ret.push(run!(customsec));
    }
    ret
}}

section! { 1, typesec -> Vec<FuncType> = run!(vec(functype)) }

section! { 2, importsec -> Vec<Import> = run!(vec(import)) }
generate! { import -> Import = {
    let module = run!(name);
    let name = run!(name);
    let desc = run!(importdesc);
    Import { module, name, desc }
}}
generate! { importdesc -> ImportDesc = {
    match run!(byte) {
        0 => ImportDesc::Func(run!(typeidx)),
        1 => ImportDesc::Table(run!(tabletype)),
        2 => ImportDesc::Mem(run!(memtype)),
        3 => ImportDesc::Global(run!(globaltype)),
        b => err!("Unknown byte {:#x} encountered for imports", b)
    }
}}

section! { 3, funcsec -> Vec<TypeIdx> = run!(vec(typeidx)) }

section! { 4, tablesec -> Vec<Table> = run!(vec(table)) }
generate! { table -> Table = Table { typ : run!(tabletype) } }

section! { 5, memsec -> Vec<Mem> = run!(vec(mem)) }
generate! { mem -> Mem = Mem { typ : run!(memtype) } }

section! { 6, globalsec -> Vec<Global> = run!(vec(global)) }
generate! { global -> Global = {
    let typ = run!(globaltype);
    let init = run!(expr);
    Global { typ, init }
}}

section! { 7, exportsec -> Vec<Export> = run!(vec(export)) }
generate! { export -> Export = {
    let name = run!(name);
    let desc = run!(exportdesc);
    Export { name, desc }
}}
generate! { exportdesc -> ExportDesc = {
    match run!(byte) {
        0 => ExportDesc::Func(run!(funcidx)),
        1 => ExportDesc::Table(run!(tableidx)),
        2 => ExportDesc::Mem(run!(memidx)),
        3 => ExportDesc::Global(run!(globalidx)),
        b => err!("Unknown byte {:#x} encountered for exports", b)
    }
}}

section! { 8, startsec -> Option<Start> = {
    if run!(length) == 0 {
        None
    } else {
        Some(run!(start))
    }
}}
generate! { start -> Start = Start {func : run!(funcidx)} }

section! { 9, elemsec -> Vec<Elem> = run!(vec(elem)) }
generate! { elem -> Elem = {
    let table = run!(tableidx);
    let offset = run!(expr);
    let init = run!(vec(funcidx));
    Elem { table, offset, init }
}}

section! { 10, codesec -> Vec<(Vec<ValType>, Expr)> = run!(vec(code)) }
generate! { code -> (Vec<ValType>, Expr) = {
    let _size = run!(u32); // TODO: Check against actual used size
    run!(func)
}}
generate! { func -> (Vec<ValType>, Expr) = {
    let locals = run!(vec(locals))
        .into_iter()
        .flatten()
        .collect::<Vec<ValType>>();
    trace!("  locals {}", locals.len());
    let body = run!(expr);
    trace!("  body {}", body.0.len());
    (locals, body)
}}
generate! { locals -> Vec<ValType> = {
    let n = run!(u32) as usize;
    trace!("n = {}", n);
    let t = run!(valtype);
    trace!("t");
    vec![t; n]
}}

section! { 11, datasec -> Vec<Data> = run!(vec(data)) }
generate! { data -> Data = {
    let data = run!(memidx);
    let offset = run!(expr);
    let init = run!(vec(byte));
    Data { data, offset, init }
}}

generate! { function_name -> (FuncIdx, Name) = {
    let idx = run!(funcidx);
    let name = run!(name);
    (idx, name)
}}
generate! { names -> Names = {
    // Reference: https://github.com/WebAssembly/wabt/blob/713bece/src/binary-reader.cc#L1634
    // This is a custom section, that appears to show up in WASI modules.
    // We support this since it makes for nicer printing of tracing
    let mut names = Names {
        module: None,
        functions: HashMap::new(),
        locals: HashMap::new(),
    };

    /*
        As per the 1.0 spec, the type field is only one byte, so I think run!(u32) is 
        technically wrong here. It should always work because the type can only be
        0, 1, or 2, and since integers are leb encoded, reading the first 32 bit int
        will only read the first byte. Still, I think it's confusing, we should only
        read one byte.
    */

    // let name_type = run!(u32); // module = 0, function = 1, local = 2
    let name_type = run!(byte) as u32;

    if name_type != 1 {
        // We don't support non-function names just yet. Might add it
        // in the future.
        unimplemented!()
    }
    let subsection_size = run!(u32);
    if subsection_size > 0 {
        let mut inp_ = run!(inp(subsection_size as usize));
        names.functions = run_parser!(vec(inp_, function_name)).into_iter().collect();
        if inp_.len() != 0 {
            err!("Unused bytes in custom name section")
        }
    }
    names
}}

generate! { module -> Module = {
    // magic
    run!(expect_byte(0x00));
    run!(expect_byte(0x61));
    run!(expect_byte(0x73));
    run!(expect_byte(0x6d));
    // version
    run!(expect_byte(0x01));
    run!(expect_byte(0x00));
    run!(expect_byte(0x00));
    run!(expect_byte(0x00));

    let mut custom = vec![];

    // declare sections
    let (
        mut types,  mut imports,    mut functions,  mut tables, 
        mut mems,   mut globals,    mut exports,    mut start, 
        mut elem,   mut code,       mut data
    ) = (
        vec![], vec![], vec![], vec![], 
        vec![], vec![], vec![], None, 
        vec![], vec![], vec![]
    );

    // parse sections
    loop {
        if run!(length) == 0 {
            break;
        }
        match run!(peek(1)) {
            &[0u8] =>    custom.append(&mut run!(customsecs)),
            &[1u8] =>    types =     run!(typesec),
            &[2u8] =>    imports =   run!(importsec),
            &[3u8] =>    functions = run!(funcsec),
            &[4u8] =>    tables =    run!(tablesec),
            &[5u8] =>    mems =      run!(memsec),
            &[6u8] =>    globals =   run!(globalsec),
            &[7u8] =>    exports =   run!(exportsec),
            &[8u8] =>    start =     run!(startsec),
            &[9u8] =>    elem =      run!(elemsec),
            &[10u8] =>   code =      run!(codesec),
            &[11u8] =>   data =      run!(datasec),
            &[b] => err!("Unknown section {:#x}", b),
            _ => unreachable!(),
        }
    }

    let custom: HashMap<String, &[u8]> = custom.into_iter().collect();

    let names = {
        if let Some(data) = custom.get("name") {
            let mut data: &[u8] = data;
            let names = run_parser!(names(data));
            names

            // below check seems broken, see https://github.com/secure-foundations/rWasm/issues/2
            // if data.len() == 0 {
            //     names
            // } else {
            //     err!("Unused bytes in the custom name section")
            // }
        } else {
            Names {
                module: None,
                functions: HashMap::new(),
                locals: HashMap::new(),
            }
        }
    };

    // Merging the `funcsec` and the `codesec`
    //
    // This is one of the weirdest design decisions of the binary
    // format imho. They need to be the same length, by design. They
    // also must be merged together to actually create a function as
    // per the spec. So why are they kept separated? Anyways, we
    // simply zip them together and wrap them into the `Func` that we
    // need it to be.
    if functions.len() != code.len() {
        err!("funcsec and codesec are not the same length -- {} vs {}",
             functions.len(), code.len())
    }

    let imported_funcs = imports.iter().filter_map(|i| {
        match i.desc {
            ImportDesc::Func(typ) => {
                Some(Func {
                    typ,
                    internals: FuncInternals::ImportedFunc {
                        module: i.module.clone(),
                        name: i.name.clone(),
                    }
                })
            },
            _ => None,
        }
    }).collect::<Vec<_>>();

    let internal_funcs = functions.into_iter()
        .zip(code.into_iter())
        .map(|(typ, (locals, body))| Func {
            typ,
            internals: FuncInternals::LocalFunc { locals, body }
        })
        .collect::<Vec<Func>>();

    let funcs = imported_funcs.into_iter().chain(internal_funcs.into_iter()).collect();

    // .. and we finally have a module
    Module { types, funcs, tables, mems, globals, elem, data, start, imports, exports, names }
}}

pub fn parse(inp: &[u8]) -> Maybe<Module> {
    let (inp, m) = module(inp)?;
    if !inp.is_empty() {
        err!("Found {} trailing bytes in the file", inp.len())
    }
    Ok(m)
}
