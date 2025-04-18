namespace teoria4;

class Persona3 {
    private string? _nombre;
    private int _edad;
    private int _DNI;

    public Persona3(string nombre, int edad, int dni) {
        _nombre = nombre;
        _edad = edad;
        _DNI = dni;
    }
    public void setNombre(string nombre) {
        _nombre = nombre;
    }
    public string getNombre() {
        return _nombre ?? "NaN";
    }
    public int getEdad() {
        return _edad;
    }
    public void setEdad(int edad) {
        _edad = edad;
    }
    public int getDNI() {
        return _DNI;
    }
    public void setDNI(int dni) {
        _DNI = dni;
    }
    public bool EsMayorQue(Persona3 P) {
        return _edad > P.getEdad();
    }
    public void Imprimir() {
        Console.WriteLine(this._nombre + "    " + this._edad + "    " + this._DNI);
    }
}