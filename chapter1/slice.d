#!/usr/bin/rdmd

import std.stdio;

void main()
{
    //int[] base = new int[6];
    int[6] base;
    base = [1, 2, 3, 4, 5, 6];
    int[] a = base;

    writeln(a);
    writeln(base);

    a = a[0 .. 3];
    writeln(a);
    writeln(base);
}

