<%@page import="com.kh.dobby.common.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
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
				
				<c:if test="${sessionScope.loginMember.rightNo == 1}">
				<c:forEach items="${list}" var="rv" varStatus="vs">
				<div class="rh-item shadow-box">

					<div class="rh-i-header">
						<div style="line-height:200%;">
							<h1>${rv.sTitle}</h1>
							<p>${rv.dName}</p>
						</div>
						<div></div>
						<div style="line-height:170%;">
							<p>예약날짜 : <span>${rv.reservationDate}</span></p>
							<c:if test="${not empty rv.estimateDate}">
								<p>견적날짜 : <span>${rv.estimateDate}</span></p>
							</c:if>
						</div>
						<span class="btn-list">
							<div class="rh-i-h-btn">신고하기</div>
							<div class="rh-i-h-btn">문의하기</div>
							<div class="rh-i-h-btn">리뷰하기</div>
						</span>
					</div>

					<input type="checkbox" id="d-check${vs.count}">
					<label class="down material-symbols-outlined" for="d-check${vs.count}">arrow_drop_down</label>
					<label class="down material-symbols-outlined" for="d-check${vs.count}">arrow_drop_up</label>
					
					<div class="rh-detail">
					
						<form action="">
							<h2>요구사항</h2>
							<textarea name="" class="comment-text" readonly>${rv.comment}</textarea>
							<button type="button" onclick="updateComment(this, ${rv.reservation_no})">수정</button>
						</form>
					
						<c:if test="${rv.status == 'EAW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적승인대기</p>
								<p></p>
								<p></p>
								<p></p>
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
							<div class="footer-btn-list flex-center">
								<div class="rh-i-h-btn" onclick="cancel('none', ${rv.reservation_no});">예약취소</div>
							</div>
						</c:if>
						
						<c:if test="${rv.status == 'EW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적 확인중</p>
								<p></p>
								<p></p>
								<p></p>
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
							<div class="footer-btn-list flex-center">
								<div class="rh-i-h-btn" onclick="cancel('none', ${rv.reservation_no})">예약취소</div>
							</div>
						</c:if>
						
						<c:if test="${rv.status == 'RAW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적완료</p><!--견적승인대기 견적승인 견적반려 -->
								<p>예약 승인대기</p><!--예약승인대기 예약승인 예약반려 -->
								<p></p><!--결제대기 결제완료 -->
								<p></p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
							<div class="footer-btn-list flex-center">
								<div class="rh-i-h-btn" onclick="cancel('none', ${rv.reservation_no})">예약취소</div>
							</div>
						</c:if>
						
						<c:if test="${rv.status == 'PW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적완료</p><!--견적승인대기 견적승인 견적반려 -->
								<p>예약완료</p><!--예약승인대기 예약승인 예약반려 -->
								<p>결제대기</p><!--결제대기 결제완료 -->
								<p></p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
							<div class="footer-btn-list flex-center">
								<div class="rh-i-h-btn">결제하기</div>
								<div class="rh-i-h-btn" onclick="cancel('none', ${rv.reservation_no})">예약취소</div>
							</div>
						</c:if>
						
						<c:if test="${rv.status == 'SW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적완료</p><!--견적승인대기 견적승인 견적반려 -->
								<p>예약완료</p><!--예약승인대기 예약승인 예약반려 -->
								<p>결제완료</p><!--결제대기 결제완료 -->
								<p>서비스 대기</p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
							</div>
							<div class="footer-btn-list flex-center">
								<div class="rh-i-h-btn" onclick="cancel('none', ${rv.reservation_no})">예약취소</div>
							</div>
						</c:if>
						
						<c:if test="${rv.status == 'SC'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적완료</p><!--견적승인대기 견적승인 견적반려 -->
								<p>예약완료</p><!--예약승인대기 예약승인 예약반려 -->
								<p>결제완료</p><!--결제대기 결제완료 -->
								<p>서비스완료</p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
							</div>
							<div class="footer-btn-list flex-center">
							</div>
						</c:if>
						
						<c:if test="${rv.status == 'C'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p></p><!--견적승인대기 견적승인 견적반려 -->
								<p></p><!--예약승인대기 예약승인 예약반려 -->
								<p></p><!--결제대기 결제완료 -->
								<p>예약취소</p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
							<div class="footer-btn-list flex-center">
							</div>
						</c:if>
						
					</div>
				</div>
				</c:forEach>
				</c:if>
				<!-- ------------------------------------------------------------------------------------------ -->
				
				<c:if test="${sessionScope.loginMember.rightNo == 2}">
				<c:forEach items="${list}" var="rv" varStatus="vs">
				<div class="rh-item shadow-box">
					<div class="rh-i-header">
						<div style="line-height:200%;">
							<h1>title이 길 수 있잖아</h1>
						</div>
						<span class="btn-list">
							<div class="rh-i-h-btn">신고하기</div>
						</span>
					</div>
					<div class="rh-i-header2">
						<div style="line-height:170%;">
							<p>예약자 : <span>${rv.userName}</span></p>
							<p>주소지 : <span>${rv.address}</span></p>
						</div>
						<div style="line-height:170%;">
							<p>예약날짜 : <span>${rv.reservationDate}</span></p>
							<c:if test="${not empty rv.estimateDate }">
								<p>견적날짜 : <span>${rv.estimateDate }</span></p>
							</c:if>
						</div>
					</div>
					<input type="checkbox" id="d-check${vs.count }">
					<label class="down material-symbols-outlined" for="d-check${vs.count }">arrow_drop_down</label>
					<label class="down material-symbols-outlined" for="d-check${vs.count }">arrow_drop_up</label>
					<div class="rh-detail">
					
						<form action="">
							<h2>요구사항</h2>
							<textarea name="" class="comment-text" readonly>${rv.comment }</textarea>
						</form>
						
						<c:if test="${rv.status == 'EAW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적승인대기</p><!--견적승인대기 견적승인 견적반려 -->
								<p></p><!--예약승인대기 예약승인 예약반려 -->
								<p></p><!--결제대기 결제완료 -->
								<p></p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
							<form>
								<div>
									<h2>답변사항</h2>
									<textarea name="" class="recomment-text"></textarea>
								</div>
								<div class="footer-btn-list flex-center">
									<div class="rh-i-h-btn" onclick="approval(this, ${rv.reservation_no})">예약승인</div>
									<div class="rh-i-h-btn" onclick="cancel(this, ${rv.reservation_no})">예약취소</div>
								</div>
							</form>
						</c:if>
						
						<c:if test="${rv.status == 'EW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적 확인중</p><!--견적승인대기 견적승인 견적반려 -->
								<p></p><!--예약승인대기 예약승인 예약반려 -->
								<p></p><!--결제대기 결제완료 -->
								<p></p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
							
							<form>
								<div>
									<h2>견적금액</h2>
									<input type="number" name="" class="pay-text">
								</div>
								<div>
									<h2>답변사항</h2>
									<textarea name="" class="recomment-text"></textarea>
								</div>
								<div class="footer-btn-list flex-center">
									<div class="rh-i-h-btn" onclick="updateAmount(this, ${rv.reservation_no})">견적완료</div>
									<div class="rh-i-h-btn" onclick="cancel(this, ${rv.reservation_no})">견적반려</div>
								</div>
							</form>
							
						</c:if>
						
						<c:if test="${rv.status == 'RAW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적완료</p><!--견적승인대기 견적승인 견적반려 -->
								<p>예약 승인대기</p><!--예약승인대기 예약승인 예약반려 -->
								<p></p><!--결제대기 결제완료 -->
								<p></p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
							
							<form>
								<div>
									<h2>답변사항</h2>
									<textarea name="" class="recomment-text"></textarea>
								</div>
								<div class="footer-btn-list flex-center">
									<div class="rh-i-h-btn">예약승인</div>
									<div class="rh-i-h-btn">예약반려</div>
								</div>
							</form>
							
						</c:if>
						
						<c:if test="${rv.status == 'PW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적완료</p><!--견적승인대기 견적승인 견적반려 -->
								<p>예약완료</p><!--예약승인대기 예약승인 예약반려 -->
								<p>결제대기</p><!--결제대기 결제완료 -->
								<p></p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
							<div class="footer-btn-list flex-center">
								<div class="rh-i-h-btn">예약취소</div>
							</div>
						</c:if>
						
						<c:if test="${rv.status == 'SW'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적완료</p><!--견적승인대기 견적승인 견적반려 -->
								<p>예약완료</p><!--예약승인대기 예약승인 예약반려 -->
								<p>결제완료</p><!--결제대기 결제완료 -->
								<p>서비스 대기</p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer stay"></div>
							</div>
							<div class="footer-btn-list flex-center">
								<div class="rh-i-h-btn">예약취소</div>
							</div>
						</c:if>
						
						<c:if test="${rv.status == 'SC'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p>견적완료</p><!--견적승인대기 견적승인 견적반려 -->
								<p>예약완료</p><!--예약승인대기 예약승인 예약반려 -->
								<p>결제완료</p><!--결제대기 결제완료 -->
								<p>서비스완료</p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
								<div class="line done"></div>
								<div class="pointer done"></div>
							</div>
						</c:if>
						
						<c:if test="${rv.status == 'C'}">
							<div class="rh-i-status-text">
								<p>서비스신청</p>
								<p></p><!--견적승인대기 견적승인 견적반려 -->
								<p></p><!--예약승인대기 예약승인 예약반려 -->
								<p></p><!--결제대기 결제완료 -->
								<p>예약취소</p><!--서비스예정 서비스완료 -->
							</div>
							<div class="rh-i-status">
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
								<div class="line"></div>
								<div class="pointer"></div>
							</div>
						</c:if>
			
					</div>
				</div>
				</c:forEach>
				</c:if>
				
				<!-- 페이징 -->
				<div id="page-area">
					<ul id="page-nation">
						<li><a href="/dobby/reservation/history?pno=1" class="first"><<</a></li>
						<li><a class="arrow left"><</a></li>
						<li><a class="num"></a></li>
						<li><a class="num"></a></li>
						<li><a class="num"></a></li>
						<li><a class="num"></a></li>
						<li><a class="num"></a></li>
						<li><a class="arrow right">></a></li>
						<li><a href="/dobby/reservation/history?pno=${pv.maxPage}" class="last">>></a></li>
					</ul>
				</div>
				<script>
					const pageNation = document.querySelector('#page-nation');
					const numArr = pageNation.querySelectorAll('.num');
					const left = pageNation.querySelector('.arrow.left');
					const right = pageNation.querySelector('.arrow.right');

					if(${pv.startPage} > 1){
						left.href = '/dobby/reservation/history?pno=${pv.startPage}';
					}else{
						left.classList.add('none-select');
					}

					if(${pv.currentPage} != ${pv.maxPage}){
						right.href = '/dobby/reservation/history?pno=${pv.currentPage + 1}';
					}else{
						right.classList.add('none-select');
					}

					let page = ${pv.startPage};

					for (let i = 0; i < numArr.length; i++) {
						const num = numArr[i];
						
						if(page == ${pv.currentPage}){
							num.classList.add('current');
						}
						
						if(page < 1 || page > ${pv.maxPage}){
							num.classList.add('p-none');
						}else{
							num.href = '/dobby/reservation/history?pno='+page;
						}
						num.innerHTML = page;
						page++;
					}
					
					function approval(object, rno) {
					    var xhr = new XMLHttpRequest();
					    xhr.open("POST", '/dobby/reservation/result');
					    xhr.onreadystatechange = function(){
					        if(xhr.readyState == 4){
					            if(xhr.status == 200){

					            }else{
					                alert("결과가 저장되지 않음.");
					            }
					        }
					    }

						const recomment = object.form.querySelector('textarea').innerText;
					    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");	
						xhr.send('rno='+rno+'&recomment='+recomment);				
					}

					function updateAmount(object, rno) {
						const recomment = object.form.querySelector('textarea').innerText;
						const Amount = object.form.querySelector('input[type=number]').innerText;

					    var xhr = new XMLHttpRequest();
					    xhr.open("GET", '/dobby/reservation/update?'+'rno='+rno+'&Amount='+Amount+'&recomment='+recomment);
					    xhr.onreadystatechange = function(){
					        if(xhr.readyState == 4){
					            if(xhr.status == 200){

					            }else{
					                alert("결과가 저장되지 않음.");
					            }
					        }
					    }

					    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
						xhr.send();				
					}
					
					function cancel(object, rno) {
						let qString = '';
						if(object!='none'){
							const recomment = object.form.querySelector('textarea').innerText;
							qString = 'rno='+rno+'&recomment='+recomment;			
						}else{
							qString = 'rno='+rno;
						}
					    var xhr = new XMLHttpRequest();
					    xhr.open("GET", '/dobby/reservation/result?'+qString);
					    xhr.onreadystatechange = function(){
					        if(xhr.readyState == 4){
					            if(xhr.status == 200){
									location.reload;
					            }else{
					                alert("결과가 저장되지 않음.");
					            }
					        }
					    }

					    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");

						xhr.send();
					}

					function updateComment(object, rno) {
					    var xhr = new XMLHttpRequest();
					    xhr.open("POST", '/dobby/reservation/update');
					    xhr.onreadystatechange = function(){
					        if(xhr.readyState == 4){
					            if(xhr.status == 200){

					            }else{
					                alert("결과가 저장되지 않음.");
					            }
					        }
					    }
 
						const comment = object.form.querySelector('textarea').innerText;
					    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
					    xhr.send('rno='+rno+'&comment='+comment);					
					}

				</script>

			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>