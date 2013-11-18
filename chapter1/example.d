import std.stdio;

interface Interface {
    void message();
    string meaning();
}

class Abstract : Interface {
    abstract void message();
    string meaning() {return "God is dead";};
}

class adams : Abstract {
    override void message() {
        writeln("According to The HitchHiker's Guide");
    }
    override string meaning() {return "42";};
}

class nietzsche : Abstract {
    // we don't use the override keyword here
    // this gives a compiler warning...
    void message() {
        writeln("According to Nietzsche");
    }
}

void main() {
    nietzsche n = new nietzsche;
    adams a = new adams;

    a.message();
    writeln( a.meaning );
    n.message();
    writeln( n.meaning );
}

