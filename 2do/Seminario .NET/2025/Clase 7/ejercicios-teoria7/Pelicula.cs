namespace ejercicios_teoria7;

public class Pelicula : IAlquilable
{
    public virtual void SeAlquilaA(Persona p)
    {
        Console.WriteLine($"Alquilando película a persona");
    }
    public virtual void DevueltoPor(Persona p)
    {
        Console.WriteLine($"Película devuelta por persona");
    }
}