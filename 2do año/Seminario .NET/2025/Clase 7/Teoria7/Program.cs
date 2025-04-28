using System.Diagnostics;

var watch = Stopwatch.StartNew(); 

IImprimible[] vector = [
    new Moto("Zanella"),
    new Empleado("Juan"),
    new Moto("Gilera")
];
foreach(IImprimible I in vector)
{
    I.Imprimir();
}
try
{
    using StreamReader SR = new StreamReader("fuente.txt");
    using StreamWriter SW = new StreamWriter("destino.txt");
    SW.Write(SR.ReadToEnd());
}
catch (Exception e)
{
    Console.WriteLine(e.Message);
}

watch.Stop(); 
Console.WriteLine($"\nTiempo de ejecución: {watch.Elapsed.TotalMilliseconds} ms");
Console.ReadKey();