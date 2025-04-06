/*
La funzione 'GROUP BY' seleziona una colonna, con più elementi uguali, e li raggruppa in singoli elementi diversi fra loro.
Qualora un'elemento di una colonna viene rilevato più di una volta, allora a schermo non verrà printato non più di una sola volta.
poiché già printato in precedenza.

La funzione 'HAVING', invece, funziona in maniera simile alla funzione 'WHERE', mostrando a schermo solo la parte di tabella che
rispetta una condizione specifica.
*/

CREATE TABLE IF NOT EXISTS studenti(
    id_studente INT NOT NULL AUTO_INCREMENT,
    nome TEXT NOT NULL,
    id_corso INT,
    PRIMARY KEY(id_studente)
);

CREATE TABLE IF NOT EXISTS corsi(
    id_corso INT NOT NULL AUTO_INCREMENT,
    nome_corso TEXT NOT NULL,
    PRIMARY KEY(id_corso)
);

INSERT INTO studenti(nome, id_corso)
VALUE 
('Carlo', 1), 
('Claudio', 3), 
('Melissa', 1),  
('Giacomo', 3), 
('Kevin', 2);

INSERT INTO corsi(nome_corso)
VALUE
('Matematica'), ('Informatica'), ('Lingue'), ('Disegno');

SELECT corsi.nome_corso, count(studenti.id_studente) AS numero_studenti -- Come colonne vengono selezionate "nome_corso" e "id_studente", ma dato che "id_studente" è stato inserito all'interno di un count, restituisce il numero di elementi in "id_studente".
FROM corsi
LEFT JOIN studenti ON studenti.id_corso = corsi.id_corso -- Prende ogni elemento della colonna "nome_corso", anche quelli che non hanno nessuno studente associato, alla condizione che l'elemento, di ogni singola riga, della colonna "id_corso" della tabella studenti sia uguale all'elemento della colonna "id_corso" della tabella corsi.
GROUP BY corsi.nome_corso; -- Vengono mostrati a schermo solo elementi della colonna "nome_corso" senza duplicati, ma siccome stiamo prendendo il count  di "id_studente", come seconda colonna viene mostrato il numero di righe della colonna "id_studenti", per ogni corso diverso, che nella stessa riga hanno un corso in comune. Se un corso non ha studenti viene mostrato comunque, a causa della LEFT JOIN della tabella corsi, ma il conteggio sarà 0.
HAVING numero_studenti = 1 -- Selezionando l'alias di "count(studenti.id_studenti)", stiamo chiedendo di stampare a schermo solo la parte di colonna generata in cui il count di "id_studenti" è uguale a 1.