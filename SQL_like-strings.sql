/*
L'operatore LIKE viene utilizzato nelle query SQL per filtrare risultati in base a pattern specifici nelle stringhe.  
Funziona in modo simile alle regex, con due caratteri speciali principali:  

- `%`  → rappresenta una sequenza di caratteri di qualsiasi lunghezza (anche zero).  
- `_`  → rappresenta un singolo carattere qualsiasi.  

Esempi di utilizzo:  

- `A%`   → inizia con "A" e segue con qualsiasi numero di caratteri.  
- `%A`   → termina con "A", preceduta da qualsiasi numero di caratteri.  
- `%A%`  → contiene la lettera "A" in qualsiasi posizione.  
- `A_`   → inizia con "A" e ha esattamente un altro carattere dopo.  
- `_A`   → ha un carattere qualsiasi, seguito da "A".  
- `_A_`  → un carattere qualsiasi, poi "A", poi un altro carattere qualsiasi.  
- `%A_`  → qualsiasi numero di caratteri, poi "A", poi un carattere fisso.  
- `_A%`  → un carattere qualsiasi, poi "A", poi qualsiasi numero di caratteri.  

(Nell'esempio, la lettera "A" è usata solo a scopo illustrativo)  
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


SELECT * FROM dipendenti WHERE cognome LIKE '__s%' -- Questa query chiede specificatamente la riga dove nella colonna "cognome" sono presenti due caratteri iniziali fissi, una 's' dopo i due caratteri fissi e un numero di caratteri casuali che ne segue.

SELECT * FROM dipendenti WHERE nome LIKE '%a' -- Questa query, invece, chiede le righe della colonna "nome" che iniziano con un numero indefinito di caratteri, ma finiscono con la lettera 'a'.