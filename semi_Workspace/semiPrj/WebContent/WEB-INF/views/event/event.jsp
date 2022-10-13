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

			<div id="main-page" class="invisible">
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

			<div id="difficulty-page" class="">
				<div id="eazy" class="e-btn">EAZY</div>
				<div id="normal" class="e-btn">NORMAL</div>
				<div id="hard" class="e-btn">HARD</div>
			</div>

			<div id="game-page" class="invisible">
				<div id="count-down">3</div>
			</div>
			
			<div id="history-page" class="invisible">
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