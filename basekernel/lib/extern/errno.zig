pub const addr_t = u32;
pub const struct_rtc_time = extern struct {
    second: u8,
    minute: u8,
    hour: u8,
    day: u8,
    month: u8,
    year: u16,
};
pub const struct_process_info = extern struct {
    pid: c_int,
    exitcode: c_int,
    exitreason: c_int,
};
pub const KOBJECT_FILE = 0;
pub const KOBJECT_DIR = 1;
pub const KOBJECT_DEVICE = 2;
pub const KOBJECT_GRAPHICS = 3;
pub const KOBJECT_PIPE = 4;
pub const KOBJECT_CONSOLE = 5;
pub const kobject_type_t = extern enum {
    KOBJECT_FILE = 0,
    KOBJECT_DIR = 1,
    KOBJECT_DEVICE = 2,
    KOBJECT_GRAPHICS = 3,
    KOBJECT_PIPE = 4,
    KOBJECT_CONSOLE = 5,
};
pub const KERROR_NOT_FOUND = -1;
pub const KERROR_INVALID_REQUEST = -2;
pub const KERROR_PERMISSION_DENIED = -3;
pub const KERROR_NOT_IMPLEMENTED = -4;
pub const KERROR_NOT_EXECUTABLE = -5;
pub const KERROR_EXECUTION_FAILED = -6;
pub const KERROR_NOT_A_DIRECTORY = -7;
pub const KERROR_NOT_A_FILE = -8;
pub const KERROR_NOT_A_WINDOW = -9;
pub const KERROR_NOT_A_DEVICE = -10;
pub const KERROR_NOT_A_CONSOLE = -11;
pub const KERROR_NOT_A_PIPE = -12;
pub const KERROR_INVALID_SYSCALL = -13;
pub const KERROR_INVALID_OBJECT = -14;
pub const KERROR_INVALID_ADDRESS = -15;
pub const KERROR_INVALID_PATH = -16;
pub const KERROR_INVALID_TAG = -17;
pub const KERROR_OUT_OF_MEMORY = -18;
pub const KERROR_OUT_OF_OBJECTS = -19;
pub const KERROR_OUT_OF_SPACE = -20;
pub const kernel_error_t = extern enum {
    KERROR_NOT_FOUND = -1,
    KERROR_INVALID_REQUEST = -2,
    KERROR_PERMISSION_DENIED = -3,
    KERROR_NOT_IMPLEMENTED = -4,
    KERROR_NOT_EXECUTABLE = -5,
    KERROR_EXECUTION_FAILED = -6,
    KERROR_NOT_A_DIRECTORY = -7,
    KERROR_NOT_A_FILE = -8,
    KERROR_NOT_A_WINDOW = -9,
    KERROR_NOT_A_DEVICE = -10,
    KERROR_NOT_A_CONSOLE = -11,
    KERROR_NOT_A_PIPE = -12,
    KERROR_INVALID_SYSCALL = -13,
    KERROR_INVALID_OBJECT = -14,
    KERROR_INVALID_ADDRESS = -15,
    KERROR_INVALID_PATH = -16,
    KERROR_INVALID_TAG = -17,
    KERROR_OUT_OF_MEMORY = -18,
    KERROR_OUT_OF_OBJECTS = -19,
    KERROR_OUT_OF_SPACE = -20,
};
pub extern fn strerror(err_code: kernel_error_t) ?[*]const u8;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const __FLT16_MAX_EXP__ = 15;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const __SIZEOF_FLOAT__ = 4;
pub const __INT64_FMTd__ = c"ld";
pub const __STDC_VERSION__ = c_long(201112);
pub const __INT_LEAST32_FMTi__ = c"i";
pub const __INT_LEAST8_FMTi__ = c"hhi";
pub const __LDBL_EPSILON__ = 0.000000;
pub const __INT_LEAST32_FMTd__ = c"d";
pub const __STDC_UTF_32__ = 1;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const __UINT_FAST64_FMTX__ = c"lX";
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __clang_version__ = c"7.0.0 (tags/RELEASE_700/final)";
pub const __UINT_LEAST8_FMTo__ = c"hho";
pub const __SIZEOF_DOUBLE__ = 8;
pub const __INTMAX_FMTd__ = c"ld";
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __INT_LEAST16_FMTi__ = c"hi";
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __MMX__ = 1;
pub const __SIZE_FMTX__ = c"lX";
pub const PAGE_MASK = 4294963200;
pub const __WCHAR_WIDTH__ = 32;
pub const __PTRDIFF_FMTd__ = c"ld";
pub const __DBL_MIN_EXP__ = -1021;
pub const __FLT_EVAL_METHOD__ = 0;
pub const __SSE_MATH__ = 1;
pub const __UINT_FAST8_FMTo__ = c"hho";
pub const __UINT_LEAST64_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_LEAST64_FMTx__ = c"lx";
pub const __INT8_MAX__ = 127;
pub const __DBL_HAS_DENORM__ = 1;
pub const __FLOAT128__ = 1;
pub const __FLT16_HAS_QUIET_NAN__ = 1;
pub const __ATOMIC_RELAXED = 0;
pub const __DBL_DECIMAL_DIG__ = 17;
pub const __SIZEOF_SHORT__ = 2;
pub const __UINT16_FMTX__ = c"hX";
pub const __UINT_FAST16_MAX__ = 65535;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const __WINT_MAX__ = c_uint(4294967295);
pub const __LDBL_MAX_EXP__ = 16384;
pub const __NO_MATH_INLINES = 1;
pub const __WCHAR_TYPE__ = int;
pub const __LONG_MAX__ = c_long(9223372036854775807);
pub const __STDC_HOSTED__ = 1;
pub const __INT_FAST16_FMTi__ = c"hi";
pub const __PTRDIFF_WIDTH__ = 64;
pub const __INT_LEAST32_TYPE__ = int;
pub const __SCHAR_MAX__ = 127;
pub const __LDBL_DENORM_MIN__ = 0.000000;
pub const __FLT16_MIN_EXP__ = -14;
pub const __INT64_C_SUFFIX__ = L;
pub const __ELF__ = 1;
pub const __LDBL_MANT_DIG__ = 64;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __UINT64_FMTX__ = c"lX";
pub const __UINT64_MAX__ = c_ulong(18446744073709551615);
pub const __DBL_MANT_DIG__ = 53;
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __DBL_DIG__ = 15;
pub const __ATOMIC_ACQUIRE = 2;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __FLT16_HAS_DENORM__ = 1;
pub const __UINT_FAST16_FMTu__ = c"hu";
pub const __INTPTR_FMTi__ = c"li";
pub const __UINT_FAST8_FMTX__ = c"hhX";
pub const __LITTLE_ENDIAN__ = 1;
pub const __SSE__ = 1;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __SIZEOF_SIZE_T__ = 8;
pub const __UINT_LEAST16_FMTo__ = c"ho";
pub const __UINT8_FMTo__ = c"hho";
pub const __UINT_LEAST16_FMTx__ = c"hx";
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __UINT_FAST16_FMTX__ = c"hX";
pub const __VERSION__ = c"4.2.1 Compatible Clang 7.0.0 (tags/RELEASE_700/final)";
pub const __UINT_FAST32_FMTx__ = c"x";
pub const __UINTPTR_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_FAST8_FMTu__ = c"hhu";
pub const __UINT_LEAST8_FMTu__ = c"hhu";
pub const __UINT_LEAST64_FMTo__ = c"lo";
pub const __UINT_LEAST8_MAX__ = 255;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const __LDBL_MAX__ = inf;
pub const __UINT16_MAX__ = 65535;
pub const _LP64 = 1;
pub const __x86_64 = 1;
pub const linux = 1;
pub const __SIZEOF_WINT_T__ = 4;
pub const __UINTMAX_FMTo__ = c"lo";
pub const __FLT_DIG__ = 6;
pub const __UINT_LEAST8_FMTX__ = c"hhX";
pub const __INT16_MAX__ = 32767;
pub const __WINT_UNSIGNED__ = 1;
pub const __FLT_MAX_10_EXP__ = 38;
pub const __UINTPTR_FMTX__ = c"lX";
pub const __UINT_LEAST16_FMTu__ = c"hu";
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __WINT_WIDTH__ = 32;
pub const __SHRT_MAX__ = 32767;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __POINTER_WIDTH__ = 64;
pub const __PTRDIFF_MAX__ = c_long(9223372036854775807);
pub const __INT32_FMTd__ = c"d";
pub const __FLT16_DIG__ = 3;
pub const __DBL_MIN__ = 0.000000;
pub const __SIZEOF_LONG__ = 8;
pub const __INTPTR_WIDTH__ = 64;
pub const __FLT16_MAX_10_EXP__ = 4;
pub const __INT_FAST32_TYPE__ = int;
pub const __NO_INLINE__ = 1;
pub const __UINT_FAST32_FMTX__ = c"X";
pub const __gnu_linux__ = 1;
pub const PAGE_BITS = 12;
pub const __INT_FAST32_MAX__ = 2147483647;
pub const __UINTMAX_FMTu__ = c"lu";
pub const __FLT_RADIX__ = 2;
pub const __FLT16_HAS_INFINITY__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const __FLT16_DECIMAL_DIG__ = 5;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const __INT_FAST8_FMTd__ = c"hhd";
pub const __INT32_TYPE__ = int;
pub const MAX_ARGV_LENGTH = 256;
pub const __UINTMAX_WIDTH__ = 64;
pub const __FLT_MIN__ = 0.000000;
pub const __INT64_FMTi__ = c"li";
pub const __UINT_FAST64_FMTu__ = c"lu";
pub const __INT8_FMTd__ = c"hhd";
pub const __INT_FAST16_TYPE__ = short;
pub const __FLT_MAX_EXP__ = 128;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __LDBL_MIN__ = 0.000000;
pub const __INT_FAST64_FMTi__ = c"li";
pub const __INT_LEAST8_FMTd__ = c"hhd";
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __UINT_LEAST32_FMTX__ = c"X";
pub const __UINTMAX_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_FAST16_FMTo__ = c"ho";
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __UINT_LEAST64_FMTX__ = c"lX";
pub const __clang_minor__ = 0;
pub const __SIZEOF_FLOAT128__ = 16;
pub const __UINT_FAST64_FMTo__ = c"lo";
pub const __SIZE_FMTx__ = c"lx";
pub const __DBL_MAX__ = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878;
pub const __DBL_EPSILON__ = 0.000000;
pub const __UINT64_FMTx__ = c"lx";
pub const __CHAR_BIT__ = 8;
pub const __INT16_FMTi__ = c"hi";
pub const _DEBUG = 1;
pub const __GNUC_MINOR__ = 2;
pub const __UINT_FAST32_MAX__ = c_uint(4294967295);
pub const __UINT8_FMTX__ = c"hhX";
pub const __FLT_EPSILON__ = 0.000000;
pub const __UINTPTR_WIDTH__ = 64;
pub const __llvm__ = 1;
pub const __UINT_FAST64_MAX__ = c_ulong(18446744073709551615);
pub const __INT_FAST32_FMTi__ = c"i";
pub const __FLT_HAS_INFINITY__ = 1;
pub const __k8 = 1;
pub const __UINT8_FMTx__ = c"hhx";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __INT16_FMTd__ = c"hd";
pub const __UINT32_FMTX__ = c"X";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const __UINT32_C_SUFFIX__ = U;
pub const __INT32_MAX__ = 2147483647;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __INTMAX_WIDTH__ = 64;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __SIZE_FMTo__ = c"lo";
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const __INT_FAST8_FMTi__ = c"hhi";
pub const __UINT_LEAST32_FMTo__ = c"o";
pub const __STDC_UTF_16__ = 1;
pub const __UINT_LEAST32_MAX__ = c_uint(4294967295);
pub const __ATOMIC_RELEASE = 3;
pub const __UINT_FAST16_FMTx__ = c"hx";
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __FLT_MIN_EXP__ = -125;
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const __UINT_LEAST64_FMTu__ = c"lu";
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __INT_FAST64_FMTd__ = c"ld";
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const __GXX_ABI_VERSION = 1002;
pub const __INT16_TYPE__ = short;
pub const __SSE2_MATH__ = 1;
pub const __FLT_MANT_DIG__ = 24;
pub const __UINT_FAST64_FMTx__ = c"lx";
pub const __STDC__ = 1;
pub const __INT_FAST8_MAX__ = 127;
pub const __INTPTR_FMTd__ = c"ld";
pub const __GNUC_PATCHLEVEL__ = 1;
pub const __SIZE_WIDTH__ = 64;
pub const __UINT_LEAST8_FMTx__ = c"hhx";
pub const __INT_LEAST64_FMTi__ = c"li";
pub const __INT_FAST16_MAX__ = 32767;
pub const __INTPTR_MAX__ = c_long(9223372036854775807);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __UINT64_FMTu__ = c"lu";
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __SSE2__ = 1;
pub const __INT_MAX__ = 2147483647;
pub const __INTMAX_FMTi__ = c"li";
pub const __DBL_DENORM_MIN__ = 0.000000;
pub const __clang_major__ = 7;
pub const __FLT16_MANT_DIG__ = 11;
pub const __GNUC__ = 4;
pub const __UINT32_MAX__ = c_uint(4294967295);
pub const __FLT_DENORM_MIN__ = 0.000000;
pub const __DBL_MAX_EXP__ = 1024;
pub const __INT8_FMTi__ = c"hhi";
pub const __UINT_LEAST16_MAX__ = 65535;
pub const __LDBL_HAS_DENORM__ = 1;
pub const __FLT16_MIN_10_EXP__ = -13;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const __UINT_FAST8_MAX__ = 255;
pub const __DBL_MIN_10_EXP__ = -307;
pub const __UINT8_FMTu__ = c"hhu";
pub const __INT_FAST64_MAX__ = c_long(9223372036854775807);
pub const __UINT16_FMTu__ = c"hu";
pub const __ATOMIC_SEQ_CST = 5;
pub const __SIZE_FMTu__ = c"lu";
pub const __LDBL_MIN_EXP__ = -16381;
pub const __UINT_FAST32_FMTu__ = c"u";
pub const __clang_patchlevel__ = 0;
pub const MEGA = if (@typeId(@typeOf(KILO)) == @import("builtin").TypeId.Pointer) @ptrCast([*]KILO, KILO) else if (@typeId(@typeOf(KILO)) == @import("builtin").TypeId.Int) @intToPtr([*]KILO, KILO) else ([*]KILO)(KILO);
pub const __SIZEOF_LONG_LONG__ = 8;
pub const __GNUC_STDC_INLINE__ = 1;
pub const __FXSR__ = 1;
pub const __UINT8_MAX__ = 255;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const __UINT32_FMTx__ = c"x";
pub const __UINT16_FMTo__ = c"ho";
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __UINT32_FMTu__ = c"u";
pub const __SIZEOF_POINTER__ = 8;
pub const __SIZE_MAX__ = c_ulong(18446744073709551615);
pub const __unix = 1;
pub const __INT_FAST16_FMTd__ = c"hd";
pub const unix = 1;
pub const __UINT_LEAST32_FMTu__ = c"u";
pub const __FLT_MAX__ = 340282346999999984391321947108527833088.000000;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __k8__ = 1;
pub const __ATOMIC_CONSUME = 1;
pub const __tune_k8__ = 1;
pub const __unix__ = 1;
pub const __x86_64__ = 1;
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __UINTMAX_FMTx__ = c"lx";
pub const __UINT64_C_SUFFIX__ = UL;
pub const __FLT_MIN_10_EXP__ = -37;
pub const __INT_LEAST16_MAX__ = 32767;
pub const __UINT32_FMTo__ = c"o";
pub const __UINTPTR_FMTo__ = c"lo";
pub const __INT_LEAST16_FMTd__ = c"hd";
pub const __UINTPTR_FMTx__ = c"lx";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const __INT_LEAST64_FMTd__ = c"ld";
pub const __INT_LEAST16_TYPE__ = short;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const __INT_LEAST8_MAX__ = 127;
pub const PAGE_SIZE = 4096;
pub const __SIZEOF_INT__ = 4;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __amd64 = 1;
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __SIZEOF_INT128__ = 16;
pub const __UINT_FAST8_FMTx__ = c"hhx";
pub const __linux = 1;
pub const __UINT16_FMTx__ = c"hx";
pub const __UINTPTR_FMTu__ = c"lu";
pub const __UINT_LEAST16_FMTX__ = c"hX";
pub const __amd64__ = 1;
pub const __UINT_FAST32_FMTo__ = c"o";
pub const __linux__ = 1;
pub const __clang__ = 1;
pub const __LP64__ = 1;
pub const __PTRDIFF_FMTi__ = c"li";
pub const __LDBL_DIG__ = 18;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __UINT64_FMTo__ = c"lo";
pub const __INT_FAST32_FMTd__ = c"d";
pub const __ATOMIC_ACQ_REL = 4;
pub const __LONG_LONG_MAX__ = c_longlong(9223372036854775807);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const __INTMAX_MAX__ = c_long(9223372036854775807);
pub const __UINT_LEAST32_FMTx__ = c"x";
pub const __WCHAR_MAX__ = 2147483647;
pub const __INT64_MAX__ = c_long(9223372036854775807);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __INT_LEAST64_MAX__ = c_long(9223372036854775807);
pub const KILO = 1024;
pub const __UINTMAX_FMTX__ = c"lX";
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const __FLT_HAS_DENORM__ = 1;
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __INT32_FMTi__ = c"i";
pub const __DBL_HAS_INFINITY__ = 1;
pub const __FINITE_MATH_ONLY__ = 0;
pub const rtc_time = struct_rtc_time;
pub const process_info = struct_process_info;
