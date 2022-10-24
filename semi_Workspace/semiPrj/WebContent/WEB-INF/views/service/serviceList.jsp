<%@page import="com.kh.dobby.service.vo.ServiceVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.dobby.common.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ServiceVo sv = (ServiceVo) request.getAttribute("sv");
PageVo pv = (PageVo) request.getAttribute("pv");
String root = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet" href="/dobby/resources/css/serviceList.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="main-baner-box">
		<div id="main-baner"></div>
	</div>
	<main>
		<div id="service-category">
			<div id="service-category-h1">서비스 목록</div>
			<ul>
				<li><a href="/dobby/service/list">전체보기</a></li>
				<li><a href="/dobby/service/list?stn=1">가사도우미</a></li>
				<li><a href="/dobby/service/list?stn=2">이사</a></li>
				<li><a href="/dobby/service/list?stn=3">인테리어</a></li>
				<li><a href="/dobby/service/list?stn=4">전기/수도/가스</a></li>
				<li><a href="/dobby/service/list?stn=5">가전설치</a></li>
				<li><a href="/dobby/service/list?stn=6">펫/식물</a></li>
			</ul>
		</div>
		<div id="service-main">
			<div id="service-main-category">가사도우미</div>
			<div id="service-main-nav">
				<select class="nav-select" id="select-region">
					<option value="">지역선택</option>
					<option value="1">도봉구</option>
					<option value="2">노원구</option>
					<option value="3">강북구</option>
					<option value="4">은평구</option>
					<option value="5">종로구</option>
					<option value="6">성북구</option>
					<option value="7">중랑구</option>
					<option value="8">동대문구</option>
					<option value="9">서대문구</option>
					<option value="10">중구</option>
					<option value="11">마포구</option>
					<option value="12">용산구</option>
					<option value="13">성동구</option>
					<option value="14">광진구</option>
					<option value="15">강서구</option>
					<option value="16">양천구</option>
					<option value="17">구로구</option>
					<option value="18">영등포구</option>
					<option value="19">금천구</option>
					<option value="20">동작구</option>
					<option value="21">관악구</option>
					<option value="22">서초구</option>
					<option value="23">강남구</option>
					<option value="24">송파구</option>
					<option value="25">강동구</option>
				</select>
				<select class="nav-select" id="select-date">
					<option value="">날짜선택</option>
				</select>
				<div class="nav-select" id="helper-search">
					<form action="">
						<div id="textbox-wrap">
							<input type="search" id="search-textbox" placeholder="서비스를 찾아보세요">
						</div>
						<div id="search-button-wrap">
							<input type="submit" value="검색" id="search-button">
						</div>
						<div id="search-img">
							<span class="material-symbols-outlined"> search </span>
						</div>
					</form>
				</div>

			</div>
			<div id="helper-number">1,150명의 집요정</div>
			<div class="helper-list-flex">

				<c:forEach var="list" items="${svList}">

					<div class="helper-list-outline">
						<a class="helper-list"
							onclick="location.href='<%=root %>/service/detail?sno=${list.serviceNo}'">
							<div class="helper-pic">
								<img src="/dobby/${list.profileImg}" alt="">
							</div>
							<div class="helper-contents">
								<div>
									<h2>${list.title} | ${list.helper}</h2>
									<p>${list.serviceIntro}</p>
								</div>
								<div>
									<span class="starrr">★★★★★</span> <span class="star-num">5</span>
									<span class="comment">"이 집 청소 잘하네요~"</span>
								</div>
							</div>
							<div class="helper-contents2">
								<div class="favorite-btn-div">
									<button class="favorite-btn">
										<span class="material-symbols-outlined"> favorite </span>찜
									</button>
								</div>
								<div class="service-pay">${list.chargeUnit}당
									<fmt:formatNumber value="${list.charge}" pattern="#,###" />
									원
								</div>
							</div>
						</a>
					</div>

				</c:forEach>

				<div class="helper-list-outline">
					<div class="helper-list">
						<div class="helper-pic">
							<img src="/dobby/resources/img/service/dobby3.jpg" alt="">
						</div>
						<div class="helper-contents">
							<div>
								<h2>집고치는 집요정 | 집요정</h2>
								<p>
									모든 집 수리 다 합니다<br> 모든 집 수리 다해요 ~
								</p>
							</div>
							<div>
								<span class="starrr">★★★★★</span> <span class="star-num">5</span>
								<span class="comment">"이 집 청소 잘하네요~"</span>
							</div>
						</div>
						<div class="helper-contents2">
							<div class="favorite-btn-div">
								<button class="favorite-btn">♥찜하기</button>
							</div>
							<div class="service-pay">평당 15,000원</div>
						</div>
					</div>
				</div>
				<div id="page-area">
					<ul id="page-nation">
						<li><a href="#" class="first"><<</a></li>
						<li><a href="#" class="arrow left"><</a></li>
						<li><a href="#" class="num">1</a></li>
						<li><a href="/" class="num">2</a></li>
						<li><a href="/" class="num">3</a></li>
						<li><a href="/" class="num">4</a></li>
						<li><a href="/" class="num">5</a></li>
						<li><a href="/" class="arrow right">></a></li>
						<li><a href="/" class="last">>></a></li>
					</ul>
				</div>
				<%--
				<script>
					const pageNation = document.querySelector('#page-nation');
					const numArr = pageNation.querySelectorAll('.num');
					const left = pageNation.querySelector('.arrow.left');
					const right = pageNation.querySelector('.arrow.right');

					<%if(pv.getStartPage() > 1){%>
						left.href = '/dobby/reservation/history?pno=<%=pv.getStartPage()-1%>';
					<%}else{%>
						left.classList.add('none-select');
					<%}%>

					<%if(pv.getEndPage() != pv.getMaxPage()){%>
						right.href = '/dobby/reservation/history?pno=<%=pv.getEndPage()+1%>';
					<%}else{%>
						right.classList.add('none-select');
					<%}%>

					let page = <%=pv.getStartPage()%>;

					for (let i = 0; i < numArr.length; i++) {
						const num = numArr[i];
						
						if(page==<%=pv.getCurrentPage()%>){
							num.classList.add('current');
						}
						
						if(page<1){
							num.classList.add('p-none');
						}else{
							num.href = '/dobby/reservation/history?pno='+page;
						}
						num.innerHTML = page;
						page++;
					}
					--%>
				</script>
			</div>
		</div>


	</main>
	<div id="main-bottom"></div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>