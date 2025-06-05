class Cinco {
    public static void Resolver() {
        char c1 = 'A';
        string st1 = "A";
        object o1 = c1; // boxing
        object o2 = st1;
        char c2 = (char)o1; // unboxing
        string st2 = (string)o2;
    }
}