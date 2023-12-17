
const cardstxt = document.querySelectorAll(".card-text");
const cardsbtns = document.querySelectorAll(".show");
cardsbtns.forEach( (btn, i) => {
    
    btn.addEventListener("click", e =>{
        if (cardstxt[i].classList.contains("hidden"))
            cardstxt[i].classList.remove("hidden");
        else 
        cardstxt[i].classList.add("hidden");
    })
});

// Imprime el momento en que se carga el archivo
console.log("El archivo se cargó en: " + new Date());
