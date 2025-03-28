int z = 0;
Console.WriteLine("--- PUNTO " + ++z + " ---");
{
    Console.CursorVisible = false;
    ConsoleKeyInfo k = Console.ReadKey(true);
    while (k.Key != ConsoleKey.Escape) {
        Console.Clear();
        Console.Write($"{k.Modifiers}-{k.Key}-{k.KeyChar}");
        k = Console.ReadKey(true);
    }
    Console.CursorVisible = true;
}

double[,] matriz46 = new double[4,6];
for (int k = 0; k < 24; k++)
    matriz46[k / 6, k % 6] = k;

Console.WriteLine("\n--- PUNTO " + ++z + " ---");
{
    ImprimirMatriz(matriz46);

    void ImprimirMatriz(double[,] matriz) {
        for (int k = 0; k < 24; k++){
            Console.Write(matriz[k / 6, k % 6]);
            Console.Write((k % 6 != 5) ? " " : "\n");
        }
    }
}

Console.WriteLine("\n--- PUNTO " + ++z + " ---");
{
    Console.WriteLine("Ingrese su plantilla de formato:");
    string? formato = Console.ReadLine();
    ImprimirMatrizConFormato(matriz46,formato);
    
    void ImprimirMatrizConFormato(double[,] matriz, string? formatString) {
        for (int k = 0; k < 24; k++){
            Console.Write(matriz[k / 6, k % 6].ToString(formatString));
            Console.Write((k % 6 != 5) ? " " : "\n");
        }
        
    }
}

Console.WriteLine("\n--- PUNTO " + ++z + " ---");
{
    double[,] matrizCuadrada = new double[6,6];
    for (int k = 0; k < 36; k++)
        matrizCuadrada[k / 6, k % 6] = k;

    double[] array = GetDiagonalPrincipal(matrizCuadrada);
    Console.WriteLine("Diagonal principal:");
    foreach(double a in array)
        Console.Write(a + " ");

    array = GetDiagonalSecundaria(matrizCuadrada);
    Console.WriteLine("Diagonal secundaria:");
    foreach(double a in array)
        Console.Write(a + " ");

    double[] GetDiagonalPrincipal(double[,] matriz) {
        double[] aux = new double[6];
        for(int i = 0; i < 6; i++)
            aux[i] = matriz[i,i];
        return aux;
    }

    double[] GetDiagonalSecundaria(double[,] matriz) {
        double[] aux = new double[6];
        int j = 5;
        for(int i = 0; i < 6; i++, j--)
            aux[i] = matriz[i,j];
        return aux;
    }
}

Console.WriteLine("\n--- PUNTO " + ++z + " ---");
{

    
    double[][] GetArregloDeArreglo(double [,] matriz) {

    }
}