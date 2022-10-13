<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/event.css">
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
					<div id="start-btn" class="btn">게임시작</div>
					<div id="history-btn" class="btn">이전기록</div>
					<div id="ranck-btn" class="btn">최고랭킹</div>
				</div>
			</div>

			<div id="game-page">

			</div>
			
			<div id="history-page">
				<div id="history-title" class="flex-center">
					<span class="material-symbols-outlined">signal_cellular_alt</span>
					<h1>이전기록</h1>
				</div>
				<div id="history-list">
					<div class="history-item"></div>
				</div>
				<div id="history-best">
					<h2 class="flex-center">내 최고기록</h2>
					<div>
						<div>난이도</div>
						<div class="flex-center">99</div>
					</div>
				</div>
			</div>
			
			<div id="ranck-page">

			</div>

		</div>
	</div>


	
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>