package Parciales.Árboles.AYED_2022.Punto4;

import Practica_2.EJ1yEJ2.BinaryTree;

import java.util.LinkedList;
import java.util.List;

public class CodigoZigZag {
    public List<Character> descifrarCodigo(BinaryTree<Character> estructura, List<String> listaDeSecuencias) {
        List<Character> mensaje = new LinkedList<>();
        if(estructura != null && !estructura.isEmpty()) {
            for(String secuencia : listaDeSecuencias)
                _descifrarCodigo(estructura, secuencia.toCharArray(),0, mensaje);
        }
        return mensaje;
    }
    private void _descifrarCodigo(BinaryTree<Character> estructura, char[] secuencia, int i, List<Character> output) {
        if(i <= secuencia.length) {
            if (secuencia[i] == '0')
                _descifrarCodigo(estructura.getLeftChild(), secuencia, i+1, output);
            else
                _descifrarCodigo(estructura.getRightChild(), secuencia, i+1, output);
        } else output.add(estructura.getData());
    }
}
