/*
I constraints sono un'ulteriore tipo di condizioni assegnabili alle colonne di una tabella, ne esistono di 6 tipi:

1) 'not null' specifica che quel campo non deve avere valori nulli (in altre parole in quella colonna non possono esserci valori mancanti).
2) 'check' delimita i valori inseribili in una colonna.
3) 'unique' determina che quella specifica colonna deve contenere valori tutti diversi l'uno dall'altro
4) 'default' qual'ora non è presente un elemento, pertanto un null, in una colonna, quest'ultimo viene modificato inserendo al posto del null un valore di default.
5) 'primary key', ossia la "chiave primaria", funziona esattamente come "unique", con la differenza che è un valore non ripetibile e unico per tutti gli elementi di quella tabella.
6) 'foreign key', ossia la "chiave straniera", permette di utilizzare la "primary key" per poter fare collegamenti con altre tabelle.
*/

CREATE TABLE IF NOT EXISTS dipendenti(
id_dipendenti varchar(20) not null, -- Questa colonna non può avere valori mancanti
nome varchar(20) not null,
cognome varchar(20) not null,
età int not null check (età>17), -- Questa colonna non può avere valori mancanti e il valore intero inserito dev'essere maggiore di 17
stipendio decimal(6,2) not null check (stipendio<=5000 and stipendio=>1200), -- Questa colonna accetta valori decimali con un massimo di 4 cifre prima della virgola e 2 cifre dopo la virgola, non può avere valori nulli e i valori inseriti devono essere compresi fra 5000 e 1200
numero_telefono varchar(10) not null unique, -- Questa colonna non accetta valori nulli ed ogni valore inserito dev'essere unico, diverso da tutti gli altri elementi in quella colonna
data_assunzione data not null, 
PRIMARY KEY(id_dipendenti), -- Con questo comando abbiamo impostato che la colonna "id_dipendenti" è la chiave primaria, quindi è possibile referenziarsi con altre tabelle grazie a questa colonna e questa colonna conterrà valori unici che distinguono ogni singola riga l'una dall'altra.
);  

CREATE TABLE IF NOT EXISTS tasse(
id_dipendenti varchar(20) not null, -- Anche in quest'altra tabella è presente la colonna "id_dipendenti" che non accetta valori nulli
tasse decimal(17,2) default 0, -- La colonna 'tasse' può contenere valori che numeri decimali con 15 cifre massimo prima della virgola e 2 cifre dopo la virgola, di default è impostato a 0 
ore_straordinari decimal default 0, -- Questa colonna può contenere valori decimali di lunghezza non definita, di default gli elementi sono impostati a 0
PRIMARY KEY(id_dipendenti) -- Anche in questo caso, la colonna 'id_dipendenti' è la chiave primaria
FOREIGN KEY(id_dipendenti) REFERENCES dipendenti(id_dipendenti) ON DELETE CASCADE -- La tabella "tasse" è in relazione con la tabella "dipendenti" grazie alla chiave "id_dipendenti"
); 

/*
La foreign key deve riferirsi ad una tabella già esistente, non sarebbe stato possibile inserire la foreign key nella tabella dipendenti
che si relaziona con la tabella tasse (facendo quindi il contrario di quanto fatto adesso).
Avendo inserito la foreign key nella tabella tasse, creata dopo la tabella dipendenti, ci stiamo riferendo ad una tabella che già
esiste, pertanto non vi è alcun errore.

Il comando aggiuntivo "ON DELETE CASCADE" specifica che, essendo che le righe della tabella "tasse" si riferiscono a specifici elementi
della tabella "dipendenti", qualora si volesse eliminare uno specifico dipendente dalla tabella "dipendenti", la riga
di riferimento a quello specifico dipendente nella tabella "tasse" verrebbe eliminata a sua volta.

Se non fosse stato presente il comando ON DELETE CASCADE, il DBMS avrebbe dato errore nel momento in cui si tenta di cancellare una riga nella tabella dipendenti, poiché quel dipendente possiede dei dati collegati nella tabella tasse.
Al contrario, cancellare una riga dalla tabella tasse non avrebbe dato alcun errore, poiché è tasse a essere ancorata a dipendenti e non il contrario
*/