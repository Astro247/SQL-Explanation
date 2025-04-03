/*
L'istruzione JOIN permette di selezionare, data una certa condizione, più colonne da più tabelle.
*/

CREATE TABLE IF NOT EXISTS ufficio(
    id_ufficio INT NOT NULL AUTO_INCREMENT,
    nome_ufficio VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_ufficio)
);


CREATE TABLE IF NOT EXISTS dipendenti (
    id_dipendente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    telefono VARCHAR(10) UNIQUE DEFAULT 'no-numero-telefono',
    stipendio DECIMAL(6,2) NOT NULL,
    data_assunzione DATE NOT NULL,
    id_ufficio INT,
    PRIMARY KEY(id_dipendente),
    FOREIGN KEY(id_ufficio) REFERENCES ufficio(id_ufficio) ON DELETE SET NULL
);


INSERT INTO dipendenti (nome, cognome, telefono, stipendio, data_assunzione) 
VALUES
('Marco', 'Rossi', '3456789012', 1500, '2022-03-15', 4),
('Giulia', 'Bianchi', '3291234567', 1800, '2021-07-01', 3),
('Luca', 'Verdi', '3899876543', 1600, '2023-01-10', 1),
('Anna', 'Ferrari', '3771122334', 1500, '2019-09-20', 3),
('Davide', 'Moretti', '3205566778', 1700, '2020-05-25', 2);


INSERT INTO ufficio (nome_ufficio)
VALUES
('Amministrazione'),
('Servizio Civile'),
('Call Center'),
('Supporto Clienti');

/*
INNER JOIN è un tipo di unione tra tabelle che permette di combinare i dati  
solo quando esiste una corrispondenza tra le colonne specificate.  

Passaggi:
1. Si inseriscono tutte le colonne da entrambe le tabelle che si desidera inserire con SELECT.  
2. Si sceglie una tabella principale con l'istruzione FROM.  
3. Si utilizza INNER JOIN per unire una seconda tabella.  
4. Si definisce la condizione di unione con ON, specificando quali colonne devono combaciare.  

Il risultato mostrerà solo le righe in cui esiste una corrispondenza tra entrambe le tabelle. 
*/

SELECT dipendenti.id_dipendente, dipendenti.nome, ufficio.nome_ufficio
FROM dipendenti
INNER JOIN ufficio ON dipendenti.id_ufficio = ufficio.id_ufficio; -- In questo caso, collega la colonna "id_ufficio" della tabella "dipendenti" con la colonna "id_ufficio" della tabella "ufficio", unendo i dati corrispondenti.

/*
La LEFT JOIN, a differenza della INNER JOIN, prende tutti gli elementi della prima tabella inserita, quindi
la tabella dopo il FROM e tutti gli elementi della tabella di destra, quindi quella dopo il JOIN.
Qualora non ci fossero elementi corrispondenti nella tabella di destra, appariranno scritti dei NULL
come elementi della tabella, segno che esistono elementi della prima tabella che non hanno corrispondenti nella seconda tabella.
*/

SELECT dipendenti.id_dipendente, dipendenti.nome, ufficio.nome_ufficio
FROM dipendenti
LEFT JOIN ufficio ON dipendenti.id_ufficio = ufficio.id_ufficio;