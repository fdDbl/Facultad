package Práctica_1.EJ8;
/**
 *
 * @author Federico Dobal
 */
public class DoubleEndedQueue extends Queue {
    public void enqueueFirst(T element) {
        enqueueIndex(0,element);
    }
}
