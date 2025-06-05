public class Punto4
{
    public static void Run()
    {
        Console.WriteLine("----- PUNTO 4 -----");
        Taxi t = new Taxi(3, "Toyota");
        Console.WriteLine($"Un {t.Marca} con {t.Pasajeros} pasajeros");
    }

    class Auto
    {
        public string Marca { get; private set; } = "Ford";
        public Auto(string marca) => this.Marca = marca;
    }

    class Taxi : Auto
    {
        public int Pasajeros { get; private set; }
        /* No era necesario agregar el :base ya que Auto poseía un constructor nulo y C#
           llama automáticamente al mismo. */
        public Taxi(int pasajeros, string marca) : base(marca) => this.Pasajeros = pasajeros;
    }
}