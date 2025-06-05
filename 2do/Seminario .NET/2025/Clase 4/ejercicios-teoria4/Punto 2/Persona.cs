namespace teoria4;

class Persona2 {
    private string? _nombre;
    private int _edad;
    private int _DNI;

    public Persona2(string nombre, int edad, int dni) {
        _nombre = nombre;
        _edad = edad;
        _DNI = dni;
    }

    public void Imprimir() {
        Console.WriteLine(this._nombre + "    " + this._edad + "    " + this._DNI);
    }
}