using System.Globalization;
using ejercicios_teoria10;
using static System.Linq.Enumerable;

Console.WriteLine("PUNTO 1");
{
    var listaA = Range(0, 21).Select(n => 100 + n * 5); // solución mucho más eficiente que tomar el rango (100,101) y luego filtrar con where
    var listaB = Range(2, 98).Where(n => Range(2, (int)Math.Sqrt(n) - 1).All(i => n % i != 0));
    var listaC = Range(0, 10).Select(n => Math.Pow(2, n)).ToList(); // ToList() me salva de enumerar de nuevo cada vez que calculo suma y promedio
    var suma = listaC.Sum();
    var promedio = listaC.Average();
    var listaE = Range(1, 20).Where(n => n * n % 10 == 6);
    var listaF = Range(0, 7).Select(d => (DayOfWeek)d).Where(dw => dw.ToString().Contains('u'));

    Console.WriteLine("--- Elementos de Lista A ---");
    foreach (var item in listaA)
    {
        Console.WriteLine(item);
    }
    Console.WriteLine("--- Elementos de Lista B ---");
    foreach (var item in listaB)
    {
        Console.WriteLine(item);
    }
    Console.WriteLine("--- Elementos de Lista C ---");
    foreach (var item in listaC)
    {
        Console.WriteLine(item);
    }
    Console.WriteLine($"Suma: {suma}\nPromedio: {promedio}");
    Console.WriteLine("--- Elementos de Lista E ---");
    foreach (var item in listaE)
    {
        Console.WriteLine(item);
    }
    Console.WriteLine("--- Elementos de Lista F ---");
    foreach (var item in listaF)
    {
        Console.WriteLine(item);
    }
}

Console.WriteLine("PUNTO 2");
{
    int[] vector = [1, 3, 4, 5, 9, 4, 3, 4, 5, 1, 1, 4, 9, 4, 3, 1];
    vector.GroupBy(n => n)
        .Select(g => new { Numero = g.Key, Cantidad = g.Count() })
        .OrderBy(obj => obj.Cantidad)
        .ToList()
        .ForEach(obj => Console.WriteLine(obj));
}

Console.WriteLine("PUNTO 3");
{
    var alumnos = new List<Alumno>();
    alumnos.AddRange(new Alumno("Juan",1), 
                    new Alumno("Ana", 2),
                    new Alumno("Andrés", 3),
                    new Alumno("Paula",4),
                    new Alumno("Sebastián",5),
                    new Alumno("María",6),
                    new Alumno("Camila",7),
                    new Alumno("Iván",8),
                    new Alumno("Raúl",9));
    var examenes = new List<Examen>();
    examenes.AddRange(new Examen(2, 5, 1),
                    new Examen(4, 7, 5),
                    new Examen(4, 9, 3),
                    new Examen(3, 10, 4),
                    new Examen(7, 5, 3),
                    new Examen(2, 8, 4),
                    new Examen(6, 9, 5),
                    new Examen(9, 7, 1),
                    new Examen(6, 5, 4),
                    new Examen(9, 1, 4),
                    new Examen(7, 9, 5));
    var cursos = new List<Curso>();
    cursos.AddRange(new Curso(1, "Inglés"),
                    new Curso(2, "Matemática"),
                    new Curso(3, "Historia"),
                    new Curso(4, "Geografía"),
                    new Curso(5, "Literatura"),
                    new Curso(6, "Contabilidad"));

    var listaA = alumnos.GroupJoin(examenes,
            a => a.AlumnoId,
            e => e.AlumnoId,
            (a, susExamenes) => new
            {
                Alumno = a, // Proyectamos el alumno completo
                Examenes = susExamenes
            })
        .Where(resultado => resultado.Examenes.Any())
        .Select(resultado => new
        {
            NombreAlumno = resultado.Alumno.Nombre,
        })
        .OrderBy(obj => obj.NombreAlumno)
        .DistinctBy(obj => obj.NombreAlumno)
        .ToList();
    Console.WriteLine("-- RINDIERON AL MENOS UN EXAMEN:");
    foreach(var o in listaA)
        Console.WriteLine(o);

    var listaB = cursos.GroupJoin(examenes,
            c => c.CursoId,
            e => e.AlumnoId,
            (c, susExamenes) => new
            {
                Título = c.Titulo,
                Cantidad = susExamenes.Count()
            })
        .Where(resultado => resultado.Cantidad > 0)
        .OrderBy(obj => obj.Cantidad);
    Console.WriteLine("-- CURSOS DONDE SE RINDIERON EXÁMENES:");
    foreach(var o in listaB)
        Console.WriteLine(o);

    var listaC = alumnos.Join(examenes,
            a => a.AlumnoId,
            e => e.AlumnoId,
            (a, suExamen) => new
            {
                Alumno = a.Nombre,
                Curso = cursos.First(c => c.CursoId == suExamen.CursoId).Titulo,
                suExamen.Nota
            })
        .ToList();
    Console.WriteLine("-- NOTAS DE EXÁMENES POR ALUMNO Y CURSO:");
    foreach(var o in listaC)
        Console.WriteLine(o);

    var listaD = listaC.Where(l => l.Nota >= 6);
    Console.WriteLine("-- NOTAS DE EXÁMENES POR ALUMNO Y CURSO (aprobados):");
    foreach(var o in listaD)
        Console.WriteLine(o);

    var listaE = alumnos.Where(a => examenes.All(e => e.AlumnoId != a.AlumnoId));
    Console.WriteLine("-- NO RINDIERON NINGÚN EXAMEN:");
    foreach(var o in listaE)
        Console.WriteLine(o.Nombre);

    var listaF = listaC.GroupBy(g => g.Alumno).Select(grupo => new
            {
                Alumno = grupo.Key,
                Promedio = grupo.Average(item => item.Nota)
            });
    Console.WriteLine("-- PROMEDIO DE ALUMNOS QUE RINDIERON:");
    foreach(var o in listaF)
        Console.WriteLine(o);
}

Console.WriteLine("PUNTO 4");
{
    CasaSqlite.Inicializar();
    using var context = new CasaContext();
    var juego1 = new Juego()
    {
        Nombre = "Cama Elastica",
        Descripción = "Medida de 2 x 2",
        Estado = "Bueno",
        PrecioPorDía = 1000
    };
    var juego2 = new Juego()
    {
        Nombre = "Castillo",
        Descripción = "Hasta 10 personas",
        Estado = "Nuevo",
        PrecioPorDía = 1200
    };
    AgregarJuego(juego1);
    AgregarJuego(juego2);
    ListarJuegos();
    var cliente1 = new Cliente()
    {
        Dni = "20569784",
        ApellidoYNombre = "Perez, Juan",
        Direccion = "48 e/ 5 y 6 N°520"
    };
    var cliente2 = new Cliente()
    {
        Dni = "10569784",
        ApellidoYNombre = "Gonzalez, Alejandra",
        Direccion = "25 e/ 9 y 10 N°520",
        Mail = "gale@gmail.com",
        Telefono = "221-15-569874"
    };
    AgregarCliente(cliente1);
    AgregarCliente(cliente2);
    ListarClientes();
    var alquiler1 = new Alquiler()
    {
        IdCliente = 1,
        IdJuego = 1,
        Fecha = DateTime.Now.ToString(CultureInfo.CurrentCulture)
    };
    var alquiler2 = new Alquiler()
    {
        IdCliente = 1,
        IdJuego = 2,
        Fecha = DateTime.Now.ToString(CultureInfo.CurrentCulture)
    };
    AgregarAlquiler(alquiler1);
    AgregarAlquiler(alquiler2);
    ListarAlquileres();
    ModificarCliente("10569784", "Gonzalez, Alejandra", "52 e/ 9 y 10 N°520", "gale@gmail.com", "221-15-569874");
    ListarClientes();
    EliminarCliente("10569784");
    ListarClientes();
    ModificarJuego(1, "Cama Elastica", "Medida de 2 x 2", "Roto", 1500);
    ListarJuegos();
    ModificarAlquiler(1, 1562.25, new DateTime(2021 / 11 / 12));
    ListarAlquileres();
}

Console.ReadKey();