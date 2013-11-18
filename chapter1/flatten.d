#!/usr/bin/rdmd

/*
   take a text file, and concatenate successive non-empty lines
*/
import std.stdio;
import std.string;
import std.algorithm;
import std.conv;

void main() {
    string current;
    string[] paragraphs;

    foreach(line; stdin.byLine()) {
        // an empty (including whitespace) line indicates that a new paragraph has started
        if(!strip(line).length){
            if(current.length) // output current paragraph if it is non-empty
                paragraphs[paragraphs.length++] = current;
            current = "";
        }
        else {
            current ~= current.length ? " " : "";
            current ~= strip(line);
        }
    }

    // add final line, if it is not empty
    if( current.length )
        paragraphs[paragraphs.length++] = current;

    // output the concatenated lines
    foreach(i, para; paragraphs) {
        writeln("==== line ", i);
        writeln(para);
    }
}
