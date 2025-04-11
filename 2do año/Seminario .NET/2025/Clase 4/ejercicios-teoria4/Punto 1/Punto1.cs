using teoria4;
using System.IO;
using System.Collections;
public class Punto1 {
    public static void run() {
        LinkedList<Persona> listaPersonas = new();
        try {
            using (StreamReader SR = new StreamReader("Punto 1/personas.txt")) {
                Console.SetIn(SR);
                Persona P = new();
                string? linea;
                while((linea = SR.ReadLine()) != null) {
                    P.Nombre = linea;
                    P.Edad = int.Parse(SR.ReadLine());
                    P.DNI = int.Parse(SR.ReadLine());
                    SR.ReadLine();

                    Console.WriteLine(P.Nombre);
                    listaPersonas.AddLast(P);
                    P = new();
                }
            }
        } catch(Exception E) {
            Console.WriteLine("El archivo no pudo leerse: "+ E.Message);
        }

        for(int i = 0; i < listaPersonas.Count; i++) {
            Persona P = listaPersonas.ElementAt(i);
            Console.WriteLine(i+1+")    " + P.Nombre + "    " + P.Edad + "    " + P.DNI);
        }
    }
}