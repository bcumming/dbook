#!/usr/bin/rdmd

import std.stdio;

void main() {
    int[string] arr = ["one":1, "two":2, "three":3, "four":4, "five":5, "six":6, "seven":7, "eight":8, "nine":9, "ten":10];
    foreach(i, val; arr)
        writeln(i, "\t: ", val);
}

