<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

.page-button{
	width: 100px;
	height:40px;
	border:1px solid black;
	background-color: #EAE0D4;
	position: relative;
	left: 420px;
	top: 40px;
	text-margin: center;
	margin: 0 auto;
	text-align:center;
	line-height:40px;
	float:left;
}

#title{
	width:200px;
	height:30px;
	bottom:80px;
	margin-left:0px;
	top:25px;
	font-weight:400;
	font-size:larger;
	right:390px;
	margin:0 auto;
}

#blackline{
	width:2px;
	height:25px;
	background-color: black;
	border:1px solid black;
	right:500px;
	top:50px;
	margin:0 auto;
}

#blackline, #title{
	position:relative;
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

#button-box{
	margin:20px;
	margin-bottom:80px;
}
#write{
	margin-left:360px;
}
#rollback{
	margin-left:100px;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/side.jsp" %>
	<div id="blackline"></div>
	<div id="title">문의게시판 작성</div>
	
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
	<div id="button-box">
		<input type="submit" value="작성하기" id="write"  class="page-button" >
		<a href="/dobby/request/"><div class="page-button" id="rollback">돌아가기</div></a>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>