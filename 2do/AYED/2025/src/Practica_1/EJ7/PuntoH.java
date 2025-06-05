package Practica_1.EJ7;

import java.util.ArrayList;

/**
 *
 * @author Federico Dobal
 */
public class PuntoH {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList();
        for(int i = 1; i <= 10; i++) {
            lista.add(i);
            System.out.println(i);
        }
        
        invertirArrayList(lista);
        
        for(Integer I:lista)
            System.out.println(I);
    }
    
    public static void invertirArrayList(ArrayList<Integer> lista) {
        invertirArrayListAux(lista,0,lista.size()-1);
    }
            
    
    public static void invertirArrayListAux(ArrayList<Integer> lista, int ini, int fin) {
        if(ini < fin) {
            Integer aux = lista.get(ini);
            lista.set(ini, lista.get(fin));
            lista.set(fin, aux);
            invertirArrayListAux(lista,++ini,--fin);
        }
    }
}
