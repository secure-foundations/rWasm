use crate::wasm;

// All caps macros used in this file are defined in the module prologue

pub fn print_iunop(
    bs: &wasm::syntax::BitSize,
    o: &wasm::syntax::instructions::intop::UnOp,
    src: &str,
) -> String {
    use wasm::syntax::instructions::intop::UnOp::*;
    match o {
        Clz => format!("I{}_CLZ({})", bs, src),
        Ctz => format!("I{}_CTZ({})", bs, src),
        Popcnt => format!("I{}_POPCNT({})", bs, src),
        ExtendS(ps) => format!("(i{})((i{}){})", bs, ps, src),
    }
}

// relies on math.h
pub fn print_funop(o: &wasm::syntax::instructions::floatop::UnOp, src: &str) -> String {
    use wasm::syntax::instructions::floatop::UnOp::*;
    match o {
        Neg => format!("-{}", src),
        Abs => format!("fabs({})", src),
        Ceil => format!("ceil({})", src),
        Floor => format!("floor({})", src),
        Trunc => format!("trunc({})", src), // TODO: should I use prologue version?
        Nearest => format!("round({})", src),
        Sqrt => format!("sqrt({})", src),
    }
}

pub fn print_ibinop(
    bs: &wasm::syntax::BitSize,
    b: &wasm::syntax::instructions::intop::BinOp,
    src1: &str,
    src2: &str,
) -> String {
    use wasm::syntax::instructions::intop::BinOp::*;
    match b {
        Add => format!("{} + {}", src1, src2),
        Sub => format!("{} - {}", src1, src2),
        Mul => format!("{} * {}", src1, src2),
        DivS => format!("I{}_DIV_S({}, {})", bs, src1, src2),
        DivU => format!("DIV_U({},{})", src1, src2),
        RemS => format!("I{}_REM_S({}, {})", bs, src1, src2),
        RemU => format!("REM_U({},{})", src1, src2),
        And => format!("{} & {}", src1, src2),
        Or => format!("{} | {}", src1, src2),
        Xor => format!("{} ^ {}", src1, src2),
        Shl => format!("{} << ({} % {})", src1, src2, bs),
        ShrS => format!("(i{}){} >> ({} % {})", bs, src1, src2, bs),
        ShrU => format!("(u{}){} >> ({} % {})", bs, src1, src2, bs),
        Rotl => format!("I{}_ROTL({}, {})", bs, src1, src2),
        Rotr => format!("I{}_ROTR({}, {})", bs, src1, src2),
    }
}

// Relies on math.h
pub fn print_fbinop(
    b: &wasm::syntax::instructions::floatop::BinOp,
    src1: &str,
    src2: &str,
) -> String {
    use wasm::syntax::instructions::floatop::BinOp::*;
    match b {
        Add => format!("{} + {}", src1, src2),
        Sub => format!("{} - {}", src1, src2),
        Mul => format!("{} * {}", src1, src2),
        Div => format!("{} / {}", src1, src2),
        Min => format!("FMIN({}, {})", src1, src2),
        Max => format!("FMAX({}, {})", src1, src2),
        CopySign => format!("copysign({}, {})", src1, src2),
    }
}

pub fn print_irelop(
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
        LtU => format!("((u{}){}) < ((u{}){})", bs, src1, bs, src2),
        GtS => format!("{} > {}", src1, src2),
        GtU => format!("((u{}){}) > ((u{}){})", bs, src1, bs, src2),
        LeS => format!("{} <= {}", src1, src2),
        LeU => format!("((u{}){}) <= ((u{}){})", bs, src1, bs, src2),
        GeS => format!("{} >= {}", src1, src2),
        GeU => format!("((u{}){}) >= ((u{}){})", bs, src1, bs, src2),
    }
}

pub fn print_frelop(
    o: &wasm::syntax::instructions::floatop::RelOp,
    src1: &str,
    src2: &str,
) -> String {
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
