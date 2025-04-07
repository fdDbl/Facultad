using System;
using System.Data;

namespace teoria4;

public class Auto
{
    private string? _marca;
    private int _modelo;
    
    public Auto(String marca){
        this._marca = marca;
        this._modelo = DateTime.Now.Year;
    }
    public Auto(string marca, int modelo) {
        
    }

    public string ObtenerDescripción() =>
        $"Auto. Marca: {_marca}; Modelo: {_modelo}.";
}
