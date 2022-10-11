<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#main{
	width: 960px;
	height: 456px;
	border: 1px solid black;
	border-left: none;
	border-right: none;
	margin: 0 auto;
	position: relative;
	top: 80px;
	border-bottom: 3px solid black;
	border-top: 3px solid black;
	



}
.d1{
	
	height: 56px;
	border-bottom: 1px solid black;
	

	
    }
#e{
	
	background-color: #004412;
	color: white;
	margin: 0 auto;
	border: 1px solid black;
	border-bottom: 3px solid black;
	display: flex;
	text-align: center;
	line-height: 56px;

	
}

.d1{
	display: flex;
	text-align: center;
	line-height: 56px;
}
#c{
	width: 100px;
	height: 40px;
	border: 1px solid black;
	background-color: #EAE0D4;
	position: relative;
	left: 420px;
	top: 100px;
	text-align: center;
	margin: 0 auto;
	line-height :40px;
}
#a, #b{
	position: relative;
	
	
}
#a{
	width: 2px;
	height: 25px;
	background-color: black;
	border: 1px solid black;
	left: 220px;
	top: 50px;
}
#b{
	width: 200px;
	height: 30px;
	bottom: 80px;
	left: 230px;
	top: 25px;
	font-weight: 500;
	font-size: larger;

}
#t1{
	width: 96px;
	height: 56px;
}
#t2{
	width: 576px;
	height: 56px;
}
#t3{
	width: 288px;
	height: 56px;
}
#page-area{
	
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>






<div id="a"></div>
<div id="b">신고게시판</div>

<div id="main">
	<div id="e">
		<div class="t" id="t1">번호</div>
		<div class="t" id="t2">제목</div>
		<div class="t" id="t3">작성자</div>
	</div>
	<div class="d1">
		<div class="content"></div>
		<div class="content"></div>
		<div class="content"></div>
	</div>
	<div class="d1">
		<div class="content"></div>
		<div class="content"></div>
		<div class="content"></div>
	</div>
	<div class="d1">
		<div class="content"></div>
		<div class="content"></div>
		<div class="content"></div>
	</div>
	<div class="d1">
		<div class="content"></div>
		<div class="content"></div>
		<div class="content"></div>
	</div>
	<div class="d1">
		<div class="content"></div>
		<div class="content"></div>
		<div class="content"></div>
	</div>
	<div class="d1">
		<div class="content"></div>
		<div class="content"></div>
		<div class="content"></div>
	</div>
	<div class="d1">
		<div class="content"></div>
		<div class="content"></div>
		<div class="content"></div>
	</div>
	
</div>

<div id="page-area">1 2 3 4 5</div>

<div id="c"><a href=""></a>글쓰기</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>