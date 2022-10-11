let date = new Date();
let year = date.getFullYear();
let month = date.getMonth();

inputDateContainer(year, month);

const back = document.querySelector('#r-back-btn');
const next = document.querySelector('#r-next-btn');

back.addEventListener('click', function(){
    if(month>0){
        month--;
        inputDateContainer(year, month);
    }else if(month==0){
        year--;
        month = 11;
        inputDateContainer(year, month);
    }
});

next.addEventListener('click', function(){
    if(month<11){
        month++;
        inputDateContainer(year, month);
    }else if(month==11){
        year++;
        month = 0;
        inputDateContainer(year, month);
    }
});

const selectBtn = document.querySelector('#btn-select-date');
selectBtn.addEventListener('click', function(){
    const dateP = document.querySelector('#b-date');
    const radio = document.querySelector('input[type=radio]:checked');
    const checkBox = document.querySelector('#select-check');

    if(radio==null){
        checkBox.checked = true;
        return;
    }
    
    dateP.innerHTML = radio.defaultValue;
});

function inputDateContainer(y, mon) {

    const yearP = document.querySelector('#r-year');
    const monthP = document.querySelector('#r-month');

    yearP.innerText = year;
    monthP.innerText = month+1;

    const thisMonthOne = new Date(y, mon, 1);

    let dayOfweek = thisMonthOne.getDay();
    const n = 0-dayOfweek;

    let m = 0;
    let day01 = new Date(y, mon, 1+n);

    for(let i=2; i<8; i++){
        for (let j = 0; j < 7; j++) {
            day01 = new Date(y, mon, 1+n+m);
            createDate(i, j+1, day01);
            m++;
        }
    }
}


function createDate(row, col, d){
    let temp = document.querySelector(`#row-${row}`).querySelector(`.col-${col}`);

    while (temp.firstChild) {
        temp.removeChild(temp.firstChild);
     }

    let p = document.createElement('p');
    let num = document.createTextNode(`${d.getDate()}`);

    p.appendChild(num);

    let label = document.createElement('label');
    let input = document.createElement('input');
    input.setAttribute('type', 'radio');
    input.setAttribute('name', 'date');
    input.setAttribute('value', `${d.getFullYear()}-${d.getMonth()+1}-${d.getDate()}`);

    if(d.getMonth()!=(month)){
        label.classList.add('not-month');
    }

    label.appendChild(input);
    label.appendChild(p);

    temp.appendChild(label);
}