// Adapted from: https://github.com/WebAssembly/wabt/blob/9062142584eb4c753e4af8b1cf9ac2a80348fcaa/wasm2c/wasm-rt.h

#ifndef WASM_RT_H_
#define WASM_RT_H_

#include <string.h>  // memcpy
#include <stdint.h>  // *_t types
#include <math.h>    // wasm arithmetic
#include <assert.h>  // debug assertions
#include <stdio.h>   // printing error messages
#include <stdlib.h>  // needed for malloc

// includes for WASI
#include <errno.h>
#include <fcntl.h>
#include <time.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdalign.h>

// cheri headers
// #include "cheri.h"
#include "cheriintrin.h"


#ifdef __cplusplus
extern "C" {
#endif

// Type alias Wasm types -> C types to make code generation prettier
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

typedef int8_t i8;
typedef int16_t i16;
typedef int32_t i32;
typedef int64_t i64;

typedef float f32;
typedef double f64;

// Handle is caps to match the rust version of the type
// TODO: explicitly declare as capability for compatibility with hybrid code
typedef void* Handle; 


// typedef void* WasiCtx; 


// remove reliance on stdbool.h
const i32 true = 1;
const i32 false = 0;

//enum wasm_t{u32_t, u64_t, i32_t, i64_t, f32_t, f64_t, handle_t};
union TaggedVal { // WasmVal
    u32 as_u32;
    u64 as_u64;
    i32 as_i32;
    i64 as_i64;
    f32 as_f32;
    f64 as_f64;
    //Handle as_Handle;
} TaggedVal;

// #define DEFINE_TAGGED_VAL_FROM(ty)                \
//     (TaggedVal){ .as_##ty = val }         


// Sanity checks
static_assert((sizeof(u8) == 1), "u8 is the wrong size!");
static_assert((sizeof(u16) == 2), "u16 is the wrong size!");
static_assert((sizeof(u32) == 4), "u32 is the wrong size!");
static_assert((sizeof(u64) == 8), "u64 is the wrong size!");
static_assert((sizeof(i8) == 1), "i8 is the wrong size!");
static_assert((sizeof(i16) == 2), "i16 is the wrong size!");
static_assert((sizeof(i32) == 4), "i32 is the wrong size!");
static_assert((sizeof(i64) == 8), "u64 is the wrong size!");
static_assert((sizeof(f32) == 4), "f32 is the wrong size!");
static_assert((sizeof(f64) == 8), "f64 is the wrong size!");
static_assert((sizeof(TaggedVal) == 8), "On cheri machines, TaggedVal size should be 16 bytes");


// TODO: what is the official way to check if this toolchain supports cheri?
#ifdef cheri_offset_get
static_assert((sizeof(Handle) == 16), "On cheri machines, pointer size should be 16 bytes");

#else 
static_assert((sizeof(Handle) == 8), "On non-cheri machines, pointer size should be 8 bytes (sorry 32-bit machines)");

// Dynamically fail if we run mswasm-cheri on a non-mswasm machine
// TODO: I shoul probably make a config option to fail statically or dynamically
u64 cheri_offset_get(Handle h) {
    assert(false); // 
}
#endif


// struct TaggedVal {
//     wasm_t tag;
//     WasmValue v;
// }

// #define DEFINE_TAGGED_VAL_FROM(ty)                  \
//   static inline union TaggedVal from_##ty(ty val) { \
//     union TaggedVal r;                              \
//     r.as_##ty = val;                                \
//     return r;                                       \
//   }
#define DEFINE_TAGGED_VAL_FROM(ty)                  \
  static inline union TaggedVal from_##ty(ty val) { \
    union TaggedVal r = { .as_##ty = val };         \
    return r;                                       \
  }

// #define DEFINE_TAGGED_VAL_TO(ty)                  \
//   static inline ty to_##ty(TaggedVal tv) {        \
//         assert!(tv.tag == ty##_t);                \
//         tv.as_##ty                                \
//   }

DEFINE_TAGGED_VAL_FROM(u32);
DEFINE_TAGGED_VAL_FROM(u64);
DEFINE_TAGGED_VAL_FROM(i32);
DEFINE_TAGGED_VAL_FROM(i64);
DEFINE_TAGGED_VAL_FROM(f32);
DEFINE_TAGGED_VAL_FROM(f64);
// DEFINE_TAGGED_VAL_FROM(Handle);

// DEFINE_TAGGED_VAL_TO(u32);
// DEFINE_TAGGED_VAL_TO(u64);
// DEFINE_TAGGED_VAL_TO(i32);
// DEFINE_TAGGED_VAL_TO(i64);
// DEFINE_TAGGED_VAL_TO(f32);
// DEFINE_TAGGED_VAL_TO(f64);
// DEFINE_TAGGED_VAL_TO(handle);



#ifndef __has_builtin
#define __has_builtin(x) 0  // Compatibility with non-clang compilers.
#endif

#if __has_builtin(__builtin_expect)
#define UNLIKELY(x) __builtin_expect(!!(x), 0)
#define LIKELY(x) __builtin_expect(!!(x), 1)
#else
#define UNLIKELY(x) (x)
#define LIKELY(x) (x)
#endif

#if __has_builtin(__builtin_memcpy)
#define wasm_rt_memcpy __builtin_memcpy
#else
#define wasm_rt_memcpy memcpy
#endif

#define WASM_RT_NO_RETURN __attribute__((noreturn))


/** Reason a trap occurred. Provide this to `wasm_rt_trap`. */
typedef enum {
  WASM_RT_TRAP_NONE,         /** No error. */
  WASM_RT_TRAP_OOB,          /** Out-of-bounds access in linear memory. */
  WASM_RT_TRAP_INT_OVERFLOW, /** Integer overflow on divide or truncation. */
  WASM_RT_TRAP_DIV_BY_ZERO,  /** Integer divide by zero. */
  WASM_RT_TRAP_INVALID_CONVERSION, /** Conversion from NaN to integer. */
  WASM_RT_TRAP_UNREACHABLE,        /** Unreachable instruction executed. */
  WASM_RT_TRAP_CALL_INDIRECT,      /** Invalid call_indirect, for any reason. */
  WASM_RT_TRAP_EXHAUSTION,         /** Call stack exhausted. */
} wasm_rt_trap_t;




#define TRAP(x) (wasm_rt_trap(WASM_RT_TRAP_##x), 0)

#define UNREACHABLE TRAP(UNREACHABLE)

// Since the indirect_call_table is a capability, we can elide the usual bounds check on it
// currently just checks that the indirect_call_table is non-null
// TODO: add func type check back in
#define CALL_INDIRECT(table, t, ft, x, ...)          \
       ((t)table[x])(ctx, __VA_ARGS__)

// #define RANGE_CHECK(mem, offset, len) \
//   if (UNLIKELY(offset + (uint64_t)len > mem->size)) TRAP(OOB)

// if WASM_RT_MEMCHECK_SIGNAL_HANDLER
#define MEMCHECK(mem, a, t)
// #else
// #define MEMCHECK(mem, a, t) RANGE_CHECK(mem, a, sizeof(t))
// #endif


const char* wasm_rt_strerror(wasm_rt_trap_t trap) {
  switch (trap) {
    case WASM_RT_TRAP_NONE:
      return "No error";
    case WASM_RT_TRAP_OOB:
      return "Out-of-bounds access in linear memory";
    case WASM_RT_TRAP_EXHAUSTION:
      return "Call stack exhausted";
    case WASM_RT_TRAP_INT_OVERFLOW:
      return "Integer overflow on divide or truncation";
    case WASM_RT_TRAP_DIV_BY_ZERO:
      return "Integer divide by zero";
    case WASM_RT_TRAP_INVALID_CONVERSION:
      return "Conversion from NaN to integer";
    case WASM_RT_TRAP_UNREACHABLE:
      return "Unreachable instruction executed";
    case WASM_RT_TRAP_CALL_INDIRECT:
      return "Invalid call_indirect";
  }
  return "invalid trap code";
}


// TODO: write a longjmp based trap function so that we can recover from crashes?
// Print the trap and then crash
void wasm_rt_trap(wasm_rt_trap_t trap) {
  printf("%s\n",wasm_rt_strerror(trap));
  assert(false);
}


void rwasm_assert(int b, char* msg) {
  if (b == false) {
    printf(" RWASM_ASSERT FAILURE: %s\n", msg);
    abort();
  }
}

Handle rwasm_alloc(size_t size) {
  return calloc(size, 1);
}

// static inline void load_data(void *dest, const void *src, size_t n) {
//   memcpy(dest, src, n);
// }
// #define LOAD_DATA(m, o, i, s) do { \
//     RANGE_CHECK((&m), o, s); \
//     load_data(&(m.data[o]), i, s); \
//   } while (0)

#define DEFINE_LOAD(name, t1, t2, t3)             \
  static inline t3 name(Handle addr) {            \
    t1 result;                                    \
    rwasm_assert(alignof(Handle) == 16 && (uintptr_t)addr % alignof(t1) == 0, "load" );             \
    __builtin_assume_aligned(addr, alignof(t1) * 8);          \
    wasm_rt_memcpy(&result, addr, sizeof(t1));    \
    return (t3)(t2)result;                        \
  }

#define DEFINE_STORE(name, t1, t2)                  \
  static inline void name(Handle addr, t2 value) {  \
    t1 wrapped = (t1)value;                         \
    rwasm_assert(alignof(Handle) == 16 && (uintptr_t)addr % alignof(t1) == 0, "store" );             \
    __builtin_assume_aligned(addr, alignof(t1) * 8);            \
    wasm_rt_memcpy(addr, &wrapped, sizeof(t1));     \
  }



// #define DEFINE_LOAD(name, t1, t2, t3)      \
//   static inline t3 name(Handle addr) {     \
//     t1 result = *((t1*) addr);             \
//     return (t3)(t2)result;                 \
//   }

// #define DEFINE_STORE(name, t1, t2)                  \
//   static inline void name(Handle addr, t2 value) {  \
//     t1 wrapped = (t1)value;                         \
//     *((t1*) addr) = wrapped;                        \
//   }




// name, load_type, intermediate, return type 
DEFINE_LOAD(i32_load, u32, u32, u32)
DEFINE_LOAD(i64_load, u64, u64, u64)
DEFINE_LOAD(f32_load, f32, f32, f32)
DEFINE_LOAD(f64_load, f64, f64, f64)
DEFINE_LOAD(i32_load8_i, i8, i32, u32)
DEFINE_LOAD(i64_load8_i, i8, i64, u64)
DEFINE_LOAD(i32_load8_u, u8, u32, u32)
DEFINE_LOAD(i64_load8_u, u8, u64, u64)
DEFINE_LOAD(i32_load16_i, i16, i32, u32)
DEFINE_LOAD(i64_load16_i, i16, i64, u64)
DEFINE_LOAD(i32_load16_u, u16, u32, u32)
DEFINE_LOAD(i64_load16_u, u16, u64, u64)
DEFINE_LOAD(i64_load32_i, i32, i64, u64)
DEFINE_LOAD(i64_load32_u, u32, u64, u64)
// Cheri-specific load. Uses naive passthrough design.
DEFINE_LOAD(handle_load, Handle, Handle, Handle)

// name, value type, arg type
DEFINE_STORE(i32_store, u32, u32)
DEFINE_STORE(i64_store, u64, u64)
DEFINE_STORE(f32_store, f32, f32)
DEFINE_STORE(f64_store, f64, f64)
DEFINE_STORE(i32_store8, u8, u32)
DEFINE_STORE(i32_store16, u16, u32)
DEFINE_STORE(i64_store8, u8, u64)
DEFINE_STORE(i64_store16, u16, u64)
DEFINE_STORE(i64_store32, u32, u64)
// Cheri-specific store. Uses naive passthrough design.
DEFINE_STORE(handle_store, Handle, Handle)

#define I32_CLZ(x) ((x) ? __builtin_clz(x) : 32)
#define I64_CLZ(x) ((x) ? __builtin_clzll(x) : 64)
#define I32_CTZ(x) ((x) ? __builtin_ctz(x) : 32)
#define I64_CTZ(x) ((x) ? __builtin_ctzll(x) : 64)
#define I32_POPCNT(x) (__builtin_popcount(x))
#define I64_POPCNT(x) (__builtin_popcountll(x))

#define DIV_S(ut, min, x, y)                                 \
   ((UNLIKELY((y) == 0)) ?                TRAP(DIV_BY_ZERO)  \
  : (UNLIKELY((x) == min && (y) == -1)) ? TRAP(INT_OVERFLOW) \
  : (ut)((x) / (y)))

#define REM_S(ut, min, x, y)                                \
   ((UNLIKELY((y) == 0)) ?                TRAP(DIV_BY_ZERO) \
  : (UNLIKELY((x) == min && (y) == -1)) ? 0                 \
  : (ut)((x) % (y)))

#define I32_DIV_S(x, y) DIV_S(u32, INT32_MIN, (i32)x, (i32)y)
#define I64_DIV_S(x, y) DIV_S(u64, INT64_MIN, (i64)x, (i64)y)
#define I32_REM_S(x, y) REM_S(u32, INT32_MIN, (i32)x, (i32)y)
#define I64_REM_S(x, y) REM_S(u64, INT64_MIN, (i64)x, (i64)y)

#define DIVREM_U(op, x, y) \
  ((UNLIKELY((y) == 0)) ? TRAP(DIV_BY_ZERO) : ((x) op (y)))

#define DIV_U(x, y) DIVREM_U(/, x, y)
#define REM_U(x, y) DIVREM_U(%, x, y)

#define ROTL(x, y, mask) \
  (((x) << ((y) & (mask))) | ((x) >> (((mask) - (y) + 1) & (mask))))
#define ROTR(x, y, mask) \
  (((x) >> ((y) & (mask))) | ((x) << (((mask) - (y) + 1) & (mask))))

#define I32_ROTL(x, y) ROTL(x, y, 31)
#define I64_ROTL(x, y) ROTL(x, y, 63)
#define I32_ROTR(x, y) ROTR(x, y, 31)
#define I64_ROTR(x, y) ROTR(x, y, 63)

#define FMIN(x, y)                                          \
   ((UNLIKELY((x) != (x))) ? NAN                            \
  : (UNLIKELY((y) != (y))) ? NAN                            \
  : (UNLIKELY((x) == 0 && (y) == 0)) ? (signbit(x) ? x : y) \
  : (x < y) ? x : y)

#define FMAX(x, y)                                          \
   ((UNLIKELY((x) != (x))) ? NAN                            \
  : (UNLIKELY((y) != (y))) ? NAN                            \
  : (UNLIKELY((x) == 0 && (y) == 0)) ? (signbit(x) ? y : x) \
  : (x > y) ? x : y)

#define TRUNC_S(ut, st, ft, min, minop, max, x)                             \
  ((UNLIKELY((x) != (x)))                        ? TRAP(INVALID_CONVERSION) \
   : (UNLIKELY(!((x)minop(min) && (x) < (max)))) ? TRAP(INT_OVERFLOW)       \
                                                 : (ut)(st)(x))

#define I32_TRUNC_S_F32(x) TRUNC_S(u32, i32, f32, (f32)INT32_MIN, >=, 2147483648.f, x)
#define I64_TRUNC_S_F32(x) TRUNC_S(u64, i64, f32, (f32)INT64_MIN, >=, (f32)INT64_MAX, x)
#define I32_TRUNC_S_F64(x) TRUNC_S(u32, i32, f64, -2147483649., >, 2147483648., x)
#define I64_TRUNC_S_F64(x) TRUNC_S(u64, i64, f64, (f64)INT64_MIN, >=, (f64)INT64_MAX, x)

#define TRUNC_U(ut, ft, max, x)                                            \
  ((UNLIKELY((x) != (x)))                       ? TRAP(INVALID_CONVERSION) \
   : (UNLIKELY(!((x) > (ft)-1 && (x) < (max)))) ? TRAP(INT_OVERFLOW)       \
                                                : (ut)(x))

#define I32_TRUNC_U_F32(x) TRUNC_U(u32, f32, 4294967296.f, x)
#define I64_TRUNC_U_F32(x) TRUNC_U(u64, f32, (f32)UINT64_MAX, x)
#define I32_TRUNC_U_F64(x) TRUNC_U(u32, f64, 4294967296.,  x)
#define I64_TRUNC_U_F64(x) TRUNC_U(u64, f64, (f64)UINT64_MAX, x)

#define TRUNC_SAT_S(ut, st, ft, min, smin, minop, max, smax, x) \
  ((UNLIKELY((x) != (x)))         ? 0                           \
   : (UNLIKELY(!((x)minop(min)))) ? smin                        \
   : (UNLIKELY(!((x) < (max))))   ? smax                        \
                                  : (ut)(st)(x))

#define I32_TRUNC_SAT_S_F32(x) TRUNC_SAT_S(u32, i32, f32, (f32)INT32_MIN, INT32_MIN, >=, 2147483648.f, INT32_MAX, x)
#define I64_TRUNC_SAT_S_F32(x) TRUNC_SAT_S(u64, i64, f32, (f32)INT64_MIN, INT64_MIN, >=, (f32)INT64_MAX, INT64_MAX, x)
#define I32_TRUNC_SAT_S_F64(x) TRUNC_SAT_S(u32, i32, f64, -2147483649., INT32_MIN, >, 2147483648., INT32_MAX, x)
#define I64_TRUNC_SAT_S_F64(x) TRUNC_SAT_S(u64, i64, f64, (f64)INT64_MIN, INT64_MIN, >=, (f64)INT64_MAX, INT64_MAX, x)

#define TRUNC_SAT_U(ut, ft, max, smax, x) \
  ((UNLIKELY((x) != (x)))        ? 0      \
   : (UNLIKELY(!((x) > (ft)-1))) ? 0      \
   : (UNLIKELY(!((x) < (max))))  ? smax   \
                                 : (ut)(x))

#define I32_TRUNC_SAT_U_F32(x) TRUNC_SAT_U(u32, f32, 4294967296.f, UINT32_MAX, x)
#define I64_TRUNC_SAT_U_F32(x) TRUNC_SAT_U(u64, f32, (f32)UINT64_MAX, UINT64_MAX, x)
#define I32_TRUNC_SAT_U_F64(x) TRUNC_SAT_U(u32, f64, 4294967296., UINT32_MAX,  x)
#define I64_TRUNC_SAT_U_F64(x) TRUNC_SAT_U(u64, f64, (f64)UINT64_MAX, UINT64_MAX, x)

#define DEFINE_REINTERPRET(name, t1, t2)  \
  static inline t2 name(t1 x) {           \
    t2 result;                            \
    memcpy(&result, &x, sizeof(result));  \
    return result;                        \
  }

DEFINE_REINTERPRET(f32_reinterpret_i32, u32, f32)
DEFINE_REINTERPRET(i32_reinterpret_f32, f32, u32)
DEFINE_REINTERPRET(f64_reinterpret_i64, u64, f64)
DEFINE_REINTERPRET(i64_reinterpret_f64, f64, u64)


/**
 * Stop execution immediately and jump back to the call to `wasm_rt_try`.
 * The result of `wasm_rt_try` will be the provided trap reason.
 *
 * This is typically called by the generated code, and not the embedder.
 */
WASM_RT_NO_RETURN void wasm_rt_trap(wasm_rt_trap_t);

/**
 * Return a human readable error string based on a trap type.
 */
const char* wasm_rt_strerror(wasm_rt_trap_t trap);




#define WASI_MAX_FDS 32
typedef struct WasiCtx {
  i32 main_argc;
  Handle main_argv;

  i32 wasm_fd_to_native[WASI_MAX_FDS];
  i32 next_wasm_fd;

} WasiCtx;


