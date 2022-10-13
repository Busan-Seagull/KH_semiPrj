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
	height: 450px;
	border:none;
	margin: 0 auto;
	position: relative;
	top: 30px;
	border-top: 3px solid #004412;
	

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


.h, #l{height: 45px;}

#f, #j{
	display: flex;
	text-align: center;
	line-height: 45px;
	
}
#f,#l{
	border-bottom: 5px solid #004412;

}
#j{
border-bottom: none;
}


#t23{width: 96px;}
#t24{width: 96px;}
#t25{width: 528px;}
#t26{width: 192px;}
#t27{width: 144px;}
#t28{width: 96px; height: 46px;}
#t29{width: 96px;}
#t30{width: 528px;height: 46px;}
#t31{width: 192px;}
#t32{ width: 144px;}


.i1{
	width: 100px;
	height: 40px;
	box-shadow: 2px 2px lightgray;
	background-color: #EAE0D4;
	position: relative;
	text-align: center;
	margin: 0 auto;
	line-height :40px;
}
#i{
	width: 400px;
	display: flex;
	justify-content: space-around;
	position: relative;
	margin: 0 auto;
	top: 30px;
	left: 298px;
}
#l{
text-align:center;
line-height:45px;
background-color:#004412;
color:white;
}

textarea{
border:none;
border-bottom: 5px solid #004412;
overflow:auto;
}
#reply{
	width:100px;
	display:flex;
	position:relative;
	left: 590px;
	
	
}


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%@ include file="/WEB-INF/views/common/side.jsp" %>






<div id="a"></div>
<div id="b">리뷰게시판</div>

<div id="main">
	<div id="f">
		<div class="h" id="t23">번호</div>
		<div class="h" id="t24">서비스 번호</div>
		<div class="h" id="t25">제목</div>
		<div class="h" id="t26">작성자</div>
		<div class="h" id="t27">평점</div>
	</div>
	<div id="j">
		<div class="h" id="t28"></div>
		<div class="h" id="t29"></div>
		<div class="h" id="t30"></div>
		<div class="h" id="t31"></div>
		<div class="h" id="t32"></div>
	</div>
	<div>
		<div id="l">내용</div>
		<textarea class="custom-textarea" name="content" id="k" cols="141" rows="18"></textarea>
	</div>
</div>

<div id="i">
	<div class="i1"><a href=""></a>삭제</div>
	<div class="i1"><a href=""></a>수정</div>
	<div class="i1"><a href=""></a>글목록</div>
</div>

<div id="reply">
	<div>댓글</div>
	<div>0</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>