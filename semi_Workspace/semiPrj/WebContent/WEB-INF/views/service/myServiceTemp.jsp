<%@page import="com.kh.dobby.service.vo.ServiceVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet" href="/dobby/resources/css/myService.css">

<%
String root = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#mypage {
	width: 1200px;
	height: 80vh;
	/* border: 1px solid red; */
	display: grid;
	grid-template-columns: 275px 915px;
	column-gap: 10px;
	margin: 50px auto 0;
}

#profile-area {
	width: 100%;
	height: 100%;
	display: grid;
	grid-template-rows: repeat(16, 1fr);
	border: 1px solid #999999;
	border-radius: 10px;
}

#profile-area div {
	display: flex;
	/* border: 1px solid red; */
	justify-content: left;
	align-items: center;
	text-align: left;
	color: var(- -semi-green);
	font-family: var(- -sans);
	font-size: 14px;
	padding-left: 70px;
}

#profile-area div:not(#profile, #profile>div, #bin, #welcome):hover {
	background-color: rgb(215, 237, 202);
}

/* 선택된 페이지의 사이드바 버튼 스타일 */
.checked {
	background-color: rgb(215, 237, 202);
}

#profile-area div span {
	margin-right: 20px;
	font-weight: 400;
}

#profile {
	width: 200px;
	grid-row: span 4;
	display: flex;
	position: relative;
	box-sizing: border-box;
}

#profile div {
	width: 200px;
	padding: 0;
}

#profile #welcome {
	position: absolute;
	top: 120px;
}

#profile #logo {
	display: block;
	width: 80px;
	position: absolute;
	margin: auto;
	right: 24px;
	top: 35px;
}

#bin {
	grid-row: span 2;
}

.info-area {
	width: 100%;
	height: 100%;
	border: 1px solid #999999;
	border-radius: 10px;
	display: flex;
	margin: auto;
	justify-content: center;
	align-items: center;
	/* position: absolute; */
}

#join-area {
	display: grid;
	grid-template-rows: repeat(14, 45px);
	grid-template-columns: 2fr 4fr;
	margin-top: 20px;
}

#join-title, #right {
	grid-column: span 2;
	display: flex;
	margin: auto;
	justify-content: center;
}

#join-title {
	font-family: var(- -sans);
	font-weight: 500;
	color: var(- -semi-green);
	font-size: 16pt;
}

#join-title span {
	margin-right: 10px;
}

#right {
	width: 100%;
	height: 50%;
	font-family: var(- -sans);
	font-size: 10pt;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	border-top: 1px solid var(- -semi-green);
	border-bottom: 1px solid var(- -semi-green);
	padding: 2px 0;
	gap: 50px;
	margin-bottom: 20px;
}

.text {
	width: 140px;
	text-align: right;
	margin-right: 10px;
	color: var(- -semi-green);
}

input[type=text], input[type=password] {
	width: 120px;
	height: 20px;
	border: 0.75px solid #DEDEDE;
}

select {
	width: 100px;
	height: 24px;
	border: 0.75px solid #DEDEDE;
}

input[type=button] {
	width: 100px;
	height: 24px;
	border: 0.75px solid var(- -semi-green);
	background-color: white;
	color: var(- -semi-green);
}

input[type=submit] {
	width: 100px;
	height: 24px;
	border: 0.75px solid #DEDEDE;
	background-color: var(- -semi-green);
	color: white;
	margin: 10px;
}

#sub-btn {
	grid-column: span 2;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: auto;
	margin: 10px;
}

#info-area02, #info-area03, #info-area04, #info-area05, #info-area06,
	#info-area07, #info-area08, #info-area09 {
	display: none;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<%@include file="/WEB-INF/views/common/side.jsp"%>
	<div id="mypage">
		<div id="profile-area">
			<div id=profile>
				<div>
					<img src="/dobby/resources/img/dust.png" alt="" id="logo">
				</div>

				<div id="welcome">USER01 님 환영합니다</div>
			</div>

			<div id="userEdit" class="page-btn">
				<span class="material-symbols-outlined">settings</span>내 정보 수정
			</div>

			<!-- 집요정 부분 하나 추가 -->
			<div class="page-btn">
				<span class="material-symbols-outlined">list</span>등록한서비스
			</div>

			<div class="page-btn">
				<span class="material-symbols-outlined">list</span>예약 내역
			</div>
			<div class="page-btn">
				<span class="material-symbols-outlined"> credit_card </span>결제 내역
			</div>

			<!-- 아래 두개는 집요정일 시 안보임 -->
			<div class="page-btn">
				<span class="material-symbols-outlined">
					control_point_duplicate </span>보유 포인트
			</div>
			<div class="page-btn">
				<span class="material-symbols-outlined"> favorite </span>찜한 서비스
			</div>

			<div class="page-btn">
				<span class="material-symbols-outlined"> edit_square </span>작성한 게시물
			</div>
			<div class="page-btn">
				<span class="material-symbols-outlined"> forum </span>문의 내역
			</div>
			<div class="page-btn">
				<span class="material-symbols-outlined"> report </span>신고 내역
			</div>
			<div id="bin"></div>
			<div>
				<span class="material-symbols-outlined"> delete_forever </span>탈퇴하기
			</div>


		</div>

		<div class="info-area" id="info-area01">

			<div id="myservice-wrap">
				<div id="myservice-title">
					<h1>내 서비스</h1>
				</div>

				<div class="helper-list-flex">
					<c:forEach var="list" items="${myService}">
						<div class="helper-list-outline">
							<a class="helper-list"
							onclick="location.href='<%=root %>/service/detail?sno=${list.serviceNo}'">
								<div class="helper-pic">
									<img src="/dobby/${list.profileImg}" alt="">
								</div>
								<div class="helper-contents">
									<div>
										<h2>${list.title} | ${list.helper}</h2>
										<p>
											${list.serviceIntro}
										</p>
									</div>
									<div>
										<span class="starrr">★★★★★</span> <span class="star-num">5</span>
										<span class="comment">"이 집 청소 잘하네요~"</span>
									</div>
								</div>
								<div class="helper-contents2">
									<div id="btn1">
										<button onclick="loction.href='/dobby/service/modify?sno=${list.serviceNo}'">수정하기</button>
									</div>
									<div id="btn2">
										<button>삭제하기</button>
									</div>
									<div id="btn3">
										<button>리뷰보기</button>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
					<!-- 임시 서비스 프로필 -->
					<div class="helper-list-outline">
						<div class="helper-list">
							<div class="helper-pic">
								<img src="/dobby/resources/img/dust.png" alt="">
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
								<div id="btn1">
									<button onclick="loction.href='/dobby/service/modify?sno=${list.serviceNo}'">수정하기</button>
								</div>
								<div id="btn2">
									<button>삭제하기</button>
								</div>
								<div id="btn3">
									<button>리뷰보기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="info-area" id="info-area02">2</div>

		<div class="info-area" id="info-area03">3</div>

		<div class="info-area" id="info-area04">4</div>

		<div class="info-area" id="info-area05">5</div>

		<div class="info-area" id="info-area06">6</div>

		<div class="info-area" id="info-area07">7</div>

		<div class="info-area" id="info-area08">8</div>

		<div class="info-area" id="info-area09">9</div>

	</div>


	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>

<script>
    const btnArr = document.querySelectorAll('.page-btn');
    const infoArr = document.querySelectorAll('.info-area');

    for (let i = 0; i < btnArr.length; i++) {
        const element = btnArr[i];

        element.addEventListener('click',function(){

            btnArr.forEach(e => {
                e.classList.remove('checked');
            });

            element.classList.add('checked');

            infoArr[i].style.display = 'flex';

            for (let j = 0; j < infoArr.length; j++) {
                const element = infoArr[j];

                if(i!=j){
                    element.style.display = 'none';
                }
                
            }
        });
        
    }

    const area01 = document.querySelector('#info-area01');
    const area02 = document.querySelector('#info-area02');
    const area03 = document.querySelector('#info-area03');
    const area04 = document.querySelector('#info-area04');
    const area05 = document.querySelector('#info-area05');
    const area06 = document.querySelector('#info-area06');
    const area07 = document.querySelector('#info-area07');
    const area08 = document.querySelector('#info-area08');
    const area09 = document.querySelector('#info-area09');


</script>

</html>