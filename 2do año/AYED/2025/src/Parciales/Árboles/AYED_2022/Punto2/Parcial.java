package Parciales.Árboles.AYED_2022.Punto2;


import Practica_2.EJ1yEJ2.BinaryTree;

public class Parcial {
    private BinaryTree<Personaje> tree;

    public Parcial(BinaryTree<Personaje> t) { tree = t; }

    public Personaje princesaAccesible() {
        if(tree != null && !tree.isEmpty())
            return _princesaAccesible(tree);
        return new Personaje();
    }

    private Personaje _princesaAccesible(BinaryTree<Personaje> arbol) {
        if (arbol.getData().esPrincesa())
            return arbol.getData();
        else {
            Personaje aux = null;
            if (!arbol.getData().esDragon()) {
                if (arbol.hasLeftChild())
                    aux = _princesaAccesible(arbol.getLeftChild());
                if (arbol.hasRightChild() && aux == null)
                    aux = _princesaAccesible(arbol.getRightChild());
            }
            return aux;
        }
    }

    public static void main(String args[]) {
        BinaryTree<Personaje> ab = new BinaryTree<>(new Personaje("X"));
        ab.addLeftChild(new BinaryTree<>(new Personaje("Dragon")));
        ab.getLeftChild().addLeftChild(new BinaryTree<>(new Personaje("Princesa")));
        ab.getLeftChild().addRightChild(new BinaryTree<>(new Personaje("Y")));
        ab.addRightChild(new BinaryTree<>(new Personaje("Z")));
        ab.getRightChild().addRightChild(new BinaryTree<>(new Personaje("W")));
        ab.getRightChild().getRightChild().addLeftChild(new BinaryTree<>(new Personaje("Princesa")));

        Parcial p = new Parcial(ab);
        System.out.println(p.princesaAccesible());
    }
}
