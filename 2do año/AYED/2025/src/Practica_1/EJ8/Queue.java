package Practica_1.EJ8;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Federico Dobal
 */
public class Queue<T> extends Sequence {
    private List<T> queue = new ArrayList();
    
    public Queue() {
        super();
    }
    
    public void enqueue(T data) {
        if(!this.queue.isEmpty())
            this.enqueueIndex(this.queue.size(), data);
        else
            this.enqueueIndex(0, data);
    }
    
    public void enqueueIndex(int pos, T data) {
        this.queue.add(pos, data);
    }
    
    public T dequeue() {
        return this.queue.removeFirst();
    }
    
    public T head() {
        return this.queue.getFirst();
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
