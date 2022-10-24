<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
<script>
	function helloToServer() {
		const body = $('body');

		const header = $('<div/>');
		header.addClass('rh-i-header');

		body.append(header);

		let div = $('<div/>');
		div.css('line-height','200%');

		$('<h1>rv.sTitle</h1>').appendTo(div);
		$('<p>'+"rv.dName"+'</p>').appendTo(div);

		div.appendTo(header);

		div = $('<div/>');
		div.css('line-height','170%');    

		div.append('<p>예약날짜 : <span>'+"rv.reservationDate"+'</span></p>');
		div.append('<p>견적날짜 : <span>'+"rv.estimateDate"+'</span></p>');
		div.appendTo(header);

		let span = $('<span/>');
		span.addClass('btn-list');
		$('<div class="rh-i-h-btn">신고하기</div>').appendTo(span);
		$('<div class="rh-i-h-btn">문의하기</div>').appendTo(span);
		$('<div class="rh-i-h-btn">리뷰하기</div>').appendTo(span);
		span.appendTo(header);

		header.appendTo(body);

		$('<input type="checkbox" id="d-check'+"rv.count"+'">').appendTo(body);
	}


</script>
</head>
<body>
	<button onclick="helloToServer();">asdf</button>
	
</body>
</html>