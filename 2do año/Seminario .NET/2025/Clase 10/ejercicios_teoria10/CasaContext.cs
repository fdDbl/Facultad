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
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Alquiler>().ToTable("Alquileres");
        modelBuilder.Entity<Juego>().ToTable("Juegos");
        modelBuilder.Entity<Cliente>()
            .Property(c => c.Mail)
            .HasColumnName("Mail").HasDefaultValue("no especificado");
        modelBuilder.Entity<Cliente>()
            .Property(c => c.Telefono)
            .HasColumnName("Telefono").HasDefaultValue("no especificado");
        modelBuilder.Entity<Cliente>().ToTable("Clientes");
    }
}