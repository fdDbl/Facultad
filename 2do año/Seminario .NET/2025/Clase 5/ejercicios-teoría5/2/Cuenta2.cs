using System.Globalization;

public class Cuenta2
{
    private static int s_idAct;
    private static int s_cantCuentas;
    private static int s_cantDepo;
    private static int s_cantExt;
    private static double s_totalDepo;
    private static double s_totalExt;
    private static double s_saldo;
    private static int s_cantExtDenegadas;
    private static List<Cuenta2> s_cuentas = new();

    public static List<Cuenta2> Cuentas
    {
        get => new(s_cuentas);      // Punto 3
    }

    private int _id;
    private double _saldo;

    public Cuenta2()
    {
        _id = ++s_idAct;
        s_cantCuentas++;
        Console.WriteLine($"Se ha creado la cuenta con ID {_id}");
        s_cuentas.Add(this);
    }

    public Cuenta2 Depositar(double d)
    {
        _saldo += d;
        s_saldo += d;
        s_totalDepo += d;
        s_cantDepo++;
        Console.WriteLine($"Se depositó ${d} en la cuenta {_id} (Saldo = ${_saldo})");
        return this;
    }

    public Cuenta2 Extraer(double d)
    {
        if (_saldo >= d)
        {
            _saldo -= d;
            s_saldo -= d;
            s_cantExt++;
            s_totalExt += d;
            Console.WriteLine($"Se extrajo ${d} de la cuenta {_id} (Saldo = ${_saldo})");
        }
        else
        {
            Console.WriteLine("Operación denegada - Saldo insuficiente");
            s_cantExtDenegadas++;
        }
        return this;
    }

    public static void ImprimirDetalle()
    {
        Console.WriteLine($"CUENTAS CREADAS:    {s_cantCuentas}");
        Console.WriteLine($"DEPÓSITOS:          {s_cantDepo}        -Total depositado:  ${s_totalDepo}");
        Console.WriteLine($"EXTRACCIONES:       {s_cantExt}        -Total extraído:    ${s_totalExt}");
        Console.WriteLine($"                             -Saldo:             ${s_saldo}");
        if (s_cantExtDenegadas > 0)
            Console.WriteLine($"* Se denegaron {s_cantExtDenegadas} extracciones por falta de fondos");
    }
}