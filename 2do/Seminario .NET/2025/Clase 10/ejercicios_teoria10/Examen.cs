namespace ejercicios_teoria10;

public class Examen(int alumnoId, double nota, int cursoId)
{
    public int AlumnoId { get; set; } = alumnoId;
    public double Nota { get; set; } = nota;
    public int CursoId { get; set; } = cursoId;
}