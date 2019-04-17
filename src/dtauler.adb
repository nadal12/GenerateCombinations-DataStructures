with Ada.Text_IO;
use Ada.Text_IO;

package body dtauler is

   procedure empty (t: out tauler) is
   begin
      t := (others => (others => peces'First));
   end empty;

   procedure print (t: in tauler) is
      p: peces;
      s: String(1..3);
   begin
      New_Line;
      for i in t'Range(1) loop
         for j in t'Range(2) loop
            p := t(i, j);
            s := p'Image;
            put(s(2) & " ");
         end loop;
         new_line;
      end loop;
      New_Line;
   end print;

   procedure mouJugador(t: in out tauler; numJugador: in integer; cella: in tcella) is
   begin
      t(cella.fila, cella.columna) := peces'Val(numJugador);
   end mouJugador;

   function getDimensio(t: in tauler) return integer is
   begin
      return dimensio;
   end getDimensio;

   function getNumJugadors(t: in tauler) return integer is
   begin
      return numJugadors;
   end getNumJugadors;

   function isCasellaBuida(t: in tauler; cella: in tcella) return Boolean is
   begin
      return t(cella.fila, cella.columna) = peces'First;
   end isCasellaBuida;

   procedure clone (t1: in tauler; t2: out tauler) is
   begin
      t2 := t1;
   end clone;

   function getJugador(p: in string) return integer is
   begin
      return peces'Pos(peces'Value("'"& p &"'"));
   end getJugador;

   function isTaulerComplet(t: in tauler) return Boolean is
      -- Funci� per completar
   begin
      return true;
   end isTaulerComplet;

   -- Funci� que retorna si el tauler cont�
   -- una disposici� de peces pel jugador 'jugador'
   -- que formin una l�nia (horitzontal o vertical)
   function isLinia (t: in tauler; jugador: in integer) return Boolean is
      -- Funci� per completar
   begin
      return true;
   end isLinia;

   -- Funci� que retorna si el tauler cont�
   -- una disposici� de peces pel jugador 'jugado'
   -- que formin una diagonal (normal o inversa)
   function isDiagonal (t: in tauler; jugador: in integer) return Boolean is
      -- Funci� per completar
   begin
      return true;
   end isDiagonal;

   function isJocGuanyat (t: in tauler; jugador: in integer) return boolean is
      -- Funci� per completar
   begin
      return true;
   end isJocGuanyat;

end dtauler;
