------------------------PAQUETE DE IMPLEMENTACI�N DCOLA-------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body dtauler is

   --Crea un tablero vac�o.
   procedure empty (t: out tauler) is
   begin
      t := (others => (others => peces'First));
   end empty;

   --Imprime por pantalla un tablero.
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

   --Mueve el jugador indicado en el tablero y celda indicada.
   procedure mouJugador(t: in out tauler; numJugador: in integer; cella: in tcella) is
   begin
      t(cella.fila, cella.columna) := peces'Val(numJugador);
   end mouJugador;

   --Devuelve la dimensi�n de un tablero.
   function getDimensio(t: in tauler) return integer is
   begin
      return dimensio;
   end getDimensio;

   --Devuelve la cantidad de jugadores que participan en la partida.
   function getNumJugadors(t: in tauler) return integer is
   begin
      return numJugadors;
   end getNumJugadors;

   --Devuelve un booleano indicando si la casilla especificada esta vac�a.
   -- True: Casilla vac�a.
   -- False: Casilla llena.
   function isCasellaBuida(t: in tauler; cella: in tcella) return Boolean is
   begin
      return t(cella.fila, cella.columna) = peces'First;
   end isCasellaBuida;

   --Clona un tablero a otro.
   procedure clone (t1: in tauler; t2: out tauler) is
   begin
      t2 := t1;
   end clone;

   --Devuelve el jugador correspondiente al string pasado por par�metro.
   function getJugador(p: in string) return integer is
   begin
      return peces'Pos(peces'Value("'"& p &"'"));
   end getJugador;

   -- totes les caselles ocupades per peces 'X' o 'O'
   function isTaulerComplet(t: in tauler) return boolean is
   begin

      filas:
      for i in 1..dimensio loop
         columnas:
         for j in 1..dimensio loop

            if t(i, j) = peces'First then return false; end if;

         end loop columnas;
      end loop filas;

      return true;

   end isTaulerComplet;

   --Funci� que retorna si el tauler conte
   --una disposicio de peces pel jugador 'jugador'
   --que formin una linia (horitzontal o vertical)
   function isLinia(t: in tauler; jugador: in integer) return boolean is
      type array_tipus is array(1..2) of peces;
      array_peces: array_tipus;
   begin
      array_peces(1..2) := ('X', 'O');

      for i in 1..dimensio loop
         case i is
            when 1 => if t(i,i) = array_peces(jugador) and then
                    t(i+1, i+1) = array_peces(jugador) and then
                    t(i+2, i+2) = array_peces(jugador) then return true;
               end if;

            when 2 => if t(i,i) = array_peces(jugador) and then
                    t(i+1, i+1) = array_peces(jugador) and then
                    t(i-1, i-1) = array_peces(jugador) then return true;
               end if;

            when 3 => if t(i,i) = array_peces(jugador) and then
                    t(i-1, i-1) = array_peces(jugador) and then
                    t(i-2, i-2) = array_peces(jugador) then return true;
               end if;
            when others => return false;
         end case;

      end loop;

     return false;

   end isLinia;

   -- Funci� que retorna si el tauler cont�
   -- una disposici� de peces pel jugador 'jugado'
   -- que formin una diagonal (normal o inversa)
   function isDiagonal (t: in tauler; jugador: in integer) return Boolean is


   begin

      --Jugador 1 -> X
      if jugador = 1 then

         --Comprobar que la casilla central est� ocupada por la ficha del jugador 1.
         if t(2,2) /= 'X' then

            return false;

         end if;

         --Comprobar las dem�s casillas para formar la diagonal.
         if ((t(1,1) = 'X') and (t(3,3) = 'X')) or ((t(1,3)='X') and (t(3,1)='X')) then

            return true;

         end if;

      --Jugador 2 -> O
      else
          --Comprobar que la casilla central est� ocupada por la ficha del jugador 2.
          if t(2,2) /= 'O' then

            return false;

         end if;

         --Comprobar las dem�s casillas para formar la diagonal.
         if ((t(1,1) = 'O') and (t(3,3) = 'O')) or ((t(1,3)='O') and (t(3,1)='O')) then

            return true;

         end if;

      end if;

      return false;

   end isDiagonal;

   --Devuelve un booleano indicando si el juego ha sido ganado por alg�n jugador.
   -- True: Juego ganado.
   -- False: Juego no ganado.
   function isJocGuanyat (t: in tauler; jugador: in integer) return boolean is

   begin

      return isDiagonal(t, jugador) or isLinia(t, jugador);

   end isJocGuanyat;

end dtauler;
