package EJ7;

import Práctica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Fede Dobal
 */
public class CaminosV2 {
    private GeneralTree<Integer> tree;

    public CaminosV2(GeneralTree<Integer> tree) {
        this.tree = tree;
    }

    public CaminosV2() {}

    public List<Integer> caminoAHojaMasLejana () {
        List<Integer> maxCamino = new LinkedList<>();
        if ((tree != null) && !(tree.isEmpty())) {
            List<Integer> caminoAct = new LinkedList<>();
            caminoAHojaMasLejana(tree, maxCamino, caminoAct);
        }
        return maxCamino;
    }
    private void caminoAHojaMasLejana(GeneralTree<Integer> raiz, List<Integer> cM, List<Integer> cA) {
        cA.addLast(raiz.getData());
        if((raiz.isLeaf()) && (cA.size() > cM.size())) {
            cM.removeAll(cM);
            cM.addAll(cA);
        }
        for(GeneralTree<Integer> child : raiz.getChildren())
            caminoAHojaMasLejana(child, cM, cA);
        cA.removeLast();
    }

}
