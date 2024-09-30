
let openShopping = document.querySelector('.shopping');
let closeShopping = document.querySelector('.closeShopping');
let list = document.querySelector('.list');
let listCard = document.querySelector('.listCard');
let body = document.body; //seleziona direttamente l'elemento body
let total = document.querySelector('.total');
let quantity = document.querySelector('.quantity');


openShopping.addEventListener('click', () => {
    body.classList.add('active');
})

closeShopping.addEventListener('click', () => {
    body.classList.remove('active');
})


let products = [
    {
        id: 1,
        name: 'Hamburger Classico',
        image: 'hamburger1.jpeg',
        price: 8
    },
    {
        id: 2,
        name: 'Cheeseburger',
        image: 'hamburger4.jpg',
        price: 10
    },
    {
        id: 3,
        name: 'Hamburger con bacon',
        image: 'hamburger3.jpg',
        price: 12
    },
    {
        id: 4,
        name: 'Patatine fritte',
        image: 'pata1.jpg',
        price: 3.5
    },
    {
        id: 5,
        name: 'Nachos',
        image: 'pata2.jpg',
        price: 4
    },
    {
        id: 6,
        name: 'Acqua frizzante 0.5L',
        image: 'acquafriz.jpg',
        price: 2
    },
    {
        id: 7,
        name: 'Acqua naturale 0.5L',
        image: 'acquanat.jpeg',
        price: 2
    },
    {
        id: 8,
        name: 'Coca Cola 0.33L',
        image: 'coca.jpg',
        price: 2.5
    },
    {
        id: 9,
        name: 'Birra Bud Light 0.33L',
        image: 'birra.jpg',
        price: 4.5
    },
];


let listCards = [];
function initApp(){ //iniz app
    products.forEach((value, key) => {
        let newDiv = document.createElement('div');
        newDiv.classList.add('item');
        newDiv.innerHTML = `
            <img src = "/menu/imageprod/${value.image}"/>
            <div class = "title">${value.name}</div>
            <div class="price">€ ${value.price.toLocaleString()}</div>
            <button onclick = "addToCard(${key})">Aggiungi al carrello</button>
        `;
        list.appendChild(newDiv);   //aggiunge nuovo elem html dentro list
    })
}
initApp();

function addToCard(key){
    if(listCards[key] == null){
        listCards[key] = products[key];
        listCards[key].quantity = 1;
    }
    reloadCard();
}

function reloadCard(){
    listCard.innerHTML = '';    //restituisce markup html all'interno dell'elemento
    let count = 0;
    let totalPrice = 0;
    listCards.forEach((value, key) => {
        totalPrice = totalPrice + value.price;
        count = count + value.quantity;

        if(value != null){
            let newDiv = document.createElement('li');
            newDiv.innerHTML = `
            <div><img src = "/menu/imageprod/${value.image}"/></div>
            <div>${value.name}</div>
            <div>${value.price.toLocaleString()}</div>
            <div>${value.quantity}</div>
            <div>
                <button onclick = "changeQuantity(${key}, ${value.quantity - 1})">-</button>
                <div class = "count">${value.quantity}</div>
                <button onclick = "changeQuantity(${key}, ${value.quantity + 1})">+</button>
                </div>
            `;
            listCard.appendChild(newDiv);
        }
    })
    total.innerText = totalPrice.toLocaleString();
    quantity.innerText = count;
}

function changeQuantity(key, quantity){
    if(quantity == 0){
        delete listCards[key];
    }else{
        const product = products[key];

        if(listCards[key]){
            const previousQuantity = listCards[key].quantity;
            const pricePerUnit = product.price;

            //aggiorno quantità e prezzo tot nel carrello
            listCards[key].quantity = quantity;
            listCards[key].totalPrice = quantity * pricePerUnit;

            //aggiorno prezzo tot carrello sommando o sottraendo differenza
            const priceDifference = (quantity - previousQuantity) * pricePerUnit;
            listCards.totalPrice += priceDifference;
        }else{
            //se il prodotto non è nel carrello lo aggiungo con la nuova quantità
            listCards[key] = {
                quantity: quantity,
                totalPrice: quantity * product.price
            };

            //aggiorno il prezzo tot del carrello aggiungendo il prezzo del nuovo prod
            listCards.totalPrice += quantity * product.price;
        }
    }
    reloadCard();
}

//richiamo changeQuantity
newDiv.innerHTML = `
            <div>
                <button onclick="changeQuantity(${key}, ${value.quantity - 1})">-</button>
                <button onclick="changeQuantity(${key}, ${value.quantity + 1})">+</button>
            </div>
            `;
            listCard.appendChild(newDiv);



