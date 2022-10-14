let score = 0;

const count = document.querySelector('#count-down');

const mp = document.querySelector('#main-page');
const dp = document.querySelector('#difficulty-page');
const gp = document.querySelector('#game-page');
const hp = document.querySelector('#history-page');
const rp = document.querySelector('#ranck-page');
const ep = document.querySelector('#end-page');

const scoreSpan = document.querySelector('#score');

const easyBtn = document.querySelector('#easy');
easyBtn.addEventListener('click', function(e){
    dp.classList.add('invisible');
    gp.classList.remove('invisible');

    countDown();

    setTimeout(() => {game(1000);}, 3500);

});

const normalBtn = document.querySelector('#normal');
normalBtn.addEventListener('click', function(){
    dp.classList.add('invisible');
    gp.classList.add('normal-back')
    gp.classList.remove('invisible');

    countDown();
    setTimeout(() => {game(800);}, 3700);
    

});

const hardBtn = document.querySelector('#hard');
hardBtn.addEventListener('click', function(){
    dp.classList.add('invisible');
    gp.classList.add('hard-back')
    gp.classList.remove('invisible');

    countDown();

    setTimeout(() => {game(400);}, 4100);

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
        div.style.zIndex = '99';
    
        div.addEventListener('click', function(e){
            e.target.style.display = 'none';
            score = score + 2;
            scoreSpan.innerHTML = score;
            addPoint(e.target.style.left, e.target.style.top);
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
            duration: 1000+time,
            fill: "forwards"
          });
    
        i++;
        if(i==50){
            clearTimeout(timer);
            setTimeout(() => {
                endGame();
            }, 3000);
        };
    }, time);
}

//클릭했을때 번쩍이기
function addPoint(Dleft, Dtop) {
    const point = document.createElement('div');
    point.classList.add("point");

    point.style.left = Dleft;
    point.style.top = Dtop;

    gp.appendChild(point);

    setTimeout(() => {
        point.remove();
    }, 1000);
}


// 마우스이벤트
const cursor = document.querySelector('#cursor');
const gpSize = gp.getBoundingClientRect();
document.addEventListener('mousemove', function(e){
    cursor.style.left = `${e.clientX-gpSize.left-35}px`;
    cursor.style.top = `${e.clientY-gpSize.top-20}px`;
});


// 페이지 전환
const startBtn = document.querySelector('#start-btn');
const historyBtn = document.querySelector('#history-btn');
const ranckBtn = document.querySelector('#ranck-btn');

startBtn.addEventListener('click',function(){
    mp.classList.add('invisible');
    dp.classList.remove('invisible');
});

historyBtn.addEventListener('click',function(){
    mp.classList.add('invisible');
    hp.classList.remove('invisible');
});

ranckBtn.addEventListener('click',function(){
    mp.classList.add('invisible');
    rp.classList.remove('invisible');
});

//게임종료

function endGame(){
    gp.classList.add('invisible');
    ep.classList.remove('invisible');
    const myScore = document.querySelector('#my-score');
    let timer = setInterval(() => {
        myScore.innerHTML = parseInt(myScore.innerHTML) + 1;
        if(parseInt(myScore.innerHTML)==score){clearTimeout(timer);}
    }, 20);
}