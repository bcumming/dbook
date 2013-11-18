import std.stdio;

interface Interface {
    void message();
    string meaning();
}

class Abstract : Interface {
    abstract void message();
    string meaning() {return "";};
}

class adams : Abstract {
    override void message() {
        writeln("According to The HitchHiker's Guide");
    }
    override string meaning() {return "42";};
}

class nitchse : Abstract {
    // we don't use the override keyword here
    void message() {
        writeln("According to nitchse");
    }
}

void main() {
    nitchse n = new nitchse;
    adams a = new adams;

    a.message();
    writeln( a.meaning );
    n.message();
    writeln( n.meaning );
}

