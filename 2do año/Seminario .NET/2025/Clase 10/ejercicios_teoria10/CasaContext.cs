using Microsoft.EntityFrameworkCore;
namespace ejercicios_teoria10;

public class CasaContext : DbContext
{
#nullable disable
    public DbSet<Cliente> Clientes { get; set; }
    public DbSet<Juego> Juegos { get; set; }
    public DbSet<Alquiler> Alquileres { get; set; }
#nullable restore
    protected override void OnConfiguring(DbContextOptionsBuilder
        optionsBuilder)
    {   
        optionsBuilder.UseSqlite("data source=Casa.sqlite");
    }
}