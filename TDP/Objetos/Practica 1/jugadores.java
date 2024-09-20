
package tema1;

import PaqueteLectura.Lector;


public class Ej02Jugadores {

  
    public static void main(String[] args) {
        int dimF = 15;
        double [] vJugadores = new double[dimF];
        
        int i;
        double sumaTotal = 0;
        
        for(i=0;i<dimF;i++) {
            int pos = i+1;
            System.out.println("Altura del jugador " + pos + ":");
            double alt = Lector.leerDouble();
            sumaTotal = sumaTotal + alt;
        }
        
        double prom = (double) sumaTotal/dimF;
        System.out.println("El promedio de alturas entre todos los jugadores es: " + prom);
        
        int cantMayorPromedio = 0;
        for(i=0;i<dimF;i++)
            if(vJugadores[i] > prom) cantMayorPromedio++;
     
        System.out.println("Cantidad de jugadores mas altos que el promedio: " + cantMayorPromedio);
    }
    
}
