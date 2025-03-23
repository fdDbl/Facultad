package Práctica_1.EJ9;

import java.util.ArrayList;

/**
 *
 * @author Federico Dobal
 */
public class TestBalanceo {

    public static boolean esBalanceado(String S) {
        // resolveré con Array
        ArrayList<Character> caracteres = new ArrayList();
        caracteres.add('(');    
        caracteres.add(')');
        caracteres.add('[');
        caracteres.add(']');
        caracteres.add('{');
        caracteres.add('}');

        if (!S.isEmpty()) {
            for (int i = 0; i < S.length(); i++) {
                Character C = S.charAt(i);
                if (caracteres.contains(C)) {
                    if (caracteres.indexOf(C) % 2 == 0) {
                        int suma = 0;
                        int j = i + 1;
                        while (suma < S.length()) {
                            suma++;
                            if (!caracteres.get(caracteres.indexOf(C) + 1).equals(S.charAt(j)))
                                j++;
                        }
                        if ((suma % 2 != 0) || (suma == 0))
                            return false;
                    }
                } else return false;
            } return true;
        } else return false;
    }
}
