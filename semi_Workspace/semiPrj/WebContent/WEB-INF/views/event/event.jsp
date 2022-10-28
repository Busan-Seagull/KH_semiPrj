<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/event.css">
<script defer src="/dobby/resources/js/event.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	
	<div id="main-container">
		
		<div id="title">
            <span class="material-symbols-outlined"> magic_button </span>
            <p>이벤트</p>
        </div>
		<div id="game-box">

			<div id="main-page">
				<div id="game-title">
					<h1>도비를 도와줘</h1>
					<p>- H E L P D O B B Y -</p>
				</div>
				<div id="btn-box">
					<div id="start-btn" class="e-btn">게임시작</div>
					<div id="history-btn" class="e-btn">이전기록</div>
					<div id="ranck-btn" class="e-btn">최고랭킹</div>
				</div>
			</div>

			<div id="difficulty-page" class="invisible">
				<div id="easy" class="e-btn">EAZY</div>
				<div id="normal" class="e-btn">NORMAL</div>
				<div id="hard" class="e-btn">HARD</div>
			</div>

			<div id="game-page" class="invisible">
				<div id="remain-box"><span>남은먼지 : </span><span id="remain">50</span></div>
				<div id="score-box"><span>SCORE : </span><span id="score">0</span></div>
				<div id="count-down">3</div>
				<div id="cursor"></div>
			</div>
			
			<div id="end-page" class="invisible">
				<h1>나의 점수는</h1>
				<div id="my-score">0</div>
				<div class="flex-center">
					<div>
						획득 포인트 :
						<span id="get-point"></span><span>pt</span>
					</div>
					<div id="end-btn" class="btn flex-center">확인</div>
				</div>
			</div>

			<div id="history-page" class="invisible">
				<div class="back-btn"><span class="material-symbols-outlined">arrow_back_ios</span></div>
				<div id="history-title" class="flex-center">
					<span class="material-symbols-outlined">signal_cellular_alt</span>
					<h1>이전기록</h1>
				</div>
				<div id="history-list">
				</div>
				<div id="history-best" class="shadow-box">
				</div>
			</div>
			
			<div id="ranck-page" class="invisible">
				<div class="back-btn"><span class="material-symbols-outlined">arrow_back_ios</span></div>
				<div id="ranck-title" class="flex-center">
					<span class="material-symbols-outlined"> workspace_premium </span>
					<h1>랭킹</h1>
				</div>
				<div id="ranck-list">
				</div>
			</div>

		</div>
	</div>


	
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>