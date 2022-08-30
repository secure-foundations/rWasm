mod ms_wasm_wasi {

    use super::*;
    use wasi_common::wasi::wasi_snapshot_preview1;

    #[allow(dead_code)]
    // args_get(argv: Pointer<Pointer<u8>>, argv_buf: Pointer<u8>) -> Result<(), errno>
    pub(super) fn args_get(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: Handle,
        arg1: Handle,
    ) -> Option<i32> {
        let (argv_count, argv_buf_len) = {
            let mut memory = [0u8; 4 + 4];
            wasi_snapshot_preview1::args_sizes_get(
                ctx,
                &guest_mem_wrapper::GuestMemWrapper::from(&mut memory),
                0,
                4,
            );
            (read_mem_u32(&memory, 0)?, read_mem_u32(&memory, 4)?)
        };

        let argv_buf_start = (argv_count + 1) * 4;
        let mut memory: Vec<u8> = vec![0u8; (argv_buf_start + (argv_buf_len + 1)) as usize];
        let res = wasi_snapshot_preview1::args_get(
            ctx,
            &guest_mem_wrapper::GuestMemWrapper::from(&mut memory),
            0,
            argv_buf_start as i32,
        );

        for i in 0..argv_count {
            write!(
                store_handle,
                segments,
                arg0.add(i as i32 * 8)?,
                arg1.add(read_mem_i32(&memory, i as usize * 4)? - argv_buf_start as i32)?
            );
        }
        for i in 0..argv_buf_len {
            write!(
                write_mem_u8,
                segments,
                arg1.add(i as i32)?,
                read_mem_u8(&memory, (argv_buf_start + i) as usize)?
            );
        }

        Some(res)
    }

    #[allow(dead_code)]
    // args_sizes_get() -> Result<(size, size), errno>
    pub(super) fn args_sizes_get(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: Handle,
        arg1: Handle,
    ) -> Option<i32> {
        let mut memory = [0u8; 4 + 4];
        let res = wasi_snapshot_preview1::args_sizes_get(
            ctx,
            &guest_mem_wrapper::GuestMemWrapper::from(&mut memory),
            0,
            4,
        );

        let arg0_res = read_mem_u32(&memory, 0)?;
        let arg1_res = read_mem_u32(&memory, 4)?;

        write!(write_mem_u32, segments, arg0, arg0_res);
        write!(write_mem_u32, segments, arg1, arg1_res);

        Some(res)
    }

    #[allow(dead_code)]
    // clock_time_get(id: clockid, precision: timestamp) -> Result<timestamp, errno>
    pub(super) fn clock_time_get(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: i32,
        arg1: i64,
        arg2: Handle,
    ) -> Option<i32> {
        // No internal pointers, just pass through directly
        with_collected_memory_1(segments, arg2, |mem, arg2| {
            wasi_snapshot_preview1::clock_time_get(ctx, mem, arg0, arg1, arg2)
        })
    }

    #[allow(dead_code)]
    // fd_close(fd: fd) -> Result<(), errno>
    pub(super) fn fd_close(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: i32,
    ) -> Option<i32> {
        // No pointers, just pass through directly
        with_collected_memory_0(segments, |mem| {
            wasi_snapshot_preview1::fd_close(ctx, mem, arg0)
        })
    }

    #[allow(dead_code)]
    // fd_fdstat_get(fd: fd) -> Result<fdstat, errno>
    pub(super) fn fd_fdstat_get(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: i32,
        arg1: Handle,
    ) -> Option<i32> {
        // No internal pointers, just pass through directly
        with_collected_memory_1(segments, arg1, |mem, arg1| {
            wasi_snapshot_preview1::fd_fdstat_get(ctx, mem, arg0, arg1)
        })
    }

    #[allow(dead_code)]
    // fd_seek(fd: fd, offset: filedelta, whence: whence) -> Result<filesize, errno>
    pub(super) fn fd_seek(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: i32,
        arg1: i64,
        arg2: i32,
        arg3: Handle,
    ) -> Option<i32> {
        // No internal pointers, just pass through directly
        with_collected_memory_1(segments, arg3, |mem, arg3| {
            wasi_snapshot_preview1::fd_seek(ctx, mem, arg0, arg1, arg2, arg3)
        })
    }

    #[allow(dead_code)]
    // fd_write(fd: fd, iovs: ciovec_array) -> Result<size, errno>
    pub(super) fn fd_write(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        fd: i32,
        iovs_ptr: Handle,
        iovs_len: i32,
        nwritten: Handle,
    ) -> Option<i32> {
        let mut iovs: Vec<&[u8]> = vec![];
        for i in 0..iovs_len {
            let loc = read!(get_handle, segments, iovs_ptr.add(i * (8 + 8) + 0)?);
            let len = read!(read_mem_u32, segments, iovs_ptr.add(i * (8 + 8) + 8)?) as usize;
            if len == 0 {
                iovs.push(&[]);
            } else {
                iovs.push(read!(bytes, segments, loc, len));
            }
        }

        let nwritten_start: usize = 8 * iovs.len();
        let mem_iovs_data_start: usize = nwritten_start + 4;
        let mem_iovs_data_len: usize = iovs.iter().map(|x| x.len()).sum();

        let mut memory = vec![0u8; mem_iovs_data_start + mem_iovs_data_len + 4];
        {
            let mut start = mem_iovs_data_start as u32;
            for (i, iov) in iovs.into_iter().enumerate() {
                write_mem_u32(&mut memory, 8 * i + 0, start)?;
                write_mem_u32(&mut memory, 8 * i + 4, iov.len() as u32)?;
                memory[start as usize..start as usize + iov.len()].copy_from_slice(iov);
                start += iov.len() as u32;
            }
            assert_eq!(start as usize, mem_iovs_data_start + mem_iovs_data_len);
        }

        assert!(nwritten_start % 4 == 0, "nwritten_start must be 4-aligned");

        let res = wasi_snapshot_preview1::fd_write(
            ctx,
            &guest_mem_wrapper::GuestMemWrapper::from(&mut memory),
            fd,
            0,
            iovs_len,
            nwritten_start as i32,
        );

        let nwritten_res = read_mem_u32(&memory, nwritten_start)?;
        write!(write_mem_u32, segments, nwritten, nwritten_res);

        Some(res)
    }
}
