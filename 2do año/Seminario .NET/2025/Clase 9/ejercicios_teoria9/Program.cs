using ejercicios_teoria9;

Console.WriteLine("PUNTO 1");
{
    List<object> lista = [ "hola", 7, 'A' ];
    string st = Get<string>(lista, 0);
    int i = Get<int>(lista, 1);
    char c = Get<char>(lista, 2);
    Console.WriteLine($"{st} {i} {c}");

    T Get<T>(List<object> t1, int t2)
    {
        return (T) t1[t2];
    }
}

Console.WriteLine("PUNTO 2");
{
    int[] vector1 = [1, 2, 3];
    bool[] vector2 = [true, true, true];
    string[] vector3 = ["uno", "dos", "tres"];
    Set<int>(vector1, 110, 2);
    Set<bool>(vector2, false, 1);
    Set<string>(vector3, "Hola Mundo!", 0);
    Imprimir(vector1);
    Imprimir(vector2);
    Imprimir(vector3);

    void Set<T>(T[] v, T t, int i)
    {
        v[i] = t;
    }
    void Imprimir<T>(T[] v)
    {
        foreach(var t in v)
            Console.Write(t + " ");
        Console.WriteLine();
    }
}

Console.WriteLine("PUNTO 3");
{
    string[] vector1 = CrearArreglo<string>("uno", "dos");
    foreach (string st in vector1) Console.Write(st + " - ");
    Console.WriteLine();
    
    double[] vector2 = CrearArreglo<double>(1, 2.3, 4.1, 6.7);
    foreach (double valor in vector2) Console.Write(valor + " - ");
    Console.WriteLine();
    
    var stb = new System.Text.StringBuilder();
    var a = GetNuevoObjetoDelMismoTipo(stb);
    var b = GetNuevoObjetoDelMismoTipo(17);
    Console.WriteLine(a.GetType());
    Console.WriteLine(b.GetType());

    T[] CrearArreglo<T>(params T[] p)
    {
        return p;
    }
    T GetNuevoObjetoDelMismoTipo<T>(T t) where T : new()
    {
        return new T();
    }
}

Console.WriteLine("PUNTO 4");
{
    var lista = new ListaEnlazada<int>();
    lista.AgregarAdelante(3);
    lista.AgregarAdelante(100);
    lista.AgregarAtras(10);
    lista.AgregarAtras(11);
    lista.AgregarAdelante(0);
    IEnumerator<int> enumerador = lista.GetEnumerator();
    while (enumerador.MoveNext())
    {
        int i = enumerador.Current;
        Console.Write(i + " ");
    }
    Console.WriteLine();
}

Console.WriteLine("PUNTO 5");
{
    int[] vector = [1, 2, 3];
    vector.ForEach(i => Console.Write(i + ","));
    "Hola Mundo".ForEach(c => Console.Write(c + ","));
}

Console.WriteLine("PUNTO 6");
{
    int[] vector = [1, 2, 3, 4, 5];
    vector.Donde(i => i > 3) // IEnumerable<int> : 4, 5
        .Seleccionar(i => i * 10) // IEnumerable<int> : 40, 50
        .Seleccionar(i => $"({i})") // IEnumerable<string> : "(40)", "(50)"
        .ForEach(Console.WriteLine);
}

Console.WriteLine("PUNTO 7");
{
    var regla1 = new ReglaValidacion<Persona>(p => p.Nombre != "", "Falta el nombre");
    var regla2 = new ReglaValidacion<Persona>(p => p.Edad <= 35, "Edad excedida");
    var regla3 = new ReglaValidacion<Persona>(p => p.Edad >= 18, "Menor de edad");
    var validadorPersona = new Validador<Persona>()
        .AgregarRegla(regla1)
        .AgregarRegla(regla2)
        .AgregarRegla(regla3);
    var pedro = new Persona { Nombre = "Pedro", Edad = 17 };
    var ana = new Persona { Nombre = "", Edad = 16 };
    var maria = new Persona { Nombre = "María", Edad = 44 };
    var jose = new Persona { Nombre = "José", Edad = 30 };
    Validar(pedro, validadorPersona);
    Validar(ana, validadorPersona);
    Validar(maria, validadorPersona);
    Validar(jose, validadorPersona);
    void Validar(Persona p, Validador<Persona> validadorPersona)
    {
        List<string> listaErrores;
        bool esValido = validadorPersona.Validar(p, out listaErrores);
        Console.WriteLine($"Validando a {p} ==> {esValido}");
        listaErrores.ForEach(st => System.Console.WriteLine(" * " + st));
    }
}

Console.ReadKey();

public delegate bool Predicado<T>(T n);