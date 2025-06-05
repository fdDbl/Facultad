public class Cuenta {
    private int _nroCuenta;
    private string? _titularPrincipal;
    private double _saldo;
    private static double s_balance = 0;
    public Cuenta() {
        _nroCuenta = -1;
    }
    public Cuenta(int nro, string? tit) {
        _nroCuenta = nro;
        _titularPrincipal = _nroCuenta == -1 ? null : tit;
        _saldo = 0;
    }
    public bool Available() {
        return _nroCuenta != -1;
    }
    public void ImprimirResumen() {
        if(Available()) {
            Console.WriteLine("----- RESUMEN DE CUENTA -----");
            Console.WriteLine($"Número de cuenta: {_nroCuenta}");
            Console.WriteLine($"Titular principal: {_titularPrincipal}");
            Console.WriteLine($"Saldo de cuenta: {_saldo}");
        } else Console.WriteLine("No hay datos.");
    }
    public void Depositar(double din) {
        if(Available()) {
            _saldo += din;
            s_balance += din;
        }
    }
    public void Inicializar(int nro, string? tit) {
        if(!Available()) {
            _nroCuenta = nro;
            _titularPrincipal = _nroCuenta == -1 ? null : tit;
            _saldo = 0;
        }
    }
    public static void ImprimirBalance() => Console.WriteLine(s_balance);
}