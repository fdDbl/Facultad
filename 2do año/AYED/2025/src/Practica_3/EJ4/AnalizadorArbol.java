package Practica_3.EJ4;


import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 *
 * @author Federico Dobal
 */
public class AnalizadorArbol {
    public double devolverMaximoPromedio(GeneralTree<AreaEmpresa> arbol) {
        // utilizaré un recorrido por niveles
        double maxProm = -1;
        if(arbol != null && !arbol.isEmpty()) {
            Queue<GeneralTree<AreaEmpresa>> cola = new LinkedList();
            cola.add(arbol);
            cola.add(null);
            GeneralTree<AreaEmpresa> aux;
            
            while(!cola.isEmpty()) {
                double suma = 0;
                int nodosEnNivel = cola.size();
                for(int i = 0; i < nodosEnNivel; i++) {
                    aux = cola.remove();
                    if(aux != null) {
                        suma += aux.getData().getTardanza();
                        for(GeneralTree<AreaEmpresa> hijo : aux.getChildren())
                            cola.add(hijo);
                    } else
                        cola.add(null);
                }
                double prom = suma / nodosEnNivel;
                maxProm = Math.max(maxProm, prom);

            }
        }
        return maxProm;
    }
    
    public static void main(String[] args) {
        List<GeneralTree<AreaEmpresa>> children = new LinkedList<>();
        
        children.add(new GeneralTree<>(new AreaEmpresa("A",40)));
        children.add(new GeneralTree<>(new AreaEmpresa("B",7)));
        children.add(new GeneralTree<>(new AreaEmpresa("C",50)));
        GeneralTree<AreaEmpresa> a1 = new GeneralTree<>(new AreaEmpresa("J",25), children);
        
        children = new LinkedList<>();
        children.add(new GeneralTree<>(new AreaEmpresa("D",6)));
        children.add(new GeneralTree<>(new AreaEmpresa("E",10)));
        children.add(new GeneralTree<>(new AreaEmpresa("F",180)));
        GeneralTree<AreaEmpresa> a2 = new GeneralTree<>(new AreaEmpresa("K",25), children);
        
        children = new LinkedList<>();
        children.add(new GeneralTree<>(new AreaEmpresa("G",9)));
        children.add(new GeneralTree<>(new AreaEmpresa("H",12)));
        children.add(new GeneralTree<>(new AreaEmpresa("I",190)));
        GeneralTree<AreaEmpresa> a3 = new GeneralTree<>(new AreaEmpresa("L",10), children);
        
        children = new LinkedList<>();
        children.add(a1);
        children.add(a2);
        children.add(a3);
        GeneralTree<AreaEmpresa> a = new GeneralTree<>(new AreaEmpresa("M",14), children);
        
        AnalizadorArbol arb = new AnalizadorArbol();
        System.out.println("El mayor promedio entre todos los valores promedios de los niveles es: " + arb.devolverMaximoPromedio(a));
    }
}
