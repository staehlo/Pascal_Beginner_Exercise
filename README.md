# Pascal_Beginner_Exercise
Implementation of a programming task from Germany's 'Jugendwettbewerb Informatik 2018':<br/>
task 'Auf und Ab' as an exercise for an introductory course to programming.<br/>

The task description can be found here (in German):<br/>
https://bwinf.de/fileadmin/user_upload/BwInf/2018/37/1._Runde/Aufgaben/BWINF_37_Aufgaben_WEB.pdf

Implementation is in Pascal.

Short summary:<br/>
Frederick hat auf dem Speicher das Leiterspiel gefunden. Die Spielregeln sind einfach. Wer an der Reihe ist, würfelt einmal und bewegt dann seine Spielfigur entsprechend der gewürfelten Augenzahl weiter. Kommt die Figur dabei an einem Leiterende zu stehen, wird sie direkt zum anderen Ende der Leiter bewegt. Das gilt sowohl aufwärts als auch abwärts: Endet der Zug z. B. auf Feld 6, geht es direkt zu Feld 27. Endet der Zug hingegen auf der 27, geht es leider zurück zur 6.

Gewonnen hat, wer mit seiner Figur zuerst das Zielfeld 100 exakt erreicht. Das bedeutet: Wird kurz vor dem Zielfeld eine zu große Zahl gewürfelt, muss die Spielfigur den überschüssigen Rest zurücklaufen. Steht die Figur zum Beispiel auf der 99 und ihr Spieler würfelt eine Vier, muss die Figur zur 97 bewegt werden. Frederick überlegt sich: Wenn man nur Einsen würfelt, erreicht man auf jeden Fall das Ziel – aber bei mehreren Mitspielern wohl nicht als Erster. Frederick will wissen, ob man auch für das wiederholte Würfeln eines der anderen Werte von Zwei bis Sechs das Ziel erreicht. Junioraufgabe 1 Du möchtest Frederick helfen. Schreibe ein Programm, das für alle sechs möglichen Zahlen herausfindet, ob man beim Leiterspiel das Ziel erreicht, wenn man stets diese Zahl würfelt. Wie oft müsste Frederick jeweils würfeln, sofern er überhaupt ins Ziel kommt?
