package Parciales.PrincesaAccesible;
import Práctica_2.EJ1yEJ2.BinaryTree;

public class Parcial {
    private BinaryTree<Personaje> tree;

    public Parcial(BinaryTree<Personaje> t) { tree = t; }

    public Personaje princesaAccesible() {
        if(tree != null && !tree.isEmpty())
            return _princesaAccesible(tree);
        return new Personaje();
    }

    private Personaje _princesaAccesible(BinaryTree<Personaje> arbol) {
        if(arbol.getData().esPrincesa())
            return arbol.getData();
        if()
    }
}
