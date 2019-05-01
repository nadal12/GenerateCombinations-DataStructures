------------------------PAQUETE DE ESPECIFICACIÓN DCOLA-------------------------

--Tipo genérico. 
generic
   type item is limited private; 

package dcola is
   type cola is limited private;
   
   --Declaración de las excepciones.
   mal_uso: exception; 
   espacio_desbordado: exception; 
   
   --Declaración de los procedimientos y funciones. 
   procedure cvacia (qu: out cola);
   procedure poner (qu: in out cola; x:in item);
   procedure borrar_primero (qu: in out cola);
   
   function coger_primero (qu: in cola) return item; 
   function esta_vacia (qu: in cola) return boolean; 
   
   --Parte privada (implementación)
private
   
   --Declaración del nodo y del puntero a nodo. 
   type nodo; 
   type pnodo is access nodo;
   
   --Definición de un nodo. 
   type nodo is record
      x:item; 
      sig:pnodo; 
   end record;
   
   --Definición de una cola. 
   type cola is record
      p, q: pnodo; 
   end record;  

end dcola;
