class Diecinueve {
    static void Fac(int n, out int f)
    {
        f = 1;
        for (int i = 2; i <= n; i++)
            f *= i;
    }
    public static void Resolver(string[] args) {
        int n = int.Parse(args[0]);
        Fac(n, out int resultado);
        Console.WriteLine($"Factorial con out: {resultado}");
    }
}