package Practica_5.EJ3;

import Practica_5.EJ1.Edge;
import Practica_5.EJ1.Graph;
import Practica_5.EJ1.Vertex;
import Practica_5.EJ1.adjList.AdjListGraph;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Mapa {
    private final Graph<String> mapaCiudades;

    public Mapa(Graph<String> mapaCiudades) {
        this.mapaCiudades = mapaCiudades;
    }

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
        if(c1 == c2) encontre = true;
        else {
            Iterator<Edge<String>> it = mapaCiudades.getEdges(c1).iterator();
            while(!encontre && it.hasNext()) {
                Edge<String> e = it.next();
                int targetPos = e.getTarget().getPosition();
                if(!visitados[targetPos] && tanque - e.getWeight() >= 0)
                    encontre = caminoSinCargarCombustible(e.getTarget(),c2,camino,visitados,tanque - e.getWeight());
            }
        }
        visitados[c1.getPosition()] = false;
        if(!encontre)
            camino.removeLast();
        return encontre;
    }

    // 5.
    public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
        List<String> ret = new LinkedList<>();
        if(mapaCiudades != null && !mapaCiudades.isEmpty()) {
            Vertex<String> c1 = mapaCiudades.search(ciudad1);
            Vertex<String> c2 = mapaCiudades.search(ciudad2);
            if(c1 != null && c2 != null) {
                boolean[] visitados = new boolean[mapaCiudades.getSize()];
                caminoConMenorCargaDeCombustible(c1,c2,visitados,ret,new LinkedList<>(),Integer.MAX_VALUE,0,tanqueAuto,tanqueAuto);
            }
        }
        return ret;
    }
    private int caminoConMenorCargaDeCombustible(Vertex<String> origin, Vertex<String> dest, boolean[] visitados, List<String> caminoMin, List<String> caminoAct, int min, int act, int tanqueIni, int tanqueAct) {
        caminoAct.add(origin.getData());
        visitados[origin.getPosition()] = true;
        if(origin == dest && act < min) {
            min = act;
            caminoMin.clear();
            caminoMin.addAll(caminoAct);
        } else {
            for(Edge<String> e : mapaCiudades.getEdges(origin)) {
                Vertex<String> v = e.getTarget();
                if(!visitados[v.getPosition()]) {
                    tanqueAct -= e.getWeight();
                    if(tanqueAct < 0) {
                        tanqueAct = tanqueIni; // cargo combustible
                        act++;
                    }
                    visitados[v.getPosition()] = true;
                    min = caminoConMenorCargaDeCombustible(v, dest, visitados, caminoMin, caminoAct, min, act, tanqueIni, tanqueAct);
                }
            }
        }
        visitados[origin.getPosition()] = false;
        caminoAct.removeLast();
        return min;
    }
    public static void main(String[] args) {
        Graph<String> mapaCiudades = new AdjListGraph<>();
        Vertex<String> v1 = mapaCiudades.createVertex("Londres");
        Vertex<String> v2 = mapaCiudades.createVertex("Paris");
        Vertex<String> v3 = mapaCiudades.createVertex("Roma");
        Vertex<String> v4 = mapaCiudades.createVertex("Berlin");
        Vertex<String> v5 = mapaCiudades.createVertex("Madrid");
        Vertex<String> v6 = mapaCiudades.createVertex("Lisboa");
        Vertex<String> v7 = mapaCiudades.createVertex("Atenas");

        // Conexiones entre las nuevas ciudades
        mapaCiudades.connect(v1, v2, 4); // Londres - Paris
        mapaCiudades.connect(v2, v1, 4); // Paris - Londres
        mapaCiudades.connect(v1, v3, 3); // Londres - Roma
        mapaCiudades.connect(v3, v1, 3); // Roma - Londres
        mapaCiudades.connect(v1, v4, 4); // Londres - Berlin
        mapaCiudades.connect(v4, v1, 4); // Berlin - Londres
        mapaCiudades.connect(v2, v5, 15); // Paris - Madrid
        mapaCiudades.connect(v5, v2, 15); // Madrid - Paris
        mapaCiudades.connect(v3, v5, 3);  // Roma - Madrid
        mapaCiudades.connect(v5, v3, 3);  // Madrid - Roma
        mapaCiudades.connect(v4, v3, 4);  // Berlin - Roma
        mapaCiudades.connect(v3, v4, 4);  // Roma - Berlin
        mapaCiudades.connect(v4, v5, 11); // Berlin - Madrid
        mapaCiudades.connect(v5, v4, 11); // Madrid - Berlin
        mapaCiudades.connect(v4, v6, 10); // Berlin - Lisboa
        mapaCiudades.connect(v6, v4, 10); // Lisboa - Berlin
        mapaCiudades.connect(v5, v7, 4);  // Madrid - Atenas
        mapaCiudades.connect(v7, v5, 4);  // Atenas - Madrid
        mapaCiudades.connect(v6, v7, 9);  // Lisboa - Atenas
        mapaCiudades.connect(v7, v6, 9);  // Atenas - Lisboa

        Mapa mapa = new Mapa(mapaCiudades);

        System.out.print("LISTA DEVOLVER CAMINO: ");
        System.out.print(mapa.devolverCamino("Londres", "Atenas"));

        System.out.println();

        System.out.print("LISTA DEVOLVER CAMINO EXCEPTUANDO LUGARES:");
        List<String> restringidos = new LinkedList<>();
        restringidos.add("Roma");
        restringidos.add("Lisboa");
        System.out.print(mapa.devolverCaminoExceptuando("Londres", "Atenas", restringidos));

        System.out.println();

        System.out.print("LISTA CAMINO MAS CORTO (SEGUN DISTANCIA): ");
        System.out.print(mapa.caminoMasCorto("Londres", "Atenas"));

        System.out.println();

        System.out.print("LISTA CAMINO SIN CARGAR COMBUSTIBLE: ");
        System.out.print(mapa.caminoSinCargarCombustible("Londres", "Atenas", 30));

        System.out.println();

        System.out.print("LISTA CAMINO CON MENOR CARGAS DE COMBUSTIBLE: ");
        System.out.print(mapa.caminoConMenorCargaDeCombustible("Londres", "Atenas", 10));

        System.out.println();
    }
}
