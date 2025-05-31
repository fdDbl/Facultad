package Practica_1.EJ7;

import java.util.*;
public class TestArrayList {
    public static void main(String[] args) {
        // Punto A
        List<Integer> AL = new ArrayList<>(); // ArrayList
        for(int i=0; i<args.length; i++)
            AL.add(Integer.valueOf(args[i]));
        for(int i=0; i < AL.size(); i++)
            System.out.println(AL.get(i));
        
        // Punto B
        List<Integer> LL = new LinkedList<>(); // LinkedList
        for(int i=0; i<args.length; i++)
            LL.add(Integer.valueOf(args[i]));
        for(int i=0; i < LL.size(); i++)
            System.out.println(LL.get(i));
        
        // Punto C
        for(Integer I: AL) // For Each
            System.out.println(I);
    }
}