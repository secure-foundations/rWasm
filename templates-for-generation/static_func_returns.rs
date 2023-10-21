/// A common heapless return type for indirect calls.
/// Notice wasm functions have multi-returns. In order to
/// avoid heap allocation, call_indirect() returns this type
/// instead of Vec<TaggedVal>.
#[derive(Copy, Clone, Debug)]
enum IndirectFuncRet {
    <<RETDEFS>>
}

impl IndirectFuncRet {
    #[allow(dead_code)]
    fn len(&self) -> usize {
        use IndirectFuncRet::*;
        match self {
            <<RETCOUNTS>>
        }
    }
}

impl Index<usize> for IndirectFuncRet {
    type Output = TaggedVal;
    fn index<'a>(&'a self, i: usize) -> &'a TaggedVal {
        use IndirectFuncRet::*;
        match self {
            <<RETINDEXES>>
        }
    }
}

impl IndexMut<usize> for IndirectFuncRet {
    fn index_mut<'a>(&'a mut self, i: usize) -> &'a mut TaggedVal {
        use IndirectFuncRet::*;
        match self {
            <<RETINDEXESMUT>>
        }
    }
}
