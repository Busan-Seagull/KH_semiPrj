<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집요정</title>
<style>
	#main-baner-box{
		height: 400px;
		overflow: hidden;
	}

	#main-baner{
		position: relative;
		height: 100%;
		display: flex;
		transition: 0.7s;
	}

	#baner-back-btn, #baner-next-btn{
		display: flex;
		align-items: center;
		justify-content: center;
		z-index: 2;
		position: absolute;
		width: 100px;
		height: 400px;
		cursor: pointer;
	}

	#baner-back-btn span, #baner-next-btn span{
		font-size: 80px;
	}

	#baner-next-btn{
		right: 0;
	}

	#baner-back-btn:hover, #baner-next-btn:hover{
		background-color: rgba(255, 255, 255, 0.2);
	}

	#main-baner-box a{
		/* position: absolute; */
		flex-shrink: 0;
		height: 400px;
		width: 100vW;
		
		/* 백그라운드이미지 각각 개별로 */
		background: url(/dobby/resources/img/baner/메인배너_01.jfif);

		/* 아래는 임시 설정 */
		background-position: center center;
		background-size: 100%;
	}

	#main-search-box{
		background-color: var(--semi-green);
		position: absolute;
		height: 70px;
		top: 570px;
		width: 680px;
		left: 50%;
		transform: translateX(-50%);
		display: flex;
		align-items: center;
		justify-content: flex-start;

		border-radius: 10px;
	}

	#main-search-box input[type=text]{
		font-family: var(--sans);
		font-size: 15px;
		width: 580px;
		height: 40px;
		margin: 5px;
		padding: 10px;
		border: none;
		border-radius: 10px;
	}

	#main-search-box input[type=submit]{
		border: none;
		margin-left: 5px;
		width: 50px;
		height: 50px;
		background: url(/dobby/resources/img/검색.png);
	}

	main{
		display: flex;
		flex-direction: column;
		width: 1200px;
		margin: auto;
	}

	#main-category{
		gap: 30px;
		display: flex;
		align-items: center;
		justify-content: center;
		height: 350px;
	}

	.category-box{
		width: 100px;
		height: 100px;
		border-radius: 10px;
	}

	.category-box span{
		font-size: 5.5em;
	}

	.category-box:hover, .category-box:hover span{
		background-color: var(--semi-green);
		color: white;
	}

	.category-item{
		font-size: 0.7em;
		gap: 10px;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	#switching-sub{
		margin: 10px 0;
		display: flex;
		flex-direction: column;
		justify-content: flex-end;
		overflow: hidden;
		height: 300px;
	}

	.contain-header.flex-center{
		justify-content: space-between;
		font-size: 20px;
		font-weight: 600;

		font-family: var(--serif);
		margin: 5px;
	}

	.contain-header span{
		color: var(--semi-green);
		margin-right: 5px;
	}

	#switch-service-list{
		position: relative;
		transition: 1s;
		justify-content: flex-start;
		display: flex;
	}

	.service-list-item{
		flex-shrink: 0;
		position: relative;
		display: flex;
		flex-direction: column;
		align-items: flex-end;
		justify-content: space-evenly;
		width: 200px;
		height: 230px;
		padding: 15px;
		border-radius: 10px;
		margin: 5px;
	}

	.sl-item-img{
		width: 100%;
		height: 60%;
		background-color: gray;
	}

	.sl-item-like{
		position: absolute;
		top: 5px;
		right: 5px;
		width: 50px;
		height: 50px;
	}

	.sl-item-like input[type=checkbox]{
		display: none;
	}

	.sl-item-like label{
		width: 50px;
		height: 50px;
	}


	.sl-item-like span{
		color: lightgray;
		font-size: 50px;
		font-variation-settings: 'FILL' 1;
		-webkit-text-stroke: 4px rgb(255, 255, 255);
	}

	.sl-item-like label input[type=checkbox]:checked ~ span{
		color: red;
		-webkit-text-stroke: 4px rgb(255, 255, 255);
	}

	.item-grade, .item-grade span{
		font-size: 15px;
	}

	.item-grade span{
		color: gold;
	}

	.sl-item-title{
		width: 100%;
		text-align: center;
		font-size: 2em;
		font-weight: 600;
	}
	
	.item-review{
		gap: 3px;
		font-size: 15px;
	}

	#popularity{
		margin: 10px 0;
		display: flex;
		height: 350px;
	}

	#popularity > div{
		width: 50%;
		overflow: hidden;
	}

	#pd-contain, #ps-contain{
		position: relative;
		transition: 1s;
		height: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 10px 0;
		flex-wrap: wrap;
		
	}

	.item.flex-center{
		flex-shrink: 0;
		width: 90%;
		height: 100px;
		justify-content: space-between;
		padding: 20px;
		margin: 5px 10px;
	}

	.item-img{
		width: 30%;
		height: 100%;
		background-color: gray;
	}
	
	.item-title{
		font-size: 40px;
		font-weight: 600;
	}

	.text-contain{
		display: flex;
		flex-direction: column;
		gap: 15px;
		align-items: flex-end;
	}

	#community{
		height: 350px;
		margin: 10px 0;
	}

	#comuunity-contain {
		padding: 10px;
	}

	#comuunity-contain table{
		width: 100%;
		border-bottom: 2px solid var(--semi-green);
	}

	#table-header{
		font-family: var(--serif);
		color: var(--semi-green);
		font-weight: 900;
		border-bottom: 2px solid var(--semi-green);
	}

	#comuunity-contain table tr:not(#table-header){
		border-bottom: 1px solid lightgray;
		cursor: pointer;
	}

	#comuunity-contain table *{
		padding: 15px
	}

	#comuunity-contain table .t-1{
		text-align: center;
		width: 10%;
	}

	#comuunity-contain table .notice .t-1{
		color: white;
		background-color: var(--semi-green);
		font-size: 1.5em;
		border-radius: 40px;
		transform: scale(60%);
	}

	#comuunity-contain table .notice .t-2{
		color: var(--semi-green);
		font-weight: 600;
	}

	#comuunity-contain table .t-2{
		width: 60%;
	}

	#comuunity-contain table .t-3{
		text-align: center;
		width: 20%;
	}

	#comuunity-contain table .t-4{
		text-align: center;
		width: 10%;
	}

	#main-bottom{
		display: flex;
		justify-content: space-between;
		align-items: center;
		height: 500px;
		position: relative;
		background: linear-gradient(to top, var(--semi-ivory), white);
		padding: 200px;
		gap: 20px;
	}

	#main-bottom a{
		width: 200px;
		height: 100px;
		border-radius: 10px;
		font-size: 2em;
		font-family: var(--ghana);
		color: var(--semi-green);
		border: 1px solid var(--semi-green);
		margin: 10px;
		margin-right: 30px;
	}

	#main-bottom a:hover{
		background-color: var(--semi-green);
		color: white;
		border: 1px solid var(--semi-green);
	}

	#main-bottom a:hover + span > .dust:nth-of-type(1){
		animation: jump;
		animation-duration: 0.2s;
		animation-iteration-count: infinite;
		animation-direction: alternate;
	}

	#main-bottom a:hover + span > .dust:nth-of-type(2){
		animation: jump;
		animation-duration: 0.2s;
		animation-iteration-count: infinite;
		animation-direction: alternate;
		animation-delay: 0.2s;
	}

	#main-bottom a:hover + span > #tool-img{
		animation: jump;
		animation-duration: 0.2s;
		animation-iteration-count: infinite;
		animation-direction: alternate;
		animation-delay: 0.3s;
	}

	@keyframes jump{
		0%{}
		100%{
			top: 0;
		}
	}

	.dust{
		position: relative;
		left: 15px;
		top: 17px;
		width: 60px;
		height: 60px;
		background: url(/dobby/resources/img/dust.png);
		background-size: cover;
	}

	#tool-img{
		position: relative;
		left: 15px;
		top: 23px;
		width: 40px;
		height: 40px;
		background: url(/dobby/resources/img/청소도구.png);
		background-size: cover;
	}

	#bottom-contain{
		display: flex;
		flex-direction: column-reverse;
		align-items: flex-start;
	}

	#main-bottom > div > p{
		position: relative;
		margin: 30px;
		font-family: var(--serif);
		font-weight: 100;
		font-size: 3em;
		color: rgba(0, 0, 0, 0.9);
	}

	#main-bottom > div > p > strong{
		font-family: var(--ghana);
		color: var(--semi-green)
	}

</style>
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
		<style>
			#not-login-contain{
				left: 0;
				position: absolute;
				height: 200px;
				width: 100vw;
				background-color: var(--semi-green);
				padding: 50px;
			}

			#not-login-contain p{
				font-family: var(--ghana);
				color: white;
				font-size: 2em;
			}
		</style>
		<div id="switching-sub">
			<div id="not-login-contain">
				<p>아직 저희 집요정의 회원이 아니시군요!</p> 
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

<script defer>
	const back = document.querySelector('#baner-back-btn');
	const next = document.querySelector('#baner-next-btn');
	const baner = document.querySelector("#main-baner");
	let items = document.querySelectorAll('.baner-item');
	let size = items.length;
	
	let banerPage = 0;

	back.addEventListener('click', function(){
		if(banerPage>0){
			banerPage--;
			baner.style.left = -(banerPage * 100) +'vw';
		}
	});

	next.addEventListener('click', function(){
		if(banerPage<size-1){
			banerPage++;
			baner.style.left = -(banerPage * 100) +'vw';
		}
	});

	setInterval(() => {
		if(banerPage<size-1){
			banerPage++;
			baner.style.left = -(banerPage * 100) +'vw';
		}else{
			banerPage = 0;
			baner.style.left = -(banerPage * 100) +'vw';
		}
	}, 4000);

	const slNext = document.querySelector('#sl-next-btn');
	const slBack = document.querySelector('#sl-back-btn');
	const serviceContain = document.querySelector('#switch-service-list');
	let slItems = document.querySelectorAll('.service-list-item');

	let slSize = slItems.length/5;
	
	let slPage = 0;

	if(slBack!=null){
		slBack.addEventListener('click', function(){
			if(slPage>0){
				slPage--;
				serviceContain.style.left = -(slPage * 100) +'%';
			}
		});
	}

	if(slNext!=null){
		slNext.addEventListener('click', function(){
			if(slPage<slSize-1){
				slPage++;
				serviceContain.style.left = -(slPage * 100) +'%';
			}
		});
	}

	const pdNext = document.querySelector('#pd-next');
	const pdBack = document.querySelector('#pd-back');
	const pdContain = document.querySelector('#pd-contain');
	let pdItems = pdContain.querySelectorAll('.item');
	
	let pdSize = pdItems.length/2;

	let pdPage = 0;

	pdBack.addEventListener('click', function(){
		if(pdPage>0){
			pdPage--;
			pdContain.style.left = -(pdPage * 100) +'%';
		}
	});

	pdNext.addEventListener('click', function(){
		if(pdPage<pdSize-1){
			pdPage++;
			pdContain.style.left = -(pdPage * 100) +'%';
		}
	});

	const psNext = document.querySelector('#ps-next');
	const psBack = document.querySelector('#ps-back');
	const psContain = document.querySelector('#ps-contain');
	let psItems = psContain.querySelectorAll('.item');
	
	let psSize = psItems.length/2;

	let psPage = 0;

	psBack.addEventListener('click', function(){
		if(psPage>0){
			psPage--;
			psContain.style.left = -(psPage * 100) +'%';
		}
	});

	psNext.addEventListener('click', function(){
		if(psPage<psSize-1){
			psPage++;
			psContain.style.left = -(psPage * 100) +'%';
		}
	});
</script>
</html>