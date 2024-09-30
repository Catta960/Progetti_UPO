async function login() {
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const tipo = document.getElementById('tipo').value;
    
    try {
      const response = await fetch('/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, password, tipo }),
      });

      const data = await response.json();
      alert(data.message);

      if (response.status === 200) {
        // Reindirizzamento alla pagina principale dopo un login riuscito
        window.location.href = 'index.html';
      }
    } catch (error) {
      console.error('Errore durante il login:', error);
    }
  }