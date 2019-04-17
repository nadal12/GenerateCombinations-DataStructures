------------------------PAQUETE DE IMPLEMENTACIÓN DCOLA-------------------------

package body dcola is 
   
   --Procedimiento que pone a null los índices q y p de la cola (inicialización)
   procedure cvacia(qu: out cola) is
      p: pnodo renames qu.p; 
      q: pnodo renames qu.q; 
   begin 
      p:=null; q:=null;
   end cvacia;
   
   --Función que verifica si la cola esta vacía. Si q=null -> cola vacía (true).
   function esta_vacia(qu: in cola) return boolean is 
      q: pnodo renames qu.q; 
   begin
      return q=null; 
   end esta_vacia;
   
   --Función que devuelve el primer elemento de la cola. 
   function coger_primero(qu: in cola) return item is
      q: pnodo renames qu.q;
   begin
      return q.x;
   exception
      when Constraint_Error => raise mal_uso; 
   end coger_primero;
   
   --Procedimiento que añade un elemento a la cola.
   procedure poner(qu: in out cola; x: in item) is
            
      p: pnodo renames qu.p;
      q: pnodo renames qu.q; 
      
      --Declaración del nuevo elemento "r".
      r: pnodo; 
   begin
      
      --Creación del nuevo elemento "r".
      r:= new nodo;  
      
      --Inicialización del nuevo elemento "r".
      r.all:=(x, null); 
      
      if p=null then 
         --La cola esta vacía. 
         p:=r; q:=r; 
      else 
         --La cola tiene elementos. Se engancha al último.
         p.sig:=r; p:=r;  
      end if;
      
   exception
      when Storage_Error => raise espacio_desbordado; 
   end poner;
   
   --Procedimiento que quita el primer elemento de la cola.
   procedure borrar_primero(qu: in out cola) is 
      q: pnodo renames qu.q; 
      p: pnodo renames qu.p; 
   begin
      q:= q.sig; 
      if q=null then p:= null; end if; 
   exception
      when Constraint_Error => raise mal_uso; 
   end borrar_primero; 
   
end dcola;
