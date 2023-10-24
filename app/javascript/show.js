const cardsbtns= document.querySelectorAll(".show");
const cardstxt = document.querySelectorAll(".card-text");
cardsbtns.forEach( (btn, i) => {
    
    btn.addEventListener("click", e =>{
        if (cardstxt[i].classList.contains("hidden"))
            cardstxt[i].classList.remove("hidden");
        else 
        cardstxt[i].classList.add("hidden");
    })
});
