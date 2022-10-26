<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/payComplete.css">
<link rel="stylesheet" href="/dobby/resources/css/main.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="payment-complete-wrap">
		<div id="payment-complete-text">
			<img src="/ryan/공통/resources/이상해씨.jpg" width="50px"
				height="50px"> 결제가 완료 되었습니다.
		</div>
		<div id="reserved-service">
			<div id="reserved-service-text">예약한 서비스</div>
			<div id="reserved-service-content">
				<div class="service-content1">
					<img src="/ryan/공통/resources/이상해씨.jpg" alt="" height="100px"
						width="100px">
				</div>
				<div class="service-content2">집고치는 집요정 | 집요정</div>
				<div class="service-content3">
					<div id="pay-amount">
						15,000원<br> *20
					</div>
					<div id="service-unit-text">
						(단위요금)<br> (단위)
					</div>
				</div>
				<div class="service-content4">요청사항 : 잘좀 해주세요 ~</div>
				<div class="service-content5">예약날짜 : 2022/10/10</div>
			</div>

		</div>
		<div id="payment-info">
			<div id="payment-info-text">결제정보</div>
			<div id="payment-info-number">
				<div id="payment-date-text">결제일자</div>
				<div id="payment-date">2022.10.10</div>
				<div id="payment-number-text">결제번호</div>
				<div id="payment-number">20221010</div>
			</div>
			<div id="payment-info-content">
				<div id="payment-info-content1">
					<table width="100%" height="100%">
						<tr>
							<td class="payment-info-text">결제일자</td>
							<td class="payment-info-input">(평당)15,000원</td>
						</tr>
						<tr>
							<td class="payment-info-text">단위</td>
							<td class="payment-info-input">*20(평)</td>
						</tr>
						<tr>
							<td class="payment-info-text">포인트할인</td>
							<td class="payment-info-input">-12,000원</td>
						</tr>
					</table>
				</div>
				<div id="payment-info-content2">
					<table width="100%">
						<tr>
							<td colspan="2" width="200px" class="payment-info-row1">결제금액</td>
							<td class="payment-input payment-info-row1">363,000원</td>
						</tr>
						<tr>
							<td colspan="2" class="payment-input payment-info-row2">네이버페이</td>
							<td class="payment-input payment-info-row2">363,000원</td>
						</tr>
						<tr>
							<td colspan="3" class="payment-info-row3">2022.08.25 02:38</td>
						</tr>
					</table>
				</div>
				<div id="payment-info-content3">
					<table width="100%">
						<tr>
							<td class="payment-info-text">포인트 적립</td>
							<td class="payment-info-input" id="payment-info-input-point">+30,000p</td>
						</tr>
						<tr>
							<td colspan="2" id="payment-info-detail">서비스요금의 10%가 적립 됩니다.</td>
						</tr>
					</table>
				</div>
			</div>

		</div>
		<div id="button-wrap">
			<button class="button" id="button1" onclick="location.href='/dobby'">홈으로 가기</button>
			<button class="button" id="button2" onclick="location.href='/dobby/mypage/history'">결제내역 확인</button>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>