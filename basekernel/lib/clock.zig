const syscalls = @import("./extern/syscalls.zig");

pub fn wait(time: u32) void {
    var rtc_time = syscalls.struct_rtc_time{
        .second = 0,
        .minute = 0,
        .hour = 0,
        .day = 0,
        .month = 0,
        .year = 0,
    };
    _=syscalls.syscall_system_rtc(&rtc_time);
    var now: u32 = rtc_time.second + (rtc_time.minute * 60) + (rtc_time.hour * 60 * 24);
    const stop_time = now + time;
    while(now < stop_time){
        _=syscalls.syscall_system_rtc(&rtc_time);
        now = rtc_time.second + (rtc_time.minute * 60) + (rtc_time.hour * 60 * 24);
    }
}