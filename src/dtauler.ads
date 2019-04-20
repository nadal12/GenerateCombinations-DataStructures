package dtauler is

   type tauler is private;

   type tcella is record
      fila: integer;
      columna: integer;
   end record;

   procedure empty (t: out tauler);
   procedure clone (t1: in tauler; t2: out tauler);
   procedure print (t: in tauler);
   procedure mouJugador(t: in out tauler; numJugador: in integer; cella: in tcella);
   function getDimensio(t: in tauler) return integer;
   function getNumJugadors(t: in tauler) return integer;
   function isCasellaBuida(t: in tauler; cella: in tcella) return Boolean;

   -- Funció que retorna si el tauler està  complet:
   -- totes les caselles ocupades per peces 'X' o 'O'
   function isTaulerComplet(t: in tauler) return Boolean;

   -- Funció que retorna si el tauler representa
   -- una disposició de peces corresponents
   -- a una situació guanyadora pel jugador 'jugador'
   function isJocGuanyat (t: in tauler; jugador: in integer) return boolean;

   -- Funció que retorna el número de jugador
   -- a partir de l'string corresponent a la
   -- imatge de la peça ('X', 'O')
   function getJugador(p: in string) return integer;

private
   dimensio: integer := 3;
   numJugadors: integer := 2;
   type peces is ('-', 'X', 'O');
   type tauler is array (1..dimensio, 1..dimensio) of peces;

end dtauler;
