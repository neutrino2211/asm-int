#ifndef _H_METH
#define _H_METH

#include <string>
#include <vector>
#include <iostream>
#include "../utils/index.hh"
#include "../interpreter/index.hh"

using namespace std;

namespace Methods {
    void _load(Interpreter* i, vector<string> args){
        printf("%s\n",to_string(i->virtual_memory[0]).c_str());
    }

    void put(Interpreter* i, vector<string> args){
        int addr = stoi(args.at(0),nullptr,0);
        int val = stoi(args.at(1),nullptr,0);
        i->virtual_memory[addr] = val;
    }

    void db(Interpreter* i, vector<string> args){
        // auto value = Utils::resolve_value<auto>(args.at(1));
    }
};

#endif