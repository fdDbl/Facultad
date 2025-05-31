package Practica_1.EJ8;
/**
 *
 * @author Federico Dobal
 */
public class DoubleEndedQueue<T> extends Queue<T> {
    public void enqueueFirst(T element) {
        enqueueIndex(0,element);
    }
}
