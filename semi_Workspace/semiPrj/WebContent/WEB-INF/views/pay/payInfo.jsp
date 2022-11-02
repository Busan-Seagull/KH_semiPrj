<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/payInfo.css">
<link rel="stylesheet" href="/dobby/resources/css/main.css">
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div id="paymen-detail-wrap">
        <div id="payment-info">
            <div id="payment-info-text">결제정보</div>
            <div class="button">
                <button onclick="location.href='/dobby/member/mypage'" id="list-button">결제내역 목록</button>
            </div>
            <div class="button">
                <button id="cancel-button">결제취소</button>
            </div>
            <div id="payment-info-number">
                <div id="payment-date-text">결제일자</div>
                <div id="payment-date"><c:out value="${fn:substring(cpv.paymentDate, 0, 10)}"></c:out></div>
                <div id="payment-number-text">결제번호</div>
                <div id="payment-number">${cpv.paymentNo}</div>
            </div>
            <div id="payment-info-content">
                <div id="payment-info-content1">
                    <table width="100%" height="100%">
                        <tr>
                            <td class="payment-info-text">서비스요금</td>
                            <td class="payment-info-input">(단위 당)<fmt:formatNumber value="${crv.charge}" pattern="#,###"/></td>
                        </tr>
                        <tr>
                            <td class="payment-info-text">단위</td>
                            <td class="payment-info-input">*
                                <c:if test="${crv.reservationAmount == null}">
								견적 서비스
							</c:if>
								<c:if test="${crv.reservationAmount != null}">
								<c:set var= "amount" value="${crv.reservationAmount/crv.charge}"/>
								<fmt:parseNumber value="${amount}" integerOnly="true"/>(단위)</td>
                            </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td class="payment-info-text">포인트할인</td>
                            <td class="payment-info-input">-${cpv.point}p</td>
                        </tr>
                    </table>
                </div>
                <div id="payment-info-content2">
                    <table width="100%">
                        <tr>
                            <td colspan="2" width="200px" class="payment-info-row1">결제금액</td>
                            <td class="payment-input payment-info-row1">
                                <c:if test="${crv.reservationAmount == null}">
								<fmt:formatNumber value="10000" pattern="#,###"/>원
								</c:if>
								<c:if test="${crv.reservationAmount != null}">
								<fmt:formatNumber value="${crv.reservationAmount-cpv.point}" pattern="#,###"/>원
								</c:if>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="payment-input payment-info-row2">${cpv.paymentType}</td>
                            <td class="payment-input payment-info-row2">
                                <c:if test="${crv.reservationAmount == null}">
                                <fmt:formatNumber value="10000" pattern="#,###"/>원
                                </c:if>
                                <c:if test="${crv.reservationAmount != null}">
                                <fmt:formatNumber value="${crv.reservationAmount-cpv.point}" pattern="#,###"/>원
                                </c:if> 
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="payment-info-row3">${cpv.paymentDate}</td>
                        </tr>
                    </table>
                </div>
                <div id="payment-info-content3">
                    <table width="100%">
                        <tr>
                            <td class="payment-info-text">포인트 적립</td>
                            <td class="payment-info-input" id="payment-info-input-point">
                                +<fmt:formatNumber value="${crv.reservationAmount/10}" pattern="#,###"/>p
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" id="payment-info-detail">서비스요금의 10%가 적립 됩니다.</td>
                        </tr>
                    </table></div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
    
</body>
</html>
<%
	session.removeAttribute("crv");
    session.removeAttribute("cpv");

%>