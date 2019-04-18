with dtauler;
use dtauler;
with darbolordinario;
with dcola;
with Ada.Text_IO;
use Ada.Text_IO;

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

   procedure fillBoard (t: tauler; state: String) is
      index: Integer:=0;

   begin

      for I in 1..3 loop

         for E in 1..3 loop

            t(I, E):=state(1);
         index:=index+1;
         end loop;

      end loop;

   end fillBoard;

   package darboltauler is new darbolordinario(estat, print);
   use darboltauler;

  -- type parbol is access arbol;
  -- package dcolaarbol is new dcola(parbol);
  -- use dcolaarbol;
   state: String(1..9);
  -- type state is array (1..9) of Character;
   lastPlayer: Character;
   e: estat;
   a: arbol;
   t: tauler;

begin

   Put("Introduce un estado inicial del juego: ");
   get(state);
   Put_Line(state);
   Put_Line(" ");
   Put("Introduce el último jugador que ha realizado el movimiento (1-2): ");
   Get(lastPlayer);

   fillBoard(t, state);
   e.all:=(t, lastPlayer);


end main;
