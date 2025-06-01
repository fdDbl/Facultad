package Practica_5.EJ3;

import Practica_5.EJ1.Graph;
import Practica_5.EJ1.Vertex;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Mapa {
    private Graph<String> mapaCiudades;

    public List<String> devolverCamino(String ciudad1, String ciudad2) {
        List<String> ret = new LinkedList<>();
        boolean[] marcas = new boolean[mapaCiudades.getSize()];

        Iterator<Vertex<String>> it = mapaCiudades.getVertices().iterator();
        Vertex<String> c1 = null;

        while(it.hasNext() && c1 == null) {
            int pos = it.next().getPosition();
            if(!marcas[pos])
                buscarCiudad(pos,mapaCiudades,marcas,ciudad1,c1);
        }
        return ret;
    }
    private boolean buscarCiudad(int i, Graph<String> grafo, boolean[] visitados, String cNom, Vertex<String> cV) {
        visitados[i] = true;
        Vertex<String> v = grafo.getVertex(i);

    }
}
