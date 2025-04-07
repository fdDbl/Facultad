class Once {
    public static void Resolver() {
        Console.WriteLine("Ingrese una frase:");
        string? frase = Console.ReadLine();
        string[] palabras = frase.Split(' '); // Separa por espacios

        foreach (string palabra in palabras)
        {
            Console.WriteLine(palabra);
        }
    }
}