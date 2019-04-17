with dtauler;
use dtauler;
with darbolordinario;
with dcola;
with Ada.Text_IO;
use Ada.Text_IO;

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

   package darboltauler is new darbolordinario(estat, print);
   use darboltauler;

   type parbol is access arbol;
   package dcolaarbol is new dcola(parbol);
   use dcolaarbol;

begin
   null;
end espaiestats;
