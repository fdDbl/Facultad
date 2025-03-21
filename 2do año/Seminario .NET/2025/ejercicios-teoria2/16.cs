class Dieciseis {
    public static void Resolver(string[] args) {
        Console.WriteLine("Saludos con for:");
        for (int i = 0; i < args.Length; i++)
        {
            Console.WriteLine($"Hola {args[i]}!");
        }

        Console.WriteLine("Saludos con foreach:");
        foreach (string nombre in args)
        {
            Console.WriteLine($"Hola {nombre}!");
        }
    }
}