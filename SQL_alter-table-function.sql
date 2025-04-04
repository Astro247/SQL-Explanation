/*
L'istruzione ALTER TABLE, ossia letteralmente "ALTERA TABELLA", come dice il nome è utile per modificare le colonne di una
tabella una volta che quest'ultima è già stata creata, senza dover cancellare l'intera tabella e ricrearla da zero.

La sintassi per utilizzare questa istruzione è molto semplice: è sufficiente scrivere ALTER TABLE per poi inserire il nome della
tabella che si desidera modificare e successivamente ne seguono 6 istruzioni comuni utilizzabili:

- Aggiungere una colonna:
ALTER TABLE nome_tabella ADD nome_colonna, tipo_di_dato, constraint;

- Rimuovere una colonna:  
ALTER TABLE nome_tabella DROP COLUMN nome_colonna;

- Modificare posizione di una colonna:
ALTER TABLE nome_tabella MODIFY nome_colonna_da_spostare, tipo_di_dato_colonna_da_spostare AFTER colonna_rimpiazzata

- Aggiungere constraint a delle colonne:
ALTER TABLE nome_tabella ADD constraint (nome_colonna1, nome_colonna2...)

- Modificare il tipo di dato di una colonna:
ALTER TABLE nome_tabella MODIFY nome_colonna, nuovo_tipo_di_dato

- Modificare il nome di una tabella:
ALTER TABLE nome_tabella RENAME TO nuovo_nome_tabella
*/


CREATE TABLE IF NOT EXISTS dipendenti (
    id_dipendente INT NOT NULL AUTO_INCREMENT,
    nome TEXT NOT NULL,
    telefono VARCHAR(10) DEFAULT 'no-numero-telefono',
    stipendio DECIMAL(6,2) NOT NULL,
    PRIMARY KEY(id_dipendente)
);


ALTER TABLE dipendenti ADD cognome TEXT NOT NULL; -- Aggiunge una colonna "cognome" di tipo "text" con constraint "not null".

ALTER TABLE dipendenti DROP COLUMN stipendio; -- Rimuove la colonna "stipendio" dalla tabella "dipendenti".

ALTER TABLE dipendenti MODIFY telefono VARCHAR(10) AFTER id_dipendente; -- Modifica la posizione della colonna "telefono" mettendola davanti alla colonna "id_dipendente".

ALTER TABLE dipendenti ADD UNIQUE (telefono); -- Aggiunge il constraint "UNIQUE" alla colonna "telefono".

ALTER TABLE dipendenti 
ALTER COLUMN nome TEXT DEFAULT 'no-name', -- Aggiunge il constraint "TEXT" alla colonna "nome" e alla colonna "cognome".
ALTER COLUMN cognome TEXT DEFAULT 'no-name';

ALTER TABLE dipendenti RENAME TO lavoratori; -- Rinomina la tabella "dipendenti" in "lavoratori".