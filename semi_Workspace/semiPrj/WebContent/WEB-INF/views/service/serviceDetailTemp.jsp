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
					<h2>${sv.serviceIntro}</h2>
					<table width=100% height="50%">
						<tr>
							<td class="sm text-grey fixed-text">닉네임</td>
							<td class="input-text" colspan="3">${sv.helper}</td>
						</tr>
						<tr>
							<td class="sm text-grey fixed-text">비용</td>
							<td class="input-text" colspan="3">${sv.chargeUnit}당<fmt:formatNumber
									value="${sv.charge}" pattern="#,###" />원
							</td>
						</tr>
						<tr>
							<td class="sm text-grey fixed-text">분야</td>
							<td class="input-text">${sv.serviceType}(경력3년)</td>
							<td class="sm text-grey fixed-text">운영시간</td>
							<td class="input-text">${sv.openTime}~${sv.closeTime}</td>
						</tr>
						<tr>
							<td class="sm text-grey fixed-text">지역</td>
							<td class="input-text">${cv.area_1}${cv.area_2} ${cv.area_3}<br>
								${cv.area_4} ${cv.area_5}
							</td>
							<td class="sm text-grey fixed-text">결제수단</td>
							<td class="input-text">${cv.payment_1}${cv.payment_2}
								${cv.payment_3}</td>
						</tr>
						<tr>
							<td class="sm text-grey fixed-text" colspan="4">서비스평가</td>
						</tr>
						<tr>
							<td colspan="4" id="starrr">★★★★★</td>
						</tr>
					</table>

				</div>
				<div class="inline-block" id="profile-btns">
					<div id="favorite">
						♥ <span id="favor-num">50</span>
					</div>
					<button class="hidden-btn1"
						onclick="location.href='/dobby/service/modify?sno=${sv.serviceNo}';">수정하기</button>

					<button class="hidden-btn2"
						onclick="go_delete()">삭제하기</button>
				</div>
			</div>
			<div id="service-navibar">
				<ul>
					<li><a href="#service-explain" class="text-white back-green"
						id="first-a">서비스 설명</a></li>
					<li><a href="#pay-info" class="text-white back-green"
						id="second-a">요금 정보</a></li>
					<li><a href="#service-review" class="text-white back-green"
						id="third-a">서비스 평가</a></li>
				</ul>
			</div>

			<div id="main-contents">
				<div id="service-explain">
					서비스 설명
					<p>${sv.serviceDetail}</p>
				</div>
				<div id="pay-info">
					요금 정보
					<p>${sv.paymentDetail}</p>
				</div>
				<div id="service-review">
					서비스 평가
					<button id="go-board" onclick="location.href='/dobby/reviewList'">전체보기</button>
					<div class="review-box" id="review1">
						<div id="review-head">
							<div>
								<span id="stars">★★★★☆</span> <span id="review-writer">김**</span>
							</div>
							<div id="review-date">2022.10.10</div>
						</div>
						<div id="review-content">
							<p>청소를 그냥 저냥 하네요...</p>
						</div>
					</div>
					<div class="review-box" id="review2">
						<div id="review-head">
							<div>
								<span id="stars">★★★★☆</span> <span id="review-writer">김**</span>
							</div>
							<div id="review-date">2022.10.10</div>
						</div>
						<div id="review-content">
							<p>청소를 그냥 저냥 하네요...</p>
						</div>
					</div>
					<div class="review-box" id="review3">
						<div id="review-head">
							<div>
								<span id="stars">★★★★☆</span> <span id="review-writer">김**</span>
							</div>
							<div id="review-date">2022.10.10</div>
						</div>
						<div id="review-content">
							<p>청소를 그냥 저냥 하네요...</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="side-content">
			<div id="reservation-box">
				<div id="reservation-content"></div>
				<div class="back-brown text-white" id="reservation-btn"
					onclick="location.href='/dobby/reservation?sno=${sv.serviceNo}'">예약하기</div>
			</div>
			<div class="back-light" id="reserve-info">서비스 완료후에 집요정에게 결제대금이
				전달됩니다.</div>

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
        alert("로그인을 먼저 해주세요.")
        location.href='/dobby/member/login';
    }
    
    const reservation_btn = document.querySelector("#reservation-btn");
    if (${loginMember == null}){
        reservation_btn.setAttribute("onClick", "go_login()");    			
    }

    function go_delete(){
        var result = confirm("모든 정보가 삭제 됩니다.\n정말로 삭제 하시겠습니까?");
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

<!-- 이벤트버블링.. 죽어.. -->
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
	// 클릭시 모달창 띄우기..
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

	// 클릭시 모달창 닫아주기..
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
</html>