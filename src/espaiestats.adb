--------------------------------------------------------------------------------
-- TÍTULO: Práctica 2: TRES EN RAYA
-- ASIGNATURA: Estructura de Datos - UIB
-- DESARROLLADORES: Eugenio Doñaque y Nadal Llabrés. 
-- FECHA: 03/05/2019
--------------------------------------------------------------------------------
-- DESCRIPCIÓN: Esta práctica consiste en generar y mostrar el espacio de 
-- estados para el juego tres en raya. El usuario introducirá un estado y el 
-- programa mostrará todos los posibles estados a partir del introducido. 
--------------------------------------------------------------------------------
-- NOTAS: El programa esta programado para funcionar en tableros de tamaño 3x3, 
-- con dos jugadores y en modo "3 en raya". 
--------------------------------------------------------------------------------

--Se añaden los paquetes necesarios. 
with dtauler;
use dtauler;
with darbolordinario;
with dcola;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure espaiestats is
   
   --Definición del tipo estat. 
   type estat is record
      t: tauler;
      jugador: integer;
   end record;
   
   --Procedimiento que imprime por pantalla un estado recibido por parámetro. 
   procedure print (s: in estat) is
   begin
      Put_Line("Jugador: " & s.jugador'Image);
      print(s.t);
   end print;
   
   --Declaración de una cola de estados
   package micola is new dcola(estat); 
   use micola; 
   
   --Declaración de un árbol. 
   package darboltauler is new darbolordinario(estat, print, micola);
   use darboltauler;
   
   type parbol is access arbol; 
   package dcolaarbol is new dcola(parbol); 
   use dcolaarbol; 
  
   --Declaración de variables. 
   lastPlayer: integer; 
   estado: String(1..9); 
   t: tauler; 
   index: integer:=1;  
   e: estat; 
   a: arbol;
   DIM: integer;
   
   --Algoritmo que genera el espacio de estados para un determinado estado
   --inicial
   procedure genera_estats(t: in out arbol) is
      s, saux: estat; --Estado
      b: tauler; --Tablero
      j: integer; --Jugador
      c: tcella; --Celda
      qu: dcolaarbol.cola;

   begin
       
      sdsd
      ddfd
        
      cvacia(qu);
      dcolaarbol.poner(qu, t);

      while not esta_vacia(qu) loop
         
         borrar_primero(qu); 
         
         --Se obtiene el estado. 
         s := raiz(t);    
         
         if not isJocGuanyat(s.t, s.jugador) then
            --Determinar qué jugador tiene el turno. 
            if s.jugador = 1 then
               j := 2;
            else
               j := 1;
            end if;

            saux.jugador:=j;
         
            --Anadir hijos a raíz del árbol
            filas:
            for i in 1..DIM loop
               c.fila := i;
            
               columnas:
               for k in 1..DIM loop
                  c.columna := k;
               
                  --Obtener tablero. 
                  b := s.t;       
               
                  if isCasellaBuida(b, c) then
                     mouJugador(b, j , c); 

                     saux.t:=b;

                     añadir_hijo(t, saux);
                  
                  end if;
               end loop columnas;
            end loop filas;

            --Verificar si el árbol tiene hijos
            if e_primer_hijo(t) then
               primer_hijo(t, t);
               dcolaarbol.poner(qu, t);
              
               --Encolar los hermanos. 
               while e_hermano(t) loop
                  hermano(t, t); 
                  dcolaarbol.poner(qu, t); 
               end loop; 
                              
            end if;
            
         end if; 

         t := dcolaarbol.coger_primero(qu);
         
      end loop;

   end genera_estats;

   --Rellena el tablero según los datos pasados por parámetro. 
   procedure omplir_tauler(t: in out tauler; estat: in out String) is

      c: tcella;
      index: integer:=1;
      
   begin
      --Recorrido del tablero casilla a casilla. 
      for I in 1..DIM loop
         c.fila := I;
         for E in 1..DIM loop
            c.columna := E;
            mouJugador(t, getJugador(estat(index) & ""), c);  
            index:=index+1;
         end loop;
      end loop;

   end omplir_tauler;

begin  
   
   --Recoger datos proporcionados por el usuario.
   Put("Introduce un estado inicial del juego: ");
   get(estado); 
   New_Line;
   Put("Introduce el ultimo jugador que ha realizado el movimiento (1-2): ");
   get(lastPlayer);
   
   --Se vacía el tablero. (Así no será un tablero vacío y no un tablero "null"). 
   empty(t);
   
   --Se obtiene la dimensión del tablero. 
   DIM := getDimensio(t);
   
   --Llamada al procedimiento para llenar el tablero. 
   omplir_tauler(t, estado);
 
   --Asignar el tablero y el último jugador al estado inicial. 
   e.t:= t; 
   e.jugador:=lastPlayer; 
   
   --Creación del árbol con el estado inicial como raíz. 
   atomo(a, e); 
   
   --Llamada a la función que va a generar todos los estados (hijos) del juego. 
   genera_estats(a);
   
   --Llamada al recorrido en amplitud para imprimir por pantalla los estados 
   --de manera ordenada. 
   r_amplitud(a);
   
end espaiestats;
