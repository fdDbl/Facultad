using teoria4;
using System.IO;
using System.Collections;
class Punto3 {
    public static void Run() {
        Console.WriteLine("----- PUNTO 3 -----");
        LinkedList<Persona3> listaPersonas = new();
        try {
            StreamReader SR = new("Punto 3/personas.txt");
            Console.SetIn(SR);
            string? linea;
            Persona3 P;
            string[] persona;
            while ((linea = SR.ReadLine()) != null) {
                persona = linea.Split(',');
                P = new(persona[0],int.Parse(persona[1]),int.Parse(persona[2]));

                listaPersonas.AddLast(P);
            }
        } catch(Exception E) {
            Console.WriteLine("El archivo no pudo leerse: "+ E.Message);
        }

        for(int i = 0; i < listaPersonas.Count; i++) {
            Persona3 P = listaPersonas.ElementAt(i);
            Console.Write(i+1 + ")    ");
            P.Imprimir();
        }
        Console.WriteLine("Persona más jóven de la lista: ");
        PersonaMasJoven(listaPersonas).Imprimir();
    }

    public static Persona3 PersonaMasJoven(LinkedList<Persona3> lista) {
        Persona3 menor = new Persona3("menor",999,0);
        foreach(Persona3 P in lista)
            if(menor.getEdad() > P.getEdad())
                menor = P;
        return menor;
    }
}