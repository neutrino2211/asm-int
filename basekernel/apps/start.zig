const lib = @import("../lib/index.zig");
const ioports = @import("../lib/extern/ioports.zig");
const outb = ioports.outb;
const inb = ioports.inb;
const fs = lib.fs;
const io = lib.string;
const syscalls = lib.syscalls;
const close = syscalls.syscall_object_close;

fn play_sound(nFrequence: u32) void {
    // var Div: u32 = undefined;
    var tmp: u8 = undefined;

    //Set the PIT to the desired frequency
    // Div = 1193180 / nFrequence;
    // outb(0x43, 0xb6);
    // outb(0x42, @intCast(u8,(Div)) );
    // outb(0x42, @intCast(u8,(Div >> 8)));

    //And play the sound using the PC speaker
    tmp = inb(0x61);
    if (tmp != (tmp | 3)) {
        outb(0x61, tmp | 3);
    } else {
        io.printf(c"Could not output to speaker\n");
    }
}

fn nosound() void {
    var tmp: u8 = inb(0x61) & 0xFC;

    outb(0x61, tmp);
}

export fn main(argv :[*][*] u8,argc: i32) c_int {
    var fd : c_int = fs.open(c"/data/words");
    io.printf(c"Hello %s\n",argv[0]);
    var data = fs.read(fd);
    io.printf(c"Length of data: %u\n\n",io.strlen(data));
    io.printf(c"%s\n",data);
    _=close(fd);
    io.printf(c"Waited 10 seconds\n");
    nosound();
    return 0;
}