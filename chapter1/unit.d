import std.stdio;

// you can have unittest declared in multiple locations in a source file
// compile with
//      dmd unit.d -unittest -main -cov
// the -main arg inserts a main() for the purpose of calling the unit tests
// the coverage report is generated when you run the executable
//      cat unit.lst

int add(int a, int b){ return a + b; }

// unit test for add
unittest{
    writeln("testing add");
    assert(add(4,3)==7);
}

int sub(int a, int b){ return a + b; }

// unit test for sub
// this should fail, because sub has a bug
unittest{
    writeln("testing sub");
    assert(sub(4,3)==1);
}

