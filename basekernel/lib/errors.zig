const exit = @import("./extern/syscalls.zig").syscall_process_exit;

const print = @import("./extern/string.zig").printf;

pub const Error = struct {
    code: u8,
    e_type: ?[*] const u8,
    e_message: ?[*] const u8,
};

pub fn _error(e: Error) void {
    print(c"Error: [%s]\n%s\n\n",e.e_type,e.e_message);
    exit(e.code);
}