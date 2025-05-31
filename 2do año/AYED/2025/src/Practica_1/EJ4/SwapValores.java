/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica_1.EJ4;

/**
 *
 * @author Federico Dobal
 */
public class SwapValores {

    public static void swap1(int x, int y) {
        if (x < y) {
            int tmp = x;
            x = y;
            y = tmp;
        }
    } // Si x es menor a y, este método intercambia sus valores.

    public static void swap2(Integer x, Integer y) {
        if (x < y) {
            int tmp = x;
            x = y;
            y = tmp;
        }
    } /* Si x es menor a y, este método intenta intercambiar los valores de x e y, 
    pero solo modifica las copias locales de las referencias, por lo que no tiene efecto fuera del método. */

    public static void main(String[] args) {
        int a = 1, b = 2;
        Integer c = 3, d = 4;
        swap1(a, b);
        swap2(c, d);
        System.out.println("a=" + a + " b=" + b);
        System.out.println("c=" + c + " d=" + d);
    }
}
