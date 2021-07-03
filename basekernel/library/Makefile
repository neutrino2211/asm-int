include ../Makefile.config

LIBRARY_OBJECTS=$(patsubst %.c,%.o,$(wildcard *.c)) syscall.o

all: user-start.o baselib.a

%.o: %.c
	${CC} ${KERNEL_CCFLAGS} -I ../include $< -o $@

baselib.a: ${LIBRARY_OBJECTS}
	${AR} rv $@ ${LIBRARY_OBJECTS}

clean:
	rm -rf *.a *.o
