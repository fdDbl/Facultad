using Figuras;
using Automotores;
//El constructor de Círculo espera recibir el radio
List<Círculo> listaCírculos = [
    new Círculo(1.1),
    new Círculo(3),
    new Círculo(3.2)
];
//El constructor de Rectángulo espera recibir la base y la altura
List<Rectángulo> listaRectángulos = [
    new Rectángulo(3, 4),
    new Rectángulo(4.3, 4.4)
];
//La clase Auto está codificada como la vista en la teoría
List<Auto> listaAutos = [
    new Auto("Nissan", 2017),
    new Auto("Ford", 2015),
    new Auto("Renault")
];
foreach (Círculo c in listaCírculos)
{
    Console.WriteLine($"Área del círculo {c.GetArea()}");
}
foreach (Rectángulo r in listaRectángulos)
{
    Console.WriteLine($"Área del rectángulo {r.GetArea()}");
}
foreach (Auto a in listaAutos)
{
    Console.WriteLine(a.GetDescripcion());
}
Console.ReadKey();