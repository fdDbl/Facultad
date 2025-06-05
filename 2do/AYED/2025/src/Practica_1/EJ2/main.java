/*
    Escriba un método de clase que dado un número n devuelva un nuevo arreglo de tamaño n
    con los n primeros múltiplos enteros de n mayores o iguales que 1.
    Ejemplo: f(5) = [5; 10; 15; 20; 25]; f(k) = {n*k donde k : 1..k}
    Agregue al programa la posibilidad de probar con distintos valores de n ingresandolos por
    teclado, mediante el uso de System.in. La clase Scanner permite leer de forma sencilla
    valores de entrada.
 */
package Practica_1.EJ2;

import java.util.Scanner;

/**
 *
 * @author Federico Dobal
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        int n = s.nextInt();
        int[] arreglo = nuevoArreglo.generar(n);
        for(int i=0; i<n; i++) {
            System.out.println(arreglo[i]);
        }
    }
    
}
