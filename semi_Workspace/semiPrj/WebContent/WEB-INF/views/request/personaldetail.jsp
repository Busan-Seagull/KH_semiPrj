<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

#blackline{
	width:2px;
	height:25px;
	background-color: black;
	border:1px solid black;
	left:440px;
	top:50px;
}

#t1{
	width:90px;
	height:60px;
}
#t2{
	width:100px;
	height:60px;
}
#t3{
	width:700px;
	height:60px;
}
#title{
	width:200px;
	height:30px;
	bottom:80px;
	left:460px;
	top:25px;
	font-weight:500;
	font-size:larger;
}

#blackline, #title{
	position:relative;
}

#main{
	width: 960px;
	height: 456px;
	border: 1px solid black;
	border-left:none;
	border-right:none;
	margin : 0 auto;
	position : relative;
	top: 40px;
	border-bottom : 3px solid black;
	border-top : 3px solid black;
}

.data1{
	height : 56px;
	border-bottom : 1px solid black;
	display:flex;
	text-align:center;
	line-height: 56px;
}

#header{
	background-color: #004412;
	color : white;
	margin:0 auto;
	border : 1px solid black;
	border-bottom: 3px solid black;
	display : flex;
	text-align : center;
	line-height:56px;
}

</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<%@ include file="/WEB-INF/views/common/side.jsp" %>
	
	<div id="blackline"></div>
	<div id="title">문의게시판</div>
	
	<div id="main">
		<div id="header">
			<div class="t" id="t1">번호</div>
			<div class="t" id="t2">제목</div>
			<div class="t" id="t3">작성자</div>
		</div>
		<div class="data1">
			<div class="content" id="t1">1</div>
			<div class="content" id="t2">2</div>
			<div class="content" id="t3">3</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>