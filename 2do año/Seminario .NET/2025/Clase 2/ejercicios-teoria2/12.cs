class Doce {
    enum Meses {
        Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio, Agosto,
        Septiembre, Octubre, Noviembre, Diciembre
    }
    public static void Resolver() {
        // a) Imprimir los meses en orden inverso
        for (int i = 11; i >= 0; i--)
        {
            Console.WriteLine((Meses)i);
        }

        // b) Verificar si el texto ingresado es un mes válido
        Console.WriteLine("Ingrese un mes:");
        string? entrada = Console.ReadLine();
        bool esMes = Enum.TryParse(entrada, true, out Meses mes);

        Console.WriteLine(esMes ? "Es un mes válido." : "No es un mes válido.");
    }
}