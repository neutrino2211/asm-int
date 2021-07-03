// #include "fs.h"
#include "library/string.h"
#include "library/user-io.h"
#include "library/malloc.h"
#include "library/syscalls.h"

struct elf_header {
	char ident[16];
	uint16_t type;
	uint16_t machine;
	uint32_t version;
	uint32_t entry;
	uint32_t program_offset;
	uint32_t section_offset;
	uint32_t flags;
	uint16_t header_size;
	uint16_t phentsize;
	uint16_t phnum;
	uint16_t shentsize;
	uint16_t shnum;
	uint16_t shstrndx;
};

unsigned misc_len(void** l){
    unsigned i = 0;
    for(i;l[i]!=0;i++);
    return i;
}

char* str_slice(char* s, uint32_t i){
    char* ret = malloc(1);
    uint32_t j = -1;
    while(j++ < i){
        ret[j] = s[j];
    }
    ret[j] = '\0';
    return ret;
}

void main(const char** argv, int argc) {
  // switch to Elf32_Ehdr for x86 architecture.
    struct elf_header* header = malloc(1);

    int fd = syscall_open_file("/bin/init.exe",0,0),n;
    char buffer[1024];
    char* str = malloc(1);
    while((n = syscall_object_read(fd, buffer, 1024)) > 0) {
        str = strcat(str,buffer);
    }

    strcpy((char*)header,str);
    char* head = {str[0],str[1],str[2],str[3]};
    printf("Entry: 0x%x\nProgramOffset: 0x%x\nMagic: %u\n",header->entry, header->program_offset,
        strncmp(header,"\177ELF",4)
    );
    syscall_object_close(fd);
}