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

#[derive(Copy, Clone, Debug)]
pub enum Handle {
    Valid {
        base_segment_id: u32, // Note: Using segment ID here, rather than a base into memory
        offset: u32,
        // Note: Ignoring `bound: u32` for now, since we don't (yet)
        // have handle.slice/segment_slice/etc.
    },
    Corrupted {
        bytes: [u8; 8],
    },
    Null {
        offset: i32,
    },
}
impl std::fmt::Display for Handle {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Handle::Valid {
                base_segment_id,
                offset,
            } => write!(f, "<seg={} off={:#x?}>", base_segment_id, offset),
            Handle::Corrupted { bytes } => write!(f, "<corrupted {:?}>", bytes),
            Handle::Null { offset } => write!(f, "<null off={:#x?}>", offset),
        }
    }
}

impl Handle {
    const NULL: Handle = Handle::Null { offset: 0 };

    #[allow(dead_code)]
    fn add(self, amt: i32) -> Option<Self> {
        match self {
            Handle::Null { offset } => Some(Handle::Null {
                offset: offset.checked_add(amt)?,
            }),
            Handle::Corrupted { .. } => None,
            Handle::Valid {
                base_segment_id,
                offset,
            } => {
                let offset: i32 = offset as _;
                let new_offset: i32 = offset.overflowing_add(amt).0;
                Some(Handle::Valid {
                    base_segment_id,
                    offset: new_offset as _,
                })
            }
        }
    }

    #[allow(dead_code)]
    fn sub(self, amt: i32) -> Option<Self> {
        self.add(-amt)
    }

    #[allow(dead_code)]
    #[cfg(any(target_pointer_width = "32", target_pointer_width = "64"))]
    fn segment_index(self) -> Option<usize> {
        match self {
            Handle::Null { .. } | Handle::Corrupted { .. } => None,
            Handle::Valid {
                base_segment_id,
                offset: _,
            } => Some(base_segment_id as _),
        }
    }

    #[allow(dead_code)]
    #[cfg(any(target_pointer_width = "32", target_pointer_width = "64"))]
    fn segment_offset(self) -> Option<usize> {
        match self {
            Handle::Null { offset } => Some(offset as _),
            Handle::Corrupted { .. } => None,
            Handle::Valid {
                base_segment_id: _,
                offset,
            } => Some(offset as _),
        }
    }

    #[allow(dead_code)]
    fn to_bytes(self) -> ([u8; 8], Tag) {
        match self {
            Handle::Null { offset: 0 } => {
                let mut res = [0u8; 8];
                res[..4].copy_from_slice(&u32::MAX.to_ne_bytes());
                res[4..].copy_from_slice(&u32::MAX.to_ne_bytes());
                (res, Tag::Handle)
            }
            Handle::Null { offset } => {
                todo!("Trying to convert null with offset {} to bytes", offset)
            }
            Handle::Valid {
                base_segment_id,
                offset,
            } => {
                let mut res = [0u8; 8];
                res[..4].copy_from_slice(&base_segment_id.to_ne_bytes());
                res[4..].copy_from_slice(&offset.to_ne_bytes());
                (res, Tag::Handle)
            }
            Handle::Corrupted { bytes } => (bytes, Tag::Data),
        }
    }

    #[allow(dead_code)]
    fn from_bytes(bytes: [u8; 8], tag: Tag) -> Self {
        if !tag.can_be_handle() {
            Handle::Corrupted { bytes }
        } else {
            let base_segment_id = u32::from_ne_bytes(bytes[..4].try_into().unwrap());
            let offset = u32::from_ne_bytes(bytes[4..].try_into().unwrap());
            if base_segment_id == u32::MAX {
                assert_eq!(offset, u32::MAX);
                Handle::Null { offset: 0 }
            } else {
                Handle::Valid {
                    base_segment_id,
                    offset,
                }
            }
        }
    }

    #[allow(dead_code)]
    fn is_eq(self, other: Self) -> bool {
        match (self, other) {
            (Handle::Null { offset: o1 }, Handle::Null { offset: o2 }) => o1 == o2,
            (Handle::Corrupted { bytes: b1 }, Handle::Corrupted { bytes: b2 }) => b1 == b2,
            (
                Handle::Valid {
                    base_segment_id: i1,
                    offset: o1,
                },
                Handle::Valid {
                    base_segment_id: i2,
                    offset: o2,
                },
            ) => i1 == i2 && o1 == o2,
            _ => false,
        }
    }

    #[allow(dead_code)]
    fn is_lt(self, other: Self) -> Option<bool> {
        match (self, other) {
            (Handle::Corrupted { .. }, _) | (_, Handle::Corrupted { .. }) => None,
            (Handle::Null { offset: o1 }, Handle::Null { offset: o2 }) => Some(o1 < o2),
            (Handle::Null { .. }, _) => Some(true),
            (_, Handle::Null { .. }) => Some(false),
            (
                Handle::Valid {
                    base_segment_id: i1,
                    offset: o1,
                },
                Handle::Valid {
                    base_segment_id: i2,
                    offset: o2,
                },
            ) => Some(i1 < i2 || (i1 == i2 && o1 < o2)),
        }
    }
}

impl WasmModule {
    #[allow(dead_code)]
    fn new_segment(&mut self, size: u32) -> Option<Handle> {
        if size == 0 {
            panic!("Trying to allocate 0 size segment. \
                    It is easy to \"support\" this, but likely indicates something unexpected is happening, thus the panic.")
        }
        if self.segments.is_empty() {
            // Use up the "0" segment, to prevent it from being used for a real segment
            self.segments.push(Segment::Freed);
        }
        let id: u32 = self.segments.len().try_into().ok()?;
        if id == u32::MAX {
            // Filled up entire segment space, no more segments left
            // to allocate. `u32::MAX` is reserved for the
            // representation of `Handle::Null`.
            return None;
        }
        self.segments.push(Segment::allocate(size));
        Some(Handle::Valid {
            base_segment_id: id,
            offset: 0,
        })
    }

    #[allow(dead_code)]
    fn free_segment(&mut self, h: Handle) -> Option<()> {
        match h {
            Handle::Valid {
                base_segment_id,
                offset,
            } => {
                if offset == 0 {
                    self.segments.get_mut(base_segment_id as usize)?.free();
                    Some(())
                } else {
                    None
                }
            }
            Handle::Corrupted { .. } => None,
            Handle::Null { .. } => None,
        }
    }
}

#[cfg(not(feature = "notags"))]
#[allow(dead_code)]
#[derive(Clone, Copy, PartialEq, Eq)]
enum Tag {
    Data,
    Handle,
}
#[cfg(not(feature = "notags"))]
impl Tag {
    fn can_be_handle(&self) -> bool {
        *self == Tag::Handle
    }
}
#[cfg(feature = "notags")]
#[allow(dead_code)]
#[derive(Clone, Copy, PartialEq, Eq)]
struct Tag {
    // A zero sized type, optimized away
}
#[cfg(feature = "notags")]
impl Tag {
    #[allow(non_upper_case_globals)]
    const Data: Self = Self {};
    #[allow(non_upper_case_globals)]
    const Handle: Self = Self {};
    fn can_be_handle(&self) -> bool {
        true
    }
}

#[cfg(all(not(feature = "packedtags"), not(feature = "notags")))]
struct Tags {
    tags: Vec<Tag>,
}
#[cfg(all(not(feature = "packedtags"), not(feature = "notags")))]
impl Tags {
    fn new(tags_size: usize) -> Self {
        Self {
            tags: vec![Tag::Data; tags_size],
        }
    }
    #[must_use]
    fn update(&mut self, tag_offset: usize, tag: Tag) -> Option<()> {
        *self.tags.get_mut(tag_offset)? = tag;
        Some(())
    }
    fn get(&self, tag_offset: usize) -> Option<Tag> {
        self.tags.get(tag_offset).cloned()
    }
}

#[cfg(feature = "packedtags")]
struct Tags {
    packed_tags: Vec<u64>,
}
#[cfg(feature = "packedtags")]
impl Tags {
    fn new(tags_size: usize) -> Self {
        Self {
            packed_tags: vec![0u64; (tags_size + 63) / 64],
        }
    }
    #[must_use]
    fn update(&mut self, tag_offset: usize, tag: Tag) -> Option<()> {
        if tag.can_be_handle() {
            *self.packed_tags.get_mut(tag_offset / 64)? |= 1 << (tag_offset % 64);
        } else {
            *self.packed_tags.get_mut(tag_offset / 64)? &= !(1 << (tag_offset % 64));
        }
        Some(())
    }
    fn get(&self, tag_offset: usize) -> Option<Tag> {
        if self.packed_tags.get(tag_offset / 64)? & (1 << (tag_offset % 64)) == 0 {
            Some(Tag::Data)
        } else {
            Some(Tag::Handle)
        }
    }
}

#[cfg(feature = "notags")]
struct Tags {
    // A zero sized type, optimized away
}
#[cfg(feature = "notags")]
impl Tags {
    fn new(_tags_size: usize) -> Self {
        Self {}
    }
    fn update(&mut self, _tag_offset: usize, _tag: Tag) -> Option<()> {
        Some(())
    }
    fn get(&self, _tag_offset: usize) -> Option<Tag> {
        Some(Tag {})
    }
}

#[allow(dead_code)]
enum Segment {
    Freed,
    Allocated { data: Vec<u8>, tags: Tags },
}
type Segments = Vec<Segment>;

#[allow(dead_code)]
impl Segment {
    fn free(&mut self) {
        *self = Segment::Freed;
    }

    fn allocate(size: u32) -> Self {
        let size = size as usize;
        let tag_size = size.checked_add(7).unwrap() / 8; // ceiling-divide by 8
        Segment::Allocated {
            data: vec![0u8; size],
            tags: Tags::new(tag_size),
        }
    }

    fn get_data(&self) -> Option<&[u8]> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, .. } => Some(data.as_ref()),
        }
    }

    fn len(&self) -> Option<usize> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, .. } => Some(data.len()),
        }
    }

    // Performs the necessary type conversion at write time as
    // described in the MS-Wasm position paper
    fn get_mut_data(&mut self, update_offset: usize) -> Option<&mut [u8]> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, tags } => {
                tags.update(update_offset / 8, Tag::Data)?;
                Some(data.as_mut())
            }
        }
    }

    fn get_mut_data_slice(&mut self, start: usize, end: usize) -> Option<&mut [u8]> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, tags } => {
                for i in start / 8..end / 8 {
                    tags.update(i, Tag::Data)?;
                }
                Some(data.as_mut())
            }
        }
    }

    fn get_handle(&self, offset: usize) -> Option<Handle> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, tags } => {
                if offset % 8 != 0 {
                    None
                } else {
                    Some(Handle::from_bytes(
                        data.get(offset..offset + 8)?.try_into().ok()?,
                        tags.get(offset / 8)?,
                    ))
                }
            }
        }
    }

    // Performs the necessary type conversion at write time as
    // described in the MS-Wasm position paper
    fn store_handle(&mut self, offset: usize, handle: Handle) -> Option<()> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, tags } => {
                let (bytes, tag) = handle.to_bytes();
                data.get_mut(offset..offset + 8)?.copy_from_slice(&bytes);
                tags.update(offset / 8, tag)?;
                Some(())
            }
        }
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
    let seg = segments.get_mut(h0.segment_index()?)?;
    let res = f(
        &guest_mem_wrapper::GuestMemWrapper::from(seg.get_mut_data_slice(0, 0)?),
        h0.segment_offset()?.try_into().ok()?,
    )
    .into()?;
    Some(res)
}

macro_rules! write {
    (store_handle, $segments:expr, $handle:expr, $val:expr) => {
        $segments
            .get_mut($handle.segment_index()?)?
            .store_handle($handle.segment_offset()?, $val)?;
    };
    ($writefn:ident, $segments:expr, $handle:expr, $val:expr) => {
        $writefn(
            $segments
                .get_mut($handle.segment_index()?)?
                .get_mut_data($handle.segment_offset()?)?,
            ($handle.segment_offset()?) as usize,
            $val,
        )?;
    };
}

macro_rules! read {
    (get_handle, $segments:expr, $handle:expr) => {
        $segments
            .get($handle.segment_index()?)?
            .get_handle($handle.segment_offset()?)?
    };
    (bytes, $segments:expr, $handle:expr, $len:expr) => {
        &$segments.get($handle.segment_index()?)?.get_data()?[$handle.segment_offset()?..][..$len]
    };
    ($readfn:ident, $segments:expr, $handle:expr) => {
        $readfn(
            $segments.get($handle.segment_index()?)?.get_data()?,
            ($handle.segment_offset()?) as usize,
        )?
    };
}
