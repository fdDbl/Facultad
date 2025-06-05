class Dieciocho {
    static int FacIterativo(int n)
    {
        int resultado = 1;
        for (int i = 2; i <= n; i++)
            resultado *= i;
        return resultado;
    }
    static int FacRecursivo(int n)
    {
        return (n <= 1) ? 1 : n * FacRecursivo(n - 1);
    }
    static int FacExpression(int n) => (n <= 1) ? 1 : n * FacExpression(n - 1);
    public static void Resolver(string[] args) {
        int n = int.Parse(args[0]);
        Console.WriteLine($"Factorial Iterativo: {FacIterativo(n)}");
        Console.WriteLine($"Factorial Recursivo: {FacRecursivo(n)}");
        Console.WriteLine($"Factorial Expresión: {FacExpression(n)}");
    }
}