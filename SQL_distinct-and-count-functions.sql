/*
La funzione DISTINCT indica a MySQL di darci in output tutti gli elementi di una colonna, castrando tutti
gli elementi doppi, lasciando dunque solo elementi singoli diversi fra loro.

La funzione COUNT invece, chiede a MySQL di restituirci il numero di elementi presenti in una colonna, qualora volessimo
chiedere il numero di elementi in una colonna escludendo gli elementi doppi, mantenendo dunque solo gli elementi singoli,
La sintassi prevede l'inclusione della funzione DISTINCT come "positional argument" all'interno della funzione.
*/

CREATE TABLE persone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    eta INT NOT NULL,
    citta VARCHAR(20) NOT NULL
);

INSERT INTO persone (nome, eta, citta) VALUES
('Mario Rossi', 30, 'Roma'),
('Luca Bianchi', 25, 'Milano'),
('Giulia Verdi', 28, 'Napoli'),
('Anna Neri', 35, 'Roma'),
('Francesco Gallo', 40, 'Torino'),
('Elisa Russo', 22, 'Bologna');

SELECT DISTINCT citta FROM persone; -- Con questa istruzione, stiamo chiedendo a MySQL di restituirci tutti gli elementi unici della colona "citta", non tenendo conto quindi dei doppi.

SELECT count(citta) FROM persone; -- Questa query invece restituisce in output il numero totale di elementi nella colonna "citta"

SELECT count(DISTINCT citta) FROM persone; -- Aggiungendo "DISTINCT" all'interno della funzione "count" chiede a MySQL il numero di elementi singoli, escludendo dunque elementi doppi, all'interno della colonna "citta"