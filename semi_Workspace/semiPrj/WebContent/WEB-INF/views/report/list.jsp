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
	height: 505px;
	border: 1px solid black;
	border-left: none;
	border-right: none;
	margin: 0 auto;
	position: relative;
	top: 30px;
	border-bottom: 3px solid black;
	border-top: none;
	



}
.d1{
	
	height: 45px;
	border-bottom: 1px solid lightgray;
	
	

	
    }
#e{
	
	background-color: #004412;
	color: white;
	margin: 0 auto;
	
	border-bottom: 3px solid black;
	display: flex;
	text-align: center;
	line-height: 45px;

	
}

.d1{
	display: flex;
	text-align: center;
	line-height: 45px;
}
#c{
	width: 100px;
	height: 40px;
	box-shadow:2px 2px lightgray;
	background-color: #EAE0D4;
	position: relative;
	left: 425px;
	bottom:40px;
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
	left: 600px;
	top: 35px;
}
#b{
	width: 200px;
	height: 30px;
	bottom: 80px;
	left: 620px;
	top: 10px;
	font-weight: 500;
	font-size: larger;

}
#t1{
	width: 96px;
	height: 45px;
}
#t2{
	width: 576px;
	height: 45px;
}
#t3{
	width: 288px;
	height: 45px;
}
#page-area{
	width:200px;
	display:flex;
	justify-content:center;
	align-items:center;
	position: relative;
	left:970px;
	top: 50px;
	
	
}
.btn{
	width:5px;
	height:5px;
	background-color:#004412;
	color:white;
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

<div id="page-area">
	<div class="btn"><a>1</a></div> 
	<div class="btn"><a>2</a></div> 
	<div class="btn"><a>3</a></div> 
	<div class="btn"><a>4</a></div> 
	<div class="btn"><a>5</a></div> 
</div>

<div id="c"><a href=""></a>글쓰기</div>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>