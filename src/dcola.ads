------------------------PAQUETE DE ESPECIFICACI�N DCOLA-------------------------

--Tipo gen�rico. 
generic
   type item is limited private; 

package dcola is
   type cola is limited private;
   
   --Declaraci�n de las excepciones.
   mal_uso: exception; 
   espacio_desbordado: exception; 
   
   --Declaraci�n de los procedimientos y funciones. 
   procedure cvacia (qu: out cola);
   procedure poner (qu: in out cola; x:in item);
   procedure borrar_primero (qu: in out cola);
   
   function coger_primero (qu: in cola) return item; 
   function esta_vacia (qu: in cola) return boolean; 
   
   --Parte privada (implementaci�n)
private
   
   --Declaraci�n del nodo y del puntero a nodo. 
   type nodo; 
   type pnodo is access nodo;
   
   --Definici�n de un nodo. 
   type nodo is record
      x:item; 
      sig:pnodo; 
   end record;
   
   --Definici�n de una cola. 
   type cola is record
      p, q: pnodo; 
   end record;  

end dcola;
