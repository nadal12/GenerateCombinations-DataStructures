package body darbolordinario is

   --Procedimiento que vacía un arbol
   procedure avacio(t: out arbol) is
      raiz: pnodo renames t.raiz;
   begin
      raiz := null;
   end avacio;

   --Función que indica si un arbol está o no vacío
   function esta_vacio(t: in arbol) return boolean is
   begin
      return t.raiz = null;
   end esta_vacio;

   --Procedimiento para añadir un hijo a la raiz del arbol de parametros
   procedure añadir_hijo(t: in out arbol; x: in elem) is
      raiz: pnodo renames t.raiz;
      p: pnodo;
   begin
      if raiz = null then raise mal_uso; end if; --Revisar si arbol no es vacio

      if raiz.pc = null then --Revisar si arbol tiene o no hijo
         p := new nodo'(x, raiz, null, null);
         raiz.pc := p;
      else    -- Si ya tiene hijo, agregar nuevo hijo en listado de hermanos del
         -- primer hijo
         p := raiz.pc;
         while p.pb /= null loop
            p := p.pb;
         end loop;

         p.pb := new nodo'(x, raiz, null, null);
      end if;

   exception
      when Storage_Error => raise espacio_desbordado;

   end añadir_hijo;

   --Función que indica si la raiz de un arbol tiene hijos
   function e_primer_hijo(t: in arbol) return boolean is
   begin
      return t.raiz.pc /= null; --True si el primer hijo de la raiz no es null
   exception
         when Constraint_Error => raise mal_uso;
   end e_primer_hijo;

   --Procedimiento que devuelve el subarbol formado por el hijo de la raiz de t
   procedure primer_hijo(t: in arbol; ct: out arbol) is
      rt: pnodo renames t.raiz;
      rct: pnodo renames ct.raiz;
   begin

      if rt.pc = null then raise mal_uso; end if;

      rct := rt.pc; --Raiz de child es puntero a child de padre
   end primer_hijo;

   --Procedimiento que crea la raiz de un árbol
   procedure atomo(t: out arbol; x: in elem) is
   begin
      t.raiz := new nodo'(x, null, null, null); --Nodo sin padre/hijos/hermanos
   end atomo;

   --Función que devuelve el elemento de la raiz de un árbol
   function raiz(t: in arbol) return elem is
   begin
      return t.raiz.x; --Devuelve primer hijo
   exception
      when Constraint_Error => raise mal_uso;
   end raiz;

   --Función que indica si la raiz t tiene hermano
   function e_hermano(t: in arbol) return boolean is
      r: pnodo renames t.raiz;
   begin
      return r.pb /= null;
   exception
      when Constraint_Error => raise mal_uso;
   end e_hermano;

   --Procedimiento que devuelve el subarbol formado por el hermano de la raiz t
   procedure hermano(t: in arbol; st: out arbol) is
      rt: pnodo renames t.raiz; --raiz de t
      rst: pnodo renames st.raiz; --raiz de st
   begin
      rst := rt.pb; --La raiz del subarbol hermano es el puntero al hermano de t
   exception
      when constraint_error => raise mal_uso;
   end hermano;

   --Función que indica si t tiene padre
   function e_padre(t: in arbol) return boolean is
   begin
      return t.raiz.pp /= null;
   exception
      when Constraint_Error => raise mal_uso;
   end e_padre;

   --Procedimiento que devuelve el arbol formado por el padre de la raiz de t
   procedure padre(t: in arbol; pt: out arbol) is
      rt: pnodo renames t.raiz;
      rpt: pnodo renames pt.raiz;
   begin
      rpt := rt.pp;
   exception
      when Constraint_Error => raise mal_uso;
   end padre;

   --Procedimiento que realiza un recorrido en amplitud del arbol
   procedure r_amplitud(t: in arbol) is
      package micola is new dcola(pnodo);
      use micola;

      q: micola.cola;
      pt: pnodo renames t.raiz;
      p: pnodo;

   begin

      if pt = null then raise mal_uso; end if;

      p := pt;

      cvacia(q);
      poner(q, p);

      while not esta_vacia(q) loop
         p := coger_primero(q);
         borrar_primero(q);
         visita(p.x);

         p := p.pc;

         while p /= null loop
            poner(q, p);
            p := p.pb;
         end loop;
      end loop;

   end r_amplitud;

   --Procedimiento que realiza un recorrido en amplitud del arbol introduciendo
   --los elementos dentro de una cola.
   procedure r_amplitud(t: in arbol; qu: out cola) is
      package micola is new dcola(pnodo);
      use micola;

      q: micola.cola;
      pt: pnodo renames t.raiz;
      p: pnodo;

   begin

      if pt = null then raise mal_uso; end if;

      p := pt;

      cvacia(q);
      poner(q, p);

      while not esta_vacia(q) loop
         p := coger_primero(q);
         borrar_primero(q);
         poner(qu, p.x);

         p := p.pc;

         while p /= null loop
            poner(q, p);
            p := p.pb;
         end loop;
      end loop;

   end r_amplitud;

end darbolordinario;
