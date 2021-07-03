#ifndef _H_INT
#define _H_INT

#include <map>
#include <string>
#include <vector>
#include <cstring>
#include <iostream>
#include <functional>
#include "../utils/index.hh"

using namespace std;

class Interpreter {
    public:
    map<string,void(*)(Interpreter*, vector<string>)> methods;
    map<string,string> variables;
    int virtual_memory[0x7f];
    string asm_code = "";
    string asm_data = "";
    string asm_externs = "";
    Interpreter(){};
    void register_function(string name, void(*func)(Interpreter*, vector<string>)){
        methods[name] = func;
    }

    void loop(vector<string> lines){
        // methods["load"](this,Utils::split("Hello Guys",' '));
        for(uint i=0;i<lines.size();i++){
            if(lines.at(i) == "")continue;
            vector<string> cmds = Utils::split_args(lines.at(i));
            if(methods.find(cmds.at(0)) == methods.end()){
                Utils::error("No macro '"+cmds.at(0)+"' found\n");
            }
            methods[cmds.at(0).c_str()](this,vector<string>(cmds.begin()+1, cmds.end()));
        }
    }
};

#endif