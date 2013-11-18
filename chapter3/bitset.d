#!/usr/bin/rdmd
import std.stdio, std.string, std.conv;

uint bitsSet(uint value) {
    uint result=0;

    for(; value; ++result)
        value &= value-1;

    return result;
}

string genTable(string name, uint max) {
    string table;

    table = "uint ["~to!string(max)~"] "~name~" = [";
    foreach(uint i; 0 .. max)
        table ~= to!string(bitsSet(i))~",";
    table ~= "];";

    return table;
}

void main() {
    immutable uint max = 256;
    writeln(genTable("testtab", max));
    mixin(genTable("testtab", max));

    foreach(uint i; 0 .. max)
        writeln(i, "\t", bitsSet(i), "\t", testtab[i]);
}

