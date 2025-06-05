package Practica_3.EJ6;
import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

/**
 *
 * @author Fede Dobal
 */
public class RedDeAguaPotable {
    private final GeneralTree<Character> tree;

    public RedDeAguaPotable(GeneralTree<Character> tree) {
        this.tree = tree;
    }
    
    public double minimoCaudal(double caudal) {
        if(caudal <= 0 || tree == null || tree.isEmpty())
            return 0;
        return minimoCaudalRec(caudal,caudal,tree);
    }
    
    private double minimoCaudalRec(double caudal, double min, GeneralTree<Character> nodo) {
        if(!nodo.isLeaf()) {
            caudal /= nodo.getChildren().size();
            for(GeneralTree<Character> hijo : nodo.getChildren())
                min = Math.min(caudal, minimoCaudalRec(caudal,min,hijo));
        }
        return min;
    }

    public static void main(String[] args) {
        GeneralTree<Character> nodoA = new GeneralTree<>('A');
        GeneralTree<Character> nodoB = new GeneralTree<>('B');
        GeneralTree<Character> nodoC = new GeneralTree<>('C');
        GeneralTree<Character> nodoD = new GeneralTree<>('D');
        GeneralTree<Character> nodoE = new GeneralTree<>('E');
        GeneralTree<Character> nodoF = new GeneralTree<>('F');
        GeneralTree<Character> nodoG = new GeneralTree<>('G');
        GeneralTree<Character> nodoH = new GeneralTree<>('H');
        GeneralTree<Character> nodoI = new GeneralTree<>('I');
        GeneralTree<Character> nodoJ = new GeneralTree<>('J');
        GeneralTree<Character> nodoK = new GeneralTree<>('K');
        GeneralTree<Character> nodoL = new GeneralTree<>('L');
        GeneralTree<Character> nodoM = new GeneralTree<>('M');
        GeneralTree<Character> nodoN = new GeneralTree<>('N');
        GeneralTree<Character> nodoP = new GeneralTree<>('P');

        nodoA.addChild(nodoB);
        nodoA.addChild(nodoC);
        nodoA.addChild(nodoD);
        nodoA.addChild(nodoE);

        nodoB.addChild(nodoF);
        nodoC.addChild(nodoG);
        nodoG.addChild(nodoL);

        nodoD.addChild(nodoH);
        nodoD.addChild(nodoI);
        nodoD.addChild(nodoJ);
        nodoD.addChild(nodoK);
        nodoD.addChild(nodoP);

        nodoJ.addChild(nodoM);
        nodoJ.addChild(nodoN);

        RedDeAguaPotable Red = new RedDeAguaPotable(nodoA);
        System.out.println(Red.minimoCaudal(50000));
    }
}

