program AufundAb (input, output);
{ Umsetzung der Programmieraufgabe des Jugendwettbewerbs Informatik 2018:
* https://bwinf.de/fileadmin/user_upload/BwInf/2018/37/1._Runde/Aufgaben/BWINF_37_Aufgaben_WEB.pdf }

  type
  tRefLeitern = ^tLeitern;
  tLeitern = record
			Feld1 : integer;
			Feld2 : integer;
			next : tRefLeitern
		end;
  
  tRefHist = ^tHist;
  tHist = record
			Wert : integer;
			next : tRefHist
		end;
  
  var
  LeitAnfang,
  Leitern : tRefLeitern;
  HistAnfang,
  History : tRefHist;
  Felderzahl,
  Schrittweite,
  Pos : integer;
  doppelt : boolean;
  
  procedure LeiternEingeben (var outLeitAnfang, outLeitern : tRefLeitern);
  { Eingabe der Leiterfelder }

	var
	Feld1,
	Feld2 : integer;

  begin
    writeln('Bitte geben Sie die Felder für die Leitern ein. 0 beendet die Eingabe.');
    LeitAnfang := nil;
    writeln('1. Feld:');
    readln(Feld1);
    writeln('2. Feld:');
    readln(Feld2);
    while (Feld1 <> 0) do
    begin
      new (Leitern);
      Leitern^.Feld1 := Feld1;
      Leitern^.Feld2 := Feld2;
      Leitern^.next := LeitAnfang;
      LeitAnfang := Leitern;
      writeln('1. Feld:');
      readln(Feld1);
      if Feld1 <> 0 then
      begin
		writeln('2. Feld:');
		readln(Feld2)
	  end; { if }
    end; { while }
    writeln('Sie haben die Leitern erfolgreich eingetragen')
  end; { LeiternEingeben }


  function Wuerfeln (Pos, i, Felderzahl : integer) : integer;
  { berechnet das nächste Feld auf dem die Spielfigur steht }
  
	var
	Dummy : integer;
  
  begin
    Dummy := Pos + i;
    if Dummy < Felderzahl then
    Wuerfeln := Dummy
    else
    begin
      Wuerfeln := 2 * Felderzahl - Dummy
    end;
  end; { Wuerfeln }


  procedure HistoryDurchsuchen (
					inPos : integer;
				var ioHistAnfang,
					ioHistory : tRefHist;
				var iodoppelt : boolean );

	var
	Zeiger : tRefHist;

	begin
	  Zeiger := ioHistAnfang;
	  if (ioHistAnfang = nil) then
	  { Liste ist leer }
	    begin
	      new (ioHistory);
	      ioHistory^.Wert := inPos;
	      ioHistory^.next := ioHistAnfang;
	      ioHistAnfang := ioHistory
	    end
	  else { Liste nicht leer }
	  begin
	    while (Zeiger^.next <> nil) and (Zeiger^.Wert <> inPos) do
	      Zeiger := Zeiger^.next;
	    if (Zeiger^.Wert = inPos) then
	      iodoppelt := true
	    else { Zeiger^.next = nil und inPos kommt nicht vor }
	      new (ioHistory);
	      ioHistory^.Wert := inPos;
	      ioHistory^.next := ioHistAnfang;
	      ioHistAnfang := ioHistory
	  end { else }
	end; { Suchen }


  procedure LeiternDurchsuchen(
					var ioPos : integer;
					inLeitanfang,
					inLeitern : tRefLeitern);

    var
    dummy : integer;
	Zeiger : tRefLeitern;
	
  begin
	dummy := -10; { dummy erhält einen Unsinnswert }
	Zeiger := inLeitanfang;
	while (Zeiger^.next <> nil) and (Zeiger^.Feld1 <> ioPos) and (Zeiger^.Feld2 <> ioPos) do
	  Zeiger := Zeiger^.next;
	if (Zeiger^.Feld1 = ioPos) then
	  dummy := Zeiger^.Feld2;
	if (Zeiger^.Feld2 = ioPos) then
	  dummy := Zeiger^.Feld1;
	if (dummy <> -10) then
	  ioPos := dummy	
  end; { LeiternDurchsuchen }

{ Beginn des Statement Part }
begin { AufundAb }

  { Eingabe der Spielfelderanzahl }
  writeln('Wie viele Felder hat ihr Spiel?');
  readln(Felderzahl);

  { Eingabe der Leiterfelder }
  LeiternEingeben(LeitAnfang, Leitern);

  for Schrittweite := 1 to 6 do
  begin
    Pos := 0;
    doppelt := false;
    HistAnfang := nil;
    
    while (Pos < Felderzahl) AND (doppelt = false) do
    begin
      Pos := Wuerfeln (Pos, Schrittweite, Felderzahl);
	  LeiternDurchsuchen (Pos, Leitanfang, Leitern);
      HistoryDurchsuchen(Pos, HistAnfang, History, doppelt);
    end; { while }
	if doppelt = true then
      writeln(Schrittweite, ' fuehrt zu einer Schleife.')
    else
      writeln(Schrittweite, ' erreicht ', Felderzahl, ' ohne Schleife.')
  end; { for }

end. { AufundAb }
