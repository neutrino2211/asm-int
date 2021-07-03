include Makefile.config

LIBRARY_SOURCES=$(wildcard library/*.c)
LIBRARY_HEADERS=$(wildcard library/*.h)
USER_LIBRARY=$(wildcard apps/lib/extern/*.zig) $(wildcard apps/lib/*.zig)
USER_SOURCES=$(wildcard apps/*.zig)
USER_PROGRAMS=$(USER_SOURCES:zig=exe)
KERNEL_SOURCES=$(wildcard kernel/*.[chS]) $(wildcard kernel/*.zig)

all: basekernel.iso

run: basekernel.iso
	qemu-system-i386 -cdrom basekernel.iso -hda disk.img -vga vmware -device isa-debug-exit,iobase=0xf4,iosize=0x04

remote: basekernel.iso
	python ../raw.py 192.168.1.10:7000 http://192.168.1.6:80/basekernel.iso

disk.img:
	qemu-img create disk.img 10M

debug:
	qemu-system-i386 -cdrom basekernel.iso -s -S &

library/baselib.a: $(LIBRARY_SOURCES) $(LIBRARY_HEADERS)
	cd library && make

$(USER_PROGRAMS): $(USER_SOURCES) $(USER_LIBRARY) library/baselib.a $(LIBRARY_HEADERS)
	cd apps && make

kernel/basekernel.img: $(KERNEL_SOURCES) $(LIBRARY_HEADERS)
	cd kernel && make

image: $(USER_PROGRAMS) kernel/basekernel.img $(wildcard data/*)
	rm -rf image
	mkdir image image/boot image/bin
	cp kernel/basekernel.img image/boot
	cp $(USER_PROGRAMS) image/bin
	cp data image/data -r

basekernel.iso: image
	${ISOGEN} -input-charset utf-8 -iso-level 2 -J -R -o $@ -b boot/basekernel.img image

clean:
	rm -rf basekernel.iso image
	cd kernel && make clean
	cd library && make clean
	cd apps && make clean
