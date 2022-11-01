<%@page import="com.kh.dobby.service.vo.ServiceVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% ServiceVo sv = (ServiceVo)session.getAttribute("sv");
	System.out.println(sv);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet"
	href="/dobby/resources/css/serviceModification.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="/dobby/resources/js/editor/lang/summernote-ko-KR.js"></script>
 <!-- 서머노트를 위해 추가해야할 부분 -->
<script src="${pageContext.request.contextPath}/resources/js/editor/summernote-lite.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/editor/summernote-lite.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="service-registration-wrap">
		<div id="registration-title">서비스 정보 수정</div>
		<form action="/dobby/service/modify" method="post" enctype="multipart/form-data">
			<div id="registration-form1">
				<div id="service-name">서비스명*</div>
				<div id="service-name-input">
					<input type="text" name="service" value="${sv.title}">
				</div>
				<div id="service-category">서비스 카테고리</div>
				<div id="service-category-input">
					<select name="type-no" id="" disabled>
						<option value="1" <c:if test="${sv.typeNo==1}">selected</c:if>>가사도우미</option>
						<option value="2" <c:if test="${sv.typeNo==2}">selected</c:if>>이사</option>
						<option value="3" <c:if test="${sv.typeNo==3}">selected</c:if>>인테리어</option>
						<option value="4" <c:if test="${sv.typeNo==4}">selected</c:if>>전기/수도/가스</option>
						<option value="5" <c:if test="${sv.typeNo==5}">selected</c:if>>가전설치</option>
						<option value="6" <c:if test="${sv.typeNo==6}">selected</c:if>>펫/식물</option>
					</select>
				</div>
				<div id="profile-pic">프로필 사진</div>
				<div id="profile-pic-input">
					<label for="profile-img"><img class="uploaded-profile" src="/dobby/${sv.profileImg}" alt="">+</label>
					<input type="file"
						name="profile-img" id="profile-img" class="file">
				</div>
				<div id="payment-unit">요금단위</div>
				<div id="payment-unit-input">
					<select name="charge-unit" id="select-charge-unit">
						<option value="2" <c:if test="${sv.chargeUnitNo==2}">selected</c:if>>평당</option>
						<option value="3" <c:if test="${sv.chargeUnitNo==3}">selected</c:if>>시간당</option>
						<option value="4" <c:if test="${sv.chargeUnitNo==4}">selected</c:if>>회당</option>
						<option value="1" <c:if test="${sv.chargeUnitNo==1}">selected</c:if>>견적필요</option>
					</select>
				</div>
				<div id="payment">요금</div>
				<div id="payment-input">
					<input type="number" name="charge" id="number" value="${sv.charge}">
					원
				</div>
				<div id="payment-method">
					현장 결제수단
					<div id="checkbox-div">
						<input type="checkbox" name="pay-type-no" id="a" value="6"><label for="a">현금</label> <br> 
						<input type="checkbox" name="pay-type-no" id="b" value="5"><label for="b">카드</label> <br> 
						<input type="checkbox" name="pay-type-no" id="c" value="2"><label for="c">계좌이체</label>
					</div>
				</div>
				<div id="introduction">한줄소개*</div>
				<div id="introduction-input">
					<input type="text" name="service-intro" value="${sv.serviceIntro}">
				</div>
				<div id="open-time">운영시작시간</div>
				<div id="open-time-input">
					<select name="open-time" id="">
						<option value="01:00" <c:if test="${sv.openTime eq '01:00'}">selected</c:if>>01:00</option>
						<option value="02:00" <c:if test="${sv.openTime eq '02:00'}">selected</c:if>>02:00</option>
						<option value="03:00" <c:if test="${sv.openTime eq '03:00'}">selected</c:if>>03:00</option>
						<option value="04:00" <c:if test="${sv.openTime eq '04:00'}">selected</c:if>>04:00</option>
						<option value="05:00" <c:if test="${sv.openTime eq '05:00'}">selected</c:if>>05:00</option>
						<option value="06:00" <c:if test="${sv.openTime eq '06:00'}">selected</c:if>>06:00</option>
						<option value="07:00" <c:if test="${sv.openTime eq '07:00'}">selected</c:if>>07:00</option>
						<option value="08:00" <c:if test="${sv.openTime eq '08:00'}">selected</c:if>>08:00</option>
						<option value="09:00" <c:if test="${sv.openTime eq '09:00'}">selected</c:if>>09:00</option>
						<option value="10:00" <c:if test="${sv.openTime eq '10:00'}">selected</c:if>>10:00</option>
						<option value="11:00" <c:if test="${sv.openTime eq '11:00'}">selected</c:if>>11:00</option>
						<option value="12:00" <c:if test="${sv.openTime eq '12:00'}">selected</c:if>>12:00</option>
						<option value="13:00" <c:if test="${sv.openTime eq '13:00'}">selected</c:if>>13:00</option>
						<option value="14:00" <c:if test="${sv.openTime eq '14:00'}">selected</c:if>>14:00</option>
						<option value="15:00" <c:if test="${sv.openTime eq '15:00'}">selected</c:if>>15:00</option>
						<option value="16:00" <c:if test="${sv.openTime eq '16:00'}">selected</c:if>>16:00</option>
						<option value="17:00" <c:if test="${sv.openTime eq '17:00'}">selected</c:if>>17:00</option>
						<option value="18:00" <c:if test="${sv.openTime eq '18:00'}">selected</c:if>>18:00</option>
						<option value="19:00" <c:if test="${sv.openTime eq '19:00'}">selected</c:if>>19:00</option>
						<option value="20:00" <c:if test="${sv.openTime eq '20:00'}">selected</c:if>>20:00</option>
						<option value="21:00" <c:if test="${sv.openTime eq '21:00'}">selected</c:if>>21:00</option>
						<option value="22:00" <c:if test="${sv.openTime eq '22:00'}">selected</c:if>>22:00</option>
						<option value="23:00" <c:if test="${sv.openTime eq '23:00'}">selected</c:if>>23:00</option>
						<option value="00:00" <c:if test="${sv.openTime eq '00:00'}">selected</c:if>>00:00</option>
					</select>
				</div>
				<div id="close-time">운영종료시간</div>
				<div id="close-time-input">
					<select name="close-time" id="">
						<option value="01:00" <c:if test="${sv.closeTime eq '01:00'}">selected</c:if>>01:00</option>
						<option value="02:00" <c:if test="${sv.closeTime eq '02:00'}">selected</c:if>>02:00</option>
						<option value="03:00" <c:if test="${sv.closeTime eq '03:00'}">selected</c:if>>03:00</option>
						<option value="04:00" <c:if test="${sv.closeTime eq '04:00'}">selected</c:if>>04:00</option>
						<option value="05:00" <c:if test="${sv.closeTime eq '05:00'}">selected</c:if>>05:00</option>
						<option value="06:00" <c:if test="${sv.closeTime eq '06:00'}">selected</c:if>>06:00</option>
						<option value="07:00" <c:if test="${sv.closeTime eq '07:00'}">selected</c:if>>07:00</option>
						<option value="08:00" <c:if test="${sv.closeTime eq '08:00'}">selected</c:if>>08:00</option>
						<option value="09:00" <c:if test="${sv.closeTime eq '09:00'}">selected</c:if>>09:00</option>
						<option value="10:00" <c:if test="${sv.closeTime eq '10:00'}">selected</c:if>>10:00</option>
						<option value="11:00" <c:if test="${sv.closeTime eq '11:00'}">selected</c:if>>11:00</option>
						<option value="12:00" <c:if test="${sv.closeTime eq '12:00'}">selected</c:if>>12:00</option>
						<option value="13:00" <c:if test="${sv.closeTime eq '13:00'}">selected</c:if>>13:00</option>
						<option value="14:00" <c:if test="${sv.closeTime eq '14:00'}">selected</c:if>>14:00</option>
						<option value="15:00" <c:if test="${sv.closeTime eq '15:00'}">selected</c:if>>15:00</option>
						<option value="16:00" <c:if test="${sv.closeTime eq '16:00'}">selected</c:if>>16:00</option>
						<option value="17:00" <c:if test="${sv.closeTime eq '17:00'}">selected</c:if>>17:00</option>
						<option value="18:00" <c:if test="${sv.closeTime eq '18:00'}">selected</c:if>>18:00</option>
						<option value="19:00" <c:if test="${sv.closeTime eq '19:00'}">selected</c:if>>19:00</option>
						<option value="20:00" <c:if test="${sv.closeTime eq '20:00'}">selected</c:if>>20:00</option>
						<option value="21:00" <c:if test="${sv.closeTime eq '21:00'}">selected</c:if>>21:00</option>
						<option value="22:00" <c:if test="${sv.closeTime eq '22:00'}">selected</c:if>>22:00</option>
						<option value="23:00" <c:if test="${sv.closeTime eq '23:00'}">selected</c:if>>23:00</option>
						<option value="00:00" <c:if test="${sv.closeTime eq '00:00'}">selected</c:if>>00:00</option>
					</select>
				</div>
				<div id="career-years">경력</div>
				<div id="career-years-input">
					<select name="helper-exp" id="">
						<option value="1">1년 미만</option>
						<option value="2">1년</option>
						<option value="3">2년</option>
						<option value="4">3년</option>
						<option value="5">4년</option>
						<option value="6">5년</option>
						<option value="7">7년 이상</option>
						<option value="8">10년 이상</option>
					</select>
				</div>
				<div id="region">
					<div>관할지역*</div>
					<div id="region-detail">지역을 하나 이상 선택 해주세요.</div>
				</div>
				<div id="region-input">
					<div id="region-input-1">
						<select name="area-no" id="">
							<option value="0"  <c:if test="${sv.areaNo_1 == 0}">selected</c:if>> 지역을 선택해주세요</option>
							<option value="1"  <c:if test="${sv.areaNo_1 == 1}">selected</c:if>> 도봉구</option>
							<option value="2"  <c:if test="${sv.areaNo_1 == 2}">selected</c:if>> 노원구</option>
							<option value="3"  <c:if test="${sv.areaNo_1 == 3}">selected</c:if>> 강북구</option>
							<option value="4"  <c:if test="${sv.areaNo_1 == 4}">selected</c:if>> 은평구</option>
							<option value="5"  <c:if test="${sv.areaNo_1 == 5}">selected</c:if>> 종로구</option>
							<option value="6"  <c:if test="${sv.areaNo_1 == 6}">selected</c:if>> 성북구</option>
							<option value="7"  <c:if test="${sv.areaNo_1 == 7}">selected</c:if>> 중랑구</option>
							<option value="8"  <c:if test="${sv.areaNo_1 == 8}">selected</c:if>> 동대문구</option>
							<option value="9"  <c:if test="${sv.areaNo_1 == 9}">selected</c:if>> 서대문구</option>
							<option value="10" <c:if test="${sv.areaNo_1 == 10}">selected</c:if>>중구</option>
							<option value="11" <c:if test="${sv.areaNo_1 == 11}">selected</c:if>>마포구</option>
							<option value="12" <c:if test="${sv.areaNo_1 == 12}">selected</c:if>>용산구</option>
							<option value="13" <c:if test="${sv.areaNo_1 == 13}">selected</c:if>>성동구</option>
							<option value="14" <c:if test="${sv.areaNo_1 == 14}">selected</c:if>>광진구</option>
							<option value="15" <c:if test="${sv.areaNo_1 == 15}">selected</c:if>>강서구</option>
							<option value="16" <c:if test="${sv.areaNo_1 == 16}">selected</c:if>>양천구</option>
							<option value="17" <c:if test="${sv.areaNo_1 == 17}">selected</c:if>>구로구</option>
							<option value="18" <c:if test="${sv.areaNo_1 == 18}">selected</c:if>>영등포구</option>
							<option value="19" <c:if test="${sv.areaNo_1 == 19}">selected</c:if>>금천구</option>
							<option value="20" <c:if test="${sv.areaNo_1 == 20}">selected</c:if>>동작구</option>
							<option value="21" <c:if test="${sv.areaNo_1 == 21}">selected</c:if>>관악구</option>
							<option value="22" <c:if test="${sv.areaNo_1 == 22}">selected</c:if>>서초구</option>
							<option value="23" <c:if test="${sv.areaNo_1 == 23}">selected</c:if>>강남구</option>
							<option value="24" <c:if test="${sv.areaNo_1 == 24}">selected</c:if>>송파구</option>
							<option value="25" <c:if test="${sv.areaNo_1 == 25}">selected</c:if>>강동구</option>
						</select>
					</div>
					<div id="region-input-2">
						<select name="area-no" id="">
							<option value="0"  <c:if test="${sv.areaNo_2 == 0}">selected</c:if>>지역을 선택해주세요</option>
							<option value="1"  <c:if test="${sv.areaNo_2 == 1}">selected</c:if>>도봉구</option>
							<option value="2"  <c:if test="${sv.areaNo_2 == 2}">selected</c:if>>노원구</option>
							<option value="3"  <c:if test="${sv.areaNo_2 == 3}">selected</c:if>>강북구</option>
							<option value="4"  <c:if test="${sv.areaNo_2 == 4}">selected</c:if>>은평구</option>
							<option value="5"  <c:if test="${sv.areaNo_2 == 5}">selected</c:if>>종로구</option>
							<option value="6"  <c:if test="${sv.areaNo_2 == 6}">selected</c:if>>성북구</option>
							<option value="7"  <c:if test="${sv.areaNo_2 == 7}">selected</c:if>>중랑구</option>
							<option value="8"  <c:if test="${sv.areaNo_2 == 8}">selected</c:if>>동대문구</option>
							<option value="9"  <c:if test="${sv.areaNo_2 == 9}">selected</c:if>>서대문구</option>
							<option value="10" <c:if test="${sv.areaNo_2 == 10}">selected</c:if>>중구</option>
							<option value="11" <c:if test="${sv.areaNo_2 == 11}">selected</c:if>>마포구</option>
							<option value="12" <c:if test="${sv.areaNo_2 == 12}">selected</c:if>>용산구</option>
							<option value="13" <c:if test="${sv.areaNo_2 == 13}">selected</c:if>>성동구</option>
							<option value="14" <c:if test="${sv.areaNo_2 == 14}">selected</c:if>>광진구</option>
							<option value="15" <c:if test="${sv.areaNo_2 == 15}">selected</c:if>>강서구</option>
							<option value="16" <c:if test="${sv.areaNo_2 == 16}">selected</c:if>>양천구</option>
							<option value="17" <c:if test="${sv.areaNo_2 == 17}">selected</c:if>>구로구</option>
							<option value="18" <c:if test="${sv.areaNo_2 == 18}">selected</c:if>>영등포구</option>
							<option value="19" <c:if test="${sv.areaNo_2 == 19}">selected</c:if>>금천구</option>
							<option value="20" <c:if test="${sv.areaNo_2 == 20}">selected</c:if>>동작구</option>
							<option value="21" <c:if test="${sv.areaNo_2 == 21}">selected</c:if>>관악구</option>
							<option value="22" <c:if test="${sv.areaNo_2 == 22}">selected</c:if>>서초구</option>
							<option value="23" <c:if test="${sv.areaNo_2 == 23}">selected</c:if>>강남구</option>
							<option value="24" <c:if test="${sv.areaNo_2 == 24}">selected</c:if>>송파구</option>
							<option value="25" <c:if test="${sv.areaNo_2 == 25}">selected</c:if>>강동구</option>
						</select>
					</div>
					<div id="region-input-3">
						<select name="area-no" id="">
							<option value="0"  <c:if test="${sv.areaNo_3 == 0}">selected</c:if>>지역을 선택해주세요</option>
							<option value="1"  <c:if test="${sv.areaNo_3 == 1}">selected</c:if>>도봉구</option>
							<option value="2"  <c:if test="${sv.areaNo_3 == 2}">selected</c:if>>노원구</option>
							<option value="3"  <c:if test="${sv.areaNo_3 == 3}">selected</c:if>>강북구</option>
							<option value="4"  <c:if test="${sv.areaNo_3 == 4}">selected</c:if>>은평구</option>
							<option value="5"  <c:if test="${sv.areaNo_3 == 5}">selected</c:if>>종로구</option>
							<option value="6"  <c:if test="${sv.areaNo_3 == 6}">selected</c:if>>성북구</option>
							<option value="7"  <c:if test="${sv.areaNo_3 == 7}">selected</c:if>>중랑구</option>
							<option value="8"  <c:if test="${sv.areaNo_3 == 8}">selected</c:if>>동대문구</option>
							<option value="9"  <c:if test="${sv.areaNo_3 == 9}">selected</c:if>>서대문구</option>
							<option value="10" <c:if test="${sv.areaNo_3 == 10}">selected</c:if>>중구</option>
							<option value="11" <c:if test="${sv.areaNo_3 == 11}">selected</c:if>>마포구</option>
							<option value="12" <c:if test="${sv.areaNo_3 == 12}">selected</c:if>>용산구</option>
							<option value="13" <c:if test="${sv.areaNo_3 == 13}">selected</c:if>>성동구</option>
							<option value="14" <c:if test="${sv.areaNo_3 == 14}">selected</c:if>>광진구</option>
							<option value="15" <c:if test="${sv.areaNo_3 == 15}">selected</c:if>>강서구</option>
							<option value="16" <c:if test="${sv.areaNo_3 == 16}">selected</c:if>>양천구</option>
							<option value="17" <c:if test="${sv.areaNo_3 == 17}">selected</c:if>>구로구</option>
							<option value="18" <c:if test="${sv.areaNo_3 == 18}">selected</c:if>>영등포구</option>
							<option value="19" <c:if test="${sv.areaNo_3 == 19}">selected</c:if>>금천구</option>
							<option value="20" <c:if test="${sv.areaNo_3 == 20}">selected</c:if>>동작구</option>
							<option value="21" <c:if test="${sv.areaNo_3 == 21}">selected</c:if>>관악구</option>
							<option value="22" <c:if test="${sv.areaNo_3 == 22}">selected</c:if>>서초구</option>
							<option value="23" <c:if test="${sv.areaNo_3 == 23}">selected</c:if>>강남구</option>
							<option value="24" <c:if test="${sv.areaNo_3 == 24}">selected</c:if>>송파구</option>
							<option value="25" <c:if test="${sv.areaNo_3 == 25}">selected</c:if>>강동구</option>
						</select>
					</div>
					<div id="region-input-4">
						<select name="area-no" id="">
							<option value="0"  <c:if test="${sv.areaNo_4 == 0}">selected</c:if>>지역을 선택해주세요</option>
							<option value="1"  <c:if test="${sv.areaNo_4 == 1}">selected</c:if>>도봉구</option>
							<option value="2"  <c:if test="${sv.areaNo_4 == 2}">selected</c:if>>노원구</option>
							<option value="3"  <c:if test="${sv.areaNo_4 == 3}">selected</c:if>>강북구</option>
							<option value="4"  <c:if test="${sv.areaNo_4 == 4}">selected</c:if>>은평구</option>
							<option value="5"  <c:if test="${sv.areaNo_4 == 5}">selected</c:if>>종로구</option>
							<option value="6"  <c:if test="${sv.areaNo_4 == 6}">selected</c:if>>성북구</option>
							<option value="7"  <c:if test="${sv.areaNo_4 == 7}">selected</c:if>>중랑구</option>
							<option value="8"  <c:if test="${sv.areaNo_4 == 8}">selected</c:if>>동대문구</option>
							<option value="9"  <c:if test="${sv.areaNo_4 == 9}">selected</c:if>>서대문구</option>
							<option value="10" <c:if test="${sv.areaNo_4 == 10}">selected</c:if>>중구</option>
							<option value="11" <c:if test="${sv.areaNo_4 == 11}">selected</c:if>>마포구</option>
							<option value="12" <c:if test="${sv.areaNo_4 == 12}">selected</c:if>>용산구</option>
							<option value="13" <c:if test="${sv.areaNo_4 == 13}">selected</c:if>>성동구</option>
							<option value="14" <c:if test="${sv.areaNo_4 == 14}">selected</c:if>>광진구</option>
							<option value="15" <c:if test="${sv.areaNo_4 == 15}">selected</c:if>>강서구</option>
							<option value="16" <c:if test="${sv.areaNo_4 == 16}">selected</c:if>>양천구</option>
							<option value="17" <c:if test="${sv.areaNo_4 == 17}">selected</c:if>>구로구</option>
							<option value="18" <c:if test="${sv.areaNo_4 == 18}">selected</c:if>>영등포구</option>
							<option value="19" <c:if test="${sv.areaNo_4 == 19}">selected</c:if>>금천구</option>
							<option value="20" <c:if test="${sv.areaNo_4 == 20}">selected</c:if>>동작구</option>
							<option value="21" <c:if test="${sv.areaNo_4 == 21}">selected</c:if>>관악구</option>
							<option value="22" <c:if test="${sv.areaNo_4 == 22}">selected</c:if>>서초구</option>
							<option value="23" <c:if test="${sv.areaNo_4 == 23}">selected</c:if>>강남구</option>
							<option value="24" <c:if test="${sv.areaNo_4 == 24}">selected</c:if>>송파구</option>
							<option value="25" <c:if test="${sv.areaNo_4 == 25}">selected</c:if>>강동구</option>
						</select>
					</div>
					<div id="region-input-5">
						<select name="area-no" id="">
							<option value="0"  <c:if test="${sv.areaNo_5 == 0}">selected</c:if>>지역을 선택해주세요</option>
							<option value="1"  <c:if test="${sv.areaNo_5 == 1}">selected</c:if>>도봉구</option>
							<option value="2"  <c:if test="${sv.areaNo_5 == 2}">selected</c:if>>노원구</option>
							<option value="3"  <c:if test="${sv.areaNo_5 == 3}">selected</c:if>>강북구</option>
							<option value="4"  <c:if test="${sv.areaNo_5 == 4}">selected</c:if>>은평구</option>
							<option value="5"  <c:if test="${sv.areaNo_5 == 5}">selected</c:if>>종로구</option>
							<option value="6"  <c:if test="${sv.areaNo_5 == 6}">selected</c:if>>성북구</option>
							<option value="7"  <c:if test="${sv.areaNo_5 == 7}">selected</c:if>>중랑구</option>
							<option value="8"  <c:if test="${sv.areaNo_5 == 8}">selected</c:if>>동대문구</option>
							<option value="9"  <c:if test="${sv.areaNo_5 == 9}">selected</c:if>>서대문구</option>
							<option value="10" <c:if test="${sv.areaNo_5 == 10}">selected</c:if>>중구</option>
							<option value="11" <c:if test="${sv.areaNo_5 == 11}">selected</c:if>>마포구</option>
							<option value="12" <c:if test="${sv.areaNo_5 == 12}">selected</c:if>>용산구</option>
							<option value="13" <c:if test="${sv.areaNo_5 == 13}">selected</c:if>>성동구</option>
							<option value="14" <c:if test="${sv.areaNo_5 == 14}">selected</c:if>>광진구</option>
							<option value="15" <c:if test="${sv.areaNo_5 == 15}">selected</c:if>>강서구</option>
							<option value="16" <c:if test="${sv.areaNo_5 == 16}">selected</c:if>>양천구</option>
							<option value="17" <c:if test="${sv.areaNo_5 == 17}">selected</c:if>>구로구</option>
							<option value="18" <c:if test="${sv.areaNo_5 == 18}">selected</c:if>>영등포구</option>
							<option value="19" <c:if test="${sv.areaNo_5 == 19}">selected</c:if>>금천구</option>
							<option value="20" <c:if test="${sv.areaNo_5 == 20}">selected</c:if>>동작구</option>
							<option value="21" <c:if test="${sv.areaNo_5 == 21}">selected</c:if>>관악구</option>
							<option value="22" <c:if test="${sv.areaNo_5 == 22}">selected</c:if>>서초구</option>
							<option value="23" <c:if test="${sv.areaNo_5 == 23}">selected</c:if>>강남구</option>
							<option value="24" <c:if test="${sv.areaNo_5 == 24}">selected</c:if>>송파구</option>
							<option value="25" <c:if test="${sv.areaNo_5 == 25}">selected</c:if>>강동구</option>
						</select>
					</div>
				</div>
			</div>
			<div id="service-pic-wrap">
				<div id="service-pic" class="registration-t2">서비스 사진</div>
				<div id="service-pic-input1" class="service-pic-input">
					<label for="service-img-1"><img class="uploaded-profile" src="/dobby/${sv.servicePic_1}" alt="">+</label> <input type="file"
						name="service-img-1" id="service-img-1">
				</div>
				<div id="service-pic-input2" class="service-pic-input">
					<label for="service-img-2"><img class="uploaded-profile" src="/dobby/${sv.servicePic_2}" alt="">+</label> <input type="file"
						name="service-img-2" id="service-img-2">
				</div>
				<div id="service-pic-input3" class="service-pic-input">
					<label for="service-img-3"><img class="uploaded-profile" src="/dobby/${sv.servicePic_3}" alt="">+</label>
					<input type="file" name="service-img-3" id="service-img-3">
				</div>
				<div id="service-pic-input4" class="service-pic-input">
					<label for="service-img-4"><img class="uploaded-profile" src="/dobby/${sv.servicePic_4}" alt="">+</label> <input type="file"
						name="service-img-4" id="service-img-4">
				</div>
				<div id="service-pic-detail">서비스를 나타내는 사진을 1장이상 등록해주세요</div>
			</div>
			<div id="service-detail-wrap">
				<div id="service-detail-text" class="registration-t2">서비스 상세내용</div>
				<div id="service-detail" class="textarea-div">
					<textarea name="service-detail" id="" class="summernote">${sv.serviceDetail}</textarea>
				</div>

			</div>
			<div id="payment-detail-wrap">
				<div id="payment-detail-text" class="registration-t2">요금 상세 정보</div>
				<div id="payment-detail" class="textarea-div">
					<textarea name="payment-detail" id="" class="summernote">${sv.paymentDetail}</textarea>
				</div>
			</div>
			<div id="registration-button-div">
				<input type="submit" value="수정하기" id="registration-button">
			</div>

			<input name="origin-profile" type="text" hidden value="${sv.profileImg}">
			<input name="origin-pic1" type="text" hidden value="${sv.servicePic_1}">
			<input name="origin-pic2" type="text" hidden value="${sv.servicePic_2}">
			<input name="origin-pic3" type="text" hidden value="${sv.servicePic_3}">
			<input name="origin-pic4" type="text" hidden value="${sv.servicePic_4}">

		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- 체크박스 표시해주기 -->
	<script>
	var checkBox = [];
	checkBox[0] = '${sv.pTypeNo_1}';
	checkBox[1] = '${sv.pTypeNo_2}';
	checkBox[2] = '${sv.pTypeNo_3}';

	const paymentCheck = document.querySelectorAll('input[name=pay-type-no]');

	for(let i = 0; i<checkBox.length; i ++){
		for(let j = 0; j < paymentCheck.length; j ++){
			if(checkBox[i] == paymentCheck[j].value){
				paymentCheck[j].checked = true;
			}
		}
	}

	</script>

	<!-- 견적요청일때 가격 인풋 닫기 -->
	<script defer>
		const select = document.querySelector('#select-charge-unit');
		const numberInput = document.querySelector('#number');

		select.addEventListener('change', function() {

			const selectIndex = select.selectedIndex;
			const val = select.options[selectIndex].value;

			if (val == 1) {
				numberInput.value = 0;
				numberInput.disabled = true;
			} else {
				numberInput.disabled = false;
			}
		})
		
	</script>

	<!-- 서머노트 -->
	<script defer>
        $('.summernote').summernote({
            lang: 'ko-KR',
            height: 300,               // set editor height
            minHeight: 250,             // set minimum height of editor
            maxHeight: 300,             // set maximum height of editor
            focus: true,                 // set focus to editable area after initializing summernote
            placeholder: '내용을 입력하세요',
            tabsize: 2,
            height: 120,
            toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    //['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    //['insert',['picture','link']],
		    // 코드보기, 확대해서보기, 도움말
		    // ['view', ['codeview','fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });
      </script>

<!-- 필수입력 빈칸 확인 -->
<script defer>
	function submitCheck(){
		if(document.querySelector('#name-input').value==""||document.querySelector('#service-intro').value==""){
			alert("필수입력란을 작성해주세요");
			document.querySelector('#name-input').focus();
			return true;
		}
	}
</script>

<!-- 등록된 사진 들고오기 -->
<script defer>
	
	//이미지 올리면
	//src 주고 display 보이게 주면.. 되겟지.?
	const fileDOM = document.querySelector('#profile-img');
	const previews = document.querySelectorAll('.uploaded-profile');
	// console.log(previews.length);

	//이미지가 있으면 display block 주기
	
	for(var i = 0; i < previews.length; i ++){
		if(previews[i].src != "http://127.0.0.1:8888/dobby/"){
			console.log(previews[i].src);
			previews[i].style.display = "block";
		}else{
			// console.log('경로없음');
			previews[i].style.display = "none";
		}
	}
	




	//url.reateObjectUrl 을 이용.,,
	fileDOM.addEventListener('change', () => {
	const imageSrc = URL.createObjectURL(fileDOM.files[0]);
	previews[0].src = imageSrc;
	previews[0].style.display="block";
	});
	
	const fileDOM1 = document.querySelector('#service-img-1');
	fileDOM1.addEventListener('change', () => {
	const imageSrc1 = URL.createObjectURL(fileDOM1.files[0]);
	previews[1].src = imageSrc1;
	previews[1].style.display="block";
	});

	const fileDOM2 = document.querySelector('#service-img-2');
	fileDOM2.addEventListener('change', () => {
	const imageSrc2 = URL.createObjectURL(fileDOM2.files[0]);
	previews[2].src = imageSrc2;
	previews[2].style.display="block";
	});

	const fileDOM3 = document.querySelector('#service-img-3');
	fileDOM3.addEventListener('change', () => {
	const imageSrc3 = URL.createObjectURL(fileDOM3.files[0]);
	previews[3].src = imageSrc3;
	previews[3].style.display="block";
	});

	const fileDOM4 = document.querySelector('#service-img-4');
	fileDOM4.addEventListener('change', () => {
	const imageSrc4 = URL.createObjectURL(fileDOM4.files[0]);
	previews[4].src = imageSrc4;
	previews[4].style.display="block";
	});

	
</script>

</body>
</html>