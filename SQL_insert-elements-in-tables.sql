/*
Inserire dati in una tabella segue una sintassi molto semplice: E' sufficiente utilizzare la funzione "INSERT INTO", inserire il nome della tabella e inserire, in ordine, le colonne che si vuole modificaare.
Una volta specificate le colonne nella quale si vuole inserire un valore, basta utilizzare la funzzione "VALUES" e inserire, in ordine, i valori che si vuole inserire.
*/

CREATE TABLE IF NOT EXISTS studenti (
    id_studente INT NOT NULL AUTO_INCREMENT, -- AUTO_INCREMENT incrementa automaticamente il valore della colonna di 1 per ogni nuovo record inserito nella tabella, garantendo che ogni valore sia univoco e crescente.
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    telefono VARCHAR(10) UNIQUE DEFAULT 'no-numero-telefono',
    PRIMARY KEY(id_studente)
);

CREATE TABLE IF NOT EXISTS genitori(
    id_studente INT NOT NULL,
    telefono_genitore VARCHAR(10) UNIQUE DEFAULT 'no-numero-telefono',
    via_casa VARCHAR(100),
    PRIMARY KEY(id_studente),
    FOREIGN KEY (id_studente) REFERENCES studenti (id_studente) ON DELETE CASCADE
);

INSERT INTO studenti (nome, cognome, telefono) -- In questo caso, dato che è stato inserito l'auto_increment nella colonna "id_studente" non è necessario incrementarlo manualmente ogni volta o inserirlo proprio fra le colonne da modificare, viene incrementato da solo per ogni nuova riga aggiunta.
VALUES
("Marco", "Rossi", "3163752198"),  
("Luca", "Bianchi", "3285697412"),  
("Giulia", "Verdi", "3478529631"), 
("Francesca", "Ferrari", "3397412586");

INSERT INTO genitori (id_studente, nome, cognome, telefono) -- In questo caso, invece, dato che non è presente l'auto_increment, è necessario incrementare l'id studente manualmente ogni volta.
VALUES
(1, "Franco", "Rossi", "3163552118"),  
(2, "Giacomo", "Bianchi", "3282597512"),  
(3, "Marcello", "Verdi", "7472529611"), 
(4, "Pietro", "Ferrari", "8297412546"); 
