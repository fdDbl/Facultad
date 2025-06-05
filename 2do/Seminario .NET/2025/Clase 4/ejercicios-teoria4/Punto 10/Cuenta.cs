using System.Diagnostics;

class Cuenta {
    private double _monto;
    private int _titularDNI;
    private string? _titularNombre;

    public Cuenta() {
        _monto = 0;
        _titularNombre = "No especificado";
        _titularDNI = -1;
    }
    public Cuenta(int dni) : this() {
        _titularDNI = dni;
    }
    public Cuenta(string nom) : this() {
        _titularNombre = nom;
    }
    public Cuenta(string nom, int dni) : this() {
        _titularNombre = nom;
        _titularDNI = dni;
    }
    public void Imprimir() {
        Console.WriteLine($"Nombre: {_titularNombre}, DNI: {(_titularDNI == -1 ? "No especificado" : _titularDNI)}, Monto: {_monto}");
    }
    public void Depositar(double n) {
        _monto += n;
    }
    public void Extraer(double n) {
        if (_monto >= n)
            _monto -= n;
        else
            Console.WriteLine("Operación cancelada, monto insuficiente.");
    }
}