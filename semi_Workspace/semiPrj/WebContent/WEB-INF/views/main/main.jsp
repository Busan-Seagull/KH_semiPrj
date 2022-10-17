<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<a href="" class="baner-item">1</a>
			<a href="" class="baner-item">2</a>
			<a href="" class="baner-item">3</a>
			<a href="" class="baner-item">4</a>
		</div>
	</div>
	<div id="main-search-box">
		<form action="" class="flex-center">
			<input type="text" name="search" placeholder="검색어를 입력하세요"><input type="submit" value="">
		</form>
	</div>
	<main>
		<div id="main-category">
			<a href="" class="category-item" style="z-index: 10;">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">styler</span>
				</div>
				<p>가사도우미</p>
			</a>
			<a href="" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">local_shipping</span>
				</div>
				<p>이사</p>
			</a>
			<a href="" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">scene</span>
				</div>
				<p>인테리어</p>
			</a>
			<a href="" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">shower</span>
				</div>
					<p>전기/수도/가스</p>
			</a>
			<a href="" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">kitchen</span>
				</div>
				<p>가전설치</p>
			</a>
			<a href="" class="category-item">
				<div class="category-box flex-center shadow-box">
					<span class="material-symbols-outlined">potted_plant</span>
				</div>
				<p>펫/식물</p>
			</a>
		</div>

		<!-- 일반회원/집요정 -->
		<!-- <div id="switching-sub">
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
			<div id="switch-service-list" class="flex-center" style="left: 0;">

				<a href="" class="service-list-item shadow-box">
					<div class="sl-item-img"></div>
					<div class="sl-item-like"><label><input type="checkbox"><span class="material-symbols-outlined">favorite</span> </label></div>
					<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
					<div class="sl-item-title">title</div>
					<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
				</a>
				<a href="" class="service-list-item shadow-box">
					<div class="sl-item-img"></div>
					<div class="sl-item-like"><label><input type="checkbox"><span class="material-symbols-outlined">favorite</span> </label></div>
					<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
					<div class="sl-item-title">title</div>
					<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
				</a>
				<a href="" class="service-list-item shadow-box">
					<div class="sl-item-img"></div>
					<div class="sl-item-like"><label><input type="checkbox"><span class="material-symbols-outlined">favorite</span> </label></div>
					<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
					<div class="sl-item-title">title</div>
					<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
				</a>
				<a href="" class="service-list-item shadow-box">
					<div class="sl-item-img"></div>
					<div class="sl-item-like"><label><input type="checkbox"><span class="material-symbols-outlined">favorite</span> </label></div>
					<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
					<div class="sl-item-title">title</div>
					<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
				</a>
				<a href="" class="service-list-item shadow-box">
					<div class="sl-item-img"></div>
					<div class="sl-item-like"><label><input type="checkbox"><span class="material-symbols-outlined">favorite</span> </label></div>
					<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
					<div class="sl-item-title">title</div>
					<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
				</a>
				<a href="" class="service-list-item shadow-box">
					<div class="sl-item-img"></div>
					<div class="sl-item-like"><label><input type="checkbox"><span class="material-symbols-outlined">favorite</span> </label></div>
					<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
					<div class="sl-item-title">title</div>
					<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
				</a>
			</div>
		</div> -->

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
					<a href="" class="item flex-center shadow-box">
						<div class="item-img"></div>
						<div class="text-contain">
							<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
							<div class="item-title">title</div>
							<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
						</div>
					</a>
					<a href="" class="item flex-center shadow-box">
						<div class="item-img"></div>
						<div class="text-contain">
							<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
							<div class="item-title">title</div>
							<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
						</div>
					</a>
					<a href="" class="item flex-center shadow-box">
						<div class="item-img"></div>
						<div class="text-contain">
							<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
							<div class="item-title">title</div>
							<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
						</div>
					</a>
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
					<a href="" class="item flex-center shadow-box">
						<div class="item-img"></div>
						<div class="text-contain">
							<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
							<div class="item-title">title</div>
							<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
						</div>
					</a>
					<a href="" class="item flex-center shadow-box">
						<div class="item-img"></div>
						<div class="text-contain">
							<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
							<div class="item-title">title</div>
							<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
						</div>
					</a>
					<a href="" class="item flex-center shadow-box">
						<div class="item-img"></div>
						<div class="text-contain">
							<div class="item-grade flex-center"><span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">grade</span><p>5.0</p></div>
							<div class="item-title">title</div>
							<div class="item-review flex-center"><p>리뷰</p><p>123</p></div>
						</div>
					</a>
				</div>
			</div>
		</div>

		<div id="community">
			<div class="contain-header flex-center">
				<div class="flex-center">
					<span class="material-symbols-outlined">magic_button</span>
					<p>커뮤니티</p>
				</div>
				<a href="" class="flex-center">
					<span style="font-size: 15px;">더보기</span>
					<span class="material-symbols-outlined">chevron_right</span>
				</a>
			</div>
			<div id="comuunity-contain">
				<table>
					<tr id="table-header">
						<th class="t-1">비고</th>
						<th class="t-2">제목</th>
						<th class="t-3">작성자</th>
						<th class="t-4">조회수</th>
					</tr>
					<tr class="notice">
						<td class="t-1">공지</td>
						<td class="t-2">제목</td>
						<td class="t-3">작성자</td>
						<td class="t-4">조회수</td>
					</tr>
					<tr>
						<td class="t-1">비고</td>
						<td class="t-2">제목</td>
						<td class="t-3">작성자</td>
						<td class="t-4">조회수</td>
					</tr>
					<tr>
						<td class="t-1">비고</td>
						<td class="t-2">제목</td>
						<td class="t-3">작성자</td>
						<td class="t-4">조회수</td>
					</tr>
					<tr>
						<td class="t-1">비고</td>
						<td class="t-2">제목</td>
						<td class="t-3">작성자</td>
						<td class="t-4">조회수</td>
					</tr>
					<tr>
						<td class="t-1">비고</td>
						<td class="t-2">제목</td>
						<td class="t-3">작성자</td>
						<td class="t-4">조회수</td>
					</tr>
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
			<a href="" class="flex-center"><p>시작하기</p></a>
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