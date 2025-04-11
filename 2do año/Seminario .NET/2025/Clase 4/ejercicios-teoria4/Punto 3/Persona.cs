namespace teoria4;

public class Persona3 {
    private string? _nombre;
    private int _edad;
    private int _DNI;

    public Persona3(string nombre, int edad, int dni) {
        _nombre = nombre;
        _edad = edad;
        _DNI = dni;
    }
    public string getNombre() {
        return this._nombre;
    }
    public void setNombre(string nombre) {
        this._nombre = nombre;
    }
    public int getEdad() {
        return this._edad;
    }
    public void setEdad(int edad) {
        this._edad = edad;
    }
    public int getDNI() {
        return this._DNI;
    }
    public void setDNI(int dni) {
        this._DNI = dni;
    }
    public bool EsMayorQue(Persona3 P) {
        if(this._edad >P.getEdad())
            return true;
        return false;
    }
    public void Imprimir() {
        Console.WriteLine(this._nombre + "    " + this._edad + "    " + this._DNI);
    }
}