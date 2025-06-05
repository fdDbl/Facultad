package Practica_3.EJ7;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;
import java.util.LinkedList;
import java.util.List;
/**
 *
 * @author Fede Dobal
 */
public class CaminosV1 {
    private GeneralTree<Integer> tree;

    public CaminosV1(GeneralTree<Integer> tree) {
        this.tree = tree;
    }

    public CaminosV1() {}

    public List<Integer> caminoAHojaMasLejana () {
        List<Integer> maxList = new LinkedList<>();
        if ((tree != null) && !(tree.isEmpty())) {
            List<List<Integer>> caminos = new LinkedList<>();
            caminoAHojaMasLejana(tree, caminos, new LinkedList<>());
            int maxSize = -1;
            for (List<Integer> camino : caminos)
                if (camino.size() > maxSize) {
                    maxSize = camino.size();
                    maxList = camino;
                }
        }
        return maxList;
    }
    private void caminoAHojaMasLejana(GeneralTree<Integer> raiz, List<List<Integer>> caminos, List<Integer> camino) {
        camino.addLast(raiz.getData());
        if(raiz.isLeaf())
            caminos.addLast(new LinkedList<>(camino));
        for(GeneralTree<Integer> child : raiz.getChildren())
            caminoAHojaMasLejana(child, caminos, camino);
        camino.removeLast();
    }

}
