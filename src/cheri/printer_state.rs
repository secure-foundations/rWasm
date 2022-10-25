use crate::wasm;
use crate::Maybe;
use color_eyre::eyre::eyre;

#[derive(Copy, Clone, Debug)]
pub enum LabelType {
    JumpToBlockStart,
    JumpToBlockEnd,
}

#[derive(Copy, Clone, Debug)]
pub struct Label {
    pub typ: LabelType,
    pub val_arity: usize,
    pub handle_arity: usize,
    pub orig_stack_size: usize,
    pub orig_handle_stack_size: usize,
    pub name: usize,
}

impl std::fmt::Display for Label {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "label_{}", self.name)
    }
}

#[derive(Copy, Clone, Debug)]
pub enum HandleOrVal {
    Handle,
    Val,
}

// WARN: Whenever cloning, make sure to sync up label freshness
// sources correctly, so as to not end up reusing label names.
#[derive(Clone, Debug)]
pub struct PrinterState {
    pub stack_size: Option<usize>,
    pub max_stack_size: usize,
    pub handle_stack_size: Option<usize>,
    pub max_handle_stack_size: usize,
    pub label_freshness_source: usize,
    pub labels: Vec<Label>,
    pub sync_stack: Vec<HandleOrVal>,
}

impl PrinterState {
    pub fn new() -> Self {
        PrinterState {
            // value stack
            stack_size: Some(0),
            max_stack_size: 0,
            // handle stack
            handle_stack_size: Some(0),
            max_handle_stack_size: 0,
            // label values
            label_freshness_source: 0,
            labels: vec![],
            // types in stack. Needed to support value-polymorphism
            // instructions ike drop and select
            sync_stack: vec![],
        }
    }

    pub fn push_label(&mut self, typ: LabelType, val_arity: usize, handle_arity: usize) -> Label {
        let l = Label {
            typ,
            val_arity,
            handle_arity,
            orig_stack_size: self.stack_size.unwrap(),
            orig_handle_stack_size: self.handle_stack_size.unwrap(),
            name: self.label_freshness_source,
        };
        self.label_freshness_source += 1;
        self.labels.push(l);
        l
    }

    pub fn pop_label(&mut self) {
        self.labels.pop();
    }

    pub fn total_stack_size(&mut self) -> Option<usize> {
        match (self.stack_size, self.handle_stack_size) {
            (Some(x), Some(y)) => Some(x + y),
            _ => None,
        }
    }

    fn stack_check(&self) -> Maybe<()> {
        if self.stack_size.unwrap() < 1 {
            return Err(eyre!("Insufficient stack depth"));
        };
        Ok(())
    }

    fn handle_stack_check(&self) -> Maybe<()> {
        if self.handle_stack_size.unwrap() < 1 {
            return Err(eyre!("Insufficient handle stack depth"));
        }
        Ok(())
    }

    pub fn peek_val(&self) -> String {
        assert!(
            self.sync_stack.len() == self.stack_size.unwrap() + self.handle_stack_size.unwrap()
        );
        self.stack_check().unwrap();
        format_args!("v{}", self.stack_size.unwrap() - 1).to_string()
    }

    pub fn push_val(&mut self) -> String {
        assert!(
            self.sync_stack.len() == self.stack_size.unwrap() + self.handle_stack_size.unwrap()
        );
        self.stack_size = Some(self.stack_size.unwrap() + 1);
        self.max_stack_size = std::cmp::max(self.max_stack_size, self.stack_size.unwrap());
        self.sync_stack.push(HandleOrVal::Val);
        format_args!("v{}", self.stack_size.unwrap() - 1).to_string()
    }

    pub fn pop_val(&mut self) -> String {
        assert!(
            self.sync_stack.len() == self.stack_size.unwrap() + self.handle_stack_size.unwrap()
        );
        self.stack_check().unwrap();
        self.stack_size = Some(self.stack_size.unwrap() - 1);
        self.sync_stack.pop();
        format_args!("v{}", self.stack_size.unwrap()).to_string()
    }

    pub fn peek_handle(&self) -> String {
        assert!(
            self.sync_stack.len() == self.stack_size.unwrap() + self.handle_stack_size.unwrap()
        );
        self.handle_stack_check().unwrap();
        format_args!("c{}", self.handle_stack_size.unwrap() - 1).to_string()
    }

    pub fn push_handle(&mut self) -> String {
        assert!(
            self.sync_stack.len() == self.stack_size.unwrap() + self.handle_stack_size.unwrap()
        );
        self.handle_stack_size = Some(self.handle_stack_size.unwrap() + 1);
        self.max_handle_stack_size =
            std::cmp::max(self.max_handle_stack_size, self.handle_stack_size.unwrap());
        self.sync_stack.push(HandleOrVal::Handle);
        format_args!("c{}", self.handle_stack_size.unwrap() - 1).to_string()
    }

    pub fn pop_handle(&mut self) -> String {
        assert!(
            self.sync_stack.len() == self.stack_size.unwrap() + self.handle_stack_size.unwrap()
        );
        self.handle_stack_check().unwrap();
        self.handle_stack_size = Some(self.handle_stack_size.unwrap() - 1);
        self.sync_stack.pop();
        format_args!("c{}", self.handle_stack_size.unwrap()).to_string()
    }

    pub fn pop_any(&mut self) -> String {
        match self.sync_stack.last().unwrap() {
            HandleOrVal::Val => self.pop_val(),
            HandleOrVal::Handle => self.pop_handle(),
        }
    }

    pub fn push_any(&mut self, t: wasm::syntax::ValType) -> String {
        match t {
            wasm::syntax::ValType::Handle => self.push_handle(),
            _ => self.push_val(),
        }
    }
}
