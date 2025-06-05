namespace Escuela;
public class Examen
{
    public int Id { get; private set; }
    public int AlumnoId { get; private set; }
    public string Materia { get; private set; } = "";
    public double Nota { get; private set; }
    public DateTime Fecha { get; private set; }
    public Examen(int alumnoId, string materia, double nota, DateTime fecha)
    {
        // completar aquí las validaciones que aseguren la consistencia de la entidad
        AlumnoId = alumnoId;
        Materia = materia;
        Nota = nota;
        Fecha = fecha;
    }
    protected Examen() { } // Constructor para EF Core
    public void CambiarNota(double nota)
    {
        if (nota < 0 || nota > 10)
        {
            throw new ArgumentOutOfRangeException("Valor para la nota no permitido");
        }
        Nota = nota;
    }
    // Otros métodos que implementan el comportamiento de la entidad
    // manteniendo sus invariantes
}