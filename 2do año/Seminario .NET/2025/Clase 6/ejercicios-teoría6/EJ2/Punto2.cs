public class Punto2
{
    public static void Run()
    {
        Console.WriteLine("----- PUNTO 2 -----");
        A[] vector = [ new C(1),new D(2),new B(3),new D(4),new B(5)];
        foreach (A a in vector)
        {
            // if(a is B b)
            //     b.Imprimir();
            if(a.GetType() == typeof(B))
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