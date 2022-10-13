<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet" href="/dobby/resources/css/serviceModification.css">
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div id="service-registration-wrap">
        <div id="registration-title">서비스 수정하기</div>
        <form action="">
            <div id="registration-form1">
                <div id="service-name">서비스명</div>
                <div id="service-name-input">
                    <input type="text">
                </div>
                <div id="service-category">서비스 카테고리</div>            
                <div id="service-category-input">
                    <input type="text" disabled>
                </div>
                <div id="profile-pic">프로필 사진</div>
                <div id="profile-pic-input">
                    <input type="file">
                </div>
                <div id="payment-unit">요금단위</div>
                <div id="payment-unit-input">
                    <input type="text">
                </div>
                <div id="payment">요금</div>
                <div id="payment-input">
                    <input type="text">
                </div>
                <div id="payment-method">현장 결제수단</div>
                <div id="introduction">한줄소개</div>
                <div id="introduction-input">
                    <input type="text">
                </div>
                <div id="open-time">운영시작시간</div>
                <div id="open-time-input">
                    <input type="text">
                </div>
                <div id="close-time">운영종료시간</div>
                <div id="close-time-input">
                    <input type="text">
                </div>
                <div id="career-years">경력</div>
                <div id="career-years-input">
                    <input type="text">
                </div>
                <div id="region">관할지역</div>
                <div id="region-input">
                    <div id="region-input-1">
                        <select name="" id="">
                            <option value="0">지역을 선택해주세요</option>
                            <option value="1">서울</option>
                            <option value="2">부산</option>
                        </select>
                    </div>
                    <div id="region-input-2">
                        <select name="" id="">
                            <option value="0">지역을 선택해주세요</option>
                            <option value="1">서울</option>
                            <option value="2">부산</option>
                        </select>
                    </div>
                    <div id="region-input-3">
                        <select name="" id="">
                            <option value="0">지역을 선택해주세요</option>
                            <option value="1">서울</option>
                            <option value="2">부산</option>
                        </select>
                    </div>
                    <div id="region-input-4">
                        <select name="" id="">
                            <option value="0">지역을 선택해주세요</option>
                            <option value="1">서울</option>
                            <option value="2">부산</option>
                        </select>
                    </div>
                    <div id="region-input-5">
                        <select name="" id="">
                            <option value="0">지역을 선택해주세요</option>
                            <option value="1">서울</option>
                            <option value="2">부산</option>
                        </select>
                    </div>
                </div>
            </div>
            <div id="service-pic-wrap">
                <div id="service-pic" class="registration-t2">서비스 사진</div>
                <div id="service-pic-input1" class="service-pic-input">
                    <input type="file">
                </div>
                <div id="service-pic-input2" class="service-pic-input">
                    <input type="file">
                </div>
                <div id="service-pic-input3" class="service-pic-input">
                    <input type="file">
                </div>
                <div id="service-pic-input4" class="service-pic-input">
                    <input type="file">
                </div>
                <div id="service-pic-detail">서비스를 나타내는 사진을 1장이상 등록해주세요</div>
            </div>
            <div id="service-detail-wrap">
                <div id="service-detail-text" class="registration-t2">서비스 상세내용</div>
                <div id="service-detail" class="textarea-div">
                    <textarea name="" id="" placeholder="서비스에 대한 상세내용을 작성해주세요"></textarea>
                </div>
                
            </div>
            <div id="payment-detail-wrap">
                <div id="payment-detail-text" class="registration-t2">요금 상세 정보</div>
                <div id="payment-detail" class="textarea-div">
                    <textarea name="" id="" placeholder="요금에 대한 상세내용을 작성해주세요"></textarea>
                </div>
            </div>
            <div id="registration-button-div">
                <input type="submit" value="수정하기" id="revise-button">
            </div>
        </form>
    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
    
</body>
</html>