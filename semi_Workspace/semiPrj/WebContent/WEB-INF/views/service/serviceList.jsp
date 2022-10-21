<%@page import="com.kh.dobby.service.vo.ServiceVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.dobby.common.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ServiceVo sv = (ServiceVo)request.getAttribute("sv");
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
				<div class="nav-select" id="select-region">지역선택</div>
				<div class="nav-select" id="select-date">날짜선택</div>
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
						<div class="helper-list" onclick="location.href='<%=root %>/service/detail?sno=<c:out value='${list.serviceNo}'/>">
							<div class="helper-pic">
								<img src="" alt="">
							</div>
							<div class="helper-contents">
								<div>
									<h2>${list.title}|${list.helper}</h2>
									<p>${list.serviceIntro}</p>
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
								<div class="service-pay">${list.chargeUnit}당
									<fmt:formatNumber value="${list.charge}" pattern="#,###" />
									원
								</div>
							</div>
						</div>
					</div>

				</c:forEach>

				<div class="helper-list-outline">
					<div class="helper-list">
						<div class="helper-pic">
							<img src="/ryan/공통/resources/이상해씨.jpg" alt="">
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