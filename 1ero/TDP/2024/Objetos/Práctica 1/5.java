/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.Lector;
/**
 *
 * @author Alumno
 */
public class restaurante {
    public static void main (String [] args) {
        int cantClientes = 5;
        int cantAspectos = 4;
        int i,j;
        
    double [][] mCalificaciones = new double[cantClientes][cantAspectos];
    
    for(i = 0; i < cantClientes; i++) {
            System.out.println("CLIENTE " + (i+1));
            for(j=0; j < cantAspectos; j++) {
                System.out.println("Ingrese la calificacion del aspecto " + j + ":");
                double cali = Lector.leerDouble();
                mCalificaciones[i][j] = cali;
            }
    } 
        double sumaTotal = 0;
        double prom;
        for(i = 0; i < cantClientes; i++) {
            for(j=0; j < cantAspectos; j++) {
                sumaTotal = sumaTotal + mCalificaciones[i][j];
            }
            prom = (double) sumaTotal / cantAspectos;
            System.out.println("PROMEDIO DEL ASPECTO: " + prom);
        }
    }
}
