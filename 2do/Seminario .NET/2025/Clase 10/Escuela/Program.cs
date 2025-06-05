using Escuela;
using Microsoft.EntityFrameworkCore;

EscuelaSqlite.Inicializar(); //solo tiene efecto si
// la base de datos no existe
using var context = new EscuelaContext();

//Agregamos un nuevo alumno
// var alumno = new Alumno("Pablo"); // el Id será establecido por SQLite
// context.Add(alumno); // se agregará realmente con el db.SaveChanges()
// context.SaveChanges(); // actualiza la base de datos.
// // SQlite establece el valor de alumno.Id
// // Agregamos un examen para el nuevo alumno
// var examen = new Examen(alumno.Id, "Historia", 9.5, DateTime.Today);
// context.Add(examen);
// context.SaveChanges();

// borramos de la tabla Alumnos el registro con Id=3
 // var alumnoBorrar = context.Alumnos.Where(a => a.Id == 3).SingleOrDefault();
 // if (alumnoBorrar != null)
 // {
 //     context.Remove(alumnoBorrar); //se borra realmente con el context.SaveChanges()
 // }
 // //La nota en Inglés del alumno id=1 es un 5. La cambiamos a 7.5
 // var examenModificar = context.Examenes.Where(
 //     e => e.AlumnoId == 1 && e.Materia == "Inglés").SingleOrDefault();
 // if (examenModificar != null)
 // {
 //     examenModificar.CambiarNota(7.5); //se modifica el registro en memoria
 // }
 // context.SaveChanges(); //actualiza la base de datos.

// Alumno nuevo = new Alumno("Andrés");
// nuevo.Examenes = new List<Examen>() { //dejamos en 0 el AlumnoId porque va a ser ignorado
//     new Examen(0,"Lengua",7,DateTime.Parse("5/5/2022")),
//     new Examen(0,"Matemática",6,DateTime.Parse("6/5/2022"))
// };
// context.Add(nuevo);
// context.SaveChanges();

foreach (Alumno a in context.Alumnos.Include(a => a.Examenes))
{
    Console.WriteLine(a.Nombre);
    a.Examenes?.ToList()
        .ForEach(ex => Console.WriteLine($" - {ex.Materia} {ex.Nota}"));
}

Console.ReadKey();