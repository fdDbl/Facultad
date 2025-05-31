package Parciales.Árboles.COLAPINTO;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

public class Estrategia {
    public static class Compuesto {
        private String tipo;
        private int vueltas;
        private double compuesto;
        public Compuesto(String t, int v) {
            tipo = t;
            vueltas = v;
            switch (tipo) {
                case "Soft" -> compuesto = 0;
                case "Medium" -> compuesto = 0.4;
                case "Hard" -> compuesto = 0.7;
            }
        }
        public Compuesto(String t) {
            if(t.equals("Arista")) {
                compuesto = 1;
                vueltas = 10;
            } else if(t.equals("Raiz"))
                compuesto = 0;
            tipo = t;
        }
        public int getVueltas() { return vueltas; }
        public double getCompuesto() { return compuesto; }
        public String getTipo() { return tipo; }
        @Override
        public String toString() { return getVueltas() + " " + getTipo(); }
    }

    public List<Compuesto> mejorEstrategia(GeneralTree<Compuesto> arbol) {
        List<Compuesto> lista = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty())
            _mejorEstrategia(arbol,lista,new LinkedList<>(), Double.MAX_VALUE);
        return lista;
    }

    private double _mejorEstrategia(GeneralTree<Compuesto> nodo, List<Compuesto> caminoMejor, List<Compuesto> caminoActual, double sumaMejor) {
        boolean noEsRaiz = !nodo.getData().getTipo().equals("Raiz");
        if(noEsRaiz)
            caminoActual.add(nodo.getData());
        if(nodo.isLeaf()) {
            double sumaAct = 0;
            System.out.print("[ ");
            for(Compuesto c : caminoActual) {
                sumaAct += (double) c.getVueltas() * c.getCompuesto();
                System.out.print((double) c.getVueltas() * c.getCompuesto() + " ");
            }
            System.out.println("]");
            if(sumaAct < sumaMejor) {
                caminoMejor.clear();
                caminoMejor.addAll(caminoActual);
                sumaMejor = sumaAct;
            }
        }
        else for(GeneralTree<Compuesto> hijo : nodo.getChildren()) {
            if(noEsRaiz)
                caminoActual.add(new Compuesto("Arista"));
            sumaMejor = _mejorEstrategia(hijo, caminoMejor, caminoActual,sumaMejor);
        }
        if(noEsRaiz)
            caminoActual.removeLast();
        return sumaMejor;
    }

    public static void main(String[] args) {
        // Crear el árbol según la imagen
        GeneralTree<Compuesto> root = new GeneralTree<>(new Compuesto("Raiz")); // Raíz vacía

        // Primer nivel
        GeneralTree<Compuesto> node10Soft = new GeneralTree<>(new Compuesto("Soft", 10));
        GeneralTree<Compuesto> node20Hard = new GeneralTree<>(new Compuesto("Hard", 20));
        GeneralTree<Compuesto> node35Hard = new GeneralTree<>(new Compuesto("Hard", 35));

        // Agregar el primer nivel a la raíz
        root.addChild(node10Soft);
        root.addChild(node20Hard);
        root.addChild(node35Hard);

        // Segundo nivel
        GeneralTree<Compuesto> node10Soft2 = new GeneralTree<>(new Compuesto("Soft", 10));
        GeneralTree<Compuesto> node30Hard = new GeneralTree<>(new Compuesto("Hard", 30));
        GeneralTree<Compuesto> node15Med = new GeneralTree<>(new Compuesto("Medium", 15));
        GeneralTree<Compuesto> node15Soft = new GeneralTree<>(new Compuesto("Soft", 15));

        // Conectar segundo nivel con sus padres
        node10Soft.addChild(node10Soft2);
        node20Hard.addChild(node30Hard);
        node20Hard.addChild(node15Med);
        node35Hard.addChild(node15Soft);

        // Tercer nivel
        GeneralTree<Compuesto> node30Hard2 = new GeneralTree<>(new Compuesto("Hard", 30));
        GeneralTree<Compuesto> node15Med2 = new GeneralTree<>(new Compuesto("Medium", 15));

        // Conectar tercer nivel con sus padres
        node10Soft2.addChild(node30Hard2);
        node15Med.addChild(node15Med2);

        System.out.println(new Estrategia().mejorEstrategia(root));
    }
}
