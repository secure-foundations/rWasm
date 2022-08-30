tagged_value_conversion! {Handle, try_as_handle, Handle}
impl TaggedVal {
    // This alias exists only to make the generator a little easier;
    // could be fixed up on that end with some work to remove this
    // line, but since it doesn't impact performance, it is fine to
    // keep this around
    #[inline(always)]
    #[allow(dead_code, non_snake_case)]
    fn try_as_Handle(&self) -> Option<Handle> {
        self.try_as_handle()
    }
}

// A compile-time-only assertion, useful in constant contexts
macro_rules! const_assert {
    ($x:expr $(,) ?) => {
        #[allow(unknown_lints, eq_op)]
        const _: [(); 0 - !{
            const ASSERT: bool = $x;
            ASSERT
        } as usize] = [];
    };
}

const SLOT_SIZE: usize = 16;
const SUBSLOT_OFFSET_BIT_MASK: u32 = {
    const_assert!(SLOT_SIZE.is_power_of_two());
    2 * SLOT_SIZE.trailing_zeros() - 1
};

#[derive(Clone, Copy)]
#[repr(transparent)]
pub struct Handle {
    opaque: u64,
}

impl std::fmt::Display for Handle {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        if !self
            .assert_valid_oob_zeroed_rest()
            .or(self.assert_valid_inbounds_zeroed_rest())
            .is_some()
        {
            write!(f, "<corrupted={:#x?}>", self.opaque)
        } else {
            if self.is_null() {
                write!(f, "<null off={:#x?}>", self.offset())
            } else {
                write!(
                    f,
                    "<off={:#x?} lgsz={}{}>",
                    self.offset(),
                    self.refslot_logsize(),
                    if self.is_oob() { " OOB" } else { "" }
                )
            }
        }
    }
}

impl std::fmt::Debug for Handle {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "'{} opaque={:#x?}'", self, self.opaque)
    }
}

impl Handle {
    #[allow(non_upper_case_globals)]
    // A value that is strictly broken and cannot be used to dereference
    const Null: Self = Self { opaque: 1 << 62 };

    const NULL: Self = Self::Null;

    #[allow(dead_code)]
    fn is_null(self) -> bool {
        self.opaque == 1 << 62
    }

    #[inline(always)]
    fn is_oob(self) -> bool {
        self.opaque >> 63 == 1
    }

    #[inline(always)]
    fn offset(self) -> u32 {
        self.opaque as u32
    }

    #[inline(always)]
    fn new_internal(is_oob: bool, alloc_logsize: u8, offset: u32) -> Self {
        let oob_bit = (is_oob as u64) << 63;
        let main_size_bits = if is_oob { 0 } else { alloc_logsize as u64 } << 32;
        let oob_size_bits = if is_oob { alloc_logsize as u64 } else { 0 } << 40;
        let offset_bits = offset as u64;
        Self {
            opaque: oob_bit | main_size_bits | oob_size_bits | offset_bits,
        }
    }

    #[inline(always)]
    fn new(alloc_logsize: u8, offset: u32) -> Self {
        Self::new_internal(false, alloc_logsize, offset)
    }

    // Aid the optimizer, and also help with probabilistic checking of MS-Wasm corruption
    #[inline(always)]
    #[must_use]
    fn assert_valid_oob_zeroed_rest(self) -> Option<()> {
        const USED_BITS: u64 =
            0b10000000_00000000_00011111_00000000__11111111_11111111_11111111_11111111;
        (self.is_oob() && self.opaque & !USED_BITS == 0).then(|| ())
    }

    // Aid the optimizer, and also help with probabilistic checking of MS-Wasm corruption
    #[inline(always)]
    #[must_use]
    fn assert_valid_inbounds_zeroed_rest(self) -> Option<()> {
        const USED_BITS: u64 =
            0b00000000_00000000_00000000_00011111__11111111_11111111_11111111_11111111;
        (self.opaque & !USED_BITS == 0).then(|| ())
    }

    #[inline(always)]
    fn fast_inbounds_logsize(self) -> u8 {
        (self.opaque >> 32) as u8
    }

    #[inline(always)]
    fn fast_oob_logsize(self) -> u8 {
        (self.opaque >> 40) as u8
    }

    #[inline(always)]
    fn refslot_logsize(self) -> u8 {
        if self.is_oob() {
            self.fast_oob_logsize()
        } else {
            self.fast_inbounds_logsize()
        }
    }

    #[inline(always)]
    fn mark_as_in_bounds(self) -> Option<Self> {
        self.assert_valid_oob_zeroed_rest()?; // optimized out on calls
        Some(Self::new_internal(
            false,
            self.refslot_logsize(),
            self.offset(),
        ))
    }

    #[inline(always)]
    fn mark_as_oob(self) -> Option<Self> {
        self.assert_valid_inbounds_zeroed_rest()?; // optimized out on calls
        Some(Self::new_internal(
            true,
            self.refslot_logsize(),
            self.offset(),
        ))
    }

    #[inline(always)]
    fn oob_referrent_slot(self) -> Option<Self> {
        const_assert!(SLOT_SIZE.is_power_of_two());
        self.assert_valid_oob_zeroed_rest()?;

        let b = self.offset() as u32;
        let m = b & SUBSLOT_OFFSET_BIT_MASK;
        let o = if m < SLOT_SIZE as u32 / 2 {
            // In left half of slot, thus right of the actual base
            m as i32 + SLOT_SIZE as i32
        } else {
            // In right half of slot, thus left of the actual base
            m as i32 - SLOT_SIZE as i32
        };

        Some(Self::new_internal(
            false,
            self.fast_oob_logsize(),
            (self.offset() as i32 - o as i32) as u32,
        ))
    }

    #[allow(dead_code)]
    fn bounds_base_offset(self) -> Option<u32> {
        Some(if !self.is_oob() {
            let l = self.fast_inbounds_logsize();
            (self.offset() >> l) << l
        } else {
            self.oob_referrent_slot()?.bounds_base_offset()?
        })
    }

    #[inline(never)]
    #[cold] // Mark this as a slow path for the optimizer
    fn slow_path_make_valid_update_using(self: Handle, old: Handle) -> Option<Handle> {
        if (self.opaque ^ old.opaque) >> old.fast_inbounds_logsize() == 0 {
            // This function should not be called when this is true (since the expected place to
            // call the function is from within `make_valid_update_using`), but we add it in for
            // completeness sake.
            return Some(self);
        }

        #[inline(always)]
        fn set_oob_bit_or_die(this: Handle, ref_slot: Handle) -> Option<Handle> {
            // `this` and `ref_slot` should not have OOB bit set, but `this` should be _actually_ OOB

            // Check if within a safe offset to have a non-signalling OOB value
            const SAFE: i32 = SLOT_SIZE as i32 / 2;
            let o = this.offset() as i32 - ref_slot.offset() as i32;
            if o > 0 {
                if o - (1 << ref_slot.fast_inbounds_logsize()) < SAFE {
                    // Safe offset
                    this.mark_as_oob()
                } else {
                    // Too far gone, stop this entirely
                    None
                }
            } else {
                if -SAFE <= o {
                    // Safe offset
                    this.mark_as_oob()
                } else {
                    // Too far gone, stop this entirely
                    None
                }
            }
        }

        if old.is_oob() {
            let ref_slot = old.oob_referrent_slot()?;
            let e = old.refslot_logsize();
            let self_as_in_bounds = self.mark_as_in_bounds()?;
            if (self_as_in_bounds.opaque ^ ref_slot.opaque) >> e == 0 {
                // Back in bounds, return with OOB switched off
                Some(self_as_in_bounds)
            } else {
                // Still out of bounds
                set_oob_bit_or_die(self_as_in_bounds, ref_slot)
            }
        } else {
            // Old was not OOB, but the new one is
            set_oob_bit_or_die(self, old)
        }
    }

    #[inline(always)]
    fn make_valid_update_using(self, old: Self) -> Option<Self> {
        if (self.opaque ^ old.opaque) >> old.fast_inbounds_logsize() == 0 {
            // Fast path, check succeeded, directly return the value
            Some(self)
        } else {
            // Slow path, either for a benign OOB or an OOB needs to be cleared
            self.slow_path_make_valid_update_using(old)
        }
    }

    #[inline(always)]
    fn update_to_valid_or_die(self, new: Self) -> Option<Self> {
        new.make_valid_update_using(self)
    }
}

impl Handle {
    #[allow(dead_code)]
    fn add(self, amt: i32) -> Option<Self> {
        self.update_to_valid_or_die(Self {
            opaque: (self.opaque as i64 + amt as i64) as u64,
        })
    }

    #[allow(dead_code)]
    fn sub(self, amt: i32) -> Option<Self> {
        self.add(-amt)
    }

    #[allow(dead_code)]
    fn to_bytes(self) -> [u8; 8] {
        self.opaque.to_ne_bytes()
    }

    #[allow(dead_code)]
    fn from_bytes(bytes: [u8; 8]) -> Self {
        Self {
            opaque: u64::from_ne_bytes(bytes),
        }
    }

    #[allow(dead_code)]
    fn is_eq(self, other: Self) -> bool {
        self.opaque == other.opaque
    }

    #[allow(dead_code)]
    fn is_lt(self, other: Self) -> Option<bool> {
        Some(if other.is_null() {
            false
        } else if self.is_null() {
            true
        } else {
            self.offset() < other.offset()
        })
    }

    #[allow(dead_code)]
    fn handle_get_offset(&self) -> Option<i32> {
        // XXX: Maybe it is important to set this to the offset from
        // the base of the relevant segment?
        self.offset().try_into().ok()
    }
}

impl WasmModule {
    #[allow(dead_code)]
    fn new_segment(&mut self, size: u32) -> Option<Handle> {
        self.segments.allocate(size)
    }

    #[allow(dead_code)]
    fn free_segment(&mut self, h: Handle) -> Option<()> {
        self.segments.free(h)
    }
}

struct Segments {
    memory: Vec<u8>,
    free_list: [Vec<u32>; 32],
}

impl Segments {
    #[rustfmt::skip]
    fn new() -> Self {
        Self {
            memory: vec![],
            free_list: [
                vec![], vec![], vec![], vec![], vec![], vec![], vec![], vec![],
                vec![], vec![], vec![], vec![], vec![], vec![], vec![], vec![],
                vec![], vec![], vec![], vec![], vec![], vec![], vec![], vec![],
                vec![], vec![], vec![], vec![], vec![], vec![], vec![], vec![],
            ],
        }
    }

    fn allocate(&mut self, size: u32) -> Option<Handle> {
        let size = (size.max(16) as usize).checked_next_power_of_two()?;
        let logsize = size.trailing_zeros() as usize;
        let mut splittable_size = (logsize..32)
            .filter(|&i| !self.free_list[i as usize].is_empty())
            .next()
            .unwrap_or_else(|| {
                if self.memory.is_empty() {
                    let ls = logsize + 1;
                    self.free_list[ls].push(0);
                    self.memory.resize(1 << ls, 0);
                    ls
                } else {
                    loop {
                        let o: u32 = self.memory.len().try_into().unwrap();
                        assert!(self.memory.len().is_power_of_two());
                        let ls = self.memory.len().trailing_zeros() as usize;
                        self.free_list[ls].push(o);
                        self.memory.resize(2 << ls, 0); // extend by an extra 1<<ls
                        if ls >= logsize {
                            break ls;
                        }
                    }
                }
            });
        let start = loop {
            let start = self.free_list[splittable_size].pop().unwrap();
            if splittable_size == logsize {
                break start;
            }
            self.free_list[splittable_size - 1].push(start);
            self.free_list[splittable_size - 1].push(start + (1 << (splittable_size - 1)));
            splittable_size -= 1;
        };
        self.memory[start as usize..start as usize + (1 << logsize)].fill(0);
        Some(Handle::new(logsize as u8, start))
    }

    fn free(&mut self, h: Handle) -> Option<()> {
        // It is not possible to match MS-Wasm's (relaxed) memory safety guarantees wrt UaF in the
        // Baggy Bounds backend, so instead we perform normal freeing operations so that memory
        // usage is miminized.
        let logsize = h.fast_inbounds_logsize();
        let start = h.offset();

        // Can only free from start of an allocated segment
        h.assert_valid_inbounds_zeroed_rest()?;
        if start & ((1 << logsize) - 1) != 0 {
            return None;
        }

        fn coalesce(free_list: &mut [Vec<u32>; 32], logsize: usize, start: u32) {
            let other = start ^ (1 << logsize);

            if let Some((i, _)) = free_list[logsize]
                .iter()
                .enumerate()
                .filter(|&(_i, &v)| v == other)
                .next()
            {
                // There is a buddy that can be coalesced, pull it out of the free list and forward
                // the larger chunk along
                free_list[logsize].swap_remove(i);
                coalesce(free_list, logsize + 1, start & !(1 << logsize));
            } else {
                // No buddy to coalesce with, just mark as free and be done.
                free_list[logsize].push(start);
            }
        }

        // Mark as free, coalescing upwards if needed
        coalesce(&mut self.free_list, logsize as usize, start);

        Some(())
    }

    fn get_data(&self) -> &[u8] {
        &self.memory
    }

    fn get_mut_data(&mut self) -> &mut [u8] {
        &mut self.memory
    }

    #[allow(dead_code)]
    fn get_handle(&self, loc: Handle) -> Option<Handle> {
        Some(Handle {
            opaque: read_mem_u64(self.get_data(), loc.offset().try_into().unwrap())?,
        })
    }

    #[allow(dead_code)]
    fn store_handle(&mut self, loc: Handle, value: Handle) -> Option<()> {
        write_mem_u64(
            self.get_mut_data(),
            loc.offset().try_into().unwrap(),
            value.opaque,
        )
    }

    #[allow(dead_code)]
    fn store_bytes(&mut self, loc: Handle, value: &[u8]) -> Option<()> {
        let end = loc.add(value.len() as i32)?; // ensures that it is in same bounds
        self.get_mut_data()[loc.offset() as usize..end.offset() as usize].copy_from_slice(value);
        Some(())
    }
}

fn with_collected_memory_0<T, U: Into<Option<T>>>(
    _segments: &mut Segments,
    f: impl FnOnce(&guest_mem_wrapper::GuestMemWrapper) -> U,
) -> Option<T> {
    f(&guest_mem_wrapper::GuestMemWrapper::from(&mut [])).into()
}

fn with_collected_memory_1<T, U: Into<Option<T>>>(
    segments: &mut Segments,
    h0: Handle,
    f: impl FnOnce(&guest_mem_wrapper::GuestMemWrapper, i32) -> U,
) -> Option<T> {
    let res = f(
        &guest_mem_wrapper::GuestMemWrapper::from(segments.get_mut_data()),
        h0.offset().try_into().ok()?,
    )
    .into()?;
    Some(res)
}

macro_rules! write {
    (store_handle, $segments:expr, $handle:expr, $val:expr) => {
        $segments.store_handle($handle, $val)?;
    };
    ($writefn:ident, $segments:expr, $handle:expr, $val:expr) => {
        $writefn($segments.get_mut_data(), $handle.offset() as usize, $val)?;
    };
}

macro_rules! read {
    (get_handle, $segments:expr, $handle:expr) => {
        $segments.get_handle($handle)?
    };
    (bytes, $segments:expr, $handle:expr, $len:expr) => {
        &$segments.get_data()[$handle.offset() as usize..][..$len]
    };
    ($readfn:ident, $segments:expr, $handle:expr) => {
        $readfn($segments.get_data(), $handle.offset() as usize)?
    };
}
