using System.Globalization;

namespace ejercicios_teoria10;

public class Alquiler
{
    public int Id { get; private set; }
    public int IdCliente { get; set; } = int.MinValue;
    public int IdJuego { get; set; } = int.MinValue;
    public string Fecha { get; set; } = "";
    public string FechaTentativaDevolución { get; set; } = "";
    public string FechaDevolución { get; set; } = "";
    public double CostoTotal { get; set; } = 0;
    public List<Cliente>? Clientes { get; set; }
    public List<Juego>? Juegos { get; set; }
    
    public Alquiler(int idc, int idj, double c, string? f)
    {
        if (c <= 0)
            throw new ArgumentException("El alquiler debe tener un costo total positivo.");
        if(!DateTime.TryParse(f,out var fParsed))
            throw new ArgumentException("Fecha inválida.");

        this.CostoTotal = c;
        this.IdCliente = idc;
        this.IdJuego = idj;
        this.Fecha = DateTime.Now.ToString(CultureInfo.CurrentCulture);
        this.FechaDevolución = fParsed.ToString(CultureInfo.CurrentCulture);
    }
    public Alquiler() { }
}