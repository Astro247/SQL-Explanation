/*
Il meccanismo di sort in SQL funziona dipendentemente da cosa si sta cercando di ordinare: se si tratta di parole, allora l'ordine sarà alfabetico,
se si tratta di numeri allora l'ordine è numerico, mentre se si tratta di date allora le date vengono ordinate dalla più recente alla meno recente (o viceversa).

La funzione che permette il sort è "ORDER BY" seguita da una o più colonne che si desidera sortare. Una volta inserite le colonne, è possibile specificare
il verso di ordinamento: "ASC" sta per ascendente, quindi ordina le parole dalla A alla Z, numeri dal più piccolo al più grande e le date dalla più vecchia alla più recente.
Processo esattamente opposto per la funzione "DESC", ossia discendente.

Qualora si volessero inserire più colonne da sortare, la prima colonna inserita sarà quella "portante", in altre parole è la colonna con
la priorità in termini di ordinamento rispetto alle altre.
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


SELECT *  FROM dipendenti ORDER BY stipendio ASC -- Questa query chiede l'ordinamento della tabella "dipendenti" in modo tale che la colonna "stipendio" venga ordinata in maniera ascendente