using Teoría6;

Auto a = new Auto("Ford", 2000, TipoAuto.Deportivo);
Colectivo c = new Colectivo("Mercedes", 2010, 20);
a.Imprimir();
c.Imprimir();
Console.WriteLine(a.Marca + " " + a.Modelo);
Console.WriteLine(c.Marca + " " + c.Modelo);

Console.ReadKey();