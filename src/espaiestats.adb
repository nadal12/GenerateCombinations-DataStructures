with dtauler;
use dtauler;
with darbolordinario;
with dcola;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure espaiestats is
   
   type estat is record
      t: tauler;
      jugador: integer;
   end record;
   
   procedure print (s: in estat) is
   begin
      Put_Line("Jugador: " & s.jugador'Image);
      print(s.t);
   end print;
   
   package micola is new dcola(estat); 
   use micola; 
   
   package darboltauler is new darbolordinario(estat, print, micola);
   use darboltauler;

   type parbol is access arbol;
   package dcolaarbol is new dcola(parbol);
   use dcolaarbol;
  
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
      s, saux: estat;   --estado
      b: tauler;  --board
      j: integer; --player
      cont: boolean;
      c: tcella;  --celda

   begin
      
      cont := true;

      while cont loop
         s := raiz(t);    --obtain state
         
         if not isJocGuanyat(s.t, s.jugador) then

            if s.jugador = 1 then
               j := 2;
            else
               j := 1;
            end if;

            saux.jugador:=j;
         
            --Anadir hijos a raiz del arbol
            filas:
            for i in 1..DIM loop
               c.fila := i;
            
               columnas:
               for k in 1..DIM loop
                  c.columna := k;
               
                  b := s.t;        --obtain board
               
                  if isCasellaBuida(b, c) then
                     mouJugador(b, j , c); 

                     saux.t:=b;

                     a�adir_hijo(t, saux);
                  
                  end if;
               end loop columnas;
            end loop filas;

            --Verificar si arbol tiene hijos
            if e_primer_hijo(t) then
               primer_hijo(t, t);
               genera_estats(t); --Generar estados hijos de primer hijo
               padre(t, t);
            end if;
            
         end if; 
         
         --Verificar si subarbol tiene subarbol hermano
         if e_hermano(t) then
            hermano(t,t);
         else
            cont := false;
         end if;

      end loop;

   end genera_estats;

   procedure omplir_tauler(t: in out tauler; estat: in out String) is

      c: tcella;
      index: integer:=1;
      d: integer;

   begin

      d := getDimensio(t);
      
      for I in 1..d loop
         c.fila := I;
         for E in 1..d loop
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
   
   empty(t);
   
   DIM := getDimensio(t);
   
   omplir_tauler(t, estado);
 
   e.t:= t; 
   e.jugador:=lastPlayer; 
   
   atomo(a, e); 
   
   --print(raiz(a).t);
   
   genera_estats(a);
   
   r_amplitud(a);
   
end espaiestats;
