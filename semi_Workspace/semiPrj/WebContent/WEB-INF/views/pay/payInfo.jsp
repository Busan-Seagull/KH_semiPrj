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
                <button id="list-button">결제내역 목록</button>
            </div>
            <div class="button">
                <button id="cancel-button">결제취소</button>
            </div>
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
                    </table></div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
    
</body>
</html>