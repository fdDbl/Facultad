package Practica_3.EJ1yEJ2ByEJ3yEJ5;
import java.util.LinkedList;
import java.util.List;
/**
 *
 * @author Fede Dobal
 */
public class EjercitaciónÁrboles {
    /* Retornar una lista con los nodos con valor par de la frontera de un arbol */
    
    public static List<Integer> fronteraPar(GeneralTree<Integer> arbol) {
        List<Integer> lista = new LinkedList();
        if((arbol != null) && (!arbol.isEmpty())) fronteraPar(arbol,lista);
        return lista;
    }
    private static void fronteraPar(GeneralTree<Integer> arbol, List<Integer> lista) {
        if(arbol.isLeaf() && arbol.getData() % 2 == 0)
            lista.add(arbol.getData());
        else if(arbol.hasChildren())
            for(GeneralTree<Integer> hijo : arbol.getChildren())
                fronteraPar(hijo,lista);
    }
    
    public static void main(String[] args) {
        GeneralTree<Integer> arbolA = new GeneralTree<>(4);
        GeneralTree<Integer> arbolB = new GeneralTree<>(2);
        GeneralTree<Integer> arbolC = new GeneralTree<>(83);
        GeneralTree<Integer> arbolD = new GeneralTree<>(6);
        GeneralTree<Integer> arbolE = new GeneralTree<>(61);
        GeneralTree<Integer> arbolF = new GeneralTree<>(3);
        GeneralTree<Integer> arbolG = new GeneralTree<>(-50);
        GeneralTree<Integer> arbolH = new GeneralTree<>(5);

        arbolA.addChild(arbolB);
        arbolA.addChild(arbolC);
        arbolA.addChild(arbolD);
        arbolB.addChild(arbolE);
        arbolB.addChild(arbolF);
        arbolF.addChild(arbolG);
        arbolF.addChild(arbolH);

/*                       4
                      /  |  \
                     2   83  6
                   / \
                  61  3
                     / \
                   -50   5
*/
        
        List<Integer> lista = fronteraPar(arbolA);
        
        System.out.print("Frontera par: [ ");
        for(Integer I : lista)
            System.out.print(I + " ");
        System.out.println("]");
    }
}
