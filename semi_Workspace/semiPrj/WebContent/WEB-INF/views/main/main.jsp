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
<link rel="stylesheet" href="/dobby/resources/css/mainPage.css">
<script defer src="/dobby/resources/js/mainPage.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<%@include file="/WEB-INF/views/common/side.jsp" %>
	<div id="main-baner-box">
		<div id="baner-back-btn"><span class="material-symbols-outlined">chevron_left</span></div>
		<div id="baner-next-btn"><span class="material-symbols-outlined">chevron_right</span></div>
		<div id="main-baner" style="left: 0;">
			<c:forEach items="${list}" var="bvo">
			<a href="${bvo.link}" class="baner-item" style="background: url(${bvo.imgLink}); background-size:cover"></a>
			</c:forEach>
		</div>
	</div>
	<div id="main-search-box">
		<form action="/dobby/service/list" method="get" class="flex-center">
			<input type="text" name="search" placeholder="검색어를 입력하세요"><input type="submit" value="">
		</form>
	</div>
	<main>
		<div id="main-category">
			<a href="/dobby/service/list?stn=1" class="category-item" style="z-index: 10;">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">styler</span>
				</div>
				<p>가사도우미</p>
			</a>
			<a href="/dobby/service/list?stn=2" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">local_shipping</span>
				</div>
				<p>이사</p>
			</a>
			<a href="/dobby/service/list?stn=3" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">scene</span>
				</div>
				<p>인테리어</p>
			</a>
			<a href="/dobby/service/list?stn=4" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">shower</span>
				</div>
					<p>전기/수도/가스</p>
			</a>
			<a href="/dobby/service/list?stn=5" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">kitchen</span>
				</div>
				<p>가전설치</p>
			</a>
			<a href="/dobby/service/list?stn=6" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">potted_plant</span>
				</div>
				<p>펫/식물</p>
			</a>
		</div>

		<!-- 일반회원/집요정 -->
		<%if(loginMember!=null){%>
		<div id="switching-sub">
			<div class="contain-header flex-center">
				<div class="flex-center">
					<span class="material-symbols-outlined">magic_button</span>
					<p>찜한 서비스</p>
				</div>
				<div>
					<span id="sl-back-btn" class="material-symbols-outlined">chevron_left</span>
					<span id="sl-next-btn" class="material-symbols-outlined">chevron_right</span>
				</div>
			</div>
			<div id="switch-service-list" class="flex-center" style="left: 0; height: 270px;">

				<c:forEach items="${zzList}" var="vo">
				<!--  -->
				<a href="/dobby/service/detail?sno=${vo.dNo}" class="service-list-item shadow-box">
					<img alt="" src="/dobby/${vo.imgLink }" class="sl-item-img">
					<div class="sl-item-like" onchange="clickZzim(this, ${vo.dNo})"><label><input type="checkbox"><span class="material-symbols-outlined">favorite</span> </label></div>
					<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>${vo.grade }</p></div>
					<div class="sl-item-title">${vo.title }</div>
					<div class="item-review flex-center"><p>리뷰</p><p>${vo.review }</p></div>
				</a>				
				<!--  -->
				</c:forEach>

			</div>
		</div>
		<script>
			const zzimList = document.querySelector("#switch-service-list");
			const zzimCheckArr = zzimList.querySelectorAll("input[type=checkbox]");
			const zzimItemArr = zzimList.querySelectorAll(".sl-item-like");
	
			function clickZzim(obj, n){
				const index = [...zzimItemArr].indexOf(obj);
				
				console.log(zzimCheckArr[index].checked);
	
					if(zzimCheckArr[index].checked){
						console.log(2);
						zzimAjaxCancle(n);
						return;
					}else{
						console.log(1);
						zzimAjax(n);
						return;
					}
			}
	
			function zzimAjax(sno){
				var xhr = new XMLHttpRequest();
				xhr.open("POST", '/dobby/zzim/check');
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4){
						if(xhr.status == 200){
							
						}else{
							alert("결과가 저장되지 않음.");
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
							alert("결과가 저장되지 않음.");
						}
					}
				}
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
				xhr.send();
			}
	
		</script>
		<%}else{%>
		<!-- 로그인안했을 때 -->
		<div id="switching-sub">
			<div id="nl-sub-container">
				<div>
					<span class="material-symbols-outlined">face</span>
					<h1 id="user-count">0</h1>
					<h2>일반회원</h2>
				</div>
				◆
				<div>
					<span class="material-symbols-outlined"> engineering </span>
					<h1 id="dobby-count">0</h1>
					<h2>집요정</h2>
				</div>
				◆
				<div>
					<span class="material-symbols-outlined"> handyman </span>
					<h1 id="service-count">0</h1>
					<h2>등록된 서비스</h2>
				</div>
				◆	
				<div>
					<span class="material-symbols-outlined"> inventory </span>
					<h1 id="reservation-count">0</h1>
					<h2>완료된 서비스</h2>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		const user = document.querySelector('#user-count');
		const dobby = document.querySelector('#dobby-count');
		const service = document.querySelector('#service-count');
		const reservation = document.querySelector('#reservation-count');

		if(user!=null){
		    document.addEventListener('scroll', counting());

		    function counting (){
		        let timer01 = setInterval(() => {
		        	if(${userCount} == 0){clearTimeout(timer04)};
		            user.innerHTML = parseInt(user.innerHTML) + 1;
		            if(parseInt(user.innerHTML) == ${userCount}){clearTimeout(timer01)};
		        }, 0.5);
		    
		        let timer02 = setInterval(() => {
		        	if(${dobbyCount} == 0){clearTimeout(timer04)};
		            dobby.innerHTML = parseInt(dobby.innerHTML) + 1;
		            if(parseInt(dobby.innerHTML) == ${dobbyCount}){clearTimeout(timer02)};
		        }, 0.5);
		    
		        let timer03 = setInterval(() => {
		        	if(${serviceCount} == 0){clearTimeout(timer04)};
		            service.innerHTML = parseInt(service.innerHTML) + 1;
		            if(parseInt(service.innerHTML) == ${serviceCount}){clearTimeout(timer03)};
		        }, 0.5);
		    
		        let timer04 = setInterval(() => {
		        	if(${successCount} == 0){clearTimeout(timer04)};
		            reservation.innerHTML = parseInt(reservation.innerHTML) + 1;
		            if(parseInt(reservation.innerHTML) == ${successCount}){clearTimeout(timer04)};
		        }, 0.5);
		    
		        if(window.scrollY >= 400){
		            document.removeEventListener('scroll', conting());
		        }
		    }
		}
		</script>
		
		<%}%>
		<div id="popularity">
			<div id="popularity-dobby">
				<div class="contain-header flex-center">
					<div class="flex-center">
						<span class="material-symbols-outlined">magic_button</span>
						<p>인기 집요정</p>
					</div>
					<div>
						<span id="pd-back" class="material-symbols-outlined">chevron_left</span>
						<span id="pd-next" class="material-symbols-outlined">chevron_right</span>
					</div>
				</div>
				<div id="pd-contain" style="left: 0;">

					<!-- 개인집요정 이동리읔 아직 -->
					<c:forEach items="${zList }" var="vo">
					
					<a href="/dobby/superyojeong/profile?uno=${vo.userNo }" class="item flex-center shadow-box">
						<img alt="" src="/dobby/${vo.imgLink }" class="item-img">
						<div class="text-contain">
							<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>${vo.grade }</p></div>
							<div class="item-title">${vo.nick }</div>
							<div class="item-review flex-center"><p>리뷰</p><p>${vo.review }</p></div>
						</div>
					</a>
					
					</c:forEach>
			
					<!--  -->

				</div>
			</div>
			<div id="popularity-service">
				<div class="contain-header flex-center">
					<div class="flex-center">
						<span class="material-symbols-outlined">magic_button</span>
						<p>인기 서비스</p>
					</div>
					<div>
						<span id="ps-back" class="material-symbols-outlined">chevron_left</span>
						<span id="ps-next" class="material-symbols-outlined">chevron_right</span>
					</div>
				</div>
				<div id="ps-contain" style="left: 0;">

					<!--  -->
					<c:forEach items="${sList}" var="vo">
					<a href="/dobby/service/detail?sno=${vo.serviceNo }" class="item flex-center shadow-box">
						<img alt="" src="/dobby/${vo.profileImg }" class="item-img">
						<div class="text-contain">
							<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>${vo.reviewAvg }</p></div>
							<div class="item-title">${vo.title }</div>
							<div class="item-review flex-center"><p>리뷰</p><p>${vo.reviewCnt }</p></div>
						</div>
					</a>
					</c:forEach>

					<!--  -->

				</div>
			</div>
		</div>

		<div id="community">
			<div class="contain-header flex-center">
				<div class="flex-center">
					<span class="material-symbols-outlined">magic_button</span>
					<p>커뮤니티</p>
				</div>
				<a href="/dobby/commu/list?no=1" class="flex-center">
					<span style="font-size: 15px;">더보기</span>
					<span class="material-symbols-outlined">chevron_right</span>
				</a>
			</div>
			<div id="comuunity-contain">
				<table>
					<!-- a태그 추가 링크는 /dobby/commu/detail -->
					<tr id="table-header">
						<th class="t-1">비고</th>
						<th class="t-2">제목</th>
						<th class="t-3">작성자</th>
						<th class="t-4">조회수</th>
					</tr>
				
					<c:forEach items="${cList}" var="cvo">
					<c:if test="${cvo.typeNo != '200'}">
						<tr onclick="location.href='/dobby/commu/detail?bno=${cvo.postNo}'">
					</c:if>
					<c:if test="${cvo.typeNo == '200'}">
						<tr class="notice" onclick="location.href='/dobby/commu/detail?bno=${cvo.postNo}'">
					</c:if>
					<c:choose>
						<c:when test="${cvo.typeNo == '200'}"><td class="t-1">공지</td></c:when>
						<c:when test="${cvo.typeNo == '201'}"><td class="t-1">일반</td></c:when>
						<c:when test="${cvo.typeNo == '202'}"><td class="t-1">TIP</td></c:when>
						<c:when test="${cvo.typeNo == '203'}"><td class="t-1">추천</td></c:when>
					</c:choose>
						<td class="t-2">${cvo.title}</td>
						<td class="t-3">${cvo.userNo}</td>
						<td class="t-4">${cvo.views}</td>
					</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</main>
	<div id="main-bottom">
		<div id="b-text-contain">
			<p style="left: 0;">1인 가구를 위한 홈케어</p>
			<p style="left: 50px;">내가 할 수 있는 서비스를 등록하고</p>
			<p style="left: 100px;">나에게 필요한 <strong>집요정</strong>을 불러봐요!!</p>
		</div>
		<div id="bottom-contain">
			<a href="/dobby/member/join" class="flex-center"><p>시작하기</p></a>
			<span class="flex-center"><div class="dust"></div><div class="dust"></div><div id="tool-img"></div></span>
		</div>
	</div>
	<style>
		footer{
			height: 190px;
			display: flex;
			font-family: var(--sans);
			background-color: var(--semi-brown);
			color: white;
			justify-content: center;
			align-items: center;
			gap: 50px;
		}
		#footer-logo{
			height: 60px;
		}

		#footer-link-info{
			display: flex;
			gap: 5px;
		}

		#footer-middle{
			font-size: 13px;
			display: flex;
			flex-direction: column;
			gap: 5px;
		}

		#footer-middle a{
			color: white;
		}

		#footer-quick-icon a{
			display: inline-block;
			margin: 3px;
			width: 25px;
			height: 25px;
		}

		#footer-quick-icon span{
			color: white;
			font-size: 30px;
		}

	</style>

	<footer>
		<img src="/dobby/resources/img/로고_흰색.png" alt="" id="footer-logo">
		<div id="footer-middle">
			<div id="footer-link-info">
				<a href="">이용약관</a>
				<p>|</p>
				<a href="">개인정보처리방침</a>
				<p>|</p>
				<a href="">사업자 정보확인</a>
			</div>
			<p>나를도와조는 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한</p>
			<p>이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</p>
		</div>
		<div id="footer-quick-icon">
			<a href=""><span class="material-symbols-outlined">info</span></a>
			<a href=""><span class="material-symbols-outlined">help</span></a>
			<a href=""><span class="material-symbols-outlined">pending</span></a>
		</div>
	</footer>

</body>
</html>