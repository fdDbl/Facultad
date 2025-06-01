package Practica_5.EJ3;

import Practica_5.EJ1.Edge;
import Practica_5.EJ1.Graph;
import Practica_5.EJ1.Vertex;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Mapa {
    private Graph<String> mapaCiudades;

    public List<String> devolverCamino(String ciudad1, String ciudad2) {
        List<String> ret = new LinkedList<>();
        if(!mapaCiudades.isEmpty()) {
            Vertex<String> c1 = mapaCiudades.search(ciudad1);
            Vertex<String> c2 = mapaCiudades.search(ciudad2);
            if(c1 != null && c2 != null) {
                boolean[] visitados = new boolean[mapaCiudades.getSize()];
                devolverCamino(c1, c2, ret, visitados);
            }
        }
        return ret;
    }

    private boolean devolverCamino(Vertex<String> c1, Vertex<String> c2, List<String> camino, boolean[] visitados) {
        boolean encontre = false;
        camino.add(c1.getData());
        visitados[c1.getPosition()] = true;
        if(c1 == c2) encontre = true;
        else {
            List<Edge<String>> edges = mapaCiudades.getEdges(c1);
            Iterator<Edge<String>> it = edges.iterator();
            while(it.hasNext() && !encontre) {
                Vertex<String> v = it.next().getTarget();
                int targetPos = v.getPosition();
                if(!visitados[targetPos]) encontre = devolverCamino(v, c2, camino, visitados);
            }
        }
        if(!encontre) camino.removeLast(); // backtracking
        return encontre;
    }
}
