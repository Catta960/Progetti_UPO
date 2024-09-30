document.getElementById("modifyForm").addEventListener("submit", function(event) {
    event.preventDefault();
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var newUsername = document.getElementById("newUsername").value;

    // Invia una richiesta PUT per modificare l'utente
    fetch('http://localhost:3000/utenti/' + username, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            password: password,
            newUsername: newUsername
        })
    })
    .then(response => {
        if (response.ok) {
            alert("Utente modificato con successo!");
        } else {
            alert("Si è verificato un errore durante la modifica dell'utente.");
        }
    })
    .catch(error => {
        console.error('Si è verificato un errore:', error);
    });
});




document.getElementById("searchForm").addEventListener("submit", function(event) {
    event.preventDefault();
    var searchTerm = document.getElementById("searchTerm").value;

    // Invia una richiesta GET per cercare l'utente
    fetch('http://localhost:3000/user/' + searchTerm)
    .then(response => response.json())
    .then(data => {
        alert(JSON.stringify(data));
    })
    .catch(error => {
        console.error('Si è verificato un errore:', error);
    });
});

document.getElementById("deleteForm").addEventListener("submit", function(event) {
    event.preventDefault();
    var deleteUsername = document.getElementById("deleteUsername").value;

    // Invia una richiesta DELETE per eliminare l'utente
    fetch('http://localhost:3000/utenti/' + deleteUsername, {
        method: 'DELETE'
    })
    .then(response => {
        if (response.ok) {
            alert("Utente eliminato con successo!");
        } else {
            alert("Si è verificato un errore durante l'eliminazione dell'utente.");
        }
    })
    .catch(error => {
        console.error('Si è verificato un errore:', error);
    });
});