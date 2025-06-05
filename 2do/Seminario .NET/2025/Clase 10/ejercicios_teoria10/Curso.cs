namespace ejercicios_teoria10;

public class Curso
{
    public int CursoId { get; set; }
    public string? Titulo { get; set; }

    public Curso(int cursoId, string? titulo)
    {
        CursoId = cursoId;
        Titulo = titulo;
    }
}