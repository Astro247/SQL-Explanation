/*
Per eliminare una o più righe da una tabella si utilizza l'istruzione DELETE.  
Dopo aver specificato la tabella da cui cancellare i dati, è fondamentale usare la clausola WHERE  
per indicare esattamente quali righe devono essere eliminate, evitando di rimuovere tutti i dati per errore.
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


DELETE FROM dipendenti WHERE stipendio = 1500 -- Con questa query stiamo cancellando la riga 1 e la riga 4.

/*
Quando si eliminano delle righe con l'istruzione DELETE, l'incremento automatico (AUTO_INCREMENT)  
non viene resettato e continua a generare valori successivi all'ultimo inserito.  
Questo significa che gli ID eliminati non vengono riutilizzati, e i nuovi record  
riceveranno un valore di AUTO_INCREMENT sempre crescente, indipendentemente dalle eliminazioni precedenti.
*/
