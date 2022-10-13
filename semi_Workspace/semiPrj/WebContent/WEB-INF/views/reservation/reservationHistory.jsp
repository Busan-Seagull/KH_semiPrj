<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/reservationHistory.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div id="rh-contain">
		<div id="rh-aside"></div>
		<div id="rh-main" class="shadow-box">
			<div id="rh-main-header">
				<div id="r-title">
					<span class="material-symbols-outlined"> magic_button </span>
					<p>예약하기</p>
				</div>
				<select name="" id="">
					<option value=""></option>
					<option value=""></option>
					<option value=""></option>
					<option value=""></option>
				</select>
			</div>
			<div id="rh-main-list">
				<div class="rh-item">
					<div class="rh-i-header">
						<div style="line-height:200%;">
							<h1>title이 길 수 있잖아</h1>
							<p>집요정이름</p>
						</div>
						<div></div>
						<div style="line-height:170%;">
							<p>예약날짜 : <span>2022-05-05</span></p>
							<p>견적날짜 : <span>2022-05-05</span></p>
						</div>
						<div class="btn-list">
							<div class="rh-i-h-btn">신고하기</div>
							<div class="rh-i-h-btn">문의하기</div>
							<div class="rh-i-h-btn">리뷰하기</div>
						</div>
					</div>
					<div class="rh-i-status-text">
						<p>서비스신청</p>
						<p>견적대기</p><!--견적승인대기 견적승인 견적반려 -->
						<p>예약대기</p><!--예약승인대기 예약승인 예약반려 -->
						<p>결제대기</p><!--결제대기 결제완료 -->
						<p></p><!--서비스예정 서비스완료 -->
					</div>
					<div class="rh-i-status">
						<div class="pointer"></div>
						<div class="line"></div>
						<div class="pointer stay"></div>
						<div class="line none"></div>
						<div class="pointer none"></div>
						<div class="line"></div>
						<div class="pointer"></div>
						<div class="line"></div>
						<div class="pointer"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>