namespace ejercicios_teoria8;

public class Perro : IVendible, IAtendible, ILavable, INombrable, IComparable
{
    public string Nombre { get; set; }

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
    public int CompareTo(object? obj)
    {
        int result = 0;
        if (obj is Perro p)
        {
            string nombre = p.Nombre;
            result = this.Nombre.CompareTo(nombre);
        }
        return result;
    }
}