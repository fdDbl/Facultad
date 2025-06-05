package Parciales.Árboles.EncontrarALaPrincesa;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Parcial {
    public class Personaje {
        private String nombre;
        private String tipo;

        public Personaje(String t, String n) {
            tipo = t;
            nombre = n;
        }

        public String getTipo() {
            return tipo;
        }

        @Override
        public String toString() {
            return "Personaje{" +
                    "nombre='" + nombre + '\'' +
                    ", tipo='" + tipo + '\'' +
                    '}';
        }
    }

    public List<Personaje> buscarPrincesa(GeneralTree<Personaje> arbol) {
        List<Personaje> camino = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty())
            _buscarPrincesa(arbol,camino);
        return camino;
    }
    private boolean _buscarPrincesa(GeneralTree<Personaje> nodo, List<Personaje> camino) {
        boolean encontre = false;
        camino.add(nodo.getData());
        if(nodo.getData().getTipo().equals("Princesa"))
            encontre = true;
        else {
            Iterator<GeneralTree<Personaje>> I = nodo.getChildren().iterator();
            while(I.hasNext() && !encontre) {
                GeneralTree<Personaje> hijo = I.next();
                if(!hijo.getData().getTipo().equals("Dragon"))
                    encontre = _buscarPrincesa(hijo,camino);
            }
        }
        if(!encontre)
            camino.removeLast();
        return encontre;
    }


}
