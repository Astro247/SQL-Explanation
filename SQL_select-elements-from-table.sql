/*
Per selezionare degli elementi da una tabella è sufficiente utilizzare la funzione "SELECT" seguita dalle colonne che si vogliono selezionare per poi
utilizzare la funzione "FROM" per specificare in quale tabella sono presenti le colonne desiderate.
Se si volesse inserire una condizione, quindi non selezionare tutte le righe di specifiche colonne, ma delle determinate righe, è sufficiente utilizzare
la funzione "WHERE" seguita da una condizione.
*/

CREATE TABLE IF NOT EXISTS studenti (
    id_studente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    telefono VARCHAR(10) UNIQUE DEFAULT 'no-numero-telefono',
    PRIMARY KEY(id_studente)
);

INSERT INTO studenti (nome, cognome, telefono) 
VALUES
("Marco", "Rossi", "3163752198"),  
("Luca", "Bianchi", "3285697412"),  
("Giulia", "Verdi", "3478529631"), 
("Francesca", "Ferrari", "3397412586");


SELECT id_studente, nome, telefono FROM studenti WHERE id_studente%2=0; -- Questa query richiede solo la colonna "nome" e "telefono"  della tabella "studenti" e prende solo le righe dove l'id dello studente è pari.