<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/payComplete.css">
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="payment-complete-wrap">
		<div id="payment-complete-text" class="row-flex justify-center">
			<ion-icon name="checkmark-outline"></ion-icon><span> &nbsp결제가 완료 되었습니다.</span>
		</div>
		<div id="reserved-service">
			<div id="reserved-service-text" class="row-flex">
				<ion-icon name="calendar-outline"></ion-icon><span>&nbsp 예약한 서비스</span></div>
			<div id="reserved-service-content">
				<div class="service-content1">
					<img src="/ryan/공통/resources/이상해씨.jpg" alt="" height="100px"
						width="100px">
				</div>
				<div class="service-content2">${rv.dName}&nbsp|&nbsp${rv.sTitle}</div>
				<div class="service-content3">
					<div id="pay-amount">
						<fmt:formatNumber value="${rv.charge}" pattern="#,###"/>원
						<br> *<c:set var= "amount" value="${rv.reservationAmount/rv.charge}"/>
						<fmt:parseNumber value="${amount}" integerOnly="true"/>
					</div>
					<div id="service-unit-text">
						(단위요금)<br> (단위)
					</div>
				</div>
				<div class="service-content4">요청사항 : ${rv.reComment}</div>
				<div class="service-content5">예약날짜 : <c:out value="${fn:substring(rv.reservationDate, 0, 10)}"></c:out></div>	
			</div>

		</div>
		<div id="payment-info">
			<div id="payment-info-text" class="row-flex"><ion-icon name="information-circle-outline"></ion-icon><span>&nbsp 결제정보</span></div>
			<div id="payment-info-number">
				<div id="payment-date-text">결제일자</div>
				<div id="payment-date">2022-10-27</div>
				<div id="payment-number-text">결제번호</div>
				<div id="payment-number">${pv.paymentNo}</div>
			</div>
			<div id="payment-info-content">
				<div id="payment-info-content1">
					<table width="100%" height="100%">
						<tr>
							<td class="payment-info-text">서비스요금</td>
							<td class="payment-info-input">(평당)<fmt:formatNumber value="${rv.charge}" pattern="#,###"/>원</td>
						</tr>
						<tr>
							<td class="payment-info-text">단위</td>
							<td class="payment-info-input">*<c:set var= "amount" value="${rv.reservationAmount/rv.charge}"/>
								<fmt:parseNumber value="${amount}" integerOnly="true"/>(단위)</td>
						</tr>
						<tr>
							<td class="payment-info-text">포인트할인</td>
							<td class="payment-info-input">-${pv.point}p</td>
						</tr>
					</table>
				</div>
				<div id="payment-info-content2">
					<table width="100%">
						<tr>
							<td colspan="2" width="200px" class="payment-info-row1">결제금액</td>
							<td class="payment-input payment-info-row1">
								<fmt:formatNumber value="${rv.reservationAmount-pv.point}" pattern="#,###"/>원
							</td>
						</tr>
						<tr>
							<td colspan="2" class="payment-input payment-info-row2">${pv.paymentType}</td>
							<td class="payment-input payment-info-row2">
								<fmt:formatNumber value="${rv.reservationAmount-pv.point}" pattern="#,###"/>원
							</td>
						</tr>
						<tr>
							<td colspan="3" class="payment-info-row3">${pv.paymentDate}</td>
						</tr>
					</table>
				</div>
				<div id="payment-info-content3">
					<table width="100%">
						<tr>
							<td class="payment-info-text">포인트 적립</td>
							<td class="payment-info-input" id="payment-info-input-point">
								+<fmt:formatNumber value="${rv.reservationAmount/10}" pattern="#,###"/>p
							</td>
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
			<button class="button" id="button2" onclick="location.href='/dobby/mypage/payhistory'">결제내역 확인</button>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>