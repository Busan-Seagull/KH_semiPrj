<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet" href="/dobby/resources/css/myService.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="myservice-wrap">
		<div id="myservice-title">
			<h1>내 서비스</h1>
		</div>

		<div class="helper-list-flex">
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
						<div id="btn1">
							<button>수정하기</button>
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
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>