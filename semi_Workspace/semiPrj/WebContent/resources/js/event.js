let score = 0;
let point = 0;
let difficult = 0;

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
    difficult = 1;
    dp.classList.add('invisible');
    gp.classList.remove('invisible');

    countDown();

    setTimeout(() => {game(1000);}, 2500);

});

const normalBtn = document.querySelector('#normal');
normalBtn.addEventListener('click', function(){
    difficult = 2;
    dp.classList.add('invisible');
    gp.classList.add('normal-back')
    gp.classList.remove('invisible');

    countDown();
    setTimeout(() => {game(800);}, 2700);
    

});

const hardBtn = document.querySelector('#hard');
hardBtn.addEventListener('click', function(){
    difficult = 3;
    dp.classList.add('invisible');
    gp.classList.add('hard-back')
    gp.classList.remove('invisible');

    countDown();

    setTimeout(() => {game(400);}, 3100);

});

function countDown() {
    let i = 0;
    // count.classList.add('e-count-down')
    count.animate([
        // keyframes
        { 
            fontSize: '7em',
            opacity: '100%'
        },
        { 
            fontSize: '0em',
            opacity: '0'
        }
        ], {
        // timing options
        duration: 1000,
        fill: "forwards",
        iterations: 3
        }); 
    count.innerHTML = 3;
    let timer = setInterval(function(){
        count.innerHTML = count.innerHTML - 1; 
        i++;
        if(i==3){clearTimeout(timer);};
    }, 900);
}

function game(time) {
    score = 0;
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

document.addEventListener('mousemove', function(e){
    const gpSize = gp.getBoundingClientRect();
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

    getListPost(1);
    getMyRanck();
});

function getListPost(num) {  
    var xhr = new XMLHttpRequest();
    xhr.open("POST", '/dobby/event/list');
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4){
            if(xhr.status == 200){
                const historyList = document.querySelector('#history-list');
                historyList.innerHTML = xhr.responseText;
            }else{
                alert("결과가 조회되지 않음.");
            }
        }
    }
    console.log(num);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(`pno=${num}`);
}

function getMyRanck() {  
    var xhr = new XMLHttpRequest();
    xhr.open("POST", '/dobby/event/myRanck');
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4){
            if(xhr.status == 200){
                const historyBest = document.querySelector('#history-best');
                historyBest.innerHTML = xhr.responseText;
            }else{
                alert("결과가 조회되지 않음.");
            }
        }
    }
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send();
}

ranckBtn.addEventListener('click',function(){
    mp.classList.add('invisible');
    rp.classList.remove('invisible');

    getRanck(1);
});

function getRanck(num) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", `/dobby/event/list?pno=${num}`);
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4){
            if(xhr.status == 200){
                const ranckList = document.querySelector('#ranck-list');
                ranckList.innerHTML = xhr.responseText;
            }else{
                alert("결과가 조회되지 않음.");
            }
        }
    }

    xhr.send();
}

//게임종료

function endGame(){
    gp.classList.add('invisible');
    ep.classList.remove('invisible');
    const myScore = document.querySelector('#my-score');
    myScore.innerHTML = 0;
    let timer = setInterval(() => {
        if(parseInt(myScore.innerHTML)==score){clearTimeout(timer);return;}
        myScore.innerHTML = parseInt(myScore.innerHTML) + 1;
    }, 15);

    const pointSpan = document.querySelector('#get-point');
    pointSpan.innerHTML = score * difficult;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", '/dobby/event');
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4){
            if(xhr.status == 200){

            }else{
                alert("결과가 저장되지 않음.");
            }
        }
    }

    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
    xhr.send(`score=${score}&difficult=${difficult}`);
}

//뒤로가기
const backBtnArr = document.querySelectorAll('.back-btn');
backBtnArr.forEach(element => {
    element.addEventListener('click', function(){
        hp.classList.add('invisible');
        rp.classList.add('invisible');
        mp.classList.remove('invisible');
    });
});

//게임마지막 확인버튼
const endBtn = document.querySelector('#end-btn');
endBtn.addEventListener('click', function(){

    ep.classList.add('invisible');
    mp.classList.remove('invisible');
    gp.classList.remove('normal-back');
    gp.classList.remove('hard-back');

    score = 0;
    scoreSpan.innerHTML = 0;
    difficult = 0;
    point = 0;
});