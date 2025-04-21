namespace Teoría6;
class Colectivo : Automotor
{
    private int _cantPasajeros;

    public override int Modelo
    {
        protected set => base.Modelo = (value < 2015) ? 2015 : value;
    }
    public Colectivo(string marca, int modelo, int cantPasajeros):base(marca, modelo) {
        _cantPasajeros = cantPasajeros;
    }

    public override void Imprimir()
    {
        Console.Write($"Cantidad de pasajeros: {_cantPasajeros}; ");
        base.Imprimir();
    }
}