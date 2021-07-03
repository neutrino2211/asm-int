#include <vector>
#include <stdio.h>
#include <memory.h>
#include <stdlib.h>
#include <iostream>
#include "./methods/index.hh"
#include "./interpreter/index.hh"

using namespace std;

char* add_string(char *str1, char str2){
    char * str3 = (char *) malloc(1 + strlen(str1)+ sizeof(str2) );
    strcpy(str3, str1);
    str3[strlen(str3)] = str2;
    return str3;
}

int main(int argc, char** argv)
{
    char ch, *file_name, *_string = "";
    FILE *fp;
    file_name = argv[1];
    
    fp = fopen(file_name, "r"); // read mode
    
    if (fp == NULL)
    {
        perror("Error while opening the file.\n");
        exit(EXIT_FAILURE);
    }
    
    while((ch = fgetc(fp)) != EOF){
        _string = add_string(_string,ch);
    }
    vector<string> lines = Utils::split((string)_string+"\n", '\n');
    fclose(fp);
    Interpreter i;
    i.register_function("println",Methods::_load);
    i.register_function("put",Methods::put);
    i.loop(lines);
    return 0;
}