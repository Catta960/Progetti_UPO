
create table Commento (
    id_commento int  primary key,
    testo varchar(255),
    hashtag varchar(255),
    emoji varchar(255)
);

create table Emozione (
    tipo_emozione varchar(255) primary key
);

create table Autore(
    nome varchar(255),
    cognome varchar(255),
    data_nascita date,
    primary key (nome,cognome,data_nascita),
    data_morte date,
    stile_pittorico varchar(255) not null,
    movimento_artistico varchar(255) not null
);

create table Catalogo(
    nome_catalogo varchar (255) primary key,
    num_opere int not null,
    data_creazione date unique
 );

create table Fragile(
    email varchar(255) primary key,
    nome varchar(255) not null,
    dataNascita date not null,
    genere char not null
);

create table Storia(
    id_storia int primary key,
    inizio time not null,
    fine time not null,
	codice_commento int not null unique,
    emozione_suscitata varchar(255),
    FOREIGN KEY (codice_commento) REFERENCES Commento(id_commento),
    FOREIGN KEY (emozione_suscitata) REFERENCES Emozione(tipo_emozione)
);

create table Opera(
    id_opera int primary key,
    titolo varchar(255) not null,
    descrizione varchar(255) not null,
    materiale varchar(255) not null,
    tecnica varchar(255) not null, 
    anno date not null,
    nome_artista varchar(255) not null , 
	cognome_artista varchar(255) not null,
	data_nascita_artista date not null ,
    rivista varchar (255) not null, 
    id_commento int not null unique,
    FOREIGN KEY (nome_artista,cognome_artista,data_nascita_artista) REFERENCES Autore(nome,cognome,data_nascita),
    FOREIGN KEY (rivista) REFERENCES Catalogo(nome_catalogo),
    FOREIGN KEY (id_commento) REFERENCES Commento(id_commento)
);

--NN--
create table Contiene(
    codice_storia int not null unique,
    codice_opera int not null unique,
    FOREIGN KEY (codice_storia) REFERENCES Storia(id_storia),
    FOREIGN KEY (codice_opera) REFERENCES Opera(id_opera)
);

create table Curatore(
    email varchar(255) primary key,
    nome varchar(255) not null,
    dataNascita date not null,
    genere char not null,
    rivista varchar(255) not null,
    FOREIGN KEY (rivista) REFERENCES Catalogo(nome_catalogo)
);

create table Supervisore(
    email varchar(255) primary key,
    nome varchar(255) not null,
    dataNascita date not null,
    genere char not null,
    superiore varchar(255) not null ,
    FOREIGN KEY (superiore) REFERENCES Curatore(email)
);

create table Utente(
    email varchar(255) primary key,
    nome varchar(255) not null,
    dataNascita date not null,
    genere char not null,
    rivista varchar(255) not null ,
    codice_storia int unique,
    semplice varchar(255),
    superiore varchar(255),
    coordinatore varchar(255),
    FOREIGN KEY(rivista) REFERENCES Catalogo(nome_catalogo),
    FOREIGN KEY(codice_storia) REFERENCES Storia(id_storia),
    FOREIGN KEY(semplice) REFERENCES Fragile(email),
    FOREIGN KEY(superiore) REFERENCES Curatore(email),
    FOREIGN KEY(coordinatore) REFERENCES Supervisore(email)
);

--NN--
create table Modifica(
    utente varchar(255) not null unique,
    codice_commento int not null unique,
    FOREIGN KEY(utente) REFERENCES Utente(email),
    FOREIGN KEY(codice_commento) REFERENCES Commento(id_commento)  
);

--NN--
create table Voto(
    valutazione INT CHECK (valutazione >= 1 AND valutazione <= 10),
    utente varchar(255) not null unique,
    codice_storia int not null unique,
    FOREIGN KEY (utente) REFERENCES Utente(email),
    FOREIGN KEY (codice_storia) REFERENCES Storia(id_storia)
);

--NN--
create table Inserisce (
    utente varchar(255) not null unique,
    emozione varchar(255),
    FOREIGN KEY (utente) REFERENCES Utente(email),
    FOREIGN KEY (emozione) REFERENCES Emozione(tipo_emozione)
);

create table Questionario(
    id_questionario int primary key,
    domanda1 text,
    domanda2 text,
    domanda3 text,
    utente varchar(255) not null unique,
    FOREIGN KEY (utente) REFERENCES Utente(email)
);

create table Gruppo(
    id_gruppo int primary key,
    attività varchar(255) not null,
    superiore varchar(255) not null unique,
    coordinatore varchar(255) not null unique,
    FOREIGN KEY (superiore) REFERENCES Curatore(email),
    FOREIGN KEY (coordinatore) REFERENCES Supervisore(email)
);

--NN--
create table Partecipa(
    utente varchar(255) not null unique,
    id_gruppo int not null unique,
    FOREIGN KEY (utente) REFERENCES Utente(email),
    FOREIGN KEY (id_gruppo) REFERENCES Gruppo(id_gruppo)
);


