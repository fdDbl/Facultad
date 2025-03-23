package Práctica_1.EJ8;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Federico Dobal
 */
public class Queue extends Sequence {
    private List<T> queue = new ArrayList();
    
    public Queue() {}
    
    public void enqueue(T data) {
        this.queue.add(data);
    }
    
    public T dequeue() {
        return this.queue.remove(0);
    }
    
    public T head() {
        return this.queue.get(0);
    }
    
    public int size() {
        return this.queue.size();
    }
    
    public boolean isEmpty() {
        return this.queue.isEmpty();
    }
    
    public String toString() {
        return this.queue.toString();
    }
}
