#ifndef _H_UTIL
#define _H_UTIL

#include <string>
#include <vector>
#include <cstring>
#include <iostream>

using namespace std;

void _split(const string& s, char c,
           vector<string>& v) {
    string::size_type i = 0;
    string::size_type j = s.find(c);

    while (j != string::npos) {
        v.push_back(s.substr(i, j-i));
        i = ++j;
        j = s.find(c, j);

        if (j == string::npos)
            v.push_back(s.substr(i, s.length()));
    }
}

namespace Utils {
    vector<string> split(string s,char c){
        vector<string> list;
        string _s = s;
        _split(_s,c,list);
        return list;
    }

    vector<string> split_args(string s){
        const char* str = s.c_str();
        bool eval = true;
        string tmp = "";
        vector<string> ret;
        for(int i=0; i<strlen(str); i++){
            if(str[i] == ' ' && eval){
                if(tmp != ""){
                    ret.push_back(tmp);
                    tmp = "";
                }
            } else if(str[i] == '\''){
                eval = !eval;
            } else {
                tmp += str[i];
            }
        }
        if(tmp != "")ret.push_back(tmp);
        return ret;
    }

    void print_arr(vector<string> s){
        string _s = "";
        for(uint i=0; i<s.size(); i++){
            _s += s.at(i);
            if(i<s.size()-1)_s += ", ";
        }
        printf("%s\n",_s.c_str());
    }
    template<typename T>
    T resolve_value(string value){
        try{
            int i = stoi(value,nullptr,0);
            return i;
        } catch (exception& ex){
            return value;
        };
    }

    void error(string err){
        printf("Error: %s",err.c_str());
        exit(1);
    }
};

#endif