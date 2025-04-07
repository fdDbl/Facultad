class Veintiuno {
    static void Imprimir(params object[] p) {
        Console.WriteLine(string.Join(" ",p));
    }
    public static void Resolver() {
        Imprimir(1, "casa", 'A', 3.4, DayOfWeek.Saturday);
        Imprimir(1, 2, "tres");
        Imprimir();
        Imprimir("-------------");
    }
}