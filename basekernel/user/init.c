#include "library/string.h"
#include "library/user-io.h"
#include "library/malloc.h"
#include "library/syscalls.h"

typedef char** line;
typedef line* script;
typedef void(*callback)(char**);

void** functions;

unsigned misc_len(void** l);

void init_functions(){
    functions = malloc(1);
}

void register_function(char* name, callback f){
    unsigned l = misc_len(functions);
    functions[l] = name;
    functions[l+1] = f;
}

void* get_function(void* name){
    for(int i=0;i<misc_len(functions);i+=2){
        if(!strcmp(functions[i],name)){
            return functions[i+1];
        }
    }
    return 0;
}

char* append(char* array, char a) {
    size_t len = strlen(array);

    char* ret = malloc(len+2);

    strcpy(ret, array);    
    ret[len] = a;
    ret[len+1] = '\0';

    return ret;
}

unsigned misc_len(void** l){
    unsigned i = 0;
    for(i;l[i]!=0;i++);
    return i;
}

void p(char** args){
    printf("Hello World: %s\n",args[1]);
}

void run_script(script scr){
    for(int i=0;i<misc_len(scr);i++){
        line l = scr[i];
        if(misc_len(l)>0){
            char* f_name = l[0];
            callback f = get_function(f_name);
            if(f){
                (*f)(l);
            } else {
                printf("Error: %s is not a function [0x%x]\n",f_name,f);
            }
        }
    }
}

int main(const char** argv, int argc){
    init_functions();
    register_function("print",&p);
    int fd = syscall_open_file("/data/words",0,0),n;
    char buffer[1024];
    char* str = malloc(1);
    while((n = syscall_object_read(fd, buffer, 1024)) > 0) {
        str = strcat(str,buffer);
	}
    char* s = str;
    char* a = malloc(1);
    char* b = a;
    line l = malloc(1);
    script scr = malloc(1);
    int line_index = 0;
    int script_index = 0;
    while(*s){
        if(*s == ' '){
            if(a != ""){
                l[line_index++] = a;
            }
            a = "";
        } else if(*s == '\n') {
            if(a != ""){
                l[line_index++] = a;
                a = "";
            }
            scr[script_index++] = l;
            l = malloc(1);
        } else {
            a = append(a,*s);
        }
        s++;
    }
    if(a != ""){
        l[line_index] = a;
        a = "";
        scr[script_index] = l;
    }
    syscall_object_close(fd);
    run_script(scr);
    return 0;
}