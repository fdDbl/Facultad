using ejercicios_teoria8;
using System.Collections;

Console.WriteLine("PUNTO 1");
{
    INombrable[] vector =
    [
        new Persona() { Nombre = "Zulema" },
        new Perro() { Nombre = "Sultán" },
        new Persona() { Nombre = "Claudia" },
        new Persona() { Nombre = "Carlos" },
        new Perro() { Nombre = "Chopper" },
    ];
    Array.Sort(vector); //debe ordenar por Nombre alfabéticamente
    foreach (INombrable n in vector)
    {
        Console.WriteLine($"{n.Nombre}: {n}");
    }
}

Console.WriteLine("PUNTO 2");
{
    INombrable[] vector =
    [
        new Persona() { Nombre = "Ana María" },
        new Perro() { Nombre = "Sultán" },
        new Persona() { Nombre = "Ana" },
        new Persona() { Nombre = "José Carlos" },
        new Perro() { Nombre = "Chopper" }
    ];
    Array.Sort(vector, new ComparadorLongitudNombre()); //ordena por longitud de Nombre
    foreach (INombrable n in vector)
    {
        Console.WriteLine($"{n.Nombre.Length}: {n.Nombre}");
    }
}

Console.WriteLine("PUNTO 3");
{
    IEnumerable Rango(int i, int j, int p)
    {
        List<int> secuencia = new();
        for (; i <= j; i+=p)
            secuencia.Add(i);
        return secuencia;
    }
    IEnumerable Potencias(int b, int k)
    {
        List<int> secuencia = new();
        for (int i = 1; i <= k; i++)
            secuencia.Add((int) Math.Pow(b,i));
        return secuencia;
    }
    IEnumerable DivisiblesPor(IEnumerable e, int i)
    {
        List<int> secuencia = new();
        foreach (int num in e)
            if(num % i == 0) secuencia.Add(num);
        return secuencia;
    }
    
    IEnumerable rango = Rango(6, 30, 3);
    IEnumerable potencias = Potencias(2, 10);
    IEnumerable divisibles = DivisiblesPor(rango, 6);
    foreach (int i in rango)
    {
        Console.Write(i + " ");
    }

    Console.WriteLine();
    foreach (int i in potencias)
    {
        Console.Write(i + " ");
    }

    Console.WriteLine();
    foreach (int i in divisibles)
    {
        Console.Write(i + " ");
    }

    Console.WriteLine();
}

Console.WriteLine("PUNTO 4");
{
    Del1 d1 = delegate (int x) { Console.WriteLine(x); };
    d1(10);
    Del2 d2 = x => Console.WriteLine(x.Length);
    d2(new int[] { 2, 4, 6, 8 });
    Del3 d3 = x =>
    {
        int sum = 0;
        for (int i = 1; i <= x; i++)
        {
            sum += i;
        }
        return sum;
    };
    int resultado = d3(10);
    Console.WriteLine(resultado);
    Del4 d4 = new Del4(LongitudPar);
    Console.WriteLine(d4("hola mundo"));
    bool LongitudPar(string st)
    {
        return st.Length % 2 == 0;
    }
}

Console.WriteLine("PUNTO 5");
{
    int i = 10;
    Action a = delegate
    {
        Console.WriteLine(i);   // obtiene la variable por referencia
    };
    a.Invoke();
    i = 20;
    a.Invoke();
}

Console.WriteLine("PUNTO 6");
{
    Action[] acciones = new Action[10];
    for (int i = 0; i < 10; i++)
    {
        acciones[i] = () => Console.Write(i + " ");
    }
    foreach     (var a in acciones)
    { 
        a.Invoke();
    }
}

Console.WriteLine("\nPUNTO 7");
{
    int[] vector = [1, 2, 3, 4, 5];
    vector.Print("Valores iniciales: ");
    var vector2 = vector.Seleccionar(n => n * 3);
    vector2.Print("Valores triplicados: ");
    vector.Seleccionar(n => n * n).Print("Cuadrados: ");
}

Console.WriteLine("PUNTO 8");
{
    int[] vector =[1, 2, 3, 4, 5];
    vector.Print("Valores iniciales: ");
    vector.Donde(n => n % 2 == 0).Print("Pares: ");
    vector.Donde(n => n % 2 == 1).Seleccionar(n => n * n).Print("Impares al cuadrado: ");
}

Console.ReadKey();
delegate bool Predicado(int n);
delegate int FuncionEntera(int n);
delegate void Del1(int x);
delegate void Del2(int[] x);
delegate int Del3(int x);
delegate bool Del4(string st);