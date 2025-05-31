package Practica_1.EJ7;

import java.util.*;
import java.util.stream.Collectors;

/**
 *
 * @author Federico Dobal
 */
public class PuntoDyE {
    public static void main(String[] args) {
        // Punto D
        Estudiante E1 = new Estudiante("Federico","Dobal","06/04/2006","Licenciatura en Informática",8.8,4);
        Estudiante E2 = new Estudiante("Isabella","Castañeda","10/02/2004","Analista Programador Universitario",9,3);
        Estudiante E3 = new Estudiante("Leandro","Bie","06/06/2003","Licenciatura en Sistemas",9.5,3);
        Estudiante[] arrayE = {E1,E2,E3};
        List<Estudiante> LPuntoD = puntoD(arrayE);

        // Punto E
        Estudiante E4 = new Estudiante("Leandro","Romanut","01/01/1980","Diplomatura en ESports",8,14);
        if(!LPuntoD.contains(E4))
            LPuntoD.add(E4);
    }
    
    public static List<Estudiante> puntoD(Estudiante[] arrayE) {
        // i. cree una lista que tenga 3 estudiantes
        List<Estudiante> AL3Estudiantes = new ArrayList<>();
        for(int i=0; i<3; i++) {
            AL3Estudiantes.add(arrayE[i]);
        }
        // ii. genere una nueva lista que sea una copia de la lista del inciso i
        List<Estudiante> ALCopia = new ArrayList<>(AL3Estudiantes); /* Las listas poseen un constructor que 
        construye una lista que contiene los elementos de la colección especificada (AL3Estudiantes), en el 
        orden en que son devueltos por el iterador de la colección. */
        
        // iii. imprima el contenido de la lista original y el contenido de la nueva lista
        for(Estudiante E:AL3Estudiantes)
            System.out.println(E.toString());
        for(Estudiante E:ALCopia)
            System.out.println(E.toString());
        
        // iv. modifique algún dato de los estudiantes
        for(Estudiante E:AL3Estudiantes)
            E.bajarDeAlgunaMateria();
        for(Estudiante E:ALCopia)
            E.dejarLibre();
        
        // v. vuelva a imprimir el contenido de la lista original y el contenido de la nueva lista.
        for(Estudiante E:AL3Estudiantes)
            System.out.println(E.toString());
        for(Estudiante E:ALCopia)
            System.out.println(E.toString());
        // Se determina que todo objeto que se modifique también se verá afectado en cualquier otra estructura a la que pertenezca.
        
        // vi. ¿Cuántas formas de copiar una lista existen? ¿Qué diferencias existen entre ellas?
        // Mediante addAll(): también es una copia superficial (no duplica nada, sigue usando las mismas referencias);
        List<Estudiante> copiaAddAll = new ArrayList<>();
        copiaAddAll.addAll(AL3Estudiantes);
        
        // Con List.copyOf(): crea una lista inmutable (no se pueden agregar ni modificar elementos) y también copia superficialmente;
        List<Estudiante> copiaCopyOf = List.copyOf(AL3Estudiantes);
        
        // Utilizando clone(): solo disponible para ArrayList;
        ArrayList<Estudiante> copiaClone = (ArrayList<Estudiante>) ((ArrayList<Estudiante>) AL3Estudiantes).clone();
        
        // Copia profunda con stream() y map(): copia NO SUPERFICIAL, crea una copia independiente de cada objeto;
        List<Estudiante> copiaProfunda = AL3Estudiantes.stream()
            .map(Estudiante -> new Estudiante(Estudiante.getNombre(), Estudiante.getApellido(), Estudiante.getFechaNacimiento(), Estudiante.getPropuesta(), Estudiante.getPromedio(), Estudiante.getCantMateriasEnCurso()))
            .collect(Collectors.toList());
        
        return AL3Estudiantes;
    }
}
