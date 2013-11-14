#!/usr/bin/rdmd
import std.stdio;
void main(){
    int[] arr = new int[10];
    foreach(int i, ref a; arr)
        a = i+1;
    writeln(arr);
}

