using System.Text;

object[] vector = [
    new Moto("Zanella"),
    new Empleado("Juan"),
    new string("No soy imprimible"),
    new Moto("Gilera"),
    new StringBuilder("Yo tampoco soy imprimible")
];

foreach (object o in vector)
{
    if(o is IImprimible I) // porque puede haber un objeto no IImprimible
        I.Imprimir();
}

Console.ReadKey();