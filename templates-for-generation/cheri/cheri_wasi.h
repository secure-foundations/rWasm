// adapted from https://raw.githubusercontent.com/PLSysSec/wasm2c_sandbox_compiler/main/wasm2c/wasm-rt-wasi.c
// This file is appended to the end of the prologue

// Wasi implementation
// TODO: full cheri-wasi implementation

#ifdef VERBOSE_LOGGING
#define VERBOSE_LOG(...) \
  { printf(__VA_ARGS__); }
#else
#define VERBOSE_LOG(...)
#endif

// Generic abort method for a runtime error in the runtime.
static void abort_with_message(const char* message) {
  fprintf(stderr, "%s\n", message);
  TRAP(UNREACHABLE);
}

#define WASM_STDIN 0
#define WASM_STDOUT 1
#define WASM_STDERR 2

static void init_fds(WasiCtx* wasi_ctx) {
  wasi_ctx->wasm_fd_to_native[WASM_STDIN] = STDIN_FILENO;
  wasi_ctx->wasm_fd_to_native[WASM_STDOUT] = STDOUT_FILENO;
  wasi_ctx->wasm_fd_to_native[WASM_STDERR] = STDERR_FILENO;
  wasi_ctx->next_wasm_fd = 3;
}

static u32 get_or_allocate_wasm_fd(WasiCtx* wasi_ctx, int nfd) {
  // If the native fd is already mapped, return the same wasm fd for it.
  for (uint32_t i = 0; i < wasi_ctx->next_wasm_fd; i++) {
    if (wasi_ctx->wasm_fd_to_native[i] == nfd) {
      return i;
    }
  }
  u32 fd = wasi_ctx->next_wasm_fd;
  if (fd >= WASI_MAX_FDS) {
    abort_with_message("ran out of fds");
  }
  wasi_ctx->wasm_fd_to_native[fd] = nfd;
  wasi_ctx->next_wasm_fd++;
  return fd;
}

static int get_native_fd(WasiCtx* wasi_ctx, u32 fd) {
  if (fd >= WASI_MAX_FDS || fd >= wasi_ctx->next_wasm_fd) {
    return -1;
  }
  return wasi_ctx->wasm_fd_to_native[fd];
}


WasiCtx* new_wasi_ctx(i32 argc, Handle argv){
  WasiCtx* ctx = malloc(sizeof(WasiCtx));
  ctx->main_argc = argc;
  ctx->main_argv = argv;

  memset(ctx->wasm_fd_to_native, -1, sizeof(i32[WASI_MAX_FDS]));
  init_fds(ctx);
  return ctx;
}



// Bad file descriptor.
#define WASI_BADF_ERROR 8
// Invalid argument
#define WASI_INVAL_ERROR 28
// Operation not permitted.
#define WASI_PERM_ERROR 63
#define WASI_DEFAULT_ERROR WASI_PERM_ERROR



i32 __cheri_args_get(WasmModule* ctx, Handle argv, Handle argv_buf) {
  u32 buf_size = 0;
  for (u32 i = 0; i < ctx->wasi_ctx->main_argc; i++) {
    Handle ptr = argv_buf + buf_size;
    handle_store(argv + i * 16, ptr);

    Handle arg = ((Handle*)(ctx->wasi_ctx->main_argv))[i];
    u32 len = strlen(arg) + 1;

    memcpy(ptr, arg, len);
    // make sure string is null terminated
    i32_store8(ptr + (len - 1), 0);
    buf_size += len;
  }
  return 0;
}

i32 __cheri_args_sizes_get(WasmModule* ctx, Handle pargc, Handle pargv_buf_size) {
  i32_store(pargc, ctx->wasi_ctx->main_argc);
  u32 buf_size = 0;
  for (u32 i = 0; i < ctx->wasi_ctx->main_argc; i++) {
    buf_size += strlen(((Handle*)ctx->wasi_ctx->main_argv)[i]) + 1;
  }
  i32_store(pargv_buf_size, buf_size);
  return 0;
}

/////////////////////////////////////////////////////////////
////////// File operations
/////////////////////////////////////////////////////////////

i32 __cheri_fd_write(WasmModule* ctx, i32 fd, Handle iov, i32 iovcnt, Handle nwritten) {
  int nfd = get_native_fd(ctx->wasi_ctx, fd);
  VERBOSE_LOG("  fd_write wasm %d => native %d\n", fd, nfd);
  if (nfd < 0) {
    return WASI_DEFAULT_ERROR;
  }

  u32 num = 0;
  for (u32 i = 0; i < iovcnt; i++) {
    Handle ptr = handle_load(iov + i * 32);
    u32 len = i32_load(iov + i * 32 + 16);
    VERBOSE_LOG("    chunk %d %d\n", ptr, len);

    ssize_t result;
    // Use stdio for stdout/stderr to avoid mixing a low-level write() with
    // other logging code, which can change the order from the expected.
    if (fd == WASM_STDOUT) {
      result = fwrite(ptr, 1, len, stdout);
    } else if (fd == WASM_STDERR) {
      result = fwrite(ptr, 1, len, stderr);
    } else {
      result = write(nfd, ptr, len);
    }
    if (result < 0) {
      VERBOSE_LOG("    error, %d %s\n", errno, strerror(errno));
      return WASI_DEFAULT_ERROR;
    }
    if ((size_t)result != len) {
      VERBOSE_LOG("    amount error, %ld %d\n", result, len);
      return WASI_DEFAULT_ERROR;
    }
    num += len;
  }
  VERBOSE_LOG("    success: %d\n", num);
  i32_store(nwritten, num);
  return 0;
}

i32 __cheri_fd_close(WasmModule* ctx, i32 fd) {
  int nfd = get_native_fd(ctx->wasi_ctx, fd);
  VERBOSE_LOG("  close wasm %d => native %d\n", fd, nfd);
  if (nfd < 0) {
    return WASI_DEFAULT_ERROR;
  }
  // For additional safety don't allow seeking on the input, output and error
  // streams
  if (nfd == WASM_STDOUT || nfd == WASM_STDERR || nfd == WASM_STDIN) {
    return WASI_DEFAULT_ERROR;
  }
  close(nfd);
  return 0;
}

static int whence_to_native(u32 whence) {
  if (whence == 0)
    return SEEK_SET;
  if (whence == 1)
    return SEEK_CUR;
  if (whence == 2)
    return SEEK_END;
  return -1;
}

i32 __cheri_fd_seek(WasmModule* ctx, i32 fd, i64 offset, i32 whence, Handle new_offset) {
  int nfd = get_native_fd(ctx->wasi_ctx, fd);
  int nwhence = whence_to_native(whence);
  VERBOSE_LOG("  seek %d (=> native %d) %ld %d (=> %d) %d\n", fd, nfd, offset,
              whence, nwhence, new_offset);
  if (nfd < 0) {
    return WASI_DEFAULT_ERROR;
  }

  // For additional safety don't allow seeking on the input, output and error
  // streams
  if (nfd == WASM_STDOUT || nfd == WASM_STDERR || nfd == WASM_STDIN) {
    return WASI_DEFAULT_ERROR;
  }

  off_t off = lseek(nfd, offset, nwhence);
  VERBOSE_LOG("    off: %ld\n", off);
  if (off == (off_t)-1) {
    VERBOSE_LOG("    error, %d %s\n", errno, strerror(errno));
    return WASI_DEFAULT_ERROR;
  }
  i64_store(new_offset, off);
  return 0;
}

/////////////////////////////////////////////////////////////
////////// Clock operations
/////////////////////////////////////////////////////////////

#define WASM_CLOCK_REALTIME 0
#define WASM_CLOCK_MONOTONIC 1
#define WASM_CLOCK_PROCESS_CPUTIME 2
#define WASM_CLOCK_THREAD_CPUTIME_ID 3

static int check_clock(u32 clock_id) {
  return clock_id == WASM_CLOCK_REALTIME || clock_id == WASM_CLOCK_MONOTONIC ||
         clock_id == WASM_CLOCK_PROCESS_CPUTIME ||
         clock_id == WASM_CLOCK_THREAD_CPUTIME_ID;
}

// out is a pointer to a u64 timestamp in nanoseconds
// https://github.com/WebAssembly/WASI/blob/main/phases/snapshot/docs.md#-timestamp-u64
i32 __cheri_clock_time_get(WasmModule* ctx, i32 clock_id, i64 precision, Handle out) {
  if (!check_clock(clock_id)) {
    return WASI_INVAL_ERROR;
  }

  struct timespec out_struct;
    i32 ret = clock_gettime(clock_id, &out_struct);
  u64 result =
      ((u64)out_struct.tv_sec) * 1000 * 1000 * 1000 + ((u64)out_struct.tv_nsec);
  i64_store(out, result);
  return ret;
}

i32 __cheri_fd_fdstat_get(WasmModule* ctx, i32 fd, Handle stat_ptr){
  struct stat buffer;
  i32 nfd = get_native_fd(ctx->wasi_ctx, fd);
  fstat(nfd, &buffer); // TODO: check this result
  i16 filetype = buffer.st_mode;
  i32 mode_flags = fcntl(nfd, F_GETFL, 0);

  // https://github.com/WebAssembly/WASI/blob/main/phases/snapshot/docs.md#fdstat
  i32_store16(stat_ptr, filetype);
  i32_store16(stat_ptr + 2, mode_flags);
  i64_store(stat_ptr + 8, 0); // no caps
  i64_store(stat_ptr + 16, 0xffffffffffffffff);

  return 0;
}
