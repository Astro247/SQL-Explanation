-- Una tabella in SQL è detta TABLE ed si può creare e droppare esattamente come un database.
-- Le colonne inseribili nella tabella si chiamano "campi" e la loro dichiarazione è seguita da due elementi fondamentali: il nome della colonna e il tipo di dato che gli elementi devono avere in quella colonna

/*
I tipi di dati che gli elementi nelle colonne possono assumere sono:
1) int = numero intero
2) decimal = numero con la virgola
3) char = stringa che può avere un massimo di 255 caratteri
4) varchar = stringa che può avere un massimo di 65.000+ caratteri ed è possibile, inserendolo fra parentesi, determinare il numero massimo di caratteri che le stringhe possono avere in quella colonna (così da non occupare troppa memoria)
5) text = identico al varchar, ma non è possibile selezionare manualmente il numero massimo di char inseribili
6) date = come elemento della colonna è possibile inserire una data formattata in: "anno/mese/giorno"
7) datetime = data, ma molto più specifica, formattata in: "anno/mese/giorno ora:minuto:secondo"
*/

CREATE TABLE IF NOT EXISTS dipendenti( -- viene creata una tabella "dipendenti" solo se non esiste già.
    nome varchar(20), -- la colonna "nome" può accettare solo stringhe di 20 caratteri massimo
    cognome varchar(20), -- stesso discorso per la colonna "cognome"
    stipendio decimal, -- la colonna "stipendio" può accettare solo numeri con la virgola
    id int -- Infine, la colonna "id" accetta solo numeri interi
);