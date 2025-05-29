namespace ejercicios_teoria10;

public class Cliente
{
    public int Id { get; private set; }
    public string Dni { get; set; } = "";
    public string ApellidoYNombre { get; set; } = "";
    public string Direccion { get; set; } = "";
    public string? Mail { get; set; }
    public string? Telefono { get; set; }
    public List<Juego>? Juegos { get; set; }
    public List<Alquiler>? Alquileres { get; set; }
    
    public Cliente(string apnom, string? mail = null)
    {
        if (string.IsNullOrWhiteSpace(apnom))
        {
            throw new ArgumentException("El apellido y/o nombre no puede ser nulo ni estar vacío");
        }
        if (mail != null && !MailValido(mail))
        {
            throw new ArgumentException("El formato del email no es válido.");
        }
        this.ApellidoYNombre = apnom;
        this.Mail = mail;
    }
    public Cliente() { }
    private static bool MailValido(string mail)
    {
        return mail.Contains('@') && mail.Contains('.');
    }
    public override String ToString() =>
        $"Id: {Id}, DNI: {Dni}, Apellido y Nombre: {ApellidoYNombre}, Domicilio: {Direccion}, Mail: {Mail}, Tel: {Telefono}";
}