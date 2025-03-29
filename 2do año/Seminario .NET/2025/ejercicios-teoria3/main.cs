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

double[,] matriz1 = new double[4,6];
for (int k = 0; k < matriz1.GetLength(0) * matriz1.GetLength(1); k++)
    matriz1[k / matriz1.GetLength(1), k % matriz1.GetLength(1)] = k;

Console.WriteLine("\n--- PUNTO " + ++z + " ---");
{
    ImprimirMatriz(matriz1);
}

void ImprimirMatriz(double[,] matriz) {
    for (int k = 0; k < matriz.GetLength(0) * matriz.GetLength(1); k++){
        Console.Write(matriz[k / matriz.GetLength(1), k % matriz.GetLength(1)]);
        Console.Write((k % matriz.GetLength(1) < matriz.GetLength(1)-1) ? " " : "\n");
    }
}

Console.WriteLine("\n--- PUNTO " + ++z + " ---");
{
    Console.WriteLine("Ingrese su plantilla de formato:");
    string? formato = Console.ReadLine();
    ImprimirMatrizConFormato(matriz1,formato);
}

void ImprimirMatrizConFormato(double[,] matriz, string? formatString) {
    for (int k = 0; k < matriz.GetLength(0) * matriz.GetLength(1); k++){
        Console.Write(matriz[k / matriz.GetLength(1), k % matriz.GetLength(1)].ToString(formatString));
        Console.Write((k % matriz.GetLength(1) < matriz.GetLength(1)-1) ? " " : "\n");
    }
}

double[,] matrizCuadrada = new double[6,6];
for (int k = 0; k < Math.Pow(matrizCuadrada.GetLength(0),2); k++)
    matrizCuadrada[k / matrizCuadrada.GetLength(1), k % matrizCuadrada.GetLength(1)] = k;

Console.WriteLine("\n--- PUNTO " + ++z + " ---");
{
    var array = GetDiagonalPrincipal(matrizCuadrada);
    Console.WriteLine("Diagonal principal:");
    ImprimirArreglo(array);

    array = GetDiagonalSecundaria(matrizCuadrada);
    Console.WriteLine("\nDiagonal secundaria:");
    ImprimirArreglo(array);
}

void ImprimirArreglo(double[] array) {
    foreach(double a in array)
        Console.Write(a + " ");
}

double[] GetDiagonalPrincipal(double[,] matriz) {
    double[] aux = new double[6];
    for(int i = 0; i < matriz.GetLength(1); i++)
        aux[i] = matriz[i,i];
    return aux;
}

double[] GetDiagonalSecundaria(double[,] matriz) {
    double[] aux = new double[6];
    int j = 5;
    for(int i = 0; i < matriz.GetLength(1); i++, j--)
        aux[i] = matriz[i,j];
    return aux;
}

void ImprimirArregloDeArreglo(double[][] arrayarray) {
    foreach(double[] columna in arrayarray) {
        Console.WriteLine("Columna");
        foreach(double element in columna)
            Console.WriteLine(element);
    }
}

Console.WriteLine("\n--- PUNTO " + ++z + " ---");
{
    ImprimirArregloDeArreglo(GetArregloDeArreglo(matriz1));

    double[][] GetArregloDeArreglo(double [,] matriz) {
        double[][] aux = new double[matriz.GetLength(0)][];
        for (int i = 0; i < matriz.GetLength(0); i++) 
            aux[i] = new double[matriz.GetLength(1)];
    
        for(int i=0; i < matriz.GetLength(0) * matriz.GetLength(1); i++)
            aux[i / matriz.GetLength(1)][i % matriz.GetLength(1)] = matriz[i / matriz.GetLength(1),i % matriz.GetLength(1)];
        return aux;
    }
}