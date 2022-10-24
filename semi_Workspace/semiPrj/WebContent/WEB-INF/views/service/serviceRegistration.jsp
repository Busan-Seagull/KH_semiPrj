<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/main.css">
<link rel="stylesheet"
	href="/dobby/resources/css/serviceRegistration.css">
</head>
<body>


	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="service-registration-wrap">
		<div id="registration-title">서비스 등록</div>
		<form action="" method="post" enctype="multipart/form-data">
			<div id="registration-form1">
				<div id="service-name">서비스명</div>
				<div id="service-name-input">
					<input type="text" name="service">
				</div>
				<div id="service-category">서비스 카테고리</div>
				<div id="service-category-input">
					<select name="type-no" id="">
						<option value="1">가사도우미</option>
						<option value="2">이사</option>
						<option value="3">인테리어</option>
						<option value="4">전기/수도/가스</option>
						<option value="5">가전설치</option>
						<option value="6">펫/식물</option>
					</select>
				</div>
				<div id="profile-pic">프로필 사진</div>
				<div id="profile-pic-input">
					<label for="profile-img">+</label> <input type="file"
						name="profile-img" id="profile-img">
				</div>
				<div id="payment-unit">요금단위</div>
				<div id="payment-unit-input">
					<select name="charge-unit" id="select-charge-unit">
						<option value="2">평당</option>
						<option value="3">시간당</option>
						<option value="4">회당</option>
						<option value="1">견적필요</option>
					</select>
				</div>
				<div id="payment">요금</div>
				<div id="payment-input">
					<input type="number" name="charge" value="10000" id="number">
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
				<div id="introduction">한줄소개</div>
				<div id="introduction-input">
					<input type="text" name="service-intro">
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
						<option value="00:00">00:00</option>
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
						<option value="00:00">00:00</option>
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
				<div id="region">관할지역</div>
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
							<option value="">지역을 선택해주세요</option>
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
					<label for="service-img-1">+</label> <input type="file"
						name="service-img-1" id="service-img-1">
				</div>
				<div id="service-pic-input2" class="service-pic-input">
					<label for="service-img-2">+</label> <input type="file"
						name="service-img-2" id="service-img-2">
				</div>
				<div id="service-pic-input3" class="service-pic-input">
					<label for="service-img-3">+</label> <input type="file"
						name="service-img-3" id="service-img-3">
				</div>
				<div id="service-pic-input4" class="service-pic-input">
					<label for="service-img-4">+</label> <input type="file"
						name="service-img-4" id="service-img-4">
				</div>
				<div id="service-pic-detail">서비스를 나타내는 사진을 1장이상 등록해주세요</div>
			</div>
			<div id="service-detail-wrap">
				<div id="service-detail-text" class="registration-t2">서비스 상세내용</div>
				<div id="service-detail" class="textarea-div">
					<textarea name="service-detail" id=""
						placeholder="서비스에 대한 상세내용을 작성해주세요"></textarea>
				</div>

			</div>
			<div id="payment-detail-wrap">
				<div id="payment-detail-text" class="registration-t2">요금 상세 정보</div>
				<div id="payment-detail" class="textarea-div">
					<textarea name="payment-detail" id=""
						placeholder="요금에 대한 상세내용을 작성해주세요"></textarea>
				</div>
			</div>
			<div id="registration-button-div">
				<input type="submit" value="등록하기" id="registration-button">
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

			console.log(selectIndex);
			console.log(val);

			if (val == 1) {
				numberInput.value = 0;
				numberInput.disabled = true;
			} else {
				numberInput.disabled = false;
			}
		})
	</script>


</body>
</html>