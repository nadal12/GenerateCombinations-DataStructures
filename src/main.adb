with dtauler;
use dtauler;
with darbolordinario;
with dcola;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure main is

   type estat is record
      t: tauler;
      jugador: integer;
   end record;

   procedure print (s: in estat) is
   begin
      Put_Line("Jugador: " & s.jugador'Image);
      print(s.t);
   end print;
   
    --Algoritmo que genera el espacio de estados para un determinado estado
   --inicial
   procedure genera_estats(t: in out arbol) is
      s: estat;   --estado
      b: tauler;  --board
      j: integer; --player
      cont: boolean;
      type array_tipus is array(1..2) of peces;
      array_peces: array_tipus;

   begin
      array_peces(1..2) := ('X', 'O');
      cont := true;

      while cont loop
         s := raiz(t);    --obtain state
         b := s.t;        --obtain board

         if s.jugador = 1 then
            j := 2;
         else
            j := 1;
         end if;

         --Anadir hijos a raiz del arbol
         filas:
         for i in 1..3 loop
            columnas:
            for j in 1..3 loop
               if b(i,j) = '-' then
                  b(i,j) := array_peces(j);

                  s.all := (b, j);

                  anadir_hijo(t, s);
               end if;
            end loop columnas;
         end loop filas;

         --Verificar si arbol tiene hijos
         if e_primer_hijo(t) then
            primer_hijo(t, t);
            generar_estats(t); --Generar estados hijos de primer hijo
            padre(t, t);
         end if;

         --Verificar si subarbol tiene subarbol hermano
         if e_hermano(t) then
            hermano(t,t);
         else
            cont := false;
         end if;

      end loop;

   end genera_estats;

   package darboltauler is new darbolordinario(estat, print);
   use darboltauler;

   type parbol is access arbol;
   package dcolaarbol is new dcola(parbol);
   use dcolaarbol;

   lastPlayer: integer; 
   estado: String(1..9); 
   t: tauler; 
   index: integer:=1;  
   p: peces;
   
begin  
   
   --Recoger datos proporcionados por el usuario.
   Put("Introduce un estado inicial del juego: ");
   get(estado); 
   New_Line;
   Put("Introduce el último jugador que ha realizado el movimiento (1-2): ");
   get(lastPlayer);
   
   for I in 1..3 loop
      for E in 1..3 loop
         
         p:= peces'First; 
         t(I, E) := p;
         index:=index+1; 
         
      end loop; 
   end loop; 
   
   
   --datosIniciales(t, estado);
   
 --  e.t:= t; 
--   e.jugador:=lastPlayer; 
   
  -- atomo(a, e); 
   
   
end main;
