const malloc = @import("./extern/malloc.zig");
const string = @import("./extern/string.zig");
const syscalls = @import("./extern/syscalls.zig");

const errors = @import("./errors.zig");

pub fn exists(path: [*]const u8) bool {
    const fd = syscalls.syscall_open_file(path,0,0);
    return syscalls.syscall_valid_object(fd) != 0;
}

pub fn open(path: [*]const u8) c_int {
    var fd = syscalls.syscall_open_file(path,0,0);
    if(syscalls.syscall_valid_object(fd) == 0){
        string.printf(c"Error\n");
    }
    return fd;
}

pub fn read(fd: c_int) ?[*]u8 {
    var str: ?[*]u8 = @ptrCast([*]u8,&"");
    var buffer = malloc.malloc(1024);
    var n: c_int = 1;
    while(n > 0){
        var ptr = @ptrCast([*]const u8,buffer);
        str = string.strcat(str,ptr);
        n = syscalls.syscall_object_read(fd,buffer,1024);
    }
    malloc.free(buffer);
    return str;
}