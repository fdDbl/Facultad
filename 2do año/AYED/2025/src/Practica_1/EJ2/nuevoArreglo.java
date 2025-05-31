/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica_1.EJ2;

/**
 *
 * @author Federico Dobal
 */
public class nuevoArreglo {
    static int[] generar(int n) {
        int[] aux = new int[n];
        for(int i=0;i<n;i++) {
            aux[i] = n*(i+1);
        }
        return aux;
    }
}
