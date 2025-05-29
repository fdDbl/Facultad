namespace ejercicios_teoria10;

public class Juego
{
    public int Id { get; private set; }
    public string Nombre { get; set; } = "";
    public string Descripción { get; set; } = "";
    public string Estado { get; set; } = "";
    public double PrecioPorDía { get; set; } = 0;
    
    public Juego(string nom, double p)
    {
        if (string.IsNullOrWhiteSpace(nom))
        {
            throw new ArgumentException("El nombre no puede ser nulo ni estar vacío");
        }
        if (p <= 0)
        {
            throw new ArgumentException("El formato del precio por día no es válido.");
        }
        this.Nombre = nom;
        this.PrecioPorDía = p;
    }
    public Juego() { }
    public override String ToString() =>
        $"Id: {Id}, Nombre: {Nombre}, Descripción: {Descripción}, Estado: {Estado}, Precio por día: {PrecioPorDía}";
}