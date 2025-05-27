namespace Escuela;

public class EscuelaSqlite
{
    public static void Inicializar()
    {
        using var context = new EscuelaContext();
        if (context.Database.EnsureCreated())
        {
            Console.WriteLine("Se creó base de datos");
            context.Alumnos.Add(new Alumno("Juan", "juan@gmail.com"));
            context.Alumnos.Add(new Alumno("Ana"));
            context.Alumnos.Add(new Alumno("Laura"));
            context.Examenes.Add(new Examen(2, "Inglés", 9, new DateTime(2022, 4, 4)));
            context.Examenes.Add(new Examen(1, "Inglés", 5, new DateTime(2019, 3, 1)));
            context.Examenes.Add(new Examen(1, "Álgebra", 10, new DateTime(2021, 5, 24)));
            context.SaveChanges();
        }
    }

}