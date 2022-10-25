<%@page import="com.kh.dobby.reservation.vo.ReservationVo"%>
<%@page import="com.kh.dobby.service.vo.ServiceVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집요정</title>
<link rel="stylesheet" href="/dobby/resources/css/reservation.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<c:if test="${not empty rv}">
		<script type="text/javascript">
			
		</script>
    	<form id="r-main-container" action="/dobby/reservation" method="post" class="flex-col">
    	<input type="hidden" name="rno" value="${rv.reservation_no}">
	</c:if>
	
	<c:if test="${empty rv}">
		<form id="r-main-container" action="/dobby/reservation/success" method="post" class="flex-col">
		<input type="hidden" name="sno" value="${sv.serviceNo}">
	</c:if>
	
        <div id="r-title">
            <span class="material-symbols-outlined"> magic_button </span>

           	<c:if test="${not empty rv}">
           		<p>견적예약</p>
           	</c:if>
           	
           	<c:if test="${empty rv}">
           		<p>예약하기</p>
           	</c:if>

        </div>
        
        <div id="r-service-info" class="flex-col border-g">
            <div class="flex-between">
                <h1>${sv.title}</h1>
                <p>카테고리 : ${sv.typeNo}</p>
            </div>
            
            <div class="flex-between">
                <p>담당집요정 : ${sv.helperNo}</p>
                <c:if test="${not empty rv}">
                	<p>예약예정일 : ${rv.reservationDate}</p>
                </c:if>
            </div>
        </div>

        <c:if test="${sv.charge != 0}">
            <div id="r-pay" class="border-g">
                <div class="flex-center">
                    <span class="material-symbols-outlined"> payments </span>
                    <h1>요금선택</h1>
                </div>
                <div class="flex-center">
                   	<input id="numberInput" type="number" min="1" value="1" onchange="updatePay();"></input>
                    <p>(${sv.chargeUnit})</p>
                    <p>&nbsp;X&nbsp;</p>
                    <p><fmt:formatNumber value="${sv.charge}" pattern="#,###"/>&nbsp;원</p>
                </div>
                <div class="flex-center">
                    <span class="material-symbols-outlined"> barcode </span>
                    <h1>결제 예정 금액 :</h1>
                    <h1><input type="text" id="payInput" name="pay" readonly value=""></input>&nbsp;원</h1>
                </div>
            </div>
        </c:if>
        
        <input type="checkbox" id="select-check">
        
        <div id="r-date-container" class="border-g">
            <div id="r-select-date">
            
	            <c:if test="${not empty rv}">
	                <div id="rs-sc-notice" class="flex-col grid-c12 grid-r23" style="position: absolute; left: 50px;  top: 20px;">
						<span class="material-symbols-outlined"> priority_high </span>
						<p>견적예약은 예약일로부터 일주일 전부터 가능합니다.</p>
					</div>
				</c:if>
			
                <div class="flex-center grid-c23 grid-r12">
                    <span class="material-symbols-outlined"> calendar_month </span>
                    <p>날짜 선택</p>
                </div>
                
                <c:if test="${empty rv}">
                    <div id="r-back-btn" class="grid-r34">
                        <span class="material-symbols-outlined">chevron_left</span>
                    </div>
                    <div id="r-next-btn" class="grid-r34">
                        <span class="material-symbols-outlined">chevron_right</span>
                    </div>
                </c:if>

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
            
		<c:if test="${not empty rv}">
			<input id="btn-select-date" type="submit" value="확인">
		</c:if>
		<c:if test="${empty rv}">
			<label id="btn-select-date" for="select-check">확인</label>
		</c:if>
		
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
            
            <c:if test="${empty sv.charge}">
				<input type="submit" value="견적예약" class="shadow-box">
			</c:if>
			<c:if test="${not empty sv.charge}">
				<input type="submit" value="예약완료" class="shadow-box">
			</c:if>
			
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

    if(back!=null){
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
    }

    if(next!=null){
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
    }

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

        <c:if test="${not empty rv}">
            const reservDate = ${fn:substring(rv.reservationDate,8,10)}

	        if(d.getDate() > reservDate || d.getDate() < reservDate-7){
	        	label.classList.add('not-estimate');
	        }  
		</c:if>

        if(d.getMonth()!=(month)){
            label.classList.add('not-month');
        }
		
        label.appendChild(input);
        label.appendChild(p);

        temp.appendChild(label);
    }

    const numInput = document.querySelector("#numberInput");    

    updatePay();

    function updatePay() {
        const payInput = document.querySelector("#payInput");

        if(payInput!=null){
	        const sumPay = numInput.value * ${sv.charge};
	        payInput.value = sumPay.toLocaleString('ko-KR');
        }
    }

</script>
</html>