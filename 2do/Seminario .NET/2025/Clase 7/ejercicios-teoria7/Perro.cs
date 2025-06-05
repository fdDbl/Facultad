namespace ejercicios_teoria7;

public class Perro : IVendible, IAtendible, ILavable
{
    public void SeAtiende()
    {
        Console.WriteLine($"Atendiendo perro");
    }
    public void SeLava()
    {
        Console.WriteLine("Lavando perro");
    }
    public void SeSeca()
    {
        Console.WriteLine("Secando perro");
    }
    public void SeVendeA(Persona p)
    {
        Console.WriteLine($"Vendiendo perro a persona");
    }
}