public class Punto1
{
    public static void Run()
    {
        Console.WriteLine("----- PUNTO 1 -----");
        A[] vector = [new A(3),new B(5),new C(15),new D(41)];
        foreach (A a in vector)
        {
            a.Imprimir();
        }
    }
    
    class A
    {
        protected int _id;
        public A(int id) => _id = id;
        public virtual void Imprimir() => Console.WriteLine($"A_{_id}");
    }
    class B : A
    {
        public B(int id) : base(id) {}
        public override void Imprimir()
        {
            Console.Write($"B_{_id} --> ");
            base.Imprimir();
        }
    }
    class C : B
    {
        public C(int id) : base(id) {}
        public override void Imprimir()
        {
            Console.Write($"C_{_id} --> ");
            base.Imprimir();
        }
    }
    class D : C
    {
        public D(int id) : base(id) {}
        public override void Imprimir()
        {
            Console.Write($"D_{_id} --> ");
            base.Imprimir();
        }
    }
}