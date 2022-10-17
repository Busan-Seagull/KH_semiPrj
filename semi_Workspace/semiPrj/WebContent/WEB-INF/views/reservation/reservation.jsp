<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집요정</title>
<link rel="stylesheet" href="/dobby/resources/css/reservation.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <form id="r-main-container" action="/dobby/reservation/success" method="post" class="flex-col">
        <div id="r-title">
            <span class="material-symbols-outlined"> magic_button </span>
            <p>예약하기</p>
        </div>
        <div id="r-service-info" class="flex-col border-g">
            <div class="flex-between">
                <h1>title</h1>
                <p>카테고리 : 인테리어</p>
            </div>
            <div class="flex-between">
                <p>담당집요정 : 너굴맨</p>
                <p>예약예정일 : 2222-02-02</p>
            </div>
        </div>
        <input type="checkbox" id="select-check">
        <div id="r-date-container" class="border-g">
            <div id="r-select-date">
                <div id="rs-sc-notice" class="flex-col grid-c12 grid-r23" style="position: absolute; left: 50px;  top: 20px;">
					<span class="material-symbols-outlined"> priority_high </span>
					<p>견적예약은 예약일로부터 일주일 전부터 가능합니다.</p>
				</div>
                <div class="flex-center grid-c23 grid-r12">
                    <span class="material-symbols-outlined"> calendar_month </span>
                    <p>날짜 선택</p>
                </div>
                <div id="r-back-btn" class="grid-r34"><span class="material-symbols-outlined">
                    chevron_left
                    </span></div>
                <div id="r-next-btn" class="grid-r34"><span class="material-symbols-outlined">
                    chevron_right
                    </span></div>
                <div id="r-date" class="flex-center grid-c23 grid-r23"><p id="r-year"></p><p>/</p><p id="r-month">9</p></div>
                <div id="date-container" class="grid-r34 grid-c23 flex-col">
                    <div id="row-1" class="flex-center">
                        <span class="col-1"><p>일</p></span>
                        <span class="col-2"><p>월</p></span>
                        <span class="col-3"><p>화</p></span>
                        <span class="col-4"><p>수</p></span>
                        <span class="col-5"><p>목</p></span>
                        <span class="col-6"><p>금</p></span>
                        <span class="col-7"><p>토</p></span>
                    </div>
                    <div id="row-2" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-3" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-4" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-5" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-6" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-7" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                </div>
            </div>
            <label id="btn-select-date" for="select-check">확인</label>
            <div id="r-slect-date-B" class="flex-center">
                <span class="material-symbols-outlined"> calendar_month </span>
                <p id="b-date"></p>
            </div>
        </div>
        <div id="r-coment" class="border-g">
            <div class="flex-center" style="margin: 15px 0 5px 0;">
                <span class="material-symbols-outlined"> magic_button </span>
                <p>요구사항 작성</p>
            </div>
            <textarea name="coment"></textarea>
            <input type="submit" value="예약완료" class="shadow-box">
        </div>
    </form>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
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
        let temp = document.querySelector('#row-'+row).querySelector('.col-'+col);

        while (temp.firstChild) {
            temp.removeChild(temp.firstChild);
        }

        let p = document.createElement('p');
        let num = document.createTextNode(d.getDate());

        p.appendChild(num);

        let label = document.createElement('label');
        let input = document.createElement('input');
        input.setAttribute('type', 'radio');
        input.setAttribute('name', 'date');
        input.setAttribute('value', d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDate());

        if(d.getMonth()!=(month)){
            label.classList.add('not-month');
        }

        label.appendChild(input);
        label.appendChild(p);

        temp.appendChild(label);
    }
</script>
</html>