const lib = @import("../lib/index.zig");
const line = [2][*]const u8;

fn ptrCast(char: *u8) [*]const u8 {
    return @ptrCast([*]const u8,&([]u8{char.*}));
}

fn parse(data: ?[*]u8) []line {
    const _data: [*]u8 = data orelse @ptrCast([*]u8,&"");
    const __ = @ptrCast([*]u8,&"");
    var lines: []line = []line{};
    var l: line = undefined;
    var tmp: [*]u8 = @ptrCast([*]u8,lib.malloc.malloc(1));
    var i: u32 = 0;
    var s: *u8 = &(_data[i]);
    var line_count: u32 = 0;
    while(s.* != 0){
        lib.string.printf(c"Char: %c\n",s.*);
        if(s.* == '='){
            l[0] = tmp;
            lib.string.printf(c"EQ: %s\n",s.*);
            tmp = __;
        } else if (s.* == '\n') {
            l[1] = tmp;
            lines[line_count] = l;
            line_count += 1;
            lib.string.printf(c"LINE!!: %s\n",s.*);
            tmp = __;
        } else {
            tmp = lib.string.strcat(tmp,ptrCast(s)) orelse __;
        }
        i += 1;
        s = &(_data[i]);
    }
    return lines;
}

export fn cfgrun() void {
    if(lib.fs.exists(c"/data/_cfg")){
        // lib.string.printf(c"CFG File found\n");
        const fd = lib.fs.open(c"/data/_cfg");
        var data = lib.fs.read(fd);
        data = lib.string.strcat(data,c"\n");
        const lines = parse(data);
        lib.string.printf(c"DATA: %s, LEN: %s",data,lines[0]);
        // var i: u32 = 0;
        // var l = lines[i];
        // lib.string.printf(c"K: %s, V: %s\n",l[0],l[1]);
    } else {
        lib.string.printf(c"Can't find config file, continuing\n");
    }
}