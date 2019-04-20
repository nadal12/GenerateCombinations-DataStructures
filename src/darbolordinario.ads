with dcola;

generic
   type elem is private;
   with procedure visita(x: elem);

   with package micola is new dcola(elem);
   use micola;

   package darbolordinario is
   type arbol is limited private;

   mal_uso: exception;
   espacio_desbordado: exception;

   procedure avacio(t: out arbol);
   function esta_Vacio(t: in arbol) return boolean;
   procedure añadir_hijo(t: in out arbol; x: in elem);
   function e_primer_hijo(t: in arbol) return boolean;
   procedure primer_hijo(t: in arbol; ct: out arbol);
   procedure atomo (t: out arbol; x: in elem);
   function raiz(t: in arbol) return elem;
   function e_hermano(t: in arbol) return boolean;
   procedure hermano(t: in arbol; st: out arbol);
   function e_padre(t: in arbol) return boolean;
   procedure padre(t: in arbol; pt: out arbol);
   procedure r_amplitud(t: in arbol);
   procedure r_amplitud(t: in arbol; qu: out cola);


private

   type nodo;
   type pnodo is access nodo;

   --Nodos que conforman un arbol
   type nodo is record
      x: elem;    --Elemento del nodo
      pp: pnodo;  --Puntero al padre
      pb: pnodo;  --Puntero a hermanos derechos
      pc: pnodo;  --Puntero a hijo izquierdo o único
   end record;

   type arbol is record
      raiz: pnodo;  --Puntero al nodo raiz
   end record;

end darbolordinario;
