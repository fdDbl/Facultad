using System;
using System.Collections.Generic;
using System.Text;

class Program
{
    static void Main(string[] args)
    {
        bool continuar = true;
        while (continuar)
        {
            Console.Clear();
            Console.WriteLine("Seleccione un punto (1-17) o 0 para salir:");
            for (int i = 1; i <= 17; i++)
                Console.WriteLine($"{i}. Punto {i}");
            
            if (int.TryParse(Console.ReadLine(), out int opcion))
            {
                if (opcion == 0)
                {
                    continuar = false;
                }
                else if (opcion >= 1 && opcion <= 17)
                {
                    Console.Clear();
                    switch (opcion)
                    {
                        case 1: Punto1.Ejecutar(); break;
                        case 2: Punto2.Ejecutar(); break;
                        case 3: Punto3.Ejecutar(); break;
                        case 4: Punto4.Ejecutar(); break;
                        case 5: Punto5.Ejecutar(); break;
                        case 6: Punto6.Ejecutar(); break;
                        case 7: Punto7.Ejecutar(); break;
                        case 8: Punto8.Ejecutar(); break;
                        case 9: Punto9.Ejecutar(); break;
                        case 10: Punto10.Ejecutar(); break;
                        case 11: Punto11.Ejecutar(); break;
                        case 12: Punto12.Ejecutar(); break;
                        case 13: Punto13.Ejecutar(); break;
                        case 14: Punto14.Ejecutar(); break;
                        case 15: Punto15.Ejecutar(); break;
                        case 16: Punto16.Ejecutar(); break;
                        case 17: Punto17.Ejecutar(); break;
                    }
                    Console.WriteLine("\nPresione Enter para continuar...");
                    Console.ReadLine();
                }
            }
        }
    }
}

class Punto1
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 1 ---");
        Console.CursorVisible = false;
        ConsoleKeyInfo k = Console.ReadKey(true);
        while (k.Key != ConsoleKey.Escape)
        {
            Console.Clear();
            Console.Write($"{k.Modifiers}-{k.Key}-{k.KeyChar}");
            k = Console.ReadKey(true);
        }
        Console.CursorVisible = true;
    }
}

class Punto2
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 2 ---");
        double[,] matriz1 = new double[4, 6];
        for (int k = 0; k < matriz1.GetLength(0) * matriz1.GetLength(1); k++)
            matriz1[k / matriz1.GetLength(1), k % matriz1.GetLength(1)] = k;
        ImprimirMatriz(matriz1);
    }

    public static void ImprimirMatriz(double[,] matriz)
    {
        for (int k = 0; k < matriz.GetLength(0) * matriz.GetLength(1); k++)
        {
            Console.Write(matriz[k / matriz.GetLength(1), k % matriz.GetLength(1)]);
            Console.Write((k % matriz.GetLength(1) < matriz.GetLength(1) - 1) ? " " : "\n");
        }
    }
}

class Punto3
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 3 ---");
        double[,] matriz1 = new double[4, 6];
        for (int k = 0; k < matriz1.GetLength(0) * matriz1.GetLength(1); k++)
            matriz1[k / matriz1.GetLength(1), k % matriz1.GetLength(1)] = k;
        Console.WriteLine("Ingrese su plantilla de formato:");
        string? formato = Console.ReadLine();
        ImprimirMatrizConFormato(matriz1, formato);
    }

    static void ImprimirMatrizConFormato(double[,] matriz, string? formatString)
    {
        for (int k = 0; k < matriz.GetLength(0) * matriz.GetLength(1); k++)
        {
            Console.Write(matriz[k / matriz.GetLength(1), k % matriz.GetLength(1)].ToString(formatString));
            Console.Write((k % matriz.GetLength(1) < matriz.GetLength(1) - 1) ? " " : "\n");
        }
    }
}

class Punto4
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 4 ---");
        double[,] matrizCuadrada = new double[6, 6];
        for (int k = 0; k < Math.Pow(matrizCuadrada.GetLength(0), 2); k++)
            matrizCuadrada[k / matrizCuadrada.GetLength(1), k % matrizCuadrada.GetLength(1)] = k;

        var array = GetDiagonalPrincipal(matrizCuadrada);
        Console.WriteLine("Diagonal principal:");
        ImprimirArreglo(array);

        array = GetDiagonalSecundaria(matrizCuadrada);
        Console.WriteLine("\nDiagonal secundaria:");
        ImprimirArreglo(array);
    }

    static void ImprimirArreglo(double[] array)
    {
        foreach (double a in array)
            Console.Write(a + " ");
    }

    static double[] GetDiagonalPrincipal(double[,] matriz)
    {
        double[] aux = new double[6];
        for (int i = 0; i < matriz.GetLength(1); i++)
            aux[i] = matriz[i, i];
        return aux;
    }

    static double[] GetDiagonalSecundaria(double[,] matriz)
    {
        double[] aux = new double[6];
        int j = 5;
        for (int i = 0; i < matriz.GetLength(1); i++, j--)
            aux[i] = matriz[i, j];
        return aux;
    }
}

class Punto5
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 5 ---");
        double[,] matriz1 = new double[4, 6];
        for (int k = 0; k < matriz1.GetLength(0) * matriz1.GetLength(1); k++)
            matriz1[k / matriz1.GetLength(1), k % matriz1.GetLength(1)] = k;
        ImprimirArregloDeArreglo(GetArregloDeArreglo(matriz1));
    }

    static void ImprimirArregloDeArreglo(double[][] arrayarray)
    {
        foreach (double[] columna in arrayarray)
        {
            Console.WriteLine("Columna");
            foreach (double element in columna)
                Console.WriteLine(element);
        }
    }

    static double[][] GetArregloDeArreglo(double[,] matriz)
    {
        double[][] aux = new double[matriz.GetLength(0)][];
        for (int i = 0; i < matriz.GetLength(0); i++)
            aux[i] = new double[matriz.GetLength(1)];

        for (int i = 0; i < matriz.GetLength(0) * matriz.GetLength(1); i++)
            aux[i / matriz.GetLength(1)][i % matriz.GetLength(1)] = matriz[i / matriz.GetLength(1), i % matriz.GetLength(1)];
        return aux;
    }
}

class Punto6
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 6 ---");
        double[,] A = new double[2, 2] { { 1, 2 }, { 3, 4 } };
        double[,] B = new double[2, 2] { { 5, 6 }, { 7, 8 } };
        
        var suma = Suma(A, B);
        if (suma != null) Punto2.ImprimirMatriz(suma);
        
        var resta = Resta(A, B);
        if (resta != null) Punto2.ImprimirMatriz(resta);
        
        var producto = Multiplicacion(A, B);
        Punto2.ImprimirMatriz(producto);
    }

    static bool SameSize(double[,] A, double[,] B)
    {
        return A.GetLength(0) == B.GetLength(0) && A.GetLength(1) == B.GetLength(1);
    }

    static bool SameColumnsRows(double[,] A, double[,] B)
    {
        return A.GetLength(1) == B.GetLength(0);
    }

    static double[,]? Suma(double[,] A, double[,] B)
    {
        if (!SameSize(A, B))
            return null;
        double[,] suma = new double[A.GetLength(0), A.GetLength(1)];
        for (int i = 0; i < A.GetLength(0) * A.GetLength(1); i++)
            suma[i / suma.GetLength(1), i % suma.GetLength(1)] = A[i / A.GetLength(1), i % A.GetLength(1)] + B[i / B.GetLength(1), i % B.GetLength(1)];
        return suma;
    }

    static double[,]? Resta(double[,] A, double[,] B)
    {
        if (!SameSize(A, B))
            return null;
        double[,] resta = new double[A.GetLength(0), A.GetLength(1)];
        for (int i = 0; i < A.GetLength(0) * A.GetLength(1); i++)
            resta[i / resta.GetLength(1), i % resta.GetLength(1)] = A[i / A.GetLength(1), i % A.GetLength(1)] - B[i / B.GetLength(1), i % B.GetLength(1)];
        return resta;
    }

    static double[,] Multiplicacion(double[,] A, double[,] B)
    {
        if (!SameColumnsRows(A, B))
            throw new ArgumentException("Multiplicación inválida.");
        
        int filasA = A.GetLength(0);
        int columnasA = A.GetLength(1);
        int columnasB = B.GetLength(1);
        double[,] producto = new double[filasA, columnasB];
        for (int i = 0; i < filasA; i++)
            for (int j = 0; j < columnasB; j++)
            {
                producto[i, j] = 0;
                for (int k = 0; k < columnasA; k++)
                    producto[i, j] += A[i, k] * B[k, j];
            }
        return producto;
    }
}

class Punto7
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 7 ---");
        int i = 10; // int
        var x = i * 1.0; // double
        var y = 1f; // float
        var z = i * y; // single
        Console.WriteLine($"i: {i}, x: {x}, y: {y}, z: {z}");
    }
}

class Punto8
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 8 ---");
        object obj = new int[10];
        dynamic dyna = 13;
        Console.WriteLine("obj es un arreglo, dyna es un entero");
    }
}

class Punto9
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 9 ---");
        var a = 3L;
        dynamic b = 32;
        object obj = 3;
        b = b * 2.0;
        b = "hola";
        obj = b;
        b = b + 11;
        var c = new { Nombre = "Juan" };
        var d = new { Nombre = "María" };
        var e = new { Nombre = "Maria", Edad = 20 };
        var f = new { Edad = 20, Nombre = "Maria" };
        d = c;
        
        Console.WriteLine($"a: {a}, b: {b}, obj: {obj}");
        Console.WriteLine($"c.Nombre: {c.Nombre}, d.Nombre: {d.Nombre}");
        Console.WriteLine($"e.Nombre: {e.Nombre}, e.Edad: {e.Edad}");
        Console.WriteLine($"f.Nombre: {f.Nombre}, f.Edad: {f.Edad}");
    }
}

class Punto10
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 10 ---");
        double d = 3.141592;
        Console.WriteLine("{0:0.000}", d);
        Console.WriteLine($"{d:0.000}");
    }
}

class Punto11
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 11 ---");
        List<int> a = [1, 2, 3, 4];
        a.Remove(5);
        Console.WriteLine("Lista después de Remove(5):");
        foreach (var item in a)
            Console.Write(item + " ");
    }
}

class Punto12
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 12 ---");
        string expresion = "[(a + b) * (d / e)] + (a - e) - d";
        Console.WriteLine(EsBalanceado(expresion));
    }

    static bool EsBalanceado(string exp)
    {
        if (exp.Length == 0)
            return false;
        Stack<char> pila = new();
        char[] expArray = exp.ToCharArray();
        foreach (char c in expArray)
        {
            if ((c == '(') || (c == '[') || (c == '{'))
                pila.Push(c);
            else if ((c == ')') || (c == ']') || (c == '}'))
            {
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

class Punto13
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 13 ---");
        Console.WriteLine("Ingrese el número a convertir y la base a la cuál convertir ese número, separados por un espacio:");
        string? calc = Console.ReadLine();
        
        if (string.IsNullOrEmpty(calc) || !calc.Contains(' '))
            Console.WriteLine("Formato inválido.");
        else
        {
            int esp = calc.IndexOf(' ');
            string numStr = calc.Substring(0, esp);
            string baseStr = calc.Substring(esp + 1);
            int n = int.Parse(numStr);
            int b = int.Parse(baseStr);
            Console.WriteLine($"Número: {n}, Base: {b}");
            Console.WriteLine($"Resultado: {Convertir(n, b)}");
        }
    }

    static int Convertir(int n, int b)
    {
        Stack<int> pila = new();
        do
        {
            pila.Push(n % b);
            n /= b;
        } while (n > 0);
        int res = 0;
        int exp = 1;
        
        while (pila.Count > 0) {
            res += pila.Pop() * (int)Math.Pow(10, exp);
            exp++;
        }
        return res;
    }
}

class Punto14
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 14 ---");
        Queue<int> cola = new();
        string abc = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ ";
        Console.Write("Ingrese la clave de codificación: ");
        string? clave = Console.ReadLine();
        Console.Write("Ingrese el mensaje a codificar: ");
        StringBuilder mensaje = new StringBuilder(Console.ReadLine());

        for (int i = 0; i < clave.Length; i++)
            cola.Enqueue(clave.ToCharArray().ElementAt(i) - 0x30);

        for (int i = 0; i < mensaje.Length; i++)
        {
            int suma = abc.IndexOf(mensaje[i]) + cola.Peek();
            if (suma > 28)
                suma -= 28;
            mensaje[i] = abc[suma];
            cola.Enqueue(cola.Dequeue());
        }

        Console.WriteLine(mensaje);
    }
}

class Punto15
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 15 ---");
        int x = 0;
        try
        {
            Console.WriteLine("Resultado 1: " + 1.0 / x);
            Console.WriteLine("Resultado 2: " + 1 / x);
            Console.WriteLine("todo OK");
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
    }
}

class Punto16
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 16 ---");
        double suma = 0;
        string? st = Console.ReadLine();
        while (!String.IsNullOrEmpty(st))
        {
            try
            {
                suma += double.Parse(st);
                Console.WriteLine(suma);
            }
            catch (Exception E)
            {
                Console.WriteLine("Usuario, tiene un ERROR: " + E.Message);
            }
            finally
            {
                st = Console.ReadLine();
            }
        }
    }
}

class Punto17
{
    public static void Ejecutar()
    {
        Console.WriteLine("--- PUNTO 17 ---");
        try
        {
            Metodo1();
        }
        catch
        {
            Console.WriteLine("Método 1 propagó una excepción no tratada");
        }
        try
        {
            Metodo2();
        }
        catch
        {
            Console.WriteLine("Método 2 propagó una excepción no tratada");
        }
        try
        {
            Metodo3();
        }
        catch
        {
            Console.WriteLine("Método 3 propagó una excepción");
        }
    }

    static void Metodo1()
    {
        object obj = "hola";
        try
        {
            int i = (int)obj;
        }
        finally
        {
            Console.WriteLine("Bloque finally en Metodo1");
        }
    }

    static void Metodo2()
    {
        object obj = "hola";
        try
        {
            int i = (int)obj;
        }
        catch (OverflowException)
        {
            Console.WriteLine("Overflow");
        }
    }

    static void Metodo3()
    {
        object obj = "hola";
        try
        {
            int i = (int)obj;
        }
        catch (InvalidCastException)
        {
            Console.WriteLine("Excepción InvalidCast en Metodo3");
            throw;
        }
    }
}