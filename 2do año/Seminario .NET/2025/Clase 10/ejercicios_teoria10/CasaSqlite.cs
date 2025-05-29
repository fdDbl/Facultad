namespace ejercicios_teoria10;

public class CasaSqlite
{
    public static void Inicializar()
    {
        using var context = new CasaContext();
        if (context.Database.EnsureCreated())
        {
            Console.WriteLine("Se creó base de datos");
            // context.Juegos.Add(new Juego("Ludo",5000));
            // context.Juegos.Add(new Juego("Uno",3000));
            // context.Juegos.Add(new Juego("Blackjack",8000));
            // context.Clientes.Add(new Cliente("Prevost Robert Francis","probert7@holymail.com"));
            // context.Clientes.Add(new Cliente("Giménez Susana","sgimenez@yahoo.com.ar"));
            // context.Clientes.Add(new Cliente("Corbalán Leonardo","lovecsharp@outlook.com"));
            // context.Alquileres.Add(new Alquiler(3,1,90000,"01/07/2025"));
            // context.Alquileres.Add(new Alquiler(2,2,50000,"11/07/2025"));
            // context.Alquileres.Add(new Alquiler(2,3,150000,"21/07/2025"));
            context.SaveChanges();
        }
    }
}