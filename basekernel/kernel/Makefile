include ../Makefile.config

KERNEL_OBJECTS=kernelcore.o main.o console.o memory.o keyboard.o mouse.o clock.o interrupt.o kmalloc.o pic.o ata.o cdromfs.o string.o bitmap.o graphics.o font.o cfgrun.o syscall_handler.o process.o mutex.o list.o pagetable.o rtc.o kshell.o fs.o kevinfs.o hash_set.o kevinfs_test.o serial.o elf.o device.o kobject.o pipe.o bcache.o printf.o

basekernel.img: bootblock kernel
	cat bootblock kernel /dev/zero | head -c 1474560 > basekernel.img

kernel: kernel.elf
	${OBJCOPY} -O binary $< $@

bootblock: bootblock.elf
	${OBJCOPY} -O binary $< $@

kernel.elf: ${KERNEL_OBJECTS}
	${LD} ${KERNEL_LDFLAGS} -Ttext 0x10000 ${KERNEL_OBJECTS} ../library/baselib.a -o $@

bootblock.elf: bootblock.o
	${LD} ${KERNEL_LDFLAGS} -Ttext 0 $< -o $@

%.o: %.c
	${CC} ${KERNEL_CCFLAGS} -I ../include $< -o $@

%.o: %.S
	${CC} ${KERNEL_CCFLAGS} -I ../include $< -o $@

%.o: %.zig
	zig build-obj --target-arch i386 --release-fast --library c --static -isystem ../include $<

clean:
	rm -rf basekernel.img *.o *.elf kernel bootblock bootblock.o
