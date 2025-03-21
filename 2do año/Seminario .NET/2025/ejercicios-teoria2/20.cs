class Veinte {
    static void Swap(ref int a, ref int b)
    {
        int temp = a;
        a = b;
        b = temp;
    }
    public static void Resolver() {
        int x = 5, y = 10;
        Console.WriteLine($"Antes: x={x}, y={y}");
        Swap(ref x, ref y);
        Console.WriteLine($"Después: x={x}, y={y}");
    }
}