package Practica_5.EJ6;

import Practica_5.EJ1.Edge;
import Practica_5.EJ1.Graph;
import Practica_5.EJ1.Vertex;
import Practica_5.EJ1.adjList.AdjListGraph;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class BuscadorDeCaminos {
    private Graph<String> bosque;

    public BuscadorDeCaminos(Graph<String> bosque) {
        this.bosque = bosque;
    }

    public List<List<String>> recorridosMasSeguros() {
        List<List<String>> ret = new LinkedList<>();
        if(bosque != null && !bosque.isEmpty()) {
            Vertex<String> casaCaperucita = buscarCasaCaperucita();
            if(casaCaperucita != null) {
                boolean[] marcas = new boolean[bosque.getSize()];
                dfs(casaCaperucita,ret,new LinkedList<>(),marcas);
            }
        }
        return ret;
    }

    private void dfs(Vertex<String> claro, List<List<String>> listaDeCaminos, List<String> caminoAct, boolean[] marcas) {
        marcas[claro.getPosition()] = true;
        caminoAct.add(claro.getData());

        if(claro.getData().equals("Casa Abuelita")) {
            listaDeCaminos.add(new LinkedList<>(caminoAct));
        } else {
            List<Edge<String>> edges = bosque.getEdges(claro);
            for (Edge<String> e : edges) {
                int targetPos = e.getTarget().getPosition();
                if (!marcas[targetPos] && e.getWeight() < 5)
                    dfs(e.getTarget(), listaDeCaminos, caminoAct, marcas);
            }
        }

        marcas[claro.getPosition()] = false;
        caminoAct.removeLast();
    }

    private Vertex<String> buscarCasaCaperucita() {
        Vertex<String> ret = null;
        Iterator<Vertex<String>> it = bosque.getVertices().iterator();
        boolean encontre = false;
        while(!encontre && it.hasNext()) {
            Vertex<String> v = it.next();
            if(v.getData().equals("Casa Caperucita")) {
                encontre = true;
                ret = v;
            }
        }
        return ret;
    }
    public static void main (String[] args) {
        Graph<String> bosque = new AdjListGraph<String>();
        Vertex<String> v1 = bosque.createVertex("Casa Caperucita");
        Vertex<String> v2 = bosque.createVertex("Claro 3");
        Vertex<String> v3 = bosque.createVertex("Claro 1");
        Vertex<String> v4 = bosque.createVertex("Claro 2");
        Vertex<String> v5 = bosque.createVertex("Claro 5");
        Vertex<String> v6 = bosque.createVertex("Claro 4");
        Vertex<String> v7 = bosque.createVertex("Casa Abuelita");
        bosque.connect(v1, v2, 4);
        bosque.connect(v2, v1, 4);
        bosque.connect(v1, v3, 3);
        bosque.connect(v3, v1, 3);
        bosque.connect(v1, v4, 4);
        bosque.connect(v4, v1, 4);
        bosque.connect(v2, v5, 15);
        bosque.connect(v5, v2, 15);
        bosque.connect(v3, v5, 3);
        bosque.connect(v5, v3, 3);
        bosque.connect(v4, v3, 4);
        bosque.connect(v3, v4, 4);
        bosque.connect(v4, v5, 11);
        bosque.connect(v5, v4, 11);
        bosque.connect(v4, v6, 10);
        bosque.connect(v6, v4, 10);
        bosque.connect(v4, v3, 4);
        bosque.connect(v3, v4, 4);
        bosque.connect(v5, v7, 4);
        bosque.connect(v7, v5, 4);
        bosque.connect(v6, v7, 9);
        bosque.connect(v7, v6, 9);
        BuscadorDeCaminos bos = new BuscadorDeCaminos(bosque);
        List<List<String>> lis = bos.recorridosMasSeguros();
        for(List<String> l: lis)
            System.out.println(l);
    }
}
