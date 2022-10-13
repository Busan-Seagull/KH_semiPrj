<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dobby/resources/css/reservationHistory.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div id="rh-contain">
		<div id="rh-aside"></div>
		<div id="rh-main" class="shadow-box">
			<div id="rh-main-header">
				<div id="r-title">
					<span class="material-symbols-outlined"> magic_button </span>
					<p>예약내역</p>
				</div>
				<form action="">
					<select name="status" id="" onchange="this.form.submit()">
						<option value="none">==선택==</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</form>
			</div>
			<div id="rh-main-list">
				<!-- 여기서부터 바뀜 -->
				<div class="rh-item shadow-box">
					<div class="rh-i-header">
						<div style="line-height:200%;">
							<h1>title이 길 수 있잖아</h1>
							<p>집요정이름</p>
						</div>
						<div></div>
						<div style="line-height:170%;">
							<p>예약날짜 : <span>2022-05-05</span></p>
							<p>견적날짜 : <span>2022-05-05</span></p>
						</div>
						<span class="btn-list">
							<div class="rh-i-h-btn">신고하기</div>
							<div class="rh-i-h-btn">문의하기</div>
							<div class="rh-i-h-btn">리뷰하기</div>
						</span>
					</div>
					<input type="checkbox" id="d-check01">
					<label class="down material-symbols-outlined" for="d-check01">arrow_drop_down</label>
					<label class="down material-symbols-outlined" for="d-check01">arrow_drop_up</label>
					<div class="rh-detail">
						<div class="rh-i-status-text">
							<p>서비스신청</p>
							<p>견적대기</p><!--견적승인대기 견적승인 견적반려 -->
							<p>예약대기</p><!--예약승인대기 예약승인 예약반려 -->
							<p>결제대기</p><!--결제대기 결제완료 -->
							<p></p><!--서비스예정 서비스완료 -->
						</div>
						<div class="rh-i-status">
							<div class="pointer"></div>
							<div class="line"></div>
							<div class="pointer stay"></div>
							<div class="line"></div>
							<div class="pointer done"></div>
							<div class="line"></div>
							<div class="pointer"></div>
							<div class="line"></div>
							<div class="pointer"></div>
						</div>
						<div class="footer-btn-list flex-center">
							<!-- <div class="rh-i-h-btn">결제하기</div> -->
							<div class="rh-i-h-btn">예약취소</div>
						</div>
					</div>
				</div>
				<div class="rh-item">
					<div class="rh-i-header">
						<div style="line-height:200%;">
							<h1>title이 길 수 있잖아</h1>
							<!-- <p>집요정이름</p> -->
						</div>
						<!-- <div style="line-height:170%;">
							<p>예약날짜 : <span>2022-05-05</span></p>
							<p>견적날짜 : <span>2022-05-05</span></p>
						</div> -->
						<span class="btn-list">
							<div class="rh-i-h-btn">신고하기</div>
							<!-- <div class="rh-i-h-btn">문의하기</div>
							<div class="rh-i-h-btn">리뷰하기</div> -->
						</span>
					</div>
					<div class="rh-i-header2">
						<div style="line-height:170%;">
							<p>예약자 : <span>홍길동</span></p>
							<p>주소지 : <span>서울시 성북구 어쩌구 저쩌구길</span></p>
						</div>
						<div style="line-height:170%;">
							<p>예약날짜 : <span>2022-05-05</span></p>
							<p>견적날짜 : <span>2022-05-05</span></p>
						</div>
					</div>
					<input type="checkbox" id="d-check02">
					<label class="down material-symbols-outlined" for="d-check02">arrow_drop_down</label>
					<label class="down material-symbols-outlined" for="d-check02">arrow_drop_up</label>
					<div class="rh-detail">
						<form action="">
							<h2>요구사항</h2>
							<textarea name="" class="comment-text" readonly></textarea>
							<input type="submit" value="수정">
						</form>
						<div class="rh-i-status-text">
							<p>서비스신청</p>
							<p>견적대기</p><!--견적승인대기 견적승인 견적반려 -->
							<p>예약대기</p><!--예약승인대기 예약승인 예약반려 -->
							<p>결제대기</p><!--결제대기 결제완료 -->
							<p></p><!--서비스예정 서비스완료 -->
						</div>
						<div class="rh-i-status">
							<div class="pointer"></div>
							<div class="line"></div>
							<div class="pointer stay"></div>
							<div class="line"></div>
							<div class="pointer done"></div>
							<div class="line"></div>
							<div class="pointer"></div>
							<div class="line"></div>
							<div class="pointer"></div>
						</div>
						<form action="">
							<div>
								<h2>답변사항</h2>
								<textarea name="" class="recomment-text"></textarea>
							</div>
							<div>
								<h2>견적금액</h2>
								<textarea name="" class="pay-text"></textarea>
							</div>
							<div class="footer-btn-list flex-center">
								<!-- <div class="rh-i-h-btn">결제하기</div> -->
								<div class="rh-i-h-btn">예약취소</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>