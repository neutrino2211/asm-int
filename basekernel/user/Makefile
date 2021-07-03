
include ../Makefile.config

USER_PROGRAMS=$(patsubst %.c,%.exe,$(wildcard *.c))
LIBRARY= ../library/user-start.o ../library/baselib.a

all: $(USER_PROGRAMS)

%.o: %.c
	${CC} ${KERNEL_CCFLAGS} -I ../include $< -o $@

%.exe: %.o ${LIBRARY}
	${LD} ${KERNEL_LDFLAGS} -Ttext 0x80000000 $< ${LIBRARY} -o $@

clean:
	rm -rf *.exe *.o
