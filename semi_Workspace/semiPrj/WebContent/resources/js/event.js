let score = 0;

const count = document.querySelector('#count-down');

const mp = document.querySelector('#main-page');
const dp = document.querySelector('#difficulty-page');
const gp = document.querySelector('#game-page');
const hp = document.querySelector('#history-page');
const rp = document.querySelector('#ranck-page');

const eazyBtn = document.querySelector('#eazy');
eazyBtn.addEventListener('click', function(){
    dp.classList.add('invisible');
    gp.classList.remove('invisible');

    countDown();

    setTimeout(() => {game(500);}, 4000);

});

function countDown() {
    let i = 0;
    count.classList.add('e-count-down')
    let timer = setInterval(function(){
        count.innerHTML = count.innerHTML - 1; 
        i++;
        if(i==3){clearTimeout(timer);};
    }, 1400);
}

function game(time) {
    let i = 0;
    let timer = setInterval(function(){
        const div = document.createElement('div');
        div.classList.add('dust');
        div.style.left = `${Math.floor(Math.random()*870)}px`;
        div.style.top = `${Math.floor(Math.random()*510)}px`;
    
        div.addEventListener('click', function(e){
            e.target.style.display = 'none';
            score++;
            console.log(score);
        });
        
        gp.appendChild(div);
        div.animate([
            // keyframes
            { 
                transform: 'scale(100%)',
                display: 'block',
                opacity: '100%'
            },
            { 
                transform: 'scale(0%)',
                display: 'none',
                opacity: '0'
            }
          ], {
            // timing options
            duration: time*2.5,
            fill: "forwards"
          });
    
        i++;
        if(i==100){clearTimeout(timer);};
    }, time);
}

