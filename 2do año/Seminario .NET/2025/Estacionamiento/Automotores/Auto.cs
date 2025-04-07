namespace Automotores;

public class Auto
{
    private string? _marca;
    private int _modelo;
    
    public Auto(String marca){
        this._marca = marca;
        this._modelo = DateTime.Now.Year; // se crea un 0km
    }
    public Auto(string marca, int modelo) {
        this._marca = marca;
        this._modelo = modelo;
    }

    public string ObtenerDescripción() =>
        $"Auto. Marca: {_marca}; Modelo: {_modelo}.";
}
