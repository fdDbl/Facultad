using System.Text;
class Nueve {
    public static void Resolver() {
        DateTime inicio = DateTime.Now;
        StringBuilder SB = new StringBuilder("Me llamo SB");
        SB[2] = '_';
        SB[8] = '_';
        Console.WriteLine(SB);
        DateTime fin = DateTime.Now;
        TimeSpan tiempo = fin - inicio;
        Console.WriteLine(tiempo.Milliseconds);

        inicio = DateTime.Now;
        string ST = "Modificame todo y cambiá mi referencia";
        ST = "Modificado";
        Console.WriteLine(ST);
        fin = DateTime.Now;
        tiempo = fin - inicio;
        Console.WriteLine(tiempo.Microseconds);
    }
}