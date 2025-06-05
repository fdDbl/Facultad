namespace ejercicios_teoria7;

public class Libro : IAlquilable, IReciclable
{
    public void SeAlquilaA(Persona p)
    {
        Console.WriteLine($"Alquilando libro a persona");
    }
    public void DevueltoPor(Persona p)
    {
        Console.WriteLine($"Libro devuelto por persona");
    }
    public void SeRecicla()
    {
        Console.WriteLine("Reciclando libro");
    }
}