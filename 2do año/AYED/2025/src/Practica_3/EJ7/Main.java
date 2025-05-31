package Practica_3.EJ7;
import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;
public class Main {
    public static void main(String[] args) {
        GeneralTree<Integer> tree1 = new GeneralTree<>(1);
        GeneralTree<Integer> tree6 = new GeneralTree<>(6);
        tree6.addChild(tree1);

        GeneralTree<Integer> tree10 = new GeneralTree<>(10);
        GeneralTree<Integer> tree17 = new GeneralTree<>(17);
        tree17.addChild(tree10);
        tree17.addChild(tree6);

        GeneralTree<Integer> tree8 = new GeneralTree<>(8);
        GeneralTree<Integer> tree9 = new GeneralTree<>(9);
        tree9.addChild(tree8);

        GeneralTree<Integer> tree16 = new GeneralTree<>(16);
        GeneralTree<Integer> tree7 = new GeneralTree<>(7);
        GeneralTree<Integer> tree14 = new GeneralTree<>(14);
        tree14.addChild(tree16);
        tree14.addChild(tree7);

        GeneralTree<Integer> tree18 = new GeneralTree<>(18);
        GeneralTree<Integer> tree15 = new GeneralTree<>(15);
        tree15.addChild(tree14);
        tree15.addChild(tree18);

        GeneralTree<Integer> tree12 = new GeneralTree<>(12);
        tree12.addChild(tree17);
        tree12.addChild(tree9);
        tree12.addChild(tree15);

        CaminosV1 C1 = new CaminosV1(tree12);
        for (Integer I : C1.caminoAHojaMasLejana())
            System.out.print(I + " ");
        System.out.println("(Longitud " + (C1.caminoAHojaMasLejana().size() - 1) + ")");

        CaminosV2 C2 = new CaminosV2(tree12);
        for (Integer I : C2.caminoAHojaMasLejana())
            System.out.print(I + " ");
        System.out.println("(Longitud " + (C2.caminoAHojaMasLejana().size() - 1) + ")");
    }
}