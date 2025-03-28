package Práctica_1.EJ8;
/**
 *
 * @author Federico Dobal
 */
public class CircularQueue extends Queue {
    public T shift() {
        T element = dequeue(); // extraigo el último elemento
        enqueue(element); // el último elemento pasa a ser el primero, apuntando así a quien era antes el primer elemento (ahora segundo)
        return element;
    }
}
