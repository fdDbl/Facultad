namespace ejercicios_teoria9;

public class Persona
{
    public string Nombre { get; set; }
    public int Edad { get; set; }

    public override string ToString()
    {
        return $"{Nombre} de {Edad} años";
    }
    
}