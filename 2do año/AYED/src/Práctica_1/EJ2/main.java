/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Práctica_1.EJ2;

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
