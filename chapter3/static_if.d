import std.stdio;

void main() {
    immutable int a = 4;
    immutable int b = 20;

    static if ( a<2 ) {
        writeln("a<2");
    }
    else static if ( a<5 ) {
        writeln("a<5");
    }
    else {
        writeln("a>=5");
    }

}

