using System.Text;

int ñ = 0;
Console.WriteLine("--- PUNTO " + ++ñ + " ---");
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

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
{
    ImprimirMatriz(matriz1);
}

void ImprimirMatriz(double[,] matriz) {
    for (int k = 0; k < matriz.GetLength(0) * matriz.GetLength(1); k++){
        Console.Write(matriz[k / matriz.GetLength(1), k % matriz.GetLength(1)]);
        Console.Write((k % matriz.GetLength(1) < matriz.GetLength(1)-1) ? " " : "\n");
    }
}

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
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

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
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

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
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

bool SameSize(double[,] A, double[,] B) {
    return A.GetLength(0) == B.GetLength(0) && A.GetLength(1) == B.GetLength(1);
}

bool SameColumnsRows(double[,] A, double[,] B) {
    return A.GetLength(1) == B.GetLength(0);
}

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
{
    double[,]? Suma(double[,] A, double[,] B) {
        if (!SameSize(A,B))
            return null;
        double[,] suma = new double[A.GetLength(0),A.GetLength(1)];
        for(int i=0; i < A.GetLength(0) * A.GetLength(1); i++)
            suma[i / suma.GetLength(1), i % suma.GetLength(1)] = A[i / A.GetLength(1), i % A.GetLength(1)] + B[i / B.GetLength(1), i % B.GetLength(1)];
        return suma; 
    }

    double[,]? Resta(double[,] A, double[,] B) {
        if (!SameSize(A,B))
            return null;
        double[,] resta = new double[A.GetLength(0),A.GetLength(1)];
        for(int i=0; i < A.GetLength(0) * A.GetLength(1); i++)
            resta[i / resta.GetLength(1), i % resta.GetLength(1)] = A[i / A.GetLength(1), i % A.GetLength(1)] - B[i / B.GetLength(1), i % B.GetLength(1)];
        return resta;
    }
    
    double[,] Multiplicacion(double[,] A, double[,] B) {
        if (!SameColumnsRows(A,B))
            throw new ArgumentException("Multiplicación inválida.");
        
        int filasA = A.GetLength(0);
        int columnasA = A.GetLength(1);
        int columnasB = B.GetLength(1);
        double[,] producto = new double[filasA, columnasB];
        for (int i = 0; i < filasA; i++)
            for (int j = 0; j < columnasB; j++) {
                producto[i, j] = 0;
                for (int k = 0; k < columnasA; k++)
                    producto[i, j] += A[i, k] * B[k, j];
            }
        return producto;
    }
}

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
{
    int i = 10; // int
    var x = i * 1.0; // double
    var y = 1f; // float
    var z = i * y; // single
}

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
{
    object obj = new int[10];
    dynamic dyna = 13;
    /* Console.WriteLine(obj.Length); no se puede medir un arreglo con Length */
    /* Console.WriteLine(dyna.Length); no se puede medir un int con Length */
}

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
{
    var a = 3L;
    dynamic b = 32;
    object obj = 3;
    /* a = a * 2.0; no compila ya que a es de tipo Long, no float */
    b = b * 2.0;
    b = "hola";
    obj = b;
    b = b + 11;
    /* obj = obj + 11; obj es de tipo string, y string no permite sumarse un entero */
    var c = new { Nombre = "Juan" };
    var d = new { Nombre = "María" };
    var e = new { Nombre = "Maria", Edad = 20 };
    var f = new { Edad = 20, Nombre = "Maria" };
    /* f.Edad = 22; los tipos anónimos son de solo lectura */
    d = c;
    /* e = d; no se puede convertir implícitamente */
    /* f = e; ídem */
}

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
{
    double d = 3.141592;
    Console.WriteLine("{0:0.000}", d);
    Console.WriteLine($"{d:0.000}");
    // redondea en vez de truncar
}

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
{
    List<int> a = [ 1, 2, 3, 4 ];
    a.Remove(5); // no lo encuentra, y simplemente devuelve false y no realiza ninguna acción
    /* a.RemoveAt(4); no existe la posicion 4 en el arreglo, tira error en runtime */
}

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
{
    string expresion = "[(a + b) * (d / e)] + (a - e) - d";
    Console.WriteLine(EsBalanceado(expresion));

    bool EsBalanceado(string exp)
    {
        if (exp.Length == 0)
            return false;
        Stack<char> pila = new();
        char[] expArray = exp.ToCharArray();
        foreach (char c in expArray) {
            if ((c == '(') || (c == '[') || (c == '{'))
                pila.Push(c);
            else if ((c == ')') || (c == ']') || (c == '}')) {
                if (pila.Count == 0)
                    return false;
                char top = pila.Pop();
                if ((c == ')' && top != '(') ||
                (c == ']' && top != '[') ||
                (c == '}' && top != '{'))
                    return false;
            }
        }
        return pila.Count == 0;
    }
}

Console.WriteLine("\n--- PUNTO " + ++ñ + " ---");
{
    Console.WriteLine("Ingrese el número a convertir y la base a la cuál convertir ese número, separados por un espacio:");
    string? calc = Console.ReadLine();
    
    if (string.IsNullOrEmpty(calc) || !calc.Contains(' '))
        Console.WriteLine("Formato inválido.");
    else {
        int esp = calc.IndexOf(' ');
        string numStr = calc.Substring(0, esp);
        string baseStr = calc.Substring(esp + 1);
        int n = int.Parse(numStr);
        int b = int.Parse(baseStr);
        Console.WriteLine($"Número: {n}, Base: {b}");
        Console.WriteLine($"Resultado: {Convertir(n, b)}");
    }

    static int Convertir(int n, int b) {
        Stack<int> pila = new();
        do {
            pila.Push(n % b);
            n /= b;
        } while (n > 0);
        int res = 0;
        int exp = 0;
        while (pila.Count > 0) {
            res += pila.Pop() * (int)Math.Pow(10, exp);
            exp++;
        }
        return res;
    }
}