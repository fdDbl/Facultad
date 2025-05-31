package Practica_1.EJ8;
/**
 *
 * @author Federico Dobal
 */
public class CircularQueue<T> extends Queue<T> {
    public T shift() {
        T element = dequeue(); // extraigo el último elemento
        enqueue(element); // el último elemento pasa a ser el primero, apuntando así a quien era antes el primer elemento (ahora segundo)
        return element;
    }
}
