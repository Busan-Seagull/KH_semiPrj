<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet" href="/dobby/resources/css/serviceDetail.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="service-wrap">
		<div id="main-content">
			<div id="service-pic-container">
				<div class="service-pic" id="service-pic1">
					<img class="img" src="/dobby/${sv.servicePic_1}" alt="" onerror="this.src='/dobby/resources/img/dust.png';">
					<div class="modal">
						<span class="close">&times;</span>
						<img class="modal_content" id="img01" onerror="this.src='/dobby/resources/img/dust.png';">
					</div>
				</div>
				<div class="service-pic" id="service-pic2">
					<img src="/dobby/${sv.servicePic_2}" alt="" onerror="this.src='/dobby/resources/img/dust.png';">
					<div class="modal" >
						<span class="close">&times;</span>
						<img class="modal_content" id="img02" onerror="this.src='/dobby/resources/img/dust.png';">
					</div>
				</div>
				<div class="service-pic" id="service-pic3">
					<img src="/dobby/${sv.servicePic_3}" alt="" onerror="this.src='/dobby/resources/img/dust.png';">
					<div class="modal">
						<span class="close">&times;</span>
						<img class="modal_content" id="img03" onerror="this.src='/dobby/resources/img/dust.png';">
					</div>
				</div>
				<div class="service-pic" id="service-pic4">
					<img src="/dobby/${sv.servicePic_4}" alt="" onerror="this.src='/dobby/resources/img/dust.png';">
					<div class="modal">
						<span class="close">&times;</span>
						<img class="modal_content" id="img04" onerror="this.src='/dobby/resources/img/dust.png';">
					</div>
				</div>
			</div>

			
			
			<div id="helper-profile">
				<div class="inline-block" id="profile-pic-div">
					<img src="/dobby/${sv.profileImg}" alt="" onerror="this.src='/dobby/resources/img/dust.png';">
				</div>
				<div class="inline-block" id="profile-contents">
					<h2>${sv.title}</h2>
					<table width=100% height="50%">
						<tr>
							<td class="sm text-grey fixed-text">?????????</td>
							<td class="input-text" colspan="3">${sv.helper}</td>
						</tr>
						<tr>
							<td class="sm text-grey fixed-text">&nbsp; </td>
							<td class="input-text" colspan="3">&nbsp; </td>
						</tr>
						<tr>
							<td class="sm text-grey fixed-text">??????</td>
							<td class="input-text">${sv.serviceType}(??????3???)</td>
							<td class="sm text-grey fixed-text">????????????</td>
							<td class="input-text">${sv.openTime}~${sv.closeTime}</td>
						</tr>
						<tr>
							<td class="sm text-grey fixed-text">??????</td>
							<td class="input-text">${cv.area_1} ${cv.area_2} ${cv.area_3}<br>
								${cv.area_4} ${cv.area_5}
							</td>
							<td class="sm text-grey fixed-text">????????????</td>
							<td class="input-text">${cv.payment_1} ${cv.payment_2} ${cv.payment_3}</td>
						</tr>
						<tr>
							<td class="sm text-grey fixed-text" colspan="4">???????????????</td>
						</tr>
						<tr>
							<td colspan="1" id="starrr">
								<c:if test="${sv.reviewAvg eq 5}">???????????????</c:if>
									<c:if test="${sv.reviewAvg ge 4 && sv.reviewAvg lt 5}">???????????????</c:if>
									<c:if test="${sv.reviewAvg ge 3 && sv.reviewAvg lt 4}">???????????????</c:if>
									<c:if test="${sv.reviewAvg ge 2 && sv.reviewAvg lt 3}">???????????????</c:if>
									<c:if test="${sv.reviewAvg ge 1 && sv.reviewAvg lt 2}">???????????????</c:if>
									<c:if test="${sv.reviewAvg ge 0 && sv.reviewAvg lt 1}">???????????????</c:if>
								&nbsp&nbsp<fmt:formatNumber value="${sv.reviewAvg}" pattern="0.0"/></td>
							<td id="review-cnt-profile">(${sv.reviewCnt})</td>
						</tr>
					</table>

				</div>
				<div class="inline-block" id="profile-btns">
					
					<div id="favorite" class="zzim-item-like" onchange="clickZzim(this, ${sv.serviceNo})">
						<label>
							<input type="checkbox" 
							<c:if test ="${zzim.userNo != null}">checked</c:if>
							<c:if test ="${empty loginMember}">disabled</c:if>
							>
							<span class="material-symbols-outlined">favorite</span>
						</label>
					</div>
					
					<button class="hidden-btn1"
						onclick="location.href='/dobby/service/modify?sno=${sv.serviceNo}';">????????????</button>

					<button class="hidden-btn2"
						onclick="go_delete()">????????????</button>
				</div>
			</div>
			<div id="service-navibar">
				<ul>
					<li><a href="#service-explain" class="text-white back-green"
						id="first-a">????????? ??????</a></li>
					<li><a href="#pay-info" class="text-white back-green"
						id="second-a">?????? ??????</a></li>
					<li><a href="#service-review" class="text-white back-green"
						id="third-a">????????? ??????</a></li>
				</ul>
			</div>

			<div id="main-contents">
				<div id="service-explain">
					????????? ??????
					<p>${sv.serviceDetail}</p>
				</div>
				<div id="pay-info">
					?????? ??????
					<p>${sv.paymentDetail}</p>
				</div>
				<div id="service-review">
					????????? ??????
					<button id="go-board" onclick="location.href='/dobby/reviewList'">???????????? ></button>
					
					<c:if test="${empty rvList}">
					<h1 id="none-h1">????????? ????????? ????????????.</h1>
					</c:if>
					
					<c:forEach var="list" items="${rvList}" begin="0" end="3" step="1" varStatus="status">
					<div class="review-box" id="review1">
						<div id="review-head">
							<div>
								<span id="stars">
									<c:if test="${list.grade eq 5}">???????????????</c:if>
									<c:if test="${list.grade eq 4}">???????????????</c:if>
									<c:if test="${list.grade eq 3}">???????????????</c:if>
									<c:if test="${list.grade eq 2}">???????????????</c:if>
									<c:if test="${list.grade eq 1}">???????????????</c:if>
									
									&nbsp${list.grade}&nbsp&nbsp</span> <span id="review-title">${list.title}</span> <span id="review-writer">${list.userNick}</span>
							</div>
							<div id="review-date">${fn:substring(list.writeTime,0,16)}</div>
						</div>
						<div id="review-content">
							<p>${list.content}</p>
						</div>
					</div>
					</c:forEach>

					
				</div>
			</div>
		</div>
		<div id="side-content">
			<div id="reservation-box">
				<div id="service-title">${sv.title}</div>
				<div id="reservation-content">
					<div id="reservation-content-1">????????? ??????</div>
					<div id="reservation-content-2">
						<c:if test="${sv.chargeUnit eq '????????????'}">
							?????? ??????<br>(?????? ?????? 10,000???)
					</c:if>
						<c:if test="${sv.chargeUnit ne '????????????'}">
						${sv.chargeUnit}???
						<fmt:formatNumber value="${sv.charge}" pattern="#,###" />
						???
					</c:if>
					</div>
					<div id="reservation-content-3">${sv.serviceIntro}</div>
				</div>
				<div class="back-brown text-white" id="reservation-btn"
					onclick="location.href='/dobby/reservation?sno=${sv.serviceNo}'">????????????</div>
			</div>
			<div class="back-light" id="reserve-info"><i class="bi bi-info-square-fill"></i> &nbsp????????? ???????????? ??????????????? ??????<br> 
				&nbsp&nbsp&nbsp&nbsp ????????? ???????????????.</div>

		</div>

	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
<script defer>
    const navi_a = document.querySelector("#first-a");
    const navi_b = document.querySelector("#second-a");
    const navi_c = document.querySelector("#third-a");

    navi_a.addEventListener('click', function(){
        navi_a.classList.replace('text-white','text-green');
        navi_a.classList.replace('back-green','back-white');
        navi_b.classList.replace('text-green','text-white');
        navi_b.classList.replace('back-white','back-green');
        navi_c.classList.replace('text-green','text-white');
        navi_c.classList.replace('back-white','back-green');
    });
    navi_b.addEventListener('click', function(){
        navi_b.classList.replace('text-white','text-green');
        navi_b.classList.replace('back-green','back-white');
        navi_a.classList.replace('text-green','text-white');
        navi_a.classList.replace('back-white','back-green');
        navi_c.classList.replace('text-green','text-white');
        navi_c.classList.replace('back-white','back-green');
    });
    navi_c.addEventListener('click', function(){
        navi_c.classList.replace('text-white','text-green');
        navi_c.classList.replace('back-green','back-white');
        navi_b.classList.replace('text-green','text-white');
        navi_b.classList.replace('back-white','back-green');
        navi_a.classList.replace('text-green','text-white');
        navi_a.classList.replace('back-white','back-green');
    });

    function go_login(){
        alert("???????????? ?????? ????????????.")
        location.href='/dobby/member/login';
    }
    
    const reservation_btn = document.querySelector("#reservation-btn");
    if (${loginMember == null}){
        reservation_btn.setAttribute("onClick", "go_login()");    			
    }

    function go_delete(){
        var result = confirm("?????? ????????? ?????? ?????????.\n????????? ?????? ???????????????????");
        if(result == true){
			location.href='/dobby/service/delete?sno=${sv.serviceNo}';
		}
    }

</script>
<script defer>
    const hidden_btn = document.querySelectorAll('.hidden-btn1,.hidden-btn2');

	if(${loginMember.userNo}==${sv.helperNo}){
   		for(var i = 0;i<hidden_btn.length;i++){
  		hidden_btn[i].style.display = "block";
		}
	}
</script>

<!-- ??????????????????.. ??????.. -->
<script defer>
	const modal = document.querySelectorAll(".modal");
	const img = document.querySelectorAll(".img");
	const modal_img = document.querySelectorAll(".modal_content");
	const span = document.querySelectorAll(".close");
	const img_div1 = document.querySelector("#service-pic1");
	const img_div2 = document.querySelector("#service-pic2");
	const img_div3 = document.querySelector("#service-pic3");
	const img_div4 = document.querySelector("#service-pic4");

	function modalDisplay(i, text){
		modal[i].style.display = text;
	}
	// ????????? ????????? ?????????..
	img_div1.addEventListener('click', ()=>{
		modalDisplay(0, "block");
		modal_img[0].src = "/dobby/${sv.servicePic_1}";
	});
	img_div2.addEventListener('click', ()=>{
		modalDisplay(1, "block");
		modal_img[1].src = "/dobby/${sv.servicePic_2}";
	});
	img_div3.addEventListener('click', ()=>{
		modalDisplay(2, "block");
		modal_img[2].src = "/dobby/${sv.servicePic_3}";
	});
	img_div4.addEventListener('click', ()=>{
		modalDisplay(3, "block");
		modal_img[3].src = "/dobby/${sv.servicePic_4}";
	});

	// ????????? ????????? ????????????..
	span[0].addEventListener('click', (e)=>{
		modalDisplay(0, "none");
		e.stopImmediatePropagation();
	});
	modal[0].addEventListener('click', (e)=>{
		modalDisplay(0, "none");
		e.stopImmediatePropagation();
	});
	span[1].addEventListener('click', (e)=>{
		modalDisplay(1, "none");
		e.stopImmediatePropagation();
	});
	modal[1].addEventListener('click', (e)=>{
		modalDisplay(1, "none");
		e.stopImmediatePropagation();
	});
	span[2].addEventListener('click', (e)=>{
		modalDisplay(2, "none");
		e.stopImmediatePropagation();
	});
	modal[2].addEventListener('click', (e)=>{
		modalDisplay(2, "none");
		e.stopImmediatePropagation();
	});
	span[3].addEventListener('click', (e)=>{
		modalDisplay(3, "none");
		e.stopImmediatePropagation();
	});
	modal[3].addEventListener('click', (e)=>{
		modalDisplay(3, "none");
		e.stopImmediatePropagation();
	});
	
</script>
<script>
//


// const zzimList = document.querySelector("#zzim-list");
const zzimCheck = document.querySelector("input[type=checkbox]");
const zzimItem = document.querySelector(".zzim-item-like");

function clickZzim(obj, n){
	// const index = [...zzimItem].indexOf(obj);
	if(${empty loginMember}){
		alert('???????????? ?????? ?????????.');
		return;
	}else{
	console.log(zzimCheck.checked);

		if(zzimCheck.checked){
			console.log(2);
			zzimAjaxCancle(n);
			return;
		}else{
			console.log(1);
			zzimAjax(n);
			return;
		}
	}
}

function zzimAjax(sno){
	var xhr = new XMLHttpRequest();
	xhr.open("POST", '/dobby/zzim/check');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				
			}else{
				alert("????????? ???????????? ??????.");
			}
		}
	}
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
	xhr.send('sno='+sno);	
}

function zzimAjaxCancle(sno){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", '/dobby/zzim/check?sno='+sno);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				
			}else{
				alert("????????? ???????????? ??????.");
			}
		}
	}
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
	xhr.send();
}
</script>
</html>