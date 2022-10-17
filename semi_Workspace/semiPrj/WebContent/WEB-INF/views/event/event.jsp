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
						<span id="get-point">10</span><span>pt</span>
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
					<div id="list-title">
						<p>NO</p>
						<p>DIFFICULTY</p>
						<p>SCORE</p>
						<p>GET POINT</p>
						<p>DATE</p>
					</div>
					<div class="history-item">
						<p>1</p>
						<p>HARD</p>
						<p>99</p>
						<p>100</p>
						<p>2022-10-13</p>
					</div>
				</div>
				<div id="history-best" class="shadow-box">
					<h2 class="flex-center">내 최고기록</h2>
					<div>
						<div>HARD</div>
						<div class="flex-center">99</div>
					</div>
				</div>
			</div>
			
			<div id="ranck-page" class="invisible">
				<div class="back-btn"><span class="material-symbols-outlined">arrow_back_ios</span></div>
				<div id="ranck-title" class="flex-center">
					<span class="material-symbols-outlined"> workspace_premium </span>
					<h1>랭킹</h1>
				</div>
				<div id="ranck-list">
					<div id="r-list-title">
						<p>NO</p>
						<p>DIFFICULTY</p>
						<p>PLAYER</p>
						<p>SCORE</p>
						<p>GET POINT</p>
						<p>DATE</p>
					</div>
					<div class="ranck-item">
						<p>1</p>
						<p>HARD</p>
						<p>이름이름</p>
						<p>99</p>
						<p>100</p>
						<p>2022-10-13</p>
					</div>
					<div class="ranck-item">
						<p>2</p>
						<p>HARD</p>
						<p>이름이름</p>
						<p>99</p>
						<p>100</p>
						<p>2022-10-13</p>
					</div>
					<div class="ranck-item">
						<p>3</p>
						<p>HARD</p>
						<p>이름이름</p>
						<p>99</p>
						<p>100</p>
						<p>2022-10-13</p>
					</div>
					<div class="ranck-item">
						<p>3</p>
						<p>HARD</p>
						<p>이름이름</p>
						<p>99</p>
						<p>100</p>
						<p>2022-10-13</p>
					</div>
				</div>
			</div>

		</div>
	</div>


	
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>