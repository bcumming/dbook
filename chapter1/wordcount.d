#!/usr/bin/rdmd

import std.stdio;
import std.string;
import std.algorithm;

void main()
{
    // compute the counts
    int[string] freqs;
    foreach(line; stdin.byLine())
        foreach(word; split(strip(line)))
            ++freqs[word.idup];

    // sort the in ascending order of frequency
    string[] words = freqs.keys;
    sort!( (a,b) { return freqs[a] > freqs[b]; } )(words);

    // print counts
    foreach(word; words)
        writefln("%6d\t%s", freqs[word], word);

    // determine the total number of words in a post-hoc fashion
    int sum = 0;
    foreach(word; words)
        sum += freqs[word];

    writefln("total of %d words\n", sum);
}

