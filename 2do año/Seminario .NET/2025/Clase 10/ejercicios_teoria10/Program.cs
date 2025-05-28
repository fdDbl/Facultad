using static System.Linq.Enumerable;

Console.WriteLine("PUNTO 1");
{
    var listaA = Range(0, 21).Select(n => 100 + n * 5); // solución mucho más eficiente que tomar el rango (100,101) y luego filtrar con where
    var listaB = Range(2, 98).Where(n => Range(2, (int)Math.Sqrt(n) - 1).All(i => n % i != 0));
    var listaC = Range(0, 10).Select(n => Math.Pow(2, n)).ToList(); // ToList() me salva de enumerar de nuevo cada vez que calculo suma y promedio
    var suma = listaC.Sum();
    var promedio = listaC.Average();
    var listaE = Range(1, 20).Where(n => n * n % 10 == 6);
    var listaF = Range(0, 7).Select(d => (DayOfWeek)d).Where(dw => dw.ToString().Contains('u'));

    Console.WriteLine("--- Elementos de Lista A ---");
    foreach (var item in listaA)
    {
        Console.WriteLine(item);
    }
    Console.WriteLine("--- Elementos de Lista B ---");
    foreach (var item in listaB)
    {
        Console.WriteLine(item);
    }
    Console.WriteLine("--- Elementos de Lista C ---");
    foreach (var item in listaC)
    {
        Console.WriteLine(item);
    }
    Console.WriteLine($"Suma: {suma}\nPromedio: {promedio}");
    Console.WriteLine("--- Elementos de Lista E ---");
    foreach (var item in listaE)
    {
        Console.WriteLine(item);
    }
    Console.WriteLine("--- Elementos de Lista F ---");
    foreach (var item in listaF)
    {
        Console.WriteLine(item);
    }
}

Console.WriteLine("PUNTO 2");
{
    int[] vector = [1, 3, 4, 5, 9, 4, 3, 4, 5, 1, 1, 4, 9, 4, 3, 1];
    vector.GroupBy(n => n)
        // 1. Proyectar cada grupo a un nuevo objeto con el número y su conteo.
        .Select(g => new { Numero = g.Key, Cantidad = g.Count() })
        // 2. Ordenar los nuevos objetos por la cantidad de repeticiones.
        .OrderBy(obj => obj.Cantidad)
        // 3. Convertir a una Lista para poder usar .ForEach (ver explicación abajo).
        .ToList()
        // 4. Iterar sobre la lista final e imprimir cada objeto.
        .ForEach(obj => Console.WriteLine(obj));
}

Console.ReadKey();