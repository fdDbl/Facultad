namespace Escuela;

public class Alumno
{
    public int Id { get; private set; }
    public string Nombre { get; private set; } = "";
    public string? Email { get; private set; }
    public List<Examen>? Examenes { get; set; }
    public Alumno(string nombre, string? email = null)
    {
        if (string.IsNullOrWhiteSpace(nombre))
        {
            throw new ArgumentException("El nombre no puede ser nulo ni estar vacío");
        }
        if (email != null && !EmailValido(email))
        {
            throw new ArgumentException("El formato del email no es válido.");
        }
        this.Nombre = nombre;
        this.Email = email;
        //El Id va a ser establecido por el sistema de persistencia
    }
    protected Alumno() { } // Constructor vacío (lo utilizará EntityFramework)

    private static bool EmailValido(string email)
    {
        // Una validación de email real puede ser más compleja
        return email.Contains('@') && email.Contains('.');
    }
    // Otros métodos de la entidad Alumno que implementan su comportamiento
    // permitiendo cambiar su estado y mantener su propia consistencia
    // es decir, las invariantes de la entidad (reglas que siempre deben ser verdaderas).
}
