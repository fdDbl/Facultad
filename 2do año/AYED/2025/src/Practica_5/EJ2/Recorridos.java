package Practica_5.EJ2;

import Practica_1.EJ8.Queue;
import Practica_5.EJ1.Edge;
import Practica_5.EJ1.Graph;
import Practica_5.EJ1.Vertex;
import Practica_5.EJ1.adjList.AdjListGraph;

import java.util.LinkedList;
import java.util.List;

public class Recorridos<T> {
    public List<T> dfs(Graph<T> grafo) {
        List<T> ret = new LinkedList<>();
        boolean[] marcas = new boolean[grafo.getSize()];
        for(int i = 0; i < grafo.getSize(); i++) {
            if(!marcas[i]) {
                dfs(i,grafo,marcas,ret);
            }
        }
        return ret;
    }
    private void dfs(int i, Graph<T> grafo, boolean[] marcas, List<T> lista) {
        marcas[i] = true;
        Vertex<T> v = grafo.getVertex(i);
        lista.add(v.getData());
        for(Edge<T> e : grafo.getEdges(v)) {
            int targetPos = e.getTarget().getPosition();
            if(!marcas[targetPos])
                dfs(targetPos,grafo,marcas,lista);
        }
    }

    public List<T> bfs(Graph<T> grafo) {
        boolean[] marcas = new boolean[grafo.getSize()];
        List<T> ret = new LinkedList<>();
        for(int i = 0; i < grafo.getSize(); i++) {
            if(!marcas[i])
                bfs(i,grafo,marcas,ret);
        }
        return ret;
    }
    private void bfs(int i, Graph<T> grafo, boolean[] marcas, List<T> lista) {
        Queue<Vertex<T>> cola = new Queue<>();
        cola.enqueue(grafo.getVertex(i));
        marcas[i] = true;

        while(!cola.isEmpty()) {
            Vertex<T> w = cola.dequeue();
            lista.add(w.getData());
            for(Edge<T> e : grafo.getEdges(w)) {
                int targetPos = e.getTarget().getPosition();
                if(!marcas[targetPos]) {
                    marcas[targetPos] = true;
                    cola.enqueue(e.getTarget());
                }
            }
        }
    }

    public static void main(String[] args) {
        Graph<Integer> grafo = new AdjListGraph<>();

        Vertex<Integer> v1 = grafo.createVertex(1);
        Vertex<Integer> v2 = grafo.createVertex(2);
        Vertex<Integer> v3 = grafo.createVertex(3);
        Vertex<Integer> v4 = grafo.createVertex(4);
        Vertex<Integer> v5 = grafo.createVertex(5);
        Vertex<Integer> v6 = grafo.createVertex(6);
        Vertex<Integer> v7 = grafo.createVertex(7);
        Vertex<Integer> v8 = grafo.createVertex(8);

        grafo.connect(v1,v5); // adyacentes de v1

        grafo.connect(v2,v1); // adyacentes de v2
        grafo.connect(v2,v3);
        grafo.connect(v2,v7);

        grafo.connect(v3,v4); // adyacentes de v3
        grafo.connect(v3,v7);

        grafo.connect(v4,v1); // adyacentes de v4
        grafo.connect(v4,v6);

        grafo.connect(v5,v6); // adyacentes de v5

        grafo.connect(v6,v8); // adyacentes de v6

        grafo.connect(v8,v7); // adyacentes de v8

        grafo.printAdjacencies();

        Recorridos<Integer> r = new Recorridos<>();
        System.out.println("Recorrido en profundidad (DFS): " + r.dfs(grafo));
        System.out.println("Recorrido por niveles (BFS): " + r.bfs(grafo));
    }
}
