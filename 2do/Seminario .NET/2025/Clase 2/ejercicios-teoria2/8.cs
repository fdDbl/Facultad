using System.Text;
class Ocho {
    public static void Resolver() {
        // StringBuilder representa una cadena mutable de caracteres, a diferencia de string que no es mutable.
        /* Es preferible usar StringBuilder cuando se quiere manipular un string ya inicializado
        sin cambiar su referencia. Además, esta clase posee una variedad de métodos que permiten,
        por ejemplo, modificar determinados caracteres del string. */

        // Mejor StringBuilder que string:
        StringBuilder SB = new StringBuilder("Me llamo SB");
        SB[2] = '_';
        SB[8] = '_';
        Console.WriteLine(SB);

        // Mejor string que StringBuilder:
        string ST = "Modificame todo y cambiá mi referencia";
        ST = "Modificado";
        Console.WriteLine(ST);
    }
}