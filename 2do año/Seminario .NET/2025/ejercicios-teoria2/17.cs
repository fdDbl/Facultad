class Diecisiete {
    public static bool EsPrimo(int n) {
        if (n < 2) return false;
        for (int i = 2; i <= Math.Sqrt(n); i++) 
            if (n % i == 0) return false;
        return true;
    }
    public static void Resolver(string[] args) {
        int n = int.Parse(args[0]);
        for (int i = 1; i <= n; i++)
            if (EsPrimo(i)) Console.WriteLine(i);
    }
}
