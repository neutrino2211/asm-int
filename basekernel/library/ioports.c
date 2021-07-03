/*
Copyright (C) 2015 The University of Notre Dame
This software is distributed under the GNU General Public License.
See the file LICENSE for details.
*/

#ifndef IOPORTS_H
#define IOPORTS_H

#include "kernel/types.h"

/*
These are C wrappers around the assembly instruction IN and OUT
to move data to and from I/O ports.  These variants are historically
called inb/inw/inl outb/outw/outl for in/out of byte (8 bits),
word (16 bits), and long (32 bits) respectively.
Note that some devices requires the "slow" variants that do an
extra dummy I/O in order to give the device more time to respond.
*/

 uint8_t inb(int port)
{
	uint8_t result;
      asm("inb %w1, %b0": "=a"(result):"Nd"(port));
	return result;
}

 uint16_t inw(int port)
{
	uint16_t result;
      asm("inw %w1, %w0": "=a"(result):"Nd"(port));
	return result;
}

 uint16_t inl(int port)
{
	uint32_t result;
      asm("inl %w1, %0": "=a"(result):"Nd"(port));
	return result;
}

 void outb(uint8_t value, int port)
{
      asm("outb %b0, %w1": :"a"(value), "Nd"(port));
}

 void outw(uint16_t value, int port)
{
      asm("outw %w0, %w1": :"a"(value), "Nd"(port));
}

 void outl(uint32_t value, int port)
{
      asm("outl %0, %w1": :"a"(value), "Nd"(port));
}

 void iowait()
{
	outb(0, 0x80);
}

 uint8_t inb_slow(int port)
{
	uint8_t result = inb(port);
	iowait();
	return result;
}

 uint16_t inw_slow(int port)
{
	uint16_t result = inw(port);
	iowait();
	return result;
}

 uint32_t inl_slow(int port)
{
	uint32_t result = inl(port);
	iowait();
	return result;
}

 void outb_slow(uint8_t value, int port)
{
	outb(value, port);
	iowait();
}

 void outw_slow(uint16_t value, int port)
{
	outw(value, port);
	iowait();
}

 void outl_slow(uint32_t value, int port)
{
	outl(value, port);
	iowait();
}

#endif
