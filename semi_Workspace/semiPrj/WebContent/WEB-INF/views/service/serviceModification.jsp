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
					<img class="uploaded-profile" src="" alt="">
					<label for="profile-img">+</label> <input type="file"
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
					<input type="number" name="charge" value="10000" id="number" value="${sv.charge}">
					원
				</div>
				<div id="payment-method">
					현장 결제수단
					<div id="checkbox-div">
						<input type="checkbox" name="pay-type-no" id="a" value="6"><label
							for="a">현금</label> <br> <input type="checkbox"
							name="pay-type-no" id="b" value="5"><label for="b">카드</label>
						<br> <input type="checkbox" name="pay-type-no" id="c"
							value="2"><label for="c">계좌이체</label>
					</div>
				</div>
				<div id="introduction">한줄소개*</div>
				<div id="introduction-input">
					<input type="text" name="service-intro" value="${sv.serviceIntro}">
				</div>
				<div id="open-time">운영시작시간</div>
				<div id="open-time-input">
					<select name="open-time" id="">
						<option value="01:00">01:00</option>
						<option value="02:00">02:00</option>
						<option value="03:00">03:00</option>
						<option value="04:00">04:00</option>
						<option value="05:00">05:00</option>
						<option value="06:00">06:00</option>
						<option value="07:00">07:00</option>
						<option value="08:00">08:00</option>
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
						<option value="12:00">12:00</option>
						<option value="13:00">13:00</option>
						<option value="14:00">14:00</option>
						<option value="15:00">15:00</option>
						<option value="16:00">16:00</option>
						<option value="17:00">17:00</option>
						<option value="18:00">18:00</option>
						<option value="19:00">19:00</option>
						<option value="20:00">20:00</option>
						<option value="21:00">21:00</option>
						<option value="22:00">22:00</option>
						<option value="23:00">23:00</option>
						<option value="00:00" selected>00:00</option>
					</select>
				</div>
				<div id="close-time">운영종료시간</div>
				<div id="close-time-input">
					<select name="close-time" id="">
						<option value="01:00">01:00</option>
						<option value="02:00">02:00</option>
						<option value="03:00">03:00</option>
						<option value="04:00">04:00</option>
						<option value="05:00">05:00</option>
						<option value="06:00">06:00</option>
						<option value="07:00">07:00</option>
						<option value="08:00">08:00</option>
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
						<option value="12:00">12:00</option>
						<option value="13:00">13:00</option>
						<option value="14:00">14:00</option>
						<option value="15:00">15:00</option>
						<option value="16:00">16:00</option>
						<option value="17:00">17:00</option>
						<option value="18:00">18:00</option>
						<option value="19:00">19:00</option>
						<option value="20:00">20:00</option>
						<option value="21:00">21:00</option>
						<option value="22:00">22:00</option>
						<option value="23:00">23:00</option>
						<option value="00:00" selected>00:00</option>
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
							<option value="0">지역을 선택해주세요</option>
							<option value="1">도봉구</option>
							<option value="2">노원구</option>
							<option value="3">강북구</option>
							<option value="4">은평구</option>
							<option value="5">종로구</option>
							<option value="6">성북구</option>
							<option value="7">중랑구</option>
							<option value="8">동대문구</option>
							<option value="9">서대문구</option>
							<option value="10">중구</option>
							<option value="11">마포구</option>
							<option value="12">용산구</option>
							<option value="13">성동구</option>
							<option value="14">광진구</option>
							<option value="15">강서구</option>
							<option value="16">양천구</option>
							<option value="17">구로구</option>
							<option value="18">영등포구</option>
							<option value="19">금천구</option>
							<option value="20">동작구</option>
							<option value="21">관악구</option>
							<option value="22">서초구</option>
							<option value="23">강남구</option>
							<option value="24">송파구</option>
							<option value="25">강동구</option>
						</select>
					</div>
					<div id="region-input-2">
						<select name="area-no" id="">
							<option value="0">지역을 선택해주세요</option>
							<option value="1">도봉구</option>
							<option value="2">노원구</option>
							<option value="3">강북구</option>
							<option value="4">은평구</option>
							<option value="5">종로구</option>
							<option value="6">성북구</option>
							<option value="7">중랑구</option>
							<option value="8">동대문구</option>
							<option value="9">서대문구</option>
							<option value="10">중구</option>
							<option value="11">마포구</option>
							<option value="12">용산구</option>
							<option value="13">성동구</option>
							<option value="14">광진구</option>
							<option value="15">강서구</option>
							<option value="16">양천구</option>
							<option value="17">구로구</option>
							<option value="18">영등포구</option>
							<option value="19">금천구</option>
							<option value="20">동작구</option>
							<option value="21">관악구</option>
							<option value="22">서초구</option>
							<option value="23">강남구</option>
							<option value="24">송파구</option>
							<option value="25">강동구</option>
						</select>
					</div>
					<div id="region-input-3">
						<select name="area-no" id="">
							<option value="0">지역을 선택해주세요</option>
							<option value="1">도봉구</option>
							<option value="2">노원구</option>
							<option value="3">강북구</option>
							<option value="4">은평구</option>
							<option value="5">종로구</option>
							<option value="6">성북구</option>
							<option value="7">중랑구</option>
							<option value="8">동대문구</option>
							<option value="9">서대문구</option>
							<option value="10">중구</option>
							<option value="11">마포구</option>
							<option value="12">용산구</option>
							<option value="13">성동구</option>
							<option value="14">광진구</option>
							<option value="15">강서구</option>
							<option value="16">양천구</option>
							<option value="17">구로구</option>
							<option value="18">영등포구</option>
							<option value="19">금천구</option>
							<option value="20">동작구</option>
							<option value="21">관악구</option>
							<option value="22">서초구</option>
							<option value="23">강남구</option>
							<option value="24">송파구</option>
							<option value="25">강동구</option>
						</select>
					</div>
					<div id="region-input-4">
						<select name="area-no" id="">
							<option value="0">지역을 선택해주세요</option>
							<option value="1">도봉구</option>
							<option value="2">노원구</option>
							<option value="3">강북구</option>
							<option value="4">은평구</option>
							<option value="5">종로구</option>
							<option value="6">성북구</option>
							<option value="7">중랑구</option>
							<option value="8">동대문구</option>
							<option value="9">서대문구</option>
							<option value="10">중구</option>
							<option value="11">마포구</option>
							<option value="12">용산구</option>
							<option value="13">성동구</option>
							<option value="14">광진구</option>
							<option value="15">강서구</option>
							<option value="16">양천구</option>
							<option value="17">구로구</option>
							<option value="18">영등포구</option>
							<option value="19">금천구</option>
							<option value="20">동작구</option>
							<option value="21">관악구</option>
							<option value="22">서초구</option>
							<option value="23">강남구</option>
							<option value="24">송파구</option>
							<option value="25">강동구</option>
						</select>
					</div>
					<div id="region-input-5">
						<select name="area-no" id="">
							<option value="0">지역을 선택해주세요</option>
							<option value="1">도봉구</option>
							<option value="2">노원구</option>
							<option value="3">강북구</option>
							<option value="4">은평구</option>
							<option value="5">종로구</option>
							<option value="6">성북구</option>
							<option value="7">중랑구</option>
							<option value="8">동대문구</option>
							<option value="9">서대문구</option>
							<option value="10">중구</option>
							<option value="11">마포구</option>
							<option value="12">용산구</option>
							<option value="13">성동구</option>
							<option value="14">광진구</option>
							<option value="15">강서구</option>
							<option value="16">양천구</option>
							<option value="17">구로구</option>
							<option value="18">영등포구</option>
							<option value="19">금천구</option>
							<option value="20">동작구</option>
							<option value="21">관악구</option>
							<option value="22">서초구</option>
							<option value="23">강남구</option>
							<option value="24">송파구</option>
							<option value="25">강동구</option>
						</select>
					</div>
				</div>
			</div>
			<div id="service-pic-wrap">
				<div id="service-pic" class="registration-t2">서비스 사진</div>
				<div id="service-pic-input1" class="service-pic-input">
					<img class="uploaded-profile" src="" alt="">
					<label for="service-img-1">+</label> <input type="file"
						name="service-img-1" id="service-img-1">
				</div>
				<div id="service-pic-input2" class="service-pic-input">
					<img class="uploaded-profile" src="" alt="">
					<label for="service-img-2">+</label> <input type="file"
						name="service-img-2" id="service-img-2">
				</div>
				<div id="service-pic-input3" class="service-pic-input">
					<img class="uploaded-profile" src="" alt="">
					<label for="service-img-3">+</label> <input type="file"
						name="service-img-3" id="service-img-3">
				</div>
				<div id="service-pic-input4" class="service-pic-input">
					<img class="uploaded-profile" src="" alt="">
					<label for="service-img-4">+</label> <input type="file"
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

		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

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

<script defer>
	function submitCheck(){
		if(document.querySelector('#name-input').value==""||document.querySelector('#service-intro').value==""){
			alert("필수입력란을 작성해주세요");
			document.querySelector('#name-input').focus();
			return true;
		}
	}
</script>

<script defer>

	//이미지 올리면
	//src 주고 display 보이게 주면.. 되겟지.?
	const fileDOM = document.querySelector('#profile-img');
	const previews = document.querySelectorAll('.uploaded-profile');
	// console.log(previews.length);

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