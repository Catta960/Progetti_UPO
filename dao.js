"use strict";

const sqlite = require("sqlite3");
const db = new sqlite.Database('user.db', err => {
    if (err) throw err;
});

exports.getAllUser = function () {
    return new Promise((resolve, reject) => {
        const sql = 'SELECT * FROM utenti'
        db.all(sql, (err, rows) => {
            if (err) {
                reject(err)
                return
            }

            const utenti = rows.map((row) => ({ username: row.username, email: row.email, password: row.password, tipo: row.tipo }))
            resolve(utenti)
        })
    })
}

exports.getUserByUsername = function(username){
    return new Promise((resolve, reject) => {
        const sql = 'SELECT * FROM utenti WHERE username = ?'
        db.get(sql, [username], (err, rows) => {
            if (err) {
                reject(err)
                return
            }
            if(rows){
                //send a res in JSON
                resolve({username:rows.username, email:rows.email, password:rows.password, tipo:rows.tipo}) 
            }
            else{
                //send a res in JSON
                reject({error:"Utente non trovato"})
            }
        })
    })
}

exports.getUserByEmail = function(email){
    return new Promise((resolve, reject) => {
        const sql = 'SELECT * FROM utenti WHERE email = ?'
        db.get(sql, [email], (err, rows) => {
            if (err) {
                reject(err)
                return
            }
            if(rows){
                //send a res in JSON
                resolve({username:rows.username, email:rows.email, password:rows.password, tipo:rows.tipo})  
            }
            else{
                //send a res in JSON
                reject({error:"Email non trovata"})
            }
        })
    })
}

exports.insertNewUser = function (utenti) {
    return new Promise((resolve,reject) => {
        const sql = "INSERT INTO utenti(username, email, password, tipo) VALUES (?, ?, ?, ?)"
        db.run(sql, [utenti.username,utenti.email,utenti.password,utenti.tipo], (err)=> {
            if (err) {
                reject(err)
            }else{
                resolve(this.lastID)
            }
        });
    });
}
