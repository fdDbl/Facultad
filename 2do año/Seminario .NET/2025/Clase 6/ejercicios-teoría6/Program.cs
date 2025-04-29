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
*/
Console.ReadKey();