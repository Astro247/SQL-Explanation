/*
L'istruzione TRUNCATE cancella tutte le righe di una tabella.
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
('Anna', 'Ferrari', '3771122334', 1500, '2019-09-20'),
('Davide', 'Moretti', '3205566778', 1700, '2020-05-25');

TRUNCATE TABLE dipendenti; -- Con questa query ho cancellato tutti gli elementi della tabella 'dipendenti'.