class Cuatro {
    public static void Resolver() {
        object o = "Hola Mundo!";
        // string st = o; NO
        string? st = o as string;
        int i = 12;
        // byte b = i; NO
        byte b = (byte)i;
        double d = i;
        // float f = d; NO
        float f = (float)d;
        o = i;
        i = (int)o + 1;
    }
}