using teoria4;
using System.IO;
using System.Collections;
class Punto1 {
    public static void Run() {
        Console.WriteLine("----- PUNTO 1 -----");
        LinkedList<Persona1> listaPersonas = new();
        try {
            StreamReader SR = new("Punto 1/personas.txt");
            Console.SetIn(SR);
            string? linea;
            Persona1 P;
            string[] persona;
            while ((linea = SR.ReadLine()) != null) {
                P = new();
                persona = linea.Split(',');
                P.Nombre = persona[0];
                P.Edad = int.Parse(persona[1]);
                P.DNI = int.Parse(persona[2]);

                listaPersonas.AddLast(P);
            }
        } catch(Exception E) {
            Console.WriteLine("El archivo no pudo leerse: "+ E.Message);
        }

        for(int i = 0; i < listaPersonas.Count; i++) {
            Persona1 P = listaPersonas.ElementAt(i);
            Console.WriteLine(i+1+")    " + P.Nombre + "    " + P.Edad + "    " + P.DNI);
        }
    }
}