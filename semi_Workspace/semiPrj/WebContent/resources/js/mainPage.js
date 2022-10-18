const back = document.querySelector('#baner-back-btn');
const next = document.querySelector('#baner-next-btn');
const baner = document.querySelector("#main-baner");
let items = document.querySelectorAll('.baner-item');
let size = items.length;

let banerPage = 0;

back.addEventListener('click', function(){
    if(banerPage>0){
        banerPage--;
        baner.style.left = -(banerPage * 100) +'vw';
    }
});

next.addEventListener('click', function(){
    if(banerPage<size-1){
        banerPage++;
        baner.style.left = -(banerPage * 100) +'vw';
    }
});

setInterval(() => {
    if(banerPage<size-1){
        banerPage++;
        baner.style.left = -(banerPage * 100) +'vw';
    }else{
        banerPage = 0;
        baner.style.left = -(banerPage * 100) +'vw';
    }
}, 4000);

const slNext = document.querySelector('#sl-next-btn');
const slBack = document.querySelector('#sl-back-btn');
const serviceContain = document.querySelector('#switch-service-list');
let slItems = document.querySelectorAll('.service-list-item');

let slSize = slItems.length/5;

let slPage = 0;

if(slBack!=null){
    slBack.addEventListener('click', function(){
        if(slPage>0){
            slPage--;
            serviceContain.style.left = -(slPage * 100) +'%';
        }
    });
}

if(slNext!=null){
    slNext.addEventListener('click', function(){
        if(slPage<slSize-1){
            slPage++;
            serviceContain.style.left = -(slPage * 100) +'%';
        }
    });
}

const pdNext = document.querySelector('#pd-next');
const pdBack = document.querySelector('#pd-back');
const pdContain = document.querySelector('#pd-contain');
let pdItems = pdContain.querySelectorAll('.item');

let pdSize = pdItems.length/2;

let pdPage = 0;

pdBack.addEventListener('click', function(){
    if(pdPage>0){
        pdPage--;
        pdContain.style.left = -(pdPage * 100) +'%';
    }
});

pdNext.addEventListener('click', function(){
    if(pdPage<pdSize-1){
        pdPage++;
        pdContain.style.left = -(pdPage * 100) +'%';
    }
});

const psNext = document.querySelector('#ps-next');
const psBack = document.querySelector('#ps-back');
const psContain = document.querySelector('#ps-contain');
let psItems = psContain.querySelectorAll('.item');

let psSize = psItems.length/2;

let psPage = 0;

psBack.addEventListener('click', function(){
    if(psPage>0){
        psPage--;
        psContain.style.left = -(psPage * 100) +'%';
    }
});

psNext.addEventListener('click', function(){
    if(psPage<psSize-1){
        psPage++;
        psContain.style.left = -(psPage * 100) +'%';
    }
});

const user = document.querySelector('#user-count');
const dobby = document.querySelector('#dobby-count');
const service = document.querySelector('#service-count');
const reservation = document.querySelector('#reservation-count');

if(user!=null){
    document.addEventListener('scroll', counting());

    function counting (){
        let timer01 = setInterval(() => {
            user.innerHTML = parseInt(user.innerHTML) + 1;
            if(parseInt(user.innerHTML) == 1234){clearTimeout(timer01)};
        }, 0.5);
    
        let timer02 = setInterval(() => {
            dobby.innerHTML = parseInt(dobby.innerHTML) + 1;
            if(parseInt(dobby.innerHTML) == 1234){clearTimeout(timer02)};
        }, 0.5);
    
        let timer03 = setInterval(() => {
            service.innerHTML = parseInt(service.innerHTML) + 1;
            if(parseInt(service.innerHTML) == 1234){clearTimeout(timer03)};
        }, 0.5);
    
        let timer04 = setInterval(() => {
            reservation.innerHTML = parseInt(reservation.innerHTML) + 1;
            if(parseInt(reservation.innerHTML) == 1234){clearTimeout(timer04)};
        }, 0.5);
    
        if(window.scrollY >= 400){
            document.removeEventListener('scroll', conting());
        }
    }
}

