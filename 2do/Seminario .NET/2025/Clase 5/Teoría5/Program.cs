Cuenta c1 = new();
Cuenta.ImprimirBalance();
c1.ImprimirResumen();
Cuenta.ImprimirBalance();
Cuenta c2 = new(123,"Federico Dobal");
Cuenta.ImprimirBalance();
c2.ImprimirResumen();
Cuenta.ImprimirBalance();
c2.Depositar(50000);
Cuenta.ImprimirBalance();
c1.Depositar(156);
Cuenta.ImprimirBalance();
c1.Inicializar(156,"Leandro Bie");
c1.Depositar(56000);
Cuenta.ImprimirBalance();

Console.ReadKey();