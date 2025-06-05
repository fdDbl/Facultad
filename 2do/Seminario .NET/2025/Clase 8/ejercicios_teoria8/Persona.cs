namespace ejercicios_teoria8;

public class Persona : IAtendible, INombrable, IComparable
{
    public string Nombre { get; set; }
    public void SeAtiende()
    {
        Console.WriteLine($"Atendiendo persona");
    }
    public int CompareTo(object? obj)
    {
        int result = 0;
        if (obj is Persona p)
        {
            string nombre = p.Nombre;
            result = this.Nombre.CompareTo(nombre);
        }
        return result;
    }
}