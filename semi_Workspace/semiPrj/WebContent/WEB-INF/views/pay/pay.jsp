<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/pay.css">
<link rel="stylesheet" href="/dobby/resources/css/main.css">
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<form action="" id="wrap" method="post" onsubmit="return doPay();">
		<input type="text" value="${rv.reservation_no}" name="reservationNo"
			hidden>
		<div id="main-wrap">
			<div id="order-history-wrap">
				<div class="main-h1" id="order-history">주문내역</div>
				<div id="reservation-info">
					<div id="reserv-info-pic">
						<img src="/dobby/${rv.dProfil}" alt="" onerror="this.src='/dobby/resources/img/dust.png';">
					</div>
					<div id="reserv-info-helper">${rv.dName}</div>
					<div id="reserv-info-service">${rv.sTitle}</div>
					<div id="reserv-info-request">요청사항 : ${rv.reComment}</div>
					<div id="reserv-info-date">
						예약날짜 :
						<c:out value="${fn:substring(rv.reservationDate, 0, 16)}"></c:out>
					</div>
					<div id="reserv-info-pay">
						<fmt:formatNumber value="${rv.charge}" pattern="#,###" />
						원<br>*

						<c:if test="${rv.charge gt 0}">
							<c:set var="amount" value="${rv.reservationAmount/rv.charge}" />
							<fmt:parseNumber value="${amount}" integerOnly="true" />
						</c:if>

						<c:if test="${rv.charge eq 0}">
					견적
					</c:if>

						<fmt:parseNumber value="${amount}" integerOnly="true" />
					</div>
				</div>
				<div id="request">
					<div id="request-text">결제요청사항</div>
					<div id="request-input">
						<input name="request" type="text">
					</div>
				</div>
				<div id="order-sum">
					<div id="order-sum-text">주문합계</div>
					<div id="order-sum-input">
						<fmt:formatNumber value="${rv.reservationAmount}" pattern="#,###" />
						<c:if test="${rv.reservationAmount eq null}">
							<fmt:formatNumber value="10000" pattern="#,###" />
						</c:if>

					</div>
					<div id="won">원</div>
				</div>
			</div>
			<div id="point-discount-wrap">
				<div class="main-h1" id="point-discount">할인선택</div>
				<div id="point-discount-detail">
					<div class="inline-block" id="point-text">포인트</div>
					<div class="inline-block" id="point-div">
						<table>
							<tr>
								<td class="text-grey">사용가능 포인트</td>
								<td class="text-green">35,000p</td>
								<td id="point-input-div"><input id="use-point"
									type="number" name="point" value="0" onkeyup="checkZero()"></td>
							</tr>
						</table>
					</div>
					<div class="inline-block" id="point-btn" onclick="pointCalculate()">사용</div>
				</div>
			</div>
			<div id="select-payment-wrap">
				<div class="main-h1" id="select-payment">결제수단 선택</div>
				<div class="select-payment-div" id="payment-cash">
					<div class="select-payment-text inline-block">현금결제</div>
					<div class="inline-block payment-radio">
						<input type="radio" name="payment-method" id="payment1" value="2">
						<label for="payment1">계좌이체</label>
					</div>
				</div>
				<div class="select-payment-div" id="payment-card">
					<div class="select-payment-text inline-block">일반결제</div>
					<div class="inline-block payment-radio">
						<input type="radio" name="payment-method" id="payment2" value="1">
						<label for="payment2">신용카드</label>
					</div>
				</div>
				<div class="select-payment-div" id="payment-easy">
					<div class="select-payment-text inline-block">간편결제</div>
					<div class="inline-block payment-radio">
						<input type="radio" name="payment-method" id="payment3" value="3">
						<label for="payment3">네이버페이</label>
					</div>
					<div class="inline-block payment-radio">
						<input type="radio" name="payment-method" id="payment4" value="4">
						<label for="payment4">카카오페이</label>
					</div>
				</div>
			</div>
			<div id="notice-payment">
				<p>
					<br>- 결제 주의사항<br> <br> - 아무 하나의 경, 봅니다. 패, 위에도 마리아 별
					가을로 것은 아무 까닭입니다. <br> 이름과 언덕 무엇인지 멀리 내 이름과, 시인의 계십니다. 어머님, 잔디가
					별 아무 이웃 차 겨울이 봅니다. <br> 지나가는 써 이름과 당신은 토끼, 하나에 이 가슴속에 프랑시스
					봅니다. 못 마디씩 오는 까닭이요, 봅니다. <br> 벌써 시인의 벌레는 별 했던 너무나 듯합니다.<br>
					<br> - 잠, 묻힌 이제 비둘기, 거외다. 봄이 남은 내 아름다운 까닭입니다. 파란 봄이 벌레는 묻힌
					하늘에는 아스라히 별을 나의 써 까닭입니다. <br> 소녀들의 아스라히 겨울이 계십니다. 속의 밤이 별에도
					이름과 시인의 사랑과 다하지 하나에 까닭입니다. <br> 이웃 흙으로 못 하나에 이름을 파란 속의 계십니다.
				</p>
			</div>

		</div>
		<div id="main-side">
			<div id="side-payment-text">최종 결제금액</div>
			<div id="payment-detail">
				<table>
					<tr>
						<td class="payment-detail-text">서비스 금액</td>
						<td class="payment-detail-input">
						<c:if test="${rv.reservationAmount eq null}">
						<fmt:formatNumber value="10000" pattern="#,###" />
						</c:if>
						<fmt:formatNumber value="${rv.reservationAmount}" pattern="#,###" />
						원
						</td>
					</tr>
					<tr>
						<td class="payment-detail-text">포인트 사용</td>
						<td class="payment-detail-input text-green" id="use-point-2">0p</td>
					</tr>
				</table>
			</div>
			<div id="payment-detail2">
				<table>
					<tr>
						<td class="payment-detail-text">총 결제 금액</td>
						<td id="final-amount" class="payment-detail2-input"><fmt:formatNumber
								value="${rv.reservationAmount}" pattern="#,###" />원</td>
					</tr>
				</table>
			</div>
			<div id="payment-agree-div">
				<input type="checkbox" value="" id="payment-agree-checkbox">
				<label for="payment-agree-checkbox">주문내역을 확인했으며 결제에
					동의합니다(필수)</label>
			</div>
			<input type="submit" id="payment-btn" value="결제하기">
			<div id="cancel-btn">결제취소</div>
		</div>

	</form>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>


</body>
<script defer>

	function checkZero(){
	var use = document.querySelector('#use-point');
		if(use.value<0){
			use.value =0 ;
		}
		if(use.value>${rv.reservationAmount}){
			use.value = ${rv.reservationAmount};
		}	
	}
	

	function pointCalculate(){
		const usePoint = document.querySelector('#use-point').value;
		var usePointNumber = parseInt(usePoint);
		
		if(${rv.charge}!=null){
		document.querySelector('#use-point-2').innerText = usePointNumber.toLocaleString('ko-KR') + 'p';
		document.querySelector('#final-amount').innerText = parseInt((${rv.reservationAmount} - usePoint)).toLocaleString('ko-kr')+'원';
		}else{
			alert('견적 결제에 포인트를 사용할수 없습니다.');
		}
	}

	function doPay(){

		const methodCheck = document.querySelectorAll('input[name="payment-method"]');
		var check = 0;

		for(var i = 0; i<methodCheck.length; i++){
			if(methodCheck[i].checked==true){
				check = 1;
			}
		}
		if(check ==0){
			alert('결제수단을 선택해주세요');
			return false;
		}

		if(!document.querySelector('#payment-agree-checkbox').checked){
			alert("결제에 동의 해주세요");
			return false;
		}else{
			return true;
		}

	}


</script>
</html>