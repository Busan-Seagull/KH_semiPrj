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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="main-baner-box">
		<img src="/dobby/resources/img/baner/리스트배너.png" alt="">
	</div>
	<main>
		<div id="service-category">
			<div id="service-category-h1">서비스 목록</div>
			<ul>
				<li><a href="/dobby/service/list">전체보기</a></li>
				<li><a href="/dobby/service/list?stn=1"><span class="material-symbols-outlined text-green">styler</span>가사도우미</a></li>
				<li><a href="/dobby/service/list?stn=2"><span class="material-symbols-outlined text-green">local_shipping</span>이사</a></li>
				<li><a href="/dobby/service/list?stn=3"><span class="material-symbols-outlined text-green">scene</span>인테리어</a></li>
				<li><a href="/dobby/service/list?stn=4"><span class="material-symbols-outlined text-green">shower</span>전기/수도/가스</a></li>
				<li><a href="/dobby/service/list?stn=5"><span class="material-symbols-outlined text-green">kitchen</span>가전설치</a></li>
				<li><a href="/dobby/service/list?stn=6"><span class="material-symbols-outlined text-green">potted_plant</span>펫/식물</a></li>
			</ul>
		</div>
		<div id="service-main">
			
				<div id="service-main-category">
					<span> ${category}</span>
					<c:if test="${region != null}">
						<span> > ${region}</span>
					</c:if>
				</div>
			
			<div id="service-main-nav">
				<select class="nav-select" id="select-region">
					<option value="0">지역선택</option>
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
				
				<div class="nav-select" id="helper-search">
					<form action="/dobby/service/list" method="get" autocomplete="off">
						<div id="textbox-wrap">
							<input type="text" name="search" id="search-textbox" placeholder="서비스를 찾아보세요">
						</div>
						<div id="search-button-wrap">
							<input type="submit" id="search-button" value="검색">
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
								<img src="/dobby/${list.profileImg}" alt=""onerror="this.src='/dobby/resources/img/dust.png';">
							</div>
							<div class="helper-contents">
								<div>
									<h2>${list.title} | ${list.helper}</h2>
									<p>${list.serviceIntro}</p>
								</div>
								<div>
									<span class="starrr">
										<c:if test="${list.reviewAvg eq 5}">★★★★★</c:if>
										<c:if test="${list.reviewAvg ge 4 && list.reviewAvg lt 5}">★★★★☆</c:if>
										<c:if test="${list.reviewAvg ge 3 && list.reviewAvg lt 4}">★★★☆☆</c:if>
										<c:if test="${list.reviewAvg ge 2 && list.reviewAvg lt 3}">★★☆☆☆</c:if>
										<c:if test="${list.reviewAvg ge 1 && list.reviewAvg lt 2}">★☆☆☆☆</c:if>
										<c:if test="${list.reviewAvg ge 0 && list.reviewAvg lt 1}">☆☆☆☆☆</c:if>
									</span> 
									<span class="star-num">
										<c:if test=""></c:if>
										<fmt:formatNumber value="${list.reviewAvg}" pattern="0.0"/>
										</span>
										<span id="review-cnt">(${list.reviewCnt})</span>
									<span class="comment">
										<c:if test="${empty list.reviewContent}">작성된 리뷰가 없습니다.</c:if>
										<c:if test="${not empty list.reviewContent}">"${list.reviewContent}"</c:if>
										</span>
								</div>
							</div>
							<div class="helper-contents2">
								<div class="favorite-btn-div">
									
								</div>
								<div class="service-pay">
									<c:if test="${list.chargeUnit eq '견적필요'}">
										견적 필요&nbsp&nbsp&nbsp<br><br>(견적 요금 10,000원)&nbsp&nbsp&nbsp
								</c:if>
									<c:if test="${list.chargeUnit ne '견적필요'}">
									${list.chargeUnit}당
									<fmt:formatNumber value="${list.charge}" pattern="#,###" />
									원&nbsp&nbsp&nbsp
								</c:if>
								</div>
							</div>
						</a>
					</div>

				</c:forEach>

				<div id="page-area">
					<ul id="page-nation">
						<li><a href="#" class="first"><<</a></li>
						<li><a href="#" class="arrow left"><</a></li>
						<li><a href="#" class="num">1</a></li>
						<li><a href="#" class="num">2</a></li>
						<li><a href="#" class="num">3</a></li>
						<li><a href="#" class="num">4</a></li>
						<li><a href="#" class="num">5</a></li>
						<li><a href="#" class="arrow right">></a></li>
						<li><a href="#" class="last">>></a></li>
					</ul>
				</div>

				
				
				<!-- <script>
					const pageNation = document.querySelector('#page-nation');
					const numArr = pageNation.querySelectorAll('.num');
					const left = pageNation.querySelector('.arrow.left');
					const right = pageNation.querySelector('.arrow.right');

					<%if(pv.getStartPage() > 1){%>
						left.href = '/dobby/service/list?pno=<%=pv.getStartPage()-1%>';
					<%}else{%>
						left.classList.add('none-select');
					<%}%>

					<%if(pv.getEndPage() != pv.getMaxPage()){%>
						right.href = '/dobby/service/list?pno=<%=pv.getEndPage()+1%>';
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
							num.href = '/dobby/service/list'+page;
						}
						num.innerHTML = page;
						page++;
					}
					
				</script> -->
			</div>
		</div>


	</main>
	<div id="main-bottom"></div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

	<script defer>
		

		$('#select-region').change(function(){
			//파라미터 들고오기
			const urlParams = new URL(location.href).searchParams;
			const name = urlParams.get('stn');
			const name2 = urlParams.get('region');
			console.log(name);

			//경우따라 파라미터 넣어주기..
			if(name == null && name2 == null){
				console.log(location.href);
				location.href = window.location +'?region='+this.value;
			}else if(name == null && name2 != null){
				location.href = window.location.pathname + '?region='+this.value;
			}else if(name != null && name2 == null){
				location.href=window.location.search + '&region='+this.value;
			}else if(name != null && name2 != null){
				location.href = window.location.pathname+'?stn='+name+'&region='+this.value;
			}
		})

		
	</script>

</body>
</html>