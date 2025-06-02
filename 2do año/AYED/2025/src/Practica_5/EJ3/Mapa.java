package Practica_5.EJ3;

import Practica_5.EJ1.Edge;
import Practica_5.EJ1.Graph;
import Practica_5.EJ1.Vertex;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Mapa {
    private Graph<String> mapaCiudades;

    // 1.
    public List<String> devolverCamino(String ciudad1, String ciudad2) {
        List<String> ret = new LinkedList<>();
        if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
            Vertex<String> c1 = mapaCiudades.search(ciudad1);
            Vertex<String> c2 = mapaCiudades.search(ciudad2);
            if(c1 != null && c2 != null) {
                boolean[] visitados = new boolean[mapaCiudades.getSize()];
                devolverCamino(c1, c2, ret, visitados);
            }
        }
        return ret;
    }
    private boolean devolverCamino(Vertex<String> c1, Vertex<String> c2,
                                   List<String> camino, boolean[] visitados) {    // devuelve el primer camino o nada
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

    // 2.
    public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades) {
        List<String> ret = new LinkedList<>();
        if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
            Vertex<String> c1 = mapaCiudades.search(ciudad1);
            Vertex<String> c2 = mapaCiudades.search(ciudad2);
            if(c1 != null && c2 != null) {
                boolean[] visitados = new boolean[mapaCiudades.getSize()];
                ignorarCiudades(ciudades,visitados);
                devolverCamino(c1, c2, ret, visitados);
            }
        }
        return ret;
    }
    private void ignorarCiudades(List<String> ciudades, boolean[] visitados) {
        for (String c : ciudades) {
            Vertex<String> v = mapaCiudades.search(c);
            if(v != null)
                visitados[v.getPosition()] = true;
        }
    }

    // 3.
    public List<String> caminoMasCorto(String ciudad1, String ciudad2) {
        List<String> ret = new LinkedList<>();
        if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
            Vertex<String> c1 = mapaCiudades.search(ciudad1);
            Vertex<String> c2 = mapaCiudades.search(ciudad2);
            if(c1 != null && c2 != null) {
                boolean[] visitados = new boolean[mapaCiudades.getSize()];
                caminoMasCorto(c1,c2,visitados,ret,new LinkedList<>(),Integer.MAX_VALUE,0);
            }
        }
        return ret;
    }
    private int caminoMasCorto(Vertex<String> c1, Vertex<String> c2, boolean[] visitados,
                               List<String> caminoMin, List<String> caminoAct, int min, int act) {
        caminoAct.add(c1.getData());
        visitados[c1.getPosition()] = true;
        if(c1 == c2 && act < min) {
            min = act;
            caminoMin.clear();
            caminoMin.addAll(caminoAct);
        } else {
            List<Edge<String>> edges = mapaCiudades.getEdges(c1);
            Iterator<Edge<String>> it = edges.iterator();
            while(it.hasNext() && act < min) {
                Edge<String> e = it.next();
                int targetPos = e.getTarget().getPosition();
                int nuevoAct = act + e.getWeight();
                if(!visitados[targetPos] && nuevoAct < min)
                    min = caminoMasCorto(e.getTarget(),c2,visitados,caminoMin,caminoAct,min,nuevoAct);
            }
        }
        visitados[c1.getPosition()] = false;
        caminoAct.removeLast();
        return min;
    }

    // 4.
    public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
        List<String> ret = new LinkedList<>();
        if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
            Vertex<String> c1 = mapaCiudades.search(ciudad1);
            Vertex<String> c2 = mapaCiudades.search(ciudad2);
            if(c1 != null && c2 != null) {
                boolean[] visitados = new boolean[mapaCiudades.getSize()];
                caminoSinCargarCombustible(c1,c2,ret,visitados,tanqueAuto);
            }
        }
        return ret;
    }
    private boolean caminoSinCargarCombustible(Vertex<String> c1, Vertex<String> c2, List<String> camino, boolean[] visitados, int tanque) {
        camino.add(c1.getData());
        visitados[c1.getPosition()] = true;
        boolean encontre = false;
        if(c1 == c2 && tanque > 0) encontre = true;
        else {
            Iterator<Edge<String>> it = mapaCiudades.getEdges(c1).iterator();
            while(it.hasNext() && !encontre) {
                Edge<String> e = it.next();
                int targetPos = e.getTarget().getPosition();
                if(!visitados[targetPos] && tanque - e.getWeight() > 0)
                    encontre = caminoSinCargarCombustible(e.getTarget(),c2,camino,visitados,tanque - e.getWeight());
            }
        }
        visitados[c1.getPosition()] = false;
        if(!encontre)
            camino.removeLast();
        return encontre;
    }
}
