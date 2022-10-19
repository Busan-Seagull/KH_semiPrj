<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/reservation.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div id="r-main-container">
		<div id="r-title">
			<span class="material-symbols-outlined"> magic_button </span>
			<p>예약하기</p>
		</div>
		<div id="r-success-container" class="border-g">
			<div id="rs-title" class="flex-center">
				<span class="material-symbols-outlined"> done </span>
				<h1>예약이 완료되었습니다!</h1>
			</div>
			<div id="rs-service" class="flex-center">
				<div id="rs-s-img"></div>
				<div id="rs-s-info" class="flex-col">
					<div id="rs-si-title"><h1>${sv.title}</h1></div>
					<div id="rs-si-dobby">${sv.helperNo}</div>
					<div id="rs-si-r-date"><span>예약날짜 : </span>${rv.reservationDate}</div>
					<div id="rs-si-coment"><span>요구사항 : </span>${rv.comment}</div>
				</div>
			</div>
			<div id="rs-sub-container">
				<div id="rs-sc-pay-info" class="flex-center grid-c23 grid-r12">
					<p>${rv.reservationAmount/sv.charge}</p>
					<p>(${sv.chargeUnit})</p>
					<p>&nbsp;X&nbsp;</p>
					<p><fmt:formatNumber value="${sv.charge}" pattern="#,###"/>&nbsp;원</p>
				</div>
				<hr class="grid-c13 grid-r23">
				<h1 class="grid-c12 grid-r34">결제 예정 금액 :</h1>
				<h1 class="flex-center grid-c23 grid-r34">
					<p><fmt:formatNumber value="${rv.reservationAmount}" pattern="#,###"/></p>
					&nbsp;원
				</h1>
				<div id="rs-sc-notice" class="flex-col grid-c12 grid-r45">
					<span class="material-symbols-outlined"> priority_high </span>
					<p>담당 집요정이 예약을 확인한 후 예약승인이 이루어 집니다.</p>
					<p>예약 승인 이후 결제가 진행되어야 예약이 완료됩니다.</p>
				</div>
				<a href="" class="grid-c23 grid-r45 btn shadow-box flex-center">확인</a>
			</div> 
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>