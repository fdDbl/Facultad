package Practica_1.EJ7;

import java.util.*;

/**
 *
 * @author Federico Dobal
 */
public class PuntoG {
    
    public static void main(String[] args) {
        ArrayList<Integer> L = calcularSucesion(6);
        for(Integer I: L)
            System.out.println(I);
    }
    
    public static ArrayList<Integer> calcularSucesion(int n) {
        ArrayList<Integer> l = new ArrayList();
        return calcularSucesionAux(l,n);
    }
    
    public static ArrayList<Integer> calcularSucesionAux(ArrayList<Integer> l, int n) {
        l.add(n);
        if(n>1) {
            if(n % 2 == 0)
                calcularSucesionAux(l,n/2);
            else
                calcularSucesionAux(l,3*n+1);
        }
        return l;
    }
}