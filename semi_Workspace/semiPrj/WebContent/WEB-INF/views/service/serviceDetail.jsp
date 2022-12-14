<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                    <img src="/dobby/resources/img/service/house1.jfif" alt="서비스1">
                </div>
                <div id="service-pic2">
                    <img src="/dobby/resources/img/service/house3.jfif" alt="서비스2">
                </div>
                <div id="service-pic3">
                    <img src="/dobby/resources/img/service/house2.jfif" alt="서비스3">
                </div>
                <div id="service-pic4">
                    <img src="/dobby/resources/img/service/house4.jfif" alt="서비스4">
                    
                </div>
            </div>
            <div id="helper-profile">
                <div class="inline-block" id="profile-pic-div">
                    <img src="/dobby/WEB-INF/upload/service/1666579981181_32901.50304726053.jpg" alt="">
                </div>
                <div class="inline-block" id="profile-contents">
                    <h2>집 청소 제대로 해드립니다.</h2>
                    <table width= 100% height="50%">
                        <tr>
                            <td class="sm text-grey fixed-text">닉네임</td>
                            <td class="input-text" colspan="3">DOBBY</td>
                        </tr>
                        <tr>
                            <td class="sm text-grey fixed-text">비용</td>
                            <td class="input-text" colspan="3">평당 15,000원</td>
                        </tr>
                        <tr>
                            <td class="sm text-grey fixed-text">분야</td>
                            <td class="input-text" >입주청소(경력3년)</td>
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