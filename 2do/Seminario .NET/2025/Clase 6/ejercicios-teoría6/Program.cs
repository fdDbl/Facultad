Punto1.Run();
Punto2.Run();
/* PUNTO 3: ¿Por qué no funciona el siguiente código? ¿Cómo se puede solucionar fácilmente?
    Código original:
        class Auto
        {
            double velocidad; // variable naturalmente privada
            public virtual void Acelerar() => Console.WriteLine("Velocidad = {0}", velocidad += 10);
        }
        class Taxi : Auto
        {
             public override void Acelerar() => Console.WriteLine("Velocidad = {0}", velocidad += 5);
        }
    Código corregido:
        class Auto
        {
            protected double velocidad; // protected permite a la descendencia acceder
            public virtual void Acelerar() => Console.WriteLine("Velocidad = {0}", velocidad += 10);
        }
        class Taxi : Auto
        {
             public override void Acelerar() => Console.WriteLine("Velocidad = {0}", velocidad += 5);
        }
*/
Punto4.Run();
/* PUNTO 5: ¿Qué líneas del siguiente código provocan error de compilación y por qué?
    Código:
        class Persona
        {
            public string Nombre { get; set; }
        }
        public class Auto
        {
            private Persona _dueño1, _dueño2;
            public Persona GetPrimerDueño() => _dueño1; !! ERROR: public es más accesible que Persona (private por defecto)
            protected Persona SegundoDueño { !! MISMO ERROR: protected es más accesible que private
                set => _dueño2 = value;
            }
        }
*/
/* PUNTO 6: Señalar el error en cada uno de los siguientes casos:
    6.1)
        class A
        {
         public string M1() => "A.M1";
        }
        class B : A
        {
         public override string M1() => "B.M1"; ERROR: (*)
        }
        (*) no se debe poner 'override', este solo se utiliza para superclases con métodos virtuales
        
    6.2)
        class A
        {
         public abstract string M1(); ERROR: (*)
        }
        class B : A
        {
         public override string M1() => "B.M1";
        }
        (*) A no es una clase abstracta
        
    6.3)
        abstract class A
        {
         public abstract string M1() => "A.M1"; ERROR: (*)
        }
        class B : A
        {
         public override string M1() => "B.M1";
        }
        (*) método abstracto no debe retornar nada
        
    6.4)
        class A
        {
         public override string M1() => "A.M1"; ERROR: (*)
        }
        class B : A
        {
         public override string M1() => "B.M1"; ERROR: (*)
        }
        (*) métodos override sin superclase con método virtual
        
    6.5)
        class A
        {
         public virtual string M1() => "A.M1"; 
        }
        class B : A
        {
         protected override string M1() => "B.M1"; ERROR: (*)
        }
        (*) debe ser igual o más accesible que el método sobreescrito de su superclase (public)
        
    6.6)
        class A
        {
         public static virtual string M1() => "A.M1"; ERROR: (*)
        }
        class B : A
        {
         public static override string M1() => "B.M1"; ERROR: (*)
        }
        (*) sólo se usan los modificadores virtual, override o abstract con miembros de instancia, no estáticos

    6.7)
        class A
        {
         virtual string M1() => "A.M1"; ERROR: (*)
        }
        class B : A
        {
         override string M1() => "B.M1";
        }
        (*) un método virtual no puede ser privado

    6.8)
        class A
        {
         protected A(int i) { }
        }
        class B : A
        {
         B() { } ERROR: (*)
        }
        (*) no se llama a base(int), y como A no tiene un constructor sin parámetros, 
            esto genera un error de compilación

    6.9)
        class A
        {
         private int _id;
         protected A(int i) => _id = i;
        }
        class B : A
        {
         B(int i):base(5) {
             _id = i; ERROR: (*)
         }
        }
        (*) _id es un atributo privado de A

    6.10)
        class A
         {
         private int Propiedad { set; public get; } ERROR: (*)
         }
         class B : A
         {
         }
         (*) el accesor del get es más accesible que la propiedad

    6.11)
        abstract class A
        {
         public abstract int Prop {set; get;}
        }
        class B : A
        {
         public override int Prop // ERROR: (*)
         {
         get => 5;
         }
        }
         (*) debe implementar el setter también
         
    6.12)
        abstract class A
        {
         public int Prop {set; get;}
        }
        class B : A
        {
         public override int Prop { ERROR: (*)
         get => 5;
         set {}
         }
        }
         (*) no se debe usar override porque Prop no es ni abstract ni virtual
*/
// Punto7.Run();
Console.ReadKey();