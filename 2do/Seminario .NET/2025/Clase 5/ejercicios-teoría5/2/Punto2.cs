public class Punto2
{
    public static void Run()
    {
        Console.WriteLine("----- PUNTO 2 -----");
        new Cuenta2();
        new Cuenta2();
        List<Cuenta2> cuentas = Cuenta2.Cuentas;
        // se recuperó la lista de cuentas creadas
        cuentas[0].Depositar(50);
        // se depositó 50 en la primera cuenta de la lista devuelta
        cuentas.RemoveAt(0);
        Console.WriteLine(cuentas.Count);
        // se borró un elemento de la lista devuelta
        // pero la clase Cuenta sigue manteniendo todos
        // los datos "La cuenta id: 1 tiene 50 de saldo"
        cuentas = Cuenta2.Cuentas;
        // se recuperó nuevamente la lista de cuentas
        Console.WriteLine(cuentas.Count);
        cuentas[0].Extraer(30);
        //se extrajo 30 de la cuenta id: 1 que tenía 50 de saldo
    }
}