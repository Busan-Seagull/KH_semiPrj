<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/dobby/resources/css/point.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/side.jsp" %>

<form>
	<div id="point-box">
		<div id="text01">포인트</div>
		<div id="box-table-page">
			<div id="box1" class="box">
				<div class="box" id="box-table-text">
					<div id="subtext">현재 포인트</div>
					<div id="subtext2">현재 포인트</div>
					<div id="subtext3">현재 포인트</div>
				</div>
				
				<div class="box" id="box-table-result">
					<div id="subtext">0P</div>
					<div id="subtext2">0P</div>
					<div id="subtext3">0P</div>
				</div>
			</div>
			
			<div id="text02">포인트 적립 내역</div>
			<div id="box2" class="box">
			</div>
		</div>
	</div>
</form>
</body>
</html>