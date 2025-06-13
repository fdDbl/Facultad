package Practica_5.EJ5;

import Practica_1.EJ8.Queue;
import Practica_5.EJ1.Edge;
import Practica_5.EJ1.Graph;
import Practica_5.EJ1.Vertex;
import Practica_5.EJ1.adjList.AdjListGraph;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class QuedateEnCasa {
    public List<Persona> jubiladosEnRadio(Graph<Persona> grafo, Persona empleado, int distancia) {
        List<Persona> ret = new LinkedList<>();
        if(grafo != null && !grafo.isEmpty()) {
            Vertex<Persona> emp = buscarEmpleado(grafo, empleado);
            if(emp != null) {
                boolean[] marcas = new boolean[grafo.getSize()];
                Queue<Vertex<Persona>> cola = new Queue<>();
                int vPos = emp.getPosition();
                marcas[vPos] = true;
                cola.enqueue(emp);
                int cantJ = 0;
                while(!cola.isEmpty() && distancia > 0 && cantJ < 40) {
                    Vertex<Persona> w = cola.dequeue();
                    for (Edge<Persona> e : grafo.getEdges(w)) {
                        int targetPos = e.getTarget().getPosition();
                        if(!marcas[targetPos]) {
                            marcas[targetPos] = true;
                            cola.enqueue(e.getTarget());
                            if(e.getTarget().getData().getTipo().equals("Jubilado")) {
                                ret.add(new Persona(e.getTarget().getData().getTipo(),e.getTarget().getData().getNombre(),e.getTarget().getData().getDomicilio(),e.getTarget().getData().isCobrado()));
                                cantJ++;
                            }
                        }
                    }
                    distancia--;
                }
            }
        }
        return ret;
    }

    private Vertex<Persona> buscarEmpleado(Graph<Persona> grafo, Persona empleado) {
        boolean encontre = false;
        Vertex<Persona> emp = null;
        List<Vertex<Persona>> vertices = grafo.getVertices();
        Iterator<Vertex<Persona>> it = vertices.iterator();
        while(!encontre && it.hasNext()) {
            Vertex<Persona> v = it.next();
            if(v.getData().getTipo().equals(empleado.getTipo()) && v.getData().getNombre().equals(empleado.getNombre())) {
                emp = v;
                encontre = true;
            }
        }
        return emp;
    }

    public static void main(String[] args) {
        Graph<Persona> grafo = new AdjListGraph<>();
        Vertex<Persona> v1 = grafo.createVertex(new Persona("Empleado", "Federico", "AAA", true));
        Vertex<Persona> v2 = grafo.createVertex(new Persona("Jubilado", "Julian", "BBB", false));
        Vertex<Persona> v3 = grafo.createVertex(new Persona("Jubilado", "Francisco", "CCC", false));
        Vertex<Persona> v4 = grafo.createVertex(new Persona("Empleado", "Valentin", "DDD", true));
        Vertex<Persona> v5 = grafo.createVertex(new Persona("Jubilado", "Omar", "EEE", true));
        Vertex<Persona> v6 = grafo.createVertex(new Persona("Empleado", "Rosana", "FFF", true));
        Vertex<Persona> v7 = grafo.createVertex(new Persona("Jubilado", "Maria", "GGG", false));
        Vertex<Persona> v8 = grafo.createVertex(new Persona("Jubilado", "Sandra", "HHH", true));
        Vertex<Persona> v9 = grafo.createVertex(new Persona("Jubilado", "Matheo", "III", false));

        grafo.connect(v1, v2);
        grafo.connect(v2, v1);
        grafo.connect(v2, v3);
        grafo.connect(v3, v2);

        grafo.connect(v1, v9);
        grafo.connect(v9, v1);
        grafo.connect(v9, v8);
        grafo.connect(v8, v9);

        grafo.connect(v1, v4);
        grafo.connect(v4, v1);
        grafo.connect(v1, v6);
        grafo.connect(v6, v1);
        grafo.connect(v4, v5);
        grafo.connect(v5, v4);
        grafo.connect(v5, v7);
        grafo.connect(v7, v5);


        QuedateEnCasa Q = new QuedateEnCasa();

        System.out.println(Q.jubiladosEnRadio(grafo, v1.getData(), 2));
    }
}
