package Practica_2.EJ3;

import Practica_2.EJ1yEJ2.BinaryTree;
import java.util.ArrayList;
import java.util.List;

public class ContadorArbol {
    private BinaryTree<Integer> tree;
    public ContadorArbol(BinaryTree<Integer> tree) {
        this.tree = tree;
    }
    public List<Integer> numerosParesInOrder() {
        List<Integer> list = new ArrayList();
        if(!tree.isEmpty())
            nPIO(tree,list);
        return list;
    }
    public List<Integer> numerosParesPostOrder() {
        List<Integer> list = new ArrayList();
        if(!tree.isEmpty())
            nPPO(tree,list);
        return list;
    }
    public void nPIO(BinaryTree<Integer> tree, List<Integer> list) {
        if(tree.hasLeftChild())
            nPIO(tree.getLeftChild(),list);
        if(tree.getData() % 2 == 0)
            list.add(tree.getData());
        if(tree.hasLeftChild())
            nPIO(tree.getLeftChild(),list);
    }
    public void nPPO(BinaryTree<Integer> tree, List<Integer> list) {
        if(tree.getData() % 2 == 0)
            list.add(tree.getData());
        if(tree.hasLeftChild())
            nPIO(tree.getLeftChild(),list);
        if(tree.hasLeftChild())
            nPIO(tree.getLeftChild(),list);
    }
}