// Seleziono hamburger e menu
const hamburger = document.querySelector('.hamburger');
const menu = document.querySelector('.header .menu');

// Aggiungo gestore eventi hamburger
hamburger.addEventListener('click', function() {
  // verifico se hamburger aperto o chiuso
  const isOpen = menu.style.right === '0%';

  if (isOpen) {
    // se aperto, chiudo
    menu.style.right = '-100%';
  } else {
    // se chiuso, apro
    menu.style.right = '0%';
  }
});