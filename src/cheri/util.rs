use crate::wasm;
use crate::Maybe;
use color_eyre::eyre::eyre;

pub(crate) fn get_func_name(m: &wasm::syntax::Module, id: wasm::syntax::FuncIdx) -> String {
    m.names
        .functions
        .get(&id)
        .unwrap_or(&format!("func_{}", id.0))
        .into()
}

pub fn resulttype_in_out_vals(ftype: &wasm::syntax::ResultType) -> (usize, usize) {
    let mut num_vals = 0;
    let mut num_handles = 0;
    for ty in ftype.0.iter() {
        match ty {
            wasm::syntax::ValType::Handle => {
                num_handles += 1;
            }
            _ => {
                num_vals += 1;
            }
        }
    }
    return (num_vals, num_handles);
}

pub(crate) fn block_type_in_out_vals(
    m: &wasm::syntax::Module,
    bt: &wasm::syntax::BlockType,
) -> Maybe<(usize, usize, usize, usize)> {
    match bt {
        wasm::syntax::BlockType::TypeIdx(ti) => {
            let ty = m
                .types
                .get(ti.0 as usize)
                .ok_or(eyre!("Invalid type index {}", ti.0))?;
            let (from_vals, from_handles) = resulttype_in_out_vals(&ty.from);
            let (to_vals, to_handles) = resulttype_in_out_vals(&ty.to);
            Ok((from_vals, to_vals, from_handles, to_handles))
        }
        wasm::syntax::BlockType::ValType(None) => Ok((0, 0, 0, 0)),
        // to handle
        wasm::syntax::BlockType::ValType(Some(wasm::syntax::ValType::Handle)) => Ok((0, 0, 0, 1)),
        // to value
        wasm::syntax::BlockType::ValType(Some(_v)) => Ok((0, 1, 0, 0)),
    }
}

pub(crate) fn local_typ(
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
