class Punto6 {
    public static void Run() {
        Console.WriteLine("----- PUNTO 6 -----");
        Console.WriteLine("Ingrese una ecuación cuadrática completa (ax^2 + bx + c):"); 
        string? ecu = Console.ReadLine();
        Ecuacion2 ecuacion1 = !string.IsNullOrWhiteSpace(ecu) ? new(ecu) : new(0,0,0);
        Console.WriteLine(ecuacion1.getExpresión());
        Console.WriteLine($"Discriminante de la ecuación: {ecuacion1.GetDiscriminante()}");
        Console.WriteLine($"Cantidad de raíces: {ecuacion1.GetCantidadDeRaices()}");
        ecuacion1.ImprimirRaíces();
    }
}