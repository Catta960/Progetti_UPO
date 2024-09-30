
INSERT INTO Commento (id_commento, testo, hashtag, emoji)
VALUES (1, 'Impressionante', '#stupore', '😮'),
       (2, 'Molto rilassante', '#pace', '🧘‍♀️'),
       (3, 'Incredibile dettaglio', '#dettaglio', '👁️'),
       (4, 'Sentimenti profondi', '#sentimenti', '💜'),
       (5, 'Composizione inquitante', '#inquietante', '😰'),
       (6, 'Grande felicità', '#allegro', '😄'),
       (7, 'Voglia di fare festa', '#felice', '🌟'),
       (8, 'Mi dispiace per loro', '#compassione', '🙏'),
       (9, 'Mi ha confuso molto', '#dubbioso', '🤨'),
       (10, 'Mi piace molto il panorama', '#panorama', '🌞');


INSERT INTO Emozione (tipo_emozione)
VALUES
    ('amore'),
    ('paura'),
    ('tristezza'),
    ('rabbia'),
    ('stupore'),
    ('indifferenza'),
    ('tranquillità'),
    ('felicità'),
    ('coraggio'),
    ('odio');

INSERT INTO Autore (nome, cognome, data_nascita, data_morte, stile_pittorico, movimento_artistico)
VALUES
    ('Leonardo', 'da Vinci', '1452-04-15', '1519-05-02', 'Rinascimento', 'Alto Rinascimento'),
    ('Vincent', 'van Gogh', '1853-03-30', '1890-07-29', 'Post-Impressionismo', 'Realismo'),
    ('Pablo', 'Picasso', '1881-10-25', '1973-04-08', 'Cubismo', 'Cubismo'),
    ('Claude', 'Monet', '1840-11-14', '1926-12-05', 'Impressionismo', 'Impressionismo'),
    ('Michelangelo', 'Buonarroti', '1475-03-06', '1564-02-18', 'Rinascimento', 'Alto Rinascimento'),
    ('Salvador', 'Dali', '1904-05-11', '1989-01-23', 'Surrealismo', 'Surrealismo'),
    ('Georgia', 'O Keeffe', '1887-11-15', '1986-03-06', 'Precisionismo', 'Arte moderna'),
    ('Leonora', 'Carrington', '1917-04-06', '2011-05-25', 'Surrealismo', 'Surrealismo'),
    ('Francesco', 'Hayez', '1791-02-10', '1882-12-02', 'Neoclassicismo', 'Romanticismo'),
    ('Andy', 'Warhol', '1928-08-06', '1987-02-22', 'Pop art', 'Pop art');


INSERT INTO Catalogo (nome_catalogo, num_opere, data_creazione)
VALUES
    ('Catalogo 1', 500, '2022-09-10');
  

INSERT INTO Fragile (email, nome, dataNascita, genere)
VALUES
    ('lucarossi@example.com', 'Luca', '1990-03-15', 'M'),
    ('albertoneri@example.com', 'Alberto', '1985-07-20', 'M'),
    ('carloverdi@example.com', 'Carlo', '1995-01-10', 'M'),
    ('francoblu@example.com', 'Franco', '1980-12-02', 'M'),
    ('martinagialla@example.com', 'Martina', '1992-09-28', 'F');

INSERT INTO Storia (id_storia, inizio, fine, codice_commento, emozione_suscitata)
VALUES
    (1, '10:00:00', '11:30:00', 1, 'amore'),
    (2, '14:45:00', '16:15:00', 2, 'paura'),
    (3, '09:30:00', '10:45:00', 3, 'tristezza'),
    (4, '11:30:00', '13:00:00', 4, 'rabbia'),
    (5, '11:30:00', '13:00:00', 5, 'stupore'),
    (6, '11:30:00', '13:00:00', 6, 'indifferenza'),
    (7, '11:30:00', '13:00:00', 7,'tranquillità'),
    (8, '11:30:00', '13:00:00', 8,'felicità'),
    (9, '11:30:00', '13:00:00', 9,'coraggio'),
    (10, '15:15:00', '16:30:00', 10,'odio');


INSERT INTO Opera (id_opera, titolo, descrizione, materiale, tecnica, anno, nome_artista, cognome_artista, data_nascita_artista, rivista, id_commento)
VALUES 
        (1, 'La Gioconda', 'Ritratto di Lisa Gherardini', 'Legno', 'Olio', '1506-01-04', 'Leonardo', 'da Vinci', '1452-04-15', 'Catalogo 1', 3),--
        (2, 'Notte stellata', 'Veduta del cielo notturno', 'Tela', 'Olio', '1889-06-13', 'Vincent', 'van Gogh', '1853-03-30', 'Catalogo 1', 1),--
        (3, 'Il bacio', 'Rappresentazione romantica', 'Marmo', 'Scultura', '1882-12-05', 'Francesco', 'Hayez', '1791-02-10', 'Catalogo 1', 4),
        (4, 'Guernica', 'Rappresentazione dell orrorre della guerra', 'Tela', 'Olio', '1937-05-20', 'Pablo', 'Picasso', '1881-10-25', 'Catalogo 1', 5),--
        (5, 'Shot Marilyns', 'Dipinti serigrafici', 'Olio su tela', 'Pittura a olio', '1962-02-20', 'Andy', 'Warhol', '1928-08-06', 'Catalogo 1', 8),    --                                                                                                                                                        
        (6, 'Ninfee', 'Serie di dipinti sui giardini di Giverny', 'Olio su tela', 'Pittura a olio', '1916-11-05', 'Claude', 'Monet', '1840-11-14', 'Catalogo 1', 10),--
        (7, 'La creazione di Adamo', 'Affresco sulla Cappella Sistina', 'Affresco', 'Affresco', '1512-09-23', 'Michelangelo', 'Buonarroti', '1475-03-06', 'Catalogo 1', 9),--
        (8, 'La persistenza della memoria', 'Surrealismo', 'Olio su tela', 'Pittura a olio', '1931-04-21', 'Salvador', 'Dali', '1904-05-11', 'Catalogo 1', 6),--
        (9, 'Il gioco delle carte', 'Autoritratto con carte da gioco', 'Olio su tela', 'Pittura a olio', '1946-01-30', 'Georgia', 'O Keeffe', '1887-11-15', 'Catalogo 1', 7),--
        (10, 'Il canto dell''uccello', 'Ritratto surreale', 'Olio su tela', 'Pittura a olio', '1952-02-20', 'Leonora', 'Carrington', '1917-04-06', 'Catalogo 1', 2);--
        

INSERT INTO Contiene (codice_storia, codice_opera)
VALUES (1, 3),
       (2, 2),
       (3, 5),
       (4, 6),
       (5, 1),
       (6, 10),
       (7, 9),
       (8, 7),
       (9, 8),
       (10, 4);

INSERT INTO Curatore (email, nome, dataNascita, genere, rivista)
VALUES ('giorgianeri@example.com', 'Giorgia', '1985-06-10', 'F', 'Catalogo 1'),
       ('luciarossi@example.com', 'Lucia', '1990-03-20', 'M', 'Catalogo 1'),
       ('danieleverdi@example.com', 'Daniele', '1985-06-10', 'M', 'Catalogo 1'),
       ('umbertoblu@example.com', 'Umberto', '1985-06-10', 'M', 'Catalogo 1'),
       ('franconeri@example.com', 'Franco', '1985-06-10', 'M', 'Catalogo 1');


INSERT INTO Supervisore (email, nome, dataNascita, genere, superiore)
VALUES ('tommasoblu@example.com', 'Tommaso', '1978-12-05', 'M', 'giorgianeri@example.com'),
       ('fabiorossi@example.com', 'Fabio', '1982-09-15', 'M', 'luciarossi@example.com'),
       ('lorenzoneri@example.com', 'Lorenzo', '1978-12-05', 'M', 'danieleverdi@example.com'),
       ('andreaverdi@example.com', 'Andrea', '1978-12-05', 'M', 'umbertoblu@example.com'),
       ('mircogiallo@example.com', 'Mirco', '1978-12-05', 'M', 'franconeri@example.com');

INSERT INTO Utente (email, nome, dataNascita, genere, rivista, codice_storia, semplice, superiore, coordinatore)
VALUES ('giorgianeri@example.com', 'Giorgia', '1985-06-10', 'F', 'Catalogo 1', NULL,NULL,'giorgianeri@example.com', NULL), -- inizio curatori 
       ('luciarossi@example.com', 'Lucia', '1990-03-20', 'M', 'Catalogo 1', NULL,NULL,'luciarossi@example.com',NULL),
       ('danieleverdi@example.com', 'Daniele', '1985-06-10', 'M', 'Catalogo 1',NULL,NULL,'danieleverdi@example.com',NULL),
       ('umbertoblu@example.com', 'Umberto', '1985-06-10', 'M', 'Catalogo 1',NULL,NULL,'umbertoblu@example.com',NULL),
       ('franconeri@example.com', 'Franco', '1985-06-10', 'M', 'Catalogo 1', NULL,NULL,'franconeri@example.com',NULL),        -- fine curatori 
       ('tommasoblu@example.com', 'Tommaso', '1978-12-05', 'M', 'Catalogo 1',NULL,NULL,NULL,'tommasoblu@example.com'),         -- inizio supervisori 
       ('fabiorossi@example.com', 'Fabio', '1982-09-15', 'M', 'Catalogo 1', NULL,NULL,NULL,'fabiorossi@example.com'),        
       ('lorenzoneri@example.com', 'Lorenzo', '1978-12-05', 'M','Catalogo 1', NULL,NULL,NULL,'lorenzoneri@example.com'),
       ('andreaverdi@example.com', 'Andrea', '1978-12-05', 'M','Catalogo 1', NULL,NULL,NULL,'andreaverdi@example.com'),
       ('mircogiallo@example.com', 'Mirco', '1978-12-05', 'M', 'Catalogo 1',NULL,NULL,NULL,'mircogiallo@example.com'),         -- fine supervisori
       ('lucarossi@example.com', 'Luca', '1990-03-15', 'M','Catalogo 1',1,'lucarossi@example.com',NULL,NULL),                 -- inizio fragili
       ('albertoneri@example.com', 'Alberto', '1985-07-20', 'M','Catalogo 1',2,'albertoneri@example.com', NULL,NULL),
       ('carloverdi@example.com', 'Carlo', '1995-01-10', 'M','Catalogo 1', 3,'carloverdi@example.com',NULL,NULL),
       ('francoblu@example.com', 'Franco', '1980-12-02', 'M','Catalogo 1', 4,'francoblu@example.com', NULL,NULL),
       ('martinagialla@example.com', 'Martina', '1992-09-28', 'F', 'Catalogo 1',5,'martinagialla@example.com',NULL,NULL),     -- fine fragili
       ('giorgiorossi@example.com', 'Giorgio', '1998-07-20', 'M', 'Catalogo 1', 6,NULL ,NULL ,NULL),                         -- inizio utenti 
       ('serenaverdi@example.com', 'Serena', '1995-12-10', 'F', 'Catalogo 1', 7, NULL, NULL, NULL),
       ('claudiablu@example.com', 'Claudia', '1998-07-20', 'F', 'Catalogo 1', 8, NULL, NULL, NULL),
       ('claudioneri@example.com', 'Claudio', '1998-07-20', 'M', 'Catalogo 1', 9, NULL, NULL, NULL),
       ('francescaverdi@example.com', 'Francesca', '1998-07-20', 'F', 'Catalogo 1', 10, NULL, NULL, NULL);                   -- fine utenti 

INSERT INTO Modifica (utente, codice_commento)
VALUES ('tommasoblu@example.com', 1),
       ('franconeri@example.com', 4),
       ('giorgiorossi@example.com',3),
       ('martinagialla@example.com',7),
       ('serenaverdi@example.com',2);

    
INSERT INTO Voto (valutazione, utente, codice_storia)
VALUES (6, 'giorgiorossi@example.com', 1),
       (9, 'serenaverdi@example.com', 2),
       (5, 'claudiablu@example.com', 3), 
       (8, 'claudioneri@example.com', 4),
       (9, 'francescaverdi@example.com', 5);


INSERT INTO Inserisce (utente, emozione)
VALUES ('lucarossi@example.com','felicità'),
       ('serenaverdi@example.com','tristezza'),
       ('martinagialla@example.com','stupore'),
       ('claudiablu@example.com','coraggio'),
       ('francescaverdi@example.com','paura');


INSERT INTO Questionario (id_questionario, domanda1, domanda2, domanda3, utente)
VALUES
    (1, 'Mi ricorda la gioventù','Mi fa pensare alla natura','Mi fa senitre giovane', 'claudiablu@example.com'),
    (2, 'Mi ricorda l estate','Mi fa pensare alle giornate al mare','Mi fa senitre rilassato', 'francescaverdi@example.com'),
    (3, 'Mi ricorda la privamera','Mi fa pensare ai fiori','Mi fa senitre allegro', 'giorgiorossi@example.com'),
    (4, 'Mi ricorda l inverno','Mi fa pensare alla pioggia','Mi fa senitre angosciato','francoblu@example.com'),
    (5, 'Mi ricorda l autunno','Mi fa pensare alla famiglia','Mi fa senitre nostalgico','albertoneri@example.com');


INSERT INTO Gruppo (id_gruppo, attività, superiore, coordinatore)
VALUES
    (1, 'Attività 1', 'franconeri@example.com', 'tommasoblu@example.com'),
    (2, 'Attività 2', 'luciarossi@example.com', 'fabiorossi@example.com'),
    (3, 'Attività 3', 'umbertoblu@example.com', 'andreaverdi@example.com'),
    (4, 'Attività 4', 'giorgianeri@example.com', 'mircogiallo@example.com'),
    (5, 'Attività 5', 'danieleverdi@example.com', 'lorenzoneri@example.com');
       

INSERT INTO Partecipa (utente, id_gruppo)
VALUES ('giorgiorossi@example.com', 1),
       ('serenaverdi@example.com', 2),
       ('claudiablu@example.com', 3),
       ('francoblu@example.com', 4),
       ('albertoneri@example.com', 5);






INSERT INTO Utente (email, nome, dataNascita, genere, rivista, codice_storia, semplice, superiore, coordinatore)
VALUES ('andrearossi@example.com', 'Andrea', '2002-06-10', 'M', 'Catalogo 1', NULL, 'andrearossi@example.com','andrearossi@example.com', NULL)

INSERT INTO Storia (id_storia, inizio, fine, codice_commento, emozione_suscitata)
VALUES (11, '10:30:00', '11:40:00', 11, 'ansia');

INSERT INTO Commento (id_commento, testo, hashtag, emoji)
VALUES (11, 'bell opera', '#bello', '😍');

INSERT INTO Emozione (tipo_emozione)
VALUES ('ansia');

INSERT INTO Fragile (email, nome, dataNascita, genere)
VALUES ('andrearossi@example.com', 'Andrea', '2002-06-10', 'M')

INSERT INTO Curatore (email, nome, dataNascita, genere, rivista)
VALUES ('andrearossi@example.com', 'Andrea', '2002-06-10', 'M', 'Catalogo 1')


SELECT s.*
FROM Storia s
JOIN Utente u ON s.id_storia = u.codice_storia
JOIN Fragile f ON u.semplice = f.email
JOIN Curatore c ON u.superiore = c.email
WHERE date_part('year', age(current_date, cast(u.dataNascita as date)))
BETWEEN 20 AND 30
ORDER BY s.inizio DESC;
    
    