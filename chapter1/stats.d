#!/usr/bin/rdmd

/*
   take a text file and compute statistics on the numbers therin
*/
import std.stdio, std.exception;

interface Stat {
    void accumulate(double x);
    double result();
    void process();
}

class IncrementalStat : Stat {
    protected double accumulator_;
    abstract void accumulate(double x);
    double result() {
        return accumulator_;
    }
    void process() {};
}

class min : IncrementalStat {
    this() {
        accumulator_ = double.max;
    }
    // the override keyword is required here...
    override void accumulate(double x) {
        accumulator_ = accumulator_ > x ? x : accumulator_;
    }
}

class max : IncrementalStat {
    this() {
        accumulator_ = double.min;
    }
    override void accumulate(double x) {
        accumulator_ = accumulator_ < x ? x : accumulator_;
    }
}

class mean : IncrementalStat {
    int total_ = 0;
    this() {
        accumulator_ = 0.;
    }
    override void accumulate(double x) {
        accumulator_ += x;
        ++total_;
    }
    override void process() {
        accumulator_ /= cast(double) total_;
    }
}

void main(string args[]) {
    Stat[] stats;
    foreach(i, arg; args[1 .. $]) {
        auto newStat = cast(Stat) Object.factory("stats." ~ arg);
        enforce(newStat, "Invalid statistics function: " ~ arg);
        stats ~= newStat;
    }
    writeln("processing ", stats.length, " statistics");
    for(double x; readf(" %s ", &x)==1; ) {
        foreach(s; stats) {
            //writeln(x);
            s.accumulate(x);
        }
    }
    foreach(s; stats) {
        s.process();
        writeln(s.result());
    }
}

