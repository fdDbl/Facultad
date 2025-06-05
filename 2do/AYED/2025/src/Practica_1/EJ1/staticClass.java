/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica_1.EJ1;

/**
 *
 * @author Federico Dobal
 */
public class staticClass {
    static void imprimirFor(int a, int b) {
        for(int i=a; i<=b; i++) {
            System.out.println(i);
        }
    }
    
    static void imprimirWhile(int a, int b) {
        while(a<=b) {
            System.out.println(a++);
        }
    }
    
    static void imprimirRecursivo(int a, int b) {
        if(a<=b) {
            System.out.println(a);
            imprimirRecursivo(++a,b);
        }
    }
}
