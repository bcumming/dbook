#!/usr/bin/rdmd

import std.stdio;
import std.string;
import std.algorithm;

// the example from the book fails:
//  - the splitter routine is in std.algorithm, std.string
//  - the book uses uint, but dictionary.length is of type ulong
//  - the compiler won't allow me to use a char[] as a key
void main() {
    //ulong[string] dictionary;
    uint count=0;

    foreach(line; stdin.byLine()) {
        //auto split = splitter(strip(line));
        foreach(word; splitter(strip(line))) {
            //if (word in dictionary) continue;
            //auto newID = dictionary.length;
            //dictionary[word] = newID;
            //writeln(newID, '\t', word);
            writeln(count, '\t', word);
            count++;
        }
    }
}

