--Restituire l'elenco degli artisti (deceduti/viventi) che sono stati scelti nella creazione di storie.
--Ordinare il risultato in ordine crescente per numero di volte in cui, un artista, compare nelle storie (perchè selezionato in opere che compongono una storia). 
--Riportare la durata (AVG(TimeStampFine-TimeStampInizio)) in minuti media delle storie.

select a.nome, a.cognome, a.data_morte, a.data_nascita, count(*) as contatore_storie, avg((s.fine - s.inizio)/60) as durata
from Autore a
join Opera o on o.nome_artista = a.nome and o.cognome_artista = a.cognome
join Storia s on s.id_storia = o.id_opera
group by a.nome, a.cognome, a.data_morte, a.data_nascita
order by contatore_storie ASC;



--Selezionare tutte le storie degli utenti di età compresa tra [35<=x<=50] anni (estremi inclusi) che contengono almeno 2 opere d'arte (>=2). 
--Ordinare le storie in ordine decrescente di durata della storia (durata =TimeStampFine - TimeStampInizio)

select s.id_storia, s.codice_commento, avg((s.fine - s.inizio)/60) as durata
from Utente u
join Storia s on u.codice_storia = s.id_storia
where date_part('year', age(current_date, cast(dataNascita as date)))
between 35 and 50
and (select count(*) from Opera o where o.id_opera = s.id_storia) >= 2
group by s.id_storia, s.codice_commento
order by durata desc;



--Restituire CF, nome, cognome, età e data di nascita dell'utente che ha creato il maggior numero di storie che NON HANNO ricevuto commenti 
--da altri utenti. Ordinare il risultato in ordine decrescente per numero storie create

select u.email, u.nome, u.dataNascita, date_part('year', age(current_date, cast(u.dataNascita as date))) as età, count(s.id_storia) as numero_storie
from Utente u
join Storia s on u.codice_storia = s.id_storia
left join (
    select id_commento
    from Commento
) c on s.codice_commento = c.id_commento
where c.id_commento is null
group by u.email, u.nome, u.dataNascita
order by numero_storie desc
limit 1;




--Restituire l’elenco delle opere che sono state maggiormente selezionate dagli utenti nella creazione delle loro storie, 
--che hanno età compresa [25<=x<=55] (estremi inclusi). 
--Ordinare il risultato in ordine decrescente per TitoloOpera

select o.titolo, count(*) as conteggio
from Opera o 
join Storia s on o.id_commento = s.codice_commento
join Utente u on s.id_storia = u.codice_storia
where date_part('year', age(current_date, cast(dataNascita as date)))
between 25 and 55
group by o.titolo
order by conteggio desc;




--Restituire l'elenco degli artisti (deceduti/viventi) che sono stati scelti nella creazione di storie. 
--Ordinare il risultato in ordine crescente per numero di volte in cui, un artista, compare nelle storie (perchè selezionato in opere che compongono una storia). 
--Riportare la durata (AVG(TimeStampFine-TimeStampInizio)) in minuti media delle storie.

select a.nome, a.cognome, a.data_nascita, a.data_morte, count(o.id_opera) as conteggio, avg((s.fine - s.inizio)/60) as durata
from Autore a
join Opera o on a.nome = o.nome_artista and a.cognome = o.cognome_artista and a.data_nascita = o.data_nascita_artista
join Storia s on o.id_commento = s.codice_commento
group by a.nome, a.cognome, a.data_nascita, a.data_morte 
order by conteggio asc; 



--Per ogni utente che ha creato almeno 2 storie, si vuole conoscere la durata media delle sue storie (AVG(TimeStampFine-TimeStampInizio)) in minuti, la media dei voti e numero totale di commenti. 
--Ordinare il risultato in ordine decrescente per età dell'utente.

select u.email, u.nome, u.dataNascita, avg((s.fine - s.inizio)/60) as durata_media, count (v.utente) as media_voti, count(c.id_commento) as numero_commenti,
from Utente u 
join Storia s on u.codice_storia = s.id_storia 
left join Commento c on s.codice_commento = c.id_commento     
left join Voto v on u.email = v.utente and s.id_storia = v.codice_storia
where u.codice_storia is not null
group by u.email, u.nome, u.dataNascita
having count(s.id_storia) >= 2
order by u.dataNascita desc;



--Restituire, per ogni utente, id, titolo della storia e numero delle opere contenute (nella storia) di tutte le storie suggerite dal sistema che hanno emozioni opposte

SELECT s1.id_storia AS id_storia_1, s1.emozione_suscitata AS emozione_suscitata,
       s2.id_storia AS id_storia_2, s2.emozione_suscitata AS emozione_opposta
FROM Storia s1, Storia s2
WHERE ((s1.id_storia = 1 AND s2.id_storia = 10)
       OR (s1.id_storia = 2 AND s2.id_storia = 9)
       OR (s1.id_storia = 3 AND s2.id_storia = 8)
       OR (s1.id_storia = 4 AND s2.id_storia = 7)
       OR (s1.id_storia = 5 AND s2.id_storia = 6))
  AND s1.emozione_suscitata <> s2.emozione_suscitata;
