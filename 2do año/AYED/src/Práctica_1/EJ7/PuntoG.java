package Práctica_1.EJ7;

import java.util.*;

/**
 *
 * @author Federico Dobal
 */
public class PuntoG {
    private static List<Integer> LISTA = new ArrayList<>();
    
    public static void main(String[] args) {
        LISTA = calcularSucesion(1);
        for(Integer I: LISTA)
            System.out.println(I);
    }
    public static List<Integer> calcularSucesion(int n) {
        LISTA.add(n);
        if(n!=1) {
            if(n % 2 == 0)
                n = n/2;
            else
                n = 3*n+1;
            calcularSucesion(n);
            LISTA.add(n);
        }
        return LISTA;
    }
}