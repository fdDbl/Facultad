class Dos {
    public static void Resolver() {
        char c1 = 'A';
        string st1 = "A";
        object o1 = c1; // boxing
        object o2 = st1; // string tambien es una referencia, asi que no hay boxing...
        char c2 = (char)o1; // unboxing
        string st2 = (string)o2; // ...ni unboxing
    }
}