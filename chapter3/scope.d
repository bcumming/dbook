#!/usr/bin/rdmd
import std.stdio;

int test(int i) {
    scope(exit) writeln("on exit ", ++i);
    return i;
}

void main() {
    writeln( "returned ", test(5) );
}

