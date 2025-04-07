using System;

class Program
{
    static void Main(string[] args)
    {
        bool continuar = true;
        while (continuar)
        {
            Console.Clear();
            Console.WriteLine("Seleccione un punto (1-16) o 0 para salir:");
            for (int i = 1; i <= 16; i++)
                Console.WriteLine($"{i}. Punto {i}");
            
            if (int.TryParse(Console.ReadLine(), out int opcion))
            {
                if (opcion == 0)
                {
                    continuar = false;
                }
                else if (opcion >= 1 && opcion <= 16)
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
        Console.WriteLine("--------- Punto 1 ---------");
        while (Console.ReadKey().Key != ConsoleKey.Enter) { }
        string st1 = "Hola ";
        Console.Write(st1);
        while (Console.ReadKey().Key != ConsoleKey.Enter) { }
        Console.Write(st1 += "Mundo");
    }
}

class Punto2
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 2 ---------");
        Console.WriteLine("Holaaa Mundo\nHello World\tHi everyone\nChau\\");
    }
}

class Punto3
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 3 ---------");
        string st2 = "c:\\windows\\system";
        Console.WriteLine(st2);
    }
}

class Punto4
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 4 ---------");
        string msj = Console.ReadLine();
        Console.WriteLine((string.IsNullOrWhiteSpace(msj)) ? "Hola mundo" : ("Bienvenido seas " + msj));
    }
}

class Punto5
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 5 ---------");
        string msj = Console.ReadLine();
        string impresion = msj switch
        {
            "Juan" => "¡Hola Amigo!",
            "María" => "Buenos días Señora",
            "Alberto" => "Hola Alberto",
            "" => "¡Buen día Mundo!",
            _ => "Buen día " + msj
        };
        Console.WriteLine(impresion);
    }
}

class Punto6
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 6 ---------");
        string msj = Console.ReadLine();
        while (msj != "")
        {
            Console.WriteLine(msj.Length);
            msj = Console.ReadLine();
        }
    }
}

class Punto7
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 7 ---------");
        Console.WriteLine("100".Length);
    }
}

class Punto8
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 8 ---------");
        string st;
        Console.WriteLine(st = Console.ReadLine());
    }
}

class Punto9
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 9 ---------");
        Console.WriteLine("-- SIMETRÍA DE PALABRAS --");
        Console.WriteLine("Palabras:");
        string palabras = Console.ReadLine();
        int pri;
        int ult = palabras.Length - 1;
        bool simetricas = true;
        if (!string.IsNullOrEmpty(palabras) && palabras[palabras.Length / 2] != ' ')
        {
            simetricas = false;
        }
        else
        {
            for (pri = 0; pri < (palabras.Length / 2); pri++, ult--)
            {
                if (palabras[pri] != palabras[ult])
                {
                    simetricas = false;
                    break;
                }
                else if (char.IsWhiteSpace(palabras[pri]))
                    break;
            }
        }
        Console.WriteLine(simetricas ? "Son simétricas" : "No son simétricas");
    }
}

class Punto10
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 10 ---------");
        const int n = 17;
        const int m = 29;
        Console.WriteLine("Múltiplos de 17 o 29 entre 1 y 1000:");
        for (int i = 1; i < 1000; i++)
        {
            if (i % n == 0 || i % m == 0)
                Console.WriteLine(i);
        }
    }
}

class Punto11
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 11 ---------");
        Console.WriteLine("10/3 = " + 10 / 3);
        Console.WriteLine("10.0/3 = " + 10.0 / 3);
        Console.WriteLine("10/3.0 = " + 10 / 3.0);
        int a = 10, b = 3;
        Console.WriteLine("Si a y b son variables enteras, si a=10 y b=3");
        Console.WriteLine("entonces a/b = " + a / b);
        double c = 3;
        Console.WriteLine("Si c es una variable double, c=3");
        Console.WriteLine("entonces a/c = " + a / c);
    }
}

class Punto12
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 12 ---------");
        Console.WriteLine("Ingrese el entero para ver sus divisores:");
        string entString = Console.ReadLine();
        if (!string.IsNullOrWhiteSpace(entString))
        {
            int ent = int.Parse(entString);
            for (int i = 1; i <= ent; i++)
                if (ent % i == 0)
                    Console.WriteLine(i);
        }
    }
}

class Punto13
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 13 ---------");
        int aa = 50;
        int bb = 0;
        if ((bb != 0) && (aa / bb > 5))
            Console.WriteLine(aa / bb);
        else
            Console.WriteLine("No se puede dividir por cero");
    }
}

class Punto14
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 14 ---------");
        int aaa = 10;
        int bbb = 20;
        int menor = (aaa < bbb) ? aaa : bbb;
        Console.WriteLine($"El menor valor es: {menor}");
    }
}

class Punto15
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 15 ---------");
        for (int i = 1; i <= 10;)
        {
            Console.WriteLine(i++);
        }
    }
}

class Punto16
{
    public static void Ejecutar()
    {
        Console.WriteLine("--------- Punto 16 ---------");
        int j = 1;
        if (--j == 0)
        {
            Console.WriteLine("cero");
        }
        if (j++ == 0)
        {
            Console.WriteLine("cero");
        }
        Console.WriteLine(j);
    }
}