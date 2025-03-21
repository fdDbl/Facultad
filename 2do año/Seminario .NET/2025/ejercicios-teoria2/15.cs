class Quince {
    public static void Resolver(string[] args) {
        Console.WriteLine("¡Hola {0}!", args[0]);
        //  Si no se pasan parámetros: provoca IndexOutOfRangeException porque args[0] no existe.
    }
}