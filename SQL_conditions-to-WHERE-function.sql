/*
Per andare ancora più nello specifico durante la richiesta con la funzione SELECT di specifiche righe di una tabella, è possibile
aggiungere ulteriori condizioni alla funzione WHERE.

1) AND/OR = L'istruzione 'AND' indica che la riga di una tabella viene considerata solo se due o più condizioni nel where vengono rispettate contemporaneamente, caso contrario invece per la funzione 'OR' dove almeno una delle due deve essere rispettata.
2) BETWEEN = Questa istruzione prende un range di valori, e seleziona solo quelli che rientrano in questo range.
3) IN = L'istruzione IN in SQL serve per confrontare un valore con una lista di valori possibili. È un modo più semplice e leggibile per scrivere più condizioni OR.
4) NOT IN/NOT BETWEEN = Opposto della funzione 'BETWEEN' e 'IN'.
*/

CREATE TABLE IF NOT EXISTS dipendenti (
    id_dipendente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    telefono VARCHAR(10) UNIQUE DEFAULT 'no-numero-telefono',
    stipendio DECIMAL(6,2) NOT NULL,
    data_assunzione DATE NOT NULL,
    PRIMARY KEY(id_dipendente)
);


INSERT INTO dipendenti (nome, cognome, telefono, stipendio, data_assunzione) 
VALUES
('Marco', 'Rossi', '3456789012', 1500, '2022-03-15'),
('Giulia', 'Bianchi', '3291234567', 1800, '2021-07-01'),
('Luca', 'Verdi', '3899876543', 1600, '2023-01-10'),
('Anna', 'Ferrari', '3771122334', 1000, '2019-09-20'),
('Davide', 'Moretti', '3205566778', 1700, '2020-05-25');


SELECT * FROM dipendenti WHERE stipendio <= 1600 AND data_assunzione BETWEEN '2019-01-01' AND '2021-01-01' -- Con questo SELECT stiamo cercando, nella tabella dipendenti, tutte le righe con i dipendenti che hanno uno stipendio minore o uguale di 1600, ma in più devono anche essere stati assunti fra il primo gennaio 2019 e il primo gennaio 2021.

SELECT * FROM dipendenti WHERE id_dipendente % 2 = 0 OR stipendio >= 1600 OR cognome IN (Verdi, Moretti) -- Con questo SELECT, invece, stiamo cercando tutti i dipendenti che hanno un id pari, oppure che hanno uno stipendio maggiore o uguale di 1600 oppure ancora che abbiano un cognome compreso fra uno degli elementi nella lista (in questo caso Verdi o Moretti).