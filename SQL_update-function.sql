/*
L'istruzione UPDATE viene utilizzata per modificare i dati esistenti in una tabella.  
La clausola SET specifica le colonne da aggiornare e i nuovi valori da assegnare.  
Infine, la clausola WHERE serve a identificare quali righe devono essere modificate,  
evitando di aggiornare tutte le righe accidentalmente.
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


UPDATE dipendenti
SET stipendio = 1800, nome = 'Giacomo'  
WHERE id_dipendente IN (1,3); -- Con questa query stiamo aggiornando la riga 1 e la riga 3 modificando la colonna "nome" e "stipendio"

/*
L'istruzione CASE in SQL viene utilizzata per applicare logiche condizionali, simile a un "if-else" in altri linguaggi di programmazione.  
Ogni condizione è definita dall'istruzione `WHEN`, che esamina una condizione.
Se la condizione è vera, il valore specificato dopo `THEN` viene assegnato alla colonna.  
Una volta che tutte le condizioni sono state definite, il blocco `CASE` deve essere terminato con `END`.
*/

UPDATE dipendenti
SET stipendio = CASE 
    WHEN id_dipendente = 2 THEN 1400
    WHEN id_dipendente = 4 THEN 1300
END
WHERE id_dipendente IN (2,4);

-- Utilizzare l'istruzione CASE serve solo a specificare come modificare specifiche righe, ma non significa che non dobbiamo inserire l'istruzione WHERE.