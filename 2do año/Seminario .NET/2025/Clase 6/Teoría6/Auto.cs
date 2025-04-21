namespace Teoría6;
class Auto : Automotor 
{
    private TipoAuto _tipo;
    public Auto(string marca, int modelo, TipoAuto tipo) : base(marca, modelo) {
        _tipo = tipo;
    }
    public override void Imprimir()
    {
        Console.Write("Colectivo ");
        base.Imprimir();
    }
}