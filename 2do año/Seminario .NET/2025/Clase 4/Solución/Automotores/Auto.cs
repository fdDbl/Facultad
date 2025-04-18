namespace Automotores;

public class Auto
{
    private string? _marca;
    private int _modelo;
    
    public Auto(string marca) {
        _marca = marca;
        _modelo = 2022;
    }
    public Auto(string marca, int modelo) {
        _marca = marca;
        _modelo = modelo;
    }
    public string GetDescripcion() =>
        $"Marca: {_marca}; Modelo: {_modelo}.";
}
