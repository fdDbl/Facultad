namespace ejercicios_teoria7;

public class Auto : ILavable, IVendible, IReciclable
{
    public void SeVendeA(Persona p)
    {
        Console.WriteLine($"Vendiendo auto a persona");
    }
    public void SeLava()
    {
        Console.WriteLine("Lavando auto");
    }
    public void SeSeca()
    {
        Console.WriteLine("Secando auto");
    }
    public void SeRecicla()
    {
        Console.WriteLine("Reciclando auto");
    }
}