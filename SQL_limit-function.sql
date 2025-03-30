/*
L'istruzione 'LIMIT' in SQL viene usata per limitare il numero di righe restituite da una query.
La sintassi è molto semplice, una volta inserita la funzione 'LIMIT' ne segue un numero intero, che rappresenta il numero di righe,
prese sempre dall'alto verso il basso, che verranno restituite in output.

Qualora si scrivessero due numeri interi separati da una virgola, il primo numero inserito rappresenta un "head off" ossia
il numero di righe, partendo dall'alto verso il basso, da saltare, mentre il secondo numero rappresenta invece le righe da prendere.
In altre parole il primo numero rappresentasse la riga da cui deve partire, mentre il secondo il numero da righe che deve prendere.

Il posizionamento di una virgola per indicare che il primo numero è un headoff è una sintassi del dbms MySQL, per altri dbms la sintassi
potrebbe variare, ma il concetto rimane uguale.
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

SELECT * FROM dipendenti ORDER BY data_assunzione DESC LIMIT 1 -- Con questa query stiamo selezionando tutto dalla tabella dipendenti, stiamo ordinando per la data in maniera discendente (quindi la tabella sarà riordinata dalla data più recente alla più vecchia) e infine stiamo chiedendo solo la prima riga.

SELECT * FROM dipendenti ORDER BY stipendio DESC LIMIT 1 -- Similmente a prima, con questa query stiamo chiedendo la persona con lo stipendio più alto di tutti.

SELECT * FROM dipendenti ORDER BY stipendio DESC LIMIT 1, 1 -- In questo caso, avendo impostato come headoff la prima riga, stiamo chiedendo in output la seconda riga della tabella.