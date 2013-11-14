#!/usr/bin/rdmd

import std.stdio;

int add(int left, int right){
    return left+right;
}

void main() {
    // how about that, add() is evaluated at compile time
    static if(add(2,3)==5){
        writeln("well, that settles it, 2+3 is indeed 5");
    }
    else{
        writeln("erm...");
    }

    immutable a = add(2,6);
    static assert(a==8);

    const b = add(5,6);
    static assert(b==11);
}

