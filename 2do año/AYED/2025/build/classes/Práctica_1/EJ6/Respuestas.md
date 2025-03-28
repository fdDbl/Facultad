**6) Análisis de las estructuras de listas provistas por la API de Java.**\
**a.** ¿En qué casos ArrayList ofrece un mejor rendimiento que LinkedList?\
*RTA:* ArrayList ofrece mejor rendimiento que LinkedList cuando se necesita acceder directamente a un elemento (con un índice); cuando se buscan elementos, ya que almacena los datos en un array contiguo; en iteraciones con for y for-each; y en memoria, ya que no se necesita almacenar la referencia al siguiente elemento.

**b.** ¿Cuándo LinkedList puede ser más eficiente que ArrayList?\
*RTA:* LinkedList es más eficiente que ArrayList al eliminar elementos en el inicio o en el medio de la lista cuando las eliminaciones son frecuentes y la lista es grande. Esto se debe a que solo ajusta punteros en O(1), mientras que ArrayList debe desplazar elementos en O(n). Sin embargo, si se accede por índice antes de eliminar, ArrayList sigue siendo mejor debido a su acceso O(1).

**c.** ¿Qué diferencia encuentra en el uso de la memoria en ArrayList y LinkedList?\
*RTA:* ArrayList es más eficiente en memoria porque almacena los datos en un array contiguo, optimizando la localidad de caché y evitando referencias innecesarias. En cambio, LinkedList tiene un mayor consumo de memoria debido a los punteros adicionales en cada nodo. Este sobrecosto es significativo en listas grandes, especialmente con tipos de datos pequeños. Por lo tanto, ArrayList es la mejor opción cuando se busca eficiencia en memoria, mientras que LinkedList solo es útil cuando se realizan muchas inserciones o eliminaciones en el medio o al inicio de la lista.

**d.** ¿En qué casos sería preferible usar un ArrayList o un LinkedList?\
*RTA:*
- Usar ArrayList cuando:\
Se necesita acceso rápido por índice (O(1)).\
Se realizan búsquedas frecuentes.\
Se itera a menudo.\
Las inserciones/eliminaciones son pocas o al final.

- Usar LinkedList cuando:
Se realizan muchas inserciones/eliminaciones en el medio o al inicio (O(1)).\
Se usa con iteradores en lugar de acceso por índice.\
Se necesita eliminar elementos frecuentemente sin mover otros.

En general, ArrayList es la mejor opción, excepto en casos de modificaciones frecuentes en el medio o al inicio, donde LinkedList es más eficiente.