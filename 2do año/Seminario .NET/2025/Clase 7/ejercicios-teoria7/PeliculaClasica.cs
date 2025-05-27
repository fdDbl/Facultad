namespace ejercicios_teoria7;

public class PeliculaClasica : Pelicula, IVendible, IAlquilable
{
    public void SeVendeA(Persona p)
    {
        Console.WriteLine($"Vendiendo película clásica a persona");
    }
    public override void SeAlquilaA(Persona p)
    {
        Console.WriteLine($"Alquilando película clásica a persona");
    }
    public override void DevueltoPor(Persona p)
    {
        Console.WriteLine($"Película clásica devuelta por persona");
    }
}