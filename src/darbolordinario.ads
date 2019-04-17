with dcola;

generic
   type elem is private;

   with procedure visit(x: in elem);

   with package dcolaelem is new dcola(elem);
   use dcolaelem;
package darbolordinario is
   type arbol is limited private;

   mal_uso: exception;
   espacio_desbordado: exception;

   procedure avacio (t: out arbol);
   function esta_vacio (t: in arbol) return Boolean;
   procedure anadir_hijo (t: in out arbol; x: in elem);
   function e_primer_hijo (t: in arbol) return Boolean;
   procedure primer_hijo (t: in arbol; ct: out arbol);
   procedure atom (t: out arbol; x: in elem);
   function raiz(t: in arbol) return elem;
   function e_hermano (t: in arbol) return Boolean;
   procedure hermano (t: in arbol; st: out arbol);
   function e_padre (t: in arbol) return Boolean;
   procedure padre (t: in arbol; pt: out arbol);

   procedure amplitud (t: in arbol);
   procedure amplitud (t: in arbol; q: out dcolaelem.cola);

private

   type node;
   type pnode is access node;

   type node is record
      c: elem;
      padre: pnode;
      hermano: pnode;
      primer_hijo: pnode;
   end record;

   type arbol is
      record
         raiz: pnode;
      end record;
end darbolordinario;
