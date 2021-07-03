
include ../Makefile.config

USER_PROGRAMS=$(patsubst %.zig,%.exe,$(wildcard *.zig))
USER_LIBS=$(wildcard lib/*.zig) $(wildcard lib/extern/*.zig)
LIBRARY= ../library/user-start.o ../library/ioports.o ../library/baselib.a

all: $(USER_PROGRAMS)

%.o: %.zig 
	zig build-obj --target-arch i386 --release-fast --library c --static -isystem ../include $<

%.exe: %.o ${LIBRARY} $(USER_LIBS)
	${LD} ${KERNEL_LDFLAGS} -Ttext 0x80000000 $< ${LIBRARY} -o $@

clean:
	rm -rf *.exe *.o
