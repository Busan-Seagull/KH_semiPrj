<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집요정</title>
<link rel="stylesheet" href="/dobby/resources/css/reservation.css">
<script defer src="/dobby/resources/js/reservation.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <form id="r-main-container" action="" method="" class="flex-col">
        <div id="r-title">
            <span class="material-symbols-outlined"> magic_button </span>
            <p>예약하기</p>
        </div>
        <div id="r-service-info" class="flex-col border-g">
            <div class="flex-between">
                <h1>title</h1>
                <p>카테고리 : 인테리어</p>
            </div>
            <p>담당집요정 : 너굴맨</p>
        </div>
        <input type="checkbox" id="select-check">
        <div id="r-date-container" class="border-g">
            <div id="r-select-date">
                <div class="flex-center grid-c14 grid-r12">
                    <span class="material-symbols-outlined"> calendar_month </span>
                    <p>날짜 선택</p>
                </div>
                <div id="r-back-btn" class="grid-r34"><span class="material-symbols-outlined">
                    chevron_left
                    </span></div>
                <div id="r-next-btn" class="grid-r34"><span class="material-symbols-outlined">
                    chevron_right
                    </span></div>
                <div id="r-date" class="flex-center grid-c14 grid-r23"><p id="r-year"></p><p>/</p><p id="r-month">9</p></div>
                <div id="date-container" class="grid-r34 grid-c23 flex-col">
                    <div id="row-1" class="flex-center">
                        <span class="col-1"><p>일</p></span>
                        <span class="col-2"><p>월</p></span>
                        <span class="col-3"><p>화</p></span>
                        <span class="col-4"><p>수</p></span>
                        <span class="col-5"><p>목</p></span>
                        <span class="col-6"><p>금</p></span>
                        <span class="col-7"><p>토</p></span>
                    </div>
                    <div id="row-2" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-3" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-4" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-5" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-6" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                    <div id="row-7" class="flex-center">
                        <span class="col-1"></span>
                        <span class="col-2"></span>
                        <span class="col-3"></span>
                        <span class="col-4"></span>
                        <span class="col-5"></span>
                        <span class="col-6"></span>
                        <span class="col-7"></span>
                    </div>
                </div>
            </div>
            <label id="btn-select-date" for="select-check">확인</label>
            <div id="r-slect-date-B" class="flex-center">
                <span class="material-symbols-outlined"> calendar_month </span>
                <p id="b-date"></p>
            </div>
        </div>
        <div id="r-coment" class="border-g">
            <div class="flex-center">
                <span class="material-symbols-outlined"> magic_button </span>
                <p>요구사항 작성</p>
            </div>
            <textarea name="coment"></textarea>
            <input type="submit" value="예약완료" class="shadow-box">
        </div>
    </form>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>