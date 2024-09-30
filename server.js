//imports
const express = require('express')
const sqlite = require('sqlite3')
const morgan = require('morgan')
const path = require('path')
const { validationResult, check } = require('express-validator');
const session = require('express-session');
const dao = require("./dao.js");

//init
const app = express()
const port = 3000

//set up session middleware
app.use(
  session({
    secret: 'TTG',
    resave: false,
    saveUninitialized: false,
    cookie: {sameSite : 'lax'}
  })
);


const db = new sqlite.Database('user.db', err => {
    console.error(err);
})


//set up the middlewares
app.use(morgan('tiny'))
app.use(express.static('TastyToGo'))
app.use(express.json())
app.use(express.urlencoded({extented: true}))
   

//middleware per verificare se l'utente è loggato
    const checkLoggedIn = (req, res, next) => {
      if(req.session.user){
        //utente loggato proseguo con la richiesta
        next();
      }else{
        //utente non loggato reindirizzo alla pagina di login
        res.redirect('/login.html');
      }
    };

    
//middleware per verificare se l'utente è già loggato
  const checkAlreadyLoggedIn = (req, res, next) => {
    if(req.session.user){
      //utente già loggato reindirizzo alla pagina del menu
      res.redirect('/menu.html');
    }else{
      //utente non loggato prosegui con la richiesta
      next();
    }
  };

  //middleware per verificare se l'utente è loggato come amministratore
  const checkLoggedInAsAdmin = (req, res, next) => {
    if(req.session.user && req.session.user.tipo === 'amministratore'){
      //utente amministratore loggato, proseguo con la richiesta
      next();
    }else{
      //utente non loggato o non amministratore, reindirizzo alla pagina login
      res.redirect('/login.html')
    }
  }
  


//imposto directory statica per servire i file dalla directory TastyToGo
app.use(express.static(path.join(__dirname, 'TastyToGo'), {extensions: ['html']}));

// Gestisco la richiesta per la pagina "index.html" (localhost:3000)
app.use(express.static(path.join(__dirname, 'home')));

// Gestisco la richiesta per la pagina di login
const login = path.join(__dirname, 'host', 'login');
app.use(express.static(login));

// Gestisco la richiesta per la pagina di registrazione
const registrazione = path.join(__dirname, 'host', 'registration');
app.use(express.static(registrazione));




// Endpoint per la gestione del login
app.post('/login', (req, res) => {
    const { username, password, tipo } = req.body;

    //logica di autenticazione
    // Ricerca dell'utente nel database
    db.get('SELECT * FROM utenti WHERE username = ?', [username], (err, user) => {
      if (err) {
        console.error('Errore durante la ricerca dell\'utente:', err);
        return res.status(500).json({ message: 'Errore del server' });
      }
  
      if (user) {
        // Verifica username, password e tipo di utente
        if (user.username === username && user.password === password && user.tipo === tipo) {
          //utente loggato correttamente, salvo le informazioni della sessione
          req.session.user = user;
          res.status(200).json({ message: 'Login effettuato con successo' });
        } else {
            console.error('Credenziali non valide');
          res.status(401).json({ message: 'Credenziali non valide' });
        }
      } else {
        console.error('Utente non trovato');
        res.status(404).json({ message: 'Utente non trovato' });
      }
    });
  });



  //endpoint per la pagina di login con autenticazione
  app.get('/login.html', checkAlreadyLoggedIn , (req,res)=> {
    res.sendFile(path.join(__dirname, 'host', 'login', 'login.html'));
  });


  //endpoint per la pagina del menu
  app.get('/menu.html', checkLoggedIn , (req,res)=> {
  res.sendFile(path.join(__dirname, 'menu', 'menu.html'));
  });

  
  //gestore per i file CSS
app.get('/menu/menu.css', checkLoggedIn, (req,res) => {
  res.type('text/css');
  res.sendFile(path.join(__dirname, 'menu', 'menu.css'));
});


//gestore per i file JS
app.get('/menu/menu.js', checkLoggedIn, (req,res) => {
  res.type('text/javascript');
  res.sendFile(path.join(__dirname, 'menu', 'menu.js'));
});


//gestore per le immagini
app.get('/menu/imageprod', checkLoggedIn, (req,res) => {
  res.type('png, jpg, jpeg');
  res.sendFile(path.join(__dirname, 'menu', 'imageprod'));
});

//endpoint per la pagina servizi
app.get('/servizi.html', checkLoggedInAsAdmin, (req,res) =>{
  res.sendFile(path.join(__dirname,'servizi','servizi.html'));
});



  
//GET /user
app.get('/user', (req, res) => {
    //read from db all the users
    dao.getAllUser()
    .then(utenti => res.json(utenti))
    .catch(error => res.status(500).json({error: error.message}))
  })

//GET /user/:username
app.get('/user/:username', (req,res)=>{
    //validazione
    const username = req.params.username
    dao.getUserByUsername(username)
    .then(username => res.json(username))
    .catch(error => res.status(404).json(error))
})

//GET /user/:email
app.get('/user/:email', (req,res)=>{
    //validazione
    const email = req.params.email
    dao.getUserByEmail(email)
    .then(email => res.json(email))
    .catch(error => res.status(404).json(error))
    })
    

//POST /user (per aggiungere un utente)
// req: {"username":"andrea000","email":"andrea000@gmail.com","password":"andrea000", "tipo":"amministratore"}
app.post('/utenti', (req, res) => {
    const { validationResult } = require('express-validator');
    const errors = validationResult(req);
    if(!errors.isEmpty()) {
        return res.status(422).json({errors: errors.array()});
    }

    const { username, email, password, tipo } = req.body;
    const utenti = {
      username,
      email,
      password,
      tipo,
};

    const message = 'Registrazione avvenuta con successo!!!'


  dao.insertNewUser(utenti)
  .then(() => {
    res.status(201).json({ message: 'Registrazione avvenuta con successo!!!'});
  })
  .catch((err) => {
    console.error(err);
    res.status(500).json({ error: 'Errore del server durante la creazione' });
  });
})



// PUT /user/:username
app.put('/utenti/:username', (req,res)=>{
    // validazione qui
    const username = req.params.username;
    const password = req.body.password;
    const newUsername = req.body.newUsername;

    if (!newUsername) {
      return res.status(400).json({ error: 'Il nuovo username non può essere vuoto' });
  }

    const sql = "UPDATE utenti SET password=?, username = ? WHERE username=?";

    db.run(sql, [password,newUsername, username], (err)=> {
        if (err) {
            console.error(err);
            res.status(500).json({ error: err.message })
        } else {
          res.status(200).json({ message: 'Utente modificato con successo' });
    }
});
});

//DELETE /user/:username
app.delete('/utenti/:username', (req,res)=>{
    // validazione 
    const username = req.params.username;

    const sql = "DELETE FROM utenti WHERE username=?";

    db.run(sql, [username], (err)=> {
        if (err) {
            console.error(err)
            res.status(500).json({ error: err.message });
        } else {
            res.end()
        }
    });
});


app.listen(port, () => {
    console.log(`Simple REST API for login and registration ${port}`)
})
