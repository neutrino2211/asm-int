/*
Copyright (C) 2015 The University of Notre Dame
This software is distributed under the GNU General Public License.
See the file LICENSE for details.
*/

#include "console.h"
#include "memory.h"
#include "process.h"
#include "interrupt.h"
#include "keyboard.h"
#include "mouse.h"
#include "clock.h"
#include "ata.h"
#include "device.h"
#include "cdromfs.h"
#include "string.h"
#include "graphics.h"
#include "kernel/ascii.h"
#include "kernel/syscall.h"
#include "rtc.h"
#include "kernelcore.h"
#include "kmalloc.h"
#include "memorylayout.h"
#include "kshell.h"
#include "cdromfs.h"
#include "kevinfs_test.h"
#include "kevinfs.h"
#include "serial.h"
#include "cfgrun.h"

static int silent_mount(const char *devname, int unit, const char *fs_type){
	struct device *dev = device_open(devname,unit);
	if(dev) {
		struct fs *fs = fs_lookup(fs_type);
		if(fs) {
			struct fs_volume *v = fs_volume_open(fs,dev);
			if(v) {
				struct fs_dirent *d = fs_volume_root(v);
				if(d) {
					current->root_dir = d;
					current->current_dir = fs_dirent_addref(d);
					return 0;
				} else {
					return -1;
				}
				fs_volume_close(v);
			} else {
				return -1;
			}
		} else {
			return -1;
		}
		device_close(dev);
	} else {
		return -1;
	}

	return -1;
}

/*
This is the C initialization point of the kernel.
By the time we reach this point, we are in protected mode,
with interrupts disabled, a valid C stack, but no malloc heap.
Now we initialize each subsystem in the proper order:
*/

int kernel_main()
{
	struct graphics *g = graphics_create_root();

	console_init(g);
#ifdef TEST
	serial_init();
#endif

	printf("video: %d x %d\n", video_xres, video_yres, video_xbytes);
	printf("kernel: %d bytes\n", kernel_size);

	memory_init();
	kmalloc_init((char *) KMALLOC_START, KMALLOC_LENGTH);
	interrupt_init();
	rtc_init();
	clock_init();
	mouse_init();
	keyboard_init();
	process_init();
	ata_init();
	cdrom_init();
	kevinfs_init();
	for(int i=1;i<4;i++){
		printf("Trying to mount device %d\n",i);
		int res = silent_mount("atapi",i,"cdromfs");
		if(!res){
			printf("Mounted %d\n",i);
			break;
		}
		if(i==3){
			printf("Could not find any disk\n");
			//TODO: Play error tone
		}
	}
	cfgrun();
	printf("\nKERNEL SHELL READY:\n");
	kshell_launch();

	while(1) {
		console_putchar(&console_root,keyboard_read(0));
	}

	return 0;
}
