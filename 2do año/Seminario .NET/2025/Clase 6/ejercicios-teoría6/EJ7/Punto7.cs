// namespace ejercicios_teoría6.EJ7;
//
// public class Punto7
// {
//     Imprimidor.Imprimir(new A(), new B(), new C(), new D());
//     class A {
//         public void ImprimirA() => Console.WriteLine("Soy una instancia A");
//     }
//     class B {
//         public void ImprimirB() => Console.WriteLine("Soy una instancia B");
//     }
//     class C {
//         public void ImprimirC() => Console.WriteLine("Soy una instancia C");
//     }
//     class D {
//         public void ImprimirD() => Console.WriteLine("Soy una instancia D");
//     }
//
//         static class Imprimidor
//         {
//             public static void Imprimir(params object[] vector)
//             {
//                 foreach (object o in vector)
//                 {
//                     if (o is A a) { a.ImprimirA(); }
//                     else if (o is B b) { b.ImprimirB(); }
//                     else if (o is C c) { c.ImprimirC(); }
//                     else if (o is D d) { d.ImprimirD(); }
//                 }
//             }
//         }
//     
// }