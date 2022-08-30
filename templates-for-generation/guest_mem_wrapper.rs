use std::cell::{Cell, RefCell};
use std::collections::BTreeMap;

pub struct GuestMemWrapper<'a> {
    mem: RefCell<&'a mut [u8]>,
    borrowed_regions: RefCell<BTreeMap<usize, wiggle::Region>>,
    borrowed_regions_handle_freshness: Cell<usize>,
}

impl<'a, T: AsMut<[u8]>> From<&'a mut T> for GuestMemWrapper<'a> {
    fn from(mem: &'a mut T) -> Self {
        GuestMemWrapper {
            mem: RefCell::new(mem.as_mut()),
            borrowed_regions: RefCell::new(BTreeMap::new()),
            borrowed_regions_handle_freshness: Cell::new(0),
        }
    }
}

impl<'a> From<&'a mut [u8]> for GuestMemWrapper<'a> {
    fn from(mem: &'a mut [u8]) -> Self {
        GuestMemWrapper {
            mem: RefCell::new(mem),
            borrowed_regions: RefCell::new(BTreeMap::new()),
            borrowed_regions_handle_freshness: Cell::new(0),
        }
    }
}

unsafe impl<'a> wiggle::GuestMemory for GuestMemWrapper<'a> {
    fn base(&self) -> (*mut u8, u32) {
        let base: &mut [u8] = &mut self.mem.borrow_mut();
        (base.as_mut_ptr(), base.len() as u32)
    }
    fn has_outstanding_borrows(&self) -> bool {
        self.mem.try_borrow_mut().is_err()
    }
    fn is_borrowed(&self, r: wiggle::Region) -> bool {
        self.borrowed_regions
            .borrow()
            .iter()
            .any(|(_, b)| b.overlaps(r))
    }
    fn borrow(
        &self,
        r: wiggle::Region,
    ) -> std::result::Result<wiggle::BorrowHandle, wiggle::GuestError> {
        if self.is_borrowed(r) {
            todo!()
        } else {
            let handle: usize = self.borrowed_regions_handle_freshness.get();
            self.borrowed_regions_handle_freshness.set(handle + 1);
            self.borrowed_regions.borrow_mut().insert(handle, r);
            Ok(wiggle::BorrowHandle(handle))
        }
    }
    fn unborrow(&self, handle: wiggle::BorrowHandle) {
        let _: wiggle::Region = self
            .borrowed_regions
            .borrow_mut()
            .remove(&handle.0)
            .expect("invalid unborrow");
    }
}
