<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/payHistory.css">
<link rel="stylesheet" href="/dobby/resources/css/main.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="pay-history-wrap">

		<div id="pay-history-title">
			<h1>결제 내역</h1>
		</div>

		<div class="pay-history-list">
			<div class="pay-month">
				<h2>2022.10</h2>
			</div>
			<div class="service-list-outline">
				<div class="service-profile">
					<div class="helper-pic">
						<img src="/dobby/resources/img/dust.png" alt="">
					</div>
					<div class="helper-contents">
						<div class="content-div1">
							<h1>전기 고치는 집요정</h1>
							<button onclick="location.href='/dobby/mypage/payinfo'">결제 상세 정보 ></button>
						</div>
						<div class="content-div2">
							<h2>128,000원</h2>
							<br> <span>결제번호 20221008123</span> <span>결제일자
								2022.10.10</span>
						</div>
					</div>
					<div class="history-btns-div">
						<div class="btn-div">
							<button>리뷰쓰기</button>
						</div>
						<div class="btn-div">
							<button>결제취소</button>
						</div>
					</div>
				</div>
			</div>
			<div class="pay-month">
				<h2>2022.08</h2>
			</div>
			<div class="service-list-outline">
				<div class="service-profile">
					<div class="helper-pic">
						<img src="/dobby/resources/img/dust.png" alt="">
					</div>
					<div class="helper-contents">
						<div class="content-div1">
							<h1>전기 고치는 집요정</h1>
							<button>결제 상세 정보 ></button>
						</div>
						<div class="content-div2">
							<h2>94,000원</h2>
							<br> <span>결제번호 20221008123</span> <span>결제일자
								2022.08.30</span>
						</div>
					</div>
					<div class="history-btns-div">
						<div class="btn-div">
							<button>리뷰쓰기</button>
						</div>
						<div class="btn-div">
							<button>결제취소</button>
						</div>
					</div>
				</div>
			</div>
			<div class="service-list-outline">
				<div class="service-profile">
					<div class="helper-pic">
						<img src="/dobby/resources/img/dust.png" alt="">
					</div>
					<div class="helper-contents">
						<div class="content-div1">
							<h1>수도 고치는 집요정</h1>
							<button>결제 상세 정보 ></button>
						</div>
						<div class="content-div2">
							<h2>620,000원</h2>
							<br> <span>결제번호 20221008123</span> <span>결제일자
								2022.08.10</span>
						</div>
					</div>
					<div class="history-btns-div">
						<div class="btn-div">
							<button>리뷰쓰기</button>
						</div>
						<div class="btn-div">
							<button>결제취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>


</body>
</html>