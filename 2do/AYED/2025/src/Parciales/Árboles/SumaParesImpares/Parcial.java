package Parciales.Árboles.SumaParesImpares;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class Parcial {
    public Integer resolver(GeneralTree<Integer> arbol) {
        List<Integer> nodos = new LinkedList<>();
        int suma = 0;
        if(arbol != null && !arbol.isEmpty())
            suma = _resolver(arbol,nodos);
        System.out.println("Suma general: " + suma);
        if(suma % 2 == 0) {
            suma = 0; // reutilizo suma
            for(Integer i : nodos)
                if(i > 0) suma += i;
        } else {
            suma = 0;
            for(Integer i : nodos)
                if(i < 0) suma += i;
        }
        return suma;
    }

    private Integer _resolver(GeneralTree<Integer> nodo, List<Integer> lista) {
        int res = 0;
        for(GeneralTree<Integer> hijo : nodo.getChildren())
            res += _resolver(hijo,lista);
        lista.add(nodo.getData());
        return res + nodo.getData();
    }

    public static void main(String[] args) {
        GeneralTree<Integer> n2 = new GeneralTree<>(2);
        GeneralTree<Integer> n11 = new GeneralTree<>(11);
        n11.addChild(n2);
        GeneralTree<Integer> n6 = new GeneralTree<>(6);
        GeneralTree<Integer> n7 = new GeneralTree<>(-7);
        n7.addChild(n6);
        n7.addChild(n11);
        GeneralTree<Integer> n4 = new GeneralTree<>(4);
        GeneralTree<Integer> n9 = new GeneralTree<>(-9);
        n9.addChild(n4);
        n9.addChild(n7);
        GeneralTree<Integer> n5 = new GeneralTree<>(5);
        n5.addChild(n9);
        GeneralTree<Integer> n3 = new GeneralTree<>(3);
        GeneralTree<Integer> n1 = new GeneralTree<>(1);
        GeneralTree<Integer> raiz = new GeneralTree<>(-3);
        raiz.addChild(n1);
        raiz.addChild(n3);
        raiz.addChild(n5);

        Parcial parcial = new Parcial();
        System.out.println("Resultado: " + parcial.resolver(raiz));
    }
}
