<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet" href="/dobby/resources/css/serviceDetail.css">
</head>
<body>

<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div id="service-wrap">
        <div id="main-content">
            <div id="service-pic-container">
                <div id="service-pic1">
                    <img src="${sv.servicePic_1}" alt="">
                </div>
                <div id="service-pic2">
                    <img src="${sv.servicePic_2}" alt="">
                </div>
                <div id="service-pic3">
                    <img src="${sv.servicePic_3}" alt="">
                </div>
                <div id="service-pic4">
                    <img src="${sv.servicePic_4}" alt="">
                </div>
            </div>
            <div id="helper-profile">
                <div class="inline-block" id="profile-pic-div">
                    <img src="${sv.profileImg}" alt="">
                </div>
                <div class="inline-block" id="profile-contents">
                    <h2>${sv.serviceIntro}</h2>
                    <table width= 100% height="50%">
                        <tr>
                            <td class="sm text-grey fixed-text">닉네임</td>
                            <td class="input-text" colspan="3">${sv.helper}</td>
                        </tr>
                        <tr>
                            <td class="sm text-grey fixed-text">비용</td>
                            <td class="input-text" colspan="3">${sv.chargeUnit}당 <fmt:formatNumber value="${list.charge}" pattern="#,###"/>원</td>
                        </tr>
                        <tr>
                            <td class="sm text-grey fixed-text">분야</td>
                            <td class="input-text" >${sv.serviceType}(경력3년)</td>
                            <td class="sm text-grey fixed-text">운영시간</td>
                            <td class="input-text" >09:00 ~ 22:00</td>
                        </tr>
                        <tr>
                            <td class="sm text-grey fixed-text">지역</td>
                            <td class="input-text" >강남구</td>
                            <td class="sm text-grey fixed-text">결제수단</td>
                            <td class="input-text" >만나서 결제</td>
                        </tr>
                        <tr>
                            <td class="sm text-grey fixed-text" colspan="4">서비스평가</td>
                        </tr>
                        <tr>
                            <td colspan="4" id="starrr">★★★★★</td>
                        </tr>
                    </table>
                    
                </div>
                <div class="inline-block" id="profile-btns">
                    <div id="favorite">♥
                        <span id="favor-num">50</span>
                    </div>
                    <button>수정하기</button>
                    <button>삭제하기</button>
                </div>
            </div>
            <div id="service-navibar">
                <ul>
                    <li>
                        <a class="text-white back-green" id="first-a">서비스 설명</a>
                    </li>
                    <li>
                        <a class="text-white back-green">요금 정보</a>
                    </li>
                    <li>
                        <a class="text-white back-green">서비스 평가</a>
                    </li>
                </ul>
            </div>

            <div id="main-contents">
                <div id="service-expain">서비스 설명
                    <p>
                        노새, 오는 딴은 별 보고, 했던 시인의 어머님, 슬퍼하는 버리었습니다. 
                        이름과, 내일 강아지, 차 별 남은 어머님, 계십니다. 하나에 위에 비둘기, 나는 우는 다하지 사람들의 거외다.<br>
                        노루, 벌레는 이름과, 이름과, 슬퍼하는 위에 비둘기, 말 계십니다. 된 걱정도 무성할 언덕 봄이 이런 있습니다.<br>
                        <br>
                       묻힌 계절이 무성할 별이 다 버리었습니다. 나는 부끄러운 소녀들의 이름과, 별 많은 무엇인지 까닭입니다. <br>
                       차 우는 피어나듯이 까닭입니다. 묻힌 많은 까닭이요, 이제 이름과, 별 이런 있습니다. 차 이름과 파란 어머니<br>
                       , 둘 덮어 이웃 멀듯이, 내 봅니다.<br>
                       <br>
                       그리고 잠, 남은 강아지, 풀이 많은 나는 별빛이 이름과, 까닭입니다. 한 많은 다하지 자랑처럼 헤는 있습니다. <br>
                       다 나는 패, 버리었습니다. 차 불러 별 계절이 잠, 이네들은 봅니다. 위에도 이름과, 잠, 거외다.<br>
                       <br>
                       <br>
                       서비스 설명<br>
                       <br>
                       노새, 오는 딴은 별 보고, 했던 시인의 어머님, 슬퍼하는 버리었습니다. 이름과, 내일 강아지, 차 별 남은 어머님, 계십니다. <br>
                       하나에 위에 비둘기, 나는 우는 다하지 사람들의 거외다. 노루, 벌레는 이름과, 이름과, 슬퍼하는 위에 비둘기, 말 계십니다. 된 걱정도 무성할 언덕 봄이 이런 있습니다.<br>
                       <br>
                       묻힌 계절이 무성할 별이 다 버리었습니다. 나는 부끄러운 소녀들의 이름과, <br>
                       별 많은 무엇인지 까닭입니다. 차 우는 피어나듯이 까닭입니다. 묻힌 많은 까닭이요, 이제 이름과, 별 이런 있습니다. <br>
                       차 이름과 파란 어머니, 둘 덮어 이웃 멀듯이, 내 봅니다.<br>
                       <br>
                       그리고 잠, 남은 강아지, 풀이 많은 나는 별빛이 이름과, 까닭입니다. 한 많은 다하지 자랑처럼 헤는 있습니다.<br>
                        다 나는 패, 버리었습니다. 차 불러 별 계절이 잠, 이네들은 봅니다. 위에도 이름과, 잠, 거외다.<br>

                        노새, 오는 딴은 별 보고, 했던 시인의 어머님, 슬퍼하는 버리었습니다. 
                        이름과, 내일 강아지, 차 별 남은 어머님, 계십니다. 하나에 위에 비둘기, 나는 우는 다하지 사람들의 거외다.<br>
                        노루, 벌레는 이름과, 이름과, 슬퍼하는 위에 비둘기, 말 계십니다. 된 걱정도 무성할 언덕 봄이 이런 있습니다.<br>
                        <br>
                       묻힌 계절이 무성할 별이 다 버리었습니다. 나는 부끄러운 소녀들의 이름과, 별 많은 무엇인지 까닭입니다. <br>
                       차 우는 피어나듯이 까닭입니다. 묻힌 많은 까닭이요, 이제 이름과, 별 이런 있습니다. 차 이름과 파란 어머니<br>
                       , 둘 덮어 이웃 멀듯이, 내 봅니다.<br>
                       <br>
                       그리고 잠, 남은 강아지, 풀이 많은 나는 별빛이 이름과, 까닭입니다. 한 많은 다하지 자랑처럼 헤는 있습니다. <br>
                       다 나는 패, 버리었습니다. 차 불러 별 계절이 잠, 이네들은 봅니다. 위에도 이름과, 잠, 거외다.<br>
                       <br>
                       <br>
                       서비스 설명<br>
                       <br>
                       노새, 오는 딴은 별 보고, 했던 시인의 어머님, 슬퍼하는 버리었습니다. 이름과, 내일 강아지, 차 별 남은 어머님, 계십니다. <br>
                       하나에 위에 비둘기, 나는 우는 다하지 사람들의 거외다. 노루, 벌레는 이름과, 이름과, 슬퍼하는 위에 비둘기, 말 계십니다. 된 걱정도 무성할 언덕 봄이 이런 있습니다.<br>
                       <br>
                       묻힌 계절이 무성할 별이 다 버리었습니다. 나는 부끄러운 소녀들의 이름과, <br>
                       별 많은 무엇인지 까닭입니다. 차 우는 피어나듯이 까닭입니다. 묻힌 많은 까닭이요, 이제 이름과, 별 이런 있습니다. <br>
                       차 이름과 파란 어머니, 둘 덮어 이웃 멀듯이, 내 봅니다.<br>
                       <br>
                       그리고 잠, 남은 강아지, 풀이 많은 나는 별빛이 이름과, 까닭입니다. 한 많은 다하지 자랑처럼 헤는 있습니다.<br>
                        다 나는 패, 버리었습니다. 차 불러 별 계절이 잠, 이네들은 봅니다. 위에도 이름과, 잠, 거외다.<br>
                    </p>
                </div>
                <div id="pay-info">요금 정보
                    <p>대충.. 가격표</p>
                </div>
                <div id="service-review">서비스 평가
                    <button id="go-board">전체보기</button>
                    <div class="review-box" id="review1">
                        <div id="review-head">
                            <div>
                                <span id="stars">★★★★☆</span>
                                <span id="review-writer">김**</span>
                            </div>
                            <div id="review-date">2022.10.10</div>
                        </div>
                        <div id="review-content">
                            <p>청소를 그냥 저냥 하네요...</p>
                        </div>
                    </div>
                    <div class="review-box" id="review2">
                        <div id="review-head">
                            <div>
                                <span id="stars">★★★★☆</span>
                                <span id="review-writer">김**</span>
                            </div>
                            <div id="review-date">2022.10.10</div>
                        </div>
                        <div id="review-content">
                            <p>청소를 그냥 저냥 하네요...</p>
                        </div>
                    </div>
                    <div class="review-box" id="review3">
                        <div id="review-head">
                            <div>
                                <span id="stars">★★★★☆</span>
                                <span id="review-writer">김**</span>
                            </div>
                            <div id="review-date">2022.10.10</div>
                        </div>
                        <div id="review-content">
                            <p>청소를 그냥 저냥 하네요...</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="side-content">
            <div id="reservation-box">
                <div id="reservation-content"></div>
                <div class="back-brown text-white" id="reservation-btn">예약하기</div>
            </div>
            <div class="back-light" id="reserve-info">
                서비스 완료후에 집요정에게 결제대금이 전달됩니다.
            </div>
            
        </div>
        
    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
    
</body>
</html>