public class Punto1
{
    public static void Run()
    {
        Console.WriteLine("----- PUNTO 1 -----");
        Cuenta1 c1 = new Cuenta1();
        c1.Depositar(100).Depositar(50).Extraer(120).Extraer(50);
        Cuenta1 c2 = new Cuenta1();
        c2.Depositar(200).Depositar(800);
        new Cuenta1().Depositar(20).Extraer(20);
        c2.Extraer(1000).Extraer(1);
        Console.WriteLine("\nDETALLE");
        Cuenta1.ImprimirDetalle();
    }
}