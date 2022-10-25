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
                    <img src="/dobby/${sv.servicePic_1}" alt="">
                </div>
                <div id="service-pic2">
                    <img src="/dobby/${sv.servicePic_2}" alt="">
                </div>
                <div id="service-pic3">
                    <img src="/dobby/${sv.servicePic_3}" alt="">
                </div>
                <div id="service-pic4">
                    <img src="/dobby/${sv.servicePic_4}" alt="">
                </div>
            </div>
            <div id="helper-profile">
                <div class="inline-block" id="profile-pic-div">
                    <img src="/dobby/${sv.profileImg}" alt="">
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
                            <td class="input-text" colspan="3">${sv.chargeUnit}당 <fmt:formatNumber value="${sv.charge}" pattern="#,###"/>원</td>
                        </tr>
                        <tr>
                            <td class="sm text-grey fixed-text">분야</td>
                            <td class="input-text" >${sv.serviceType}(경력3년)</td>
                            <td class="sm text-grey fixed-text">운영시간</td>
                            <td class="input-text" >${sv.openTime} ~ ${sv.closeTime}</td>
                        </tr>
                        <tr>
                            <td class="sm text-grey fixed-text">지역</td>
                            <td class="input-text" >
                            ${cv.area_1}
                            ${cv.area_2}
                            ${cv.area_3}<br>
                            ${cv.area_4}
                            ${cv.area_5}
							</td>
                            <td class="sm text-grey fixed-text">결제수단</td>
                            <td class="input-text" >
							${cv.payment_1}
							${cv.payment_2}
							${cv.payment_3}
							</td>
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
                    <button onclick="location.href='/dobby/service/modify?sno=${sv.serviceNo}';">수정하기</button>
                 
                    <button>삭제하기</button>
                </div>
            </div>
            <div id="service-navibar">
                <ul>
                    <li>
                        <a href="#service-explain" class="text-white back-green" id="first-a">서비스 설명</a>
                    </li>
                    <li>
                        <a href="#pay-info" class="text-white back-green" id="second-a">요금 정보</a>
                    </li>
                    <li>
                        <a href="#service-review" class="text-white back-green" id="third-a">서비스 평가</a>
                    </li>
                </ul>
            </div>

            <div id="main-contents">
                <div id="service-explain">서비스 설명
                    <p>
                        ${sv.serviceDetail}
                    </p>
                </div>
                <div id="pay-info">요금 정보
                    <p>
                  	 	${sv.paymentDetail}
					</p>
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
<script defer>
    const navi_a = document.querySelector("#first-a");
    const navi_b = document.querySelector("#second-a");
    const navi_c = document.querySelector("#third-a");

    navi_a.addEventListener('click', function(){
        navi_a.classList.replace('text-white','text-green');
        navi_a.classList.replace('back-green','back-white');
        navi_b.classList.replace('text-green','text-white');
        navi_b.classList.replace('back-white','back-green');
        navi_c.classList.replace('text-green','text-white');
        navi_c.classList.replace('back-white','back-green');
    });
    navi_b.addEventListener('click', function(){
        navi_b.classList.replace('text-white','text-green');
        navi_b.classList.replace('back-green','back-white');
        navi_a.classList.replace('text-green','text-white');
        navi_a.classList.replace('back-white','back-green');
        navi_c.classList.replace('text-green','text-white');
        navi_c.classList.replace('back-white','back-green');
    });
    navi_c.addEventListener('click', function(){
        navi_c.classList.replace('text-white','text-green');
        navi_c.classList.replace('back-green','back-white');
        navi_b.classList.replace('text-green','text-white');
        navi_b.classList.replace('back-white','back-green');
        navi_a.classList.replace('text-green','text-white');
        navi_a.classList.replace('back-white','back-green');
    });

</script>
</html>