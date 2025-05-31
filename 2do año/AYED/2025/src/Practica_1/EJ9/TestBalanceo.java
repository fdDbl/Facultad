package Practica_1.EJ9;
import java.util.Stack;
/**
 *
 * @author Federico Dobal
 */
public class TestBalanceo {

    public static boolean esBalanceado(String S) {
        Stack<Character> pila = new Stack<>();
        
        for (char c : S.toCharArray()) {
            if (c == '(' || c == '[' || c == '{') {
                pila.push(c);
            } 
            else if (c == ')' || c == ']' || c == '}') {
                if (pila.isEmpty()) return false;
                
                char top = pila.pop();
                if ((c == ')' && top != '(') ||
                    (c == ']' && top != '[') ||
                    (c == '}' && top != '{')) {
                    return false;
                }
            }
        }
        return pila.isEmpty();
    }
}