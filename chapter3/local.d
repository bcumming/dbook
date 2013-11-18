#!/usr/bin/rdmd
import std.stdio;

void main() {
    int i=5;
    int [] arr = [1,2,3,4,5,6];
    foreach (a; arr){
        // this doesn't work: you can define a variable that has the same name
        // as a variable in the surrounding scope
        int i=3;
        assert(i==3);
    }
}

