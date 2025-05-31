package Parciales.Árboles.Fecha_28_4_2025;

import Practica_3.EJ1yEJ2ByEJ3yEJ5.GeneralTree;
import java.util.LinkedList;

public class Tesoros {
    public GeneralTree<String> tesoroAccesibleMasCercano(GeneralTree<String> camaras) {
        LinkedList<GeneralTree<String>> caminoMin = new LinkedList<>();
        if(camaras != null && !camaras.isEmpty() && !camaras.getData().equals("Bloqueo"))
            tesoroAccesibleMasCercano(camaras,caminoMin,new LinkedList<>());
        return caminoMin.isEmpty() ? new GeneralTree<>() : caminoMin.getLast();
    }
    private void tesoroAccesibleMasCercano(GeneralTree<String> camara, LinkedList<GeneralTree<String>> caminoMin, LinkedList<GeneralTree<String>> caminoAct) {
        caminoAct.addLast(camara);
        if (camara.getData().equals("Tesoro")) {
            if (caminoMin.isEmpty() || caminoAct.size() < caminoMin.size()) {
                caminoMin.clear();
                caminoMin.addAll(caminoAct);
            }
        } else {
            for (GeneralTree<String> hijo : camara.getChildren())
                if (!hijo.getData().equals("Bloqueo"))
                    tesoroAccesibleMasCercano(hijo, caminoMin, caminoAct);
        }
        caminoAct.removeLast();
    }

    public static void main(String[] args) {
        GeneralTree<String> tesoro1 = new GeneralTree<>("Tesoro");
        GeneralTree<String> tunelT1 = new GeneralTree<>("Tunel T1");
        tunelT1.addChild(tesoro1);
        GeneralTree<String> camaraA1 = new GeneralTree<>("Camara A1");
        camaraA1.addChild(tunelT1);
        GeneralTree<String> camaraA2 = new GeneralTree<>("Camara A2");
        GeneralTree<String> camaraA = new GeneralTree<>("Camara A");
        camaraA.addChild(camaraA1);
        camaraA.addChild(camaraA2);
        GeneralTree<String> tesoroBloqueado = new GeneralTree<>("Tesoro");
        GeneralTree<String> bloqueo = new GeneralTree<>("Bloqueo");
        bloqueo.addChild(tesoroBloqueado);
        GeneralTree<String> tesoro3 = new GeneralTree<>("Tesoro");
        GeneralTree<String> camaraB1 = new GeneralTree<>("Camara B1");
        GeneralTree<String> camaraB = new GeneralTree<>("Camara B");
        camaraB.addChild(camaraB1);
        camaraB.addChild(tesoro3);
        GeneralTree<String> pasajeX = new GeneralTree<>("Pasaje X");
        pasajeX.addChild(camaraB);
        GeneralTree<String> arbol = new GeneralTree<>("Entrada");
        arbol.addChild(camaraA);
        arbol.addChild(bloqueo);
        arbol.addChild(pasajeX);

        Tesoros t = new Tesoros();
        System.out.println(t.tesoroAccesibleMasCercano(arbol).getData());
    }
}