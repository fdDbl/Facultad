using teoria4;
using System.IO;
using System.Collections;
class Punto2 {
    public static void Run() {
        Console.WriteLine("----- PUNTO 2 -----");
        LinkedList<Persona2> listaPersonas = new();
        try {
            StreamReader SR = new("Punto 2/personas.txt");
            Console.SetIn(SR);
            string? linea;
            Persona2 P;
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
            Persona2 P = listaPersonas.ElementAt(i);
            Console.Write(i+1 + ")    ");
            P.Imprimir();
        }
    }
}