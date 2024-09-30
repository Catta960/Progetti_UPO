var sr = ScrollReveal(); //iniz oggetto per gestione animazioni

sr.reveal('.hero, .poster__img1, .poster__img2, .poster__content1, .poster__content2, .bg-cover__title, .bg-cover__text, .grid .col', {
  distance: '100px',
  duration: 1500,
  easing: 'cubic-bezier(.215, .61, .355, 1)', //velocità animazione
  interval: 600 //ritardo animazoni consecutive
});


sr.reveal('.main-carousel .carousel-cell .carousel-cell__content, .grid panel-blue .col panel-blue__dots .dot', {
    duration: 1500,
    easing: 'cubic-bezier(.215, .61, .355, 1)',
    interval: 200,
    scale: 0.65,//ridimensionamento elem durante animazione
    mobile: false,
    reset: true, //ripetizione
  }, 'carouselzoom');

  sr.reveal('.dot', {
    duration: 1500,
    easing: 'cubic-bezier(.215, .61, .355, 1)',
    interval: 200,
    scale: 0.65,
    mobile: false,
    
  }, 'dots_zoom');  //mi serve per resettare gli effetti precedenti dei dots


  //param della query string URL
  const urlParams = new URLSearchParams(window.location.search); //restituisce query string dell' URL
  const message = urlParams.get('message');
  
  // Visualizzo il messaggio se presente
  if (message) {
    const messageDiv = document.getElementById('message');
    messageDiv.textContent = message;
  }