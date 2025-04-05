/*
L'istruzione JOIN mette in comunicazione più colonne di due tabelle basandosi su una specifica condizione.
*/

CREATE TABLE IF NOT EXISTS clienti(
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome TEXT NOT NULL,
    ordine_cliente INT,
    PRIMARY KEY(id_cliente)
);

CREATE TABLE IF NOT EXISTS ordini(
    ordine_cibo TEXT NOT NULL,
    id_ordine INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id_ordine)
);

INSERT INTO clienti(nome, ordine_cliente)
VALUES 
("Marco", 1), ("Giovanni", 2), ("Claudio", 1);

INSERT INTO ordini(ordine_cibo)
VALUES 
("Pizza"), ("Pasta"), ("Insalata");

/*
L'istruzione INNER JOIN è un tipo di unione fra due tabelle che ragiona in modo tale che vengono mostrati a schermo solo gli elementi
delle colonne scelte che rispettano a pieno la condizione prestabilita.
*/

SELECT clienti.nome, ordini.ordine_cibo -- A schermo verranno mostrate SOLO le colonne "nome" e "ordine_cibo"
FROM clienti -- la tabella "clienti", essendo la tabella inserita dopo il FROM, è la tabella principale.
INNER JOIN ordini ON clienti.ordine_cliente = ordini.id_ordine;  -- Alla tabella "clienti" viene unita la tabella "ordini" e verranno mostrati a schermo solo gli elementi delle due colonne che nella stessa riga hanno lo stesso valore nella colonna "ordine_cliente" e "id_ordine".

/*
L'istruzione LEFT JOIN, invece, è un tipo di unione fra due tabelle il cui algoritmo funziona in modo tale che, indipendentemente dalla condizione imposta dopo ON,
tutti gli elementi delle colonne della tabella principale, ossia quella inserita dopo il FROM, vengano mostrate a schermo.
Qualora la condizione dopo ON non dovesse essere rispettata per determinati elementi di determinate colonne, verrà mostrato a schermo
un 'NULL', segno che per una specifica riga non è stata rispettata la condizione prestabilita.
*/

SELECT clienti.nome, ordini.ordine_cibo
FROM clienti -- la colonna "clienti" è quella principale, pertanto tutte le colonne selezionate dopo il SELECT appartenenti a questa tabella verranno mostrate indipendentemente dalla condizione.
LEFT JOIN ordini ON clienti.ordine_cliente = ordini.id_ordine; -- Qualora gli elementi nella stessa riga della colonna "ordine_cliente" e "id_ordine" fossero diversi, l'elemento della colonna della tabella principale, ossia "clienti", viene mostrato comunque a schermo, ma l'elemento della colonna secondaria, ossia "ordini" sarà mostrato come 'NULL'.