IImprimible[] vector = [
    new Moto("Zanella"),
    new Empleado("Juan"),
    new Moto("Gilera")
];

foreach(IImprimible I in vector)
{
    I.Imprimir();
}

StreamReader? SR = null;
StreamWriter? SW = null;
try
{
    SR = new StreamReader("fuente.txt");
    SW = new StreamWriter("destino.txt");
    SW.Write(SR.ReadToEnd());
}
catch (Exception e)
{
    Console.WriteLine(e.Message);
}
finally
{
    SR?.Dispose();
    SW?.Dispose();
}

Console.ReadKey();